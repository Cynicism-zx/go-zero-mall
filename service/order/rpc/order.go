package main

import (
	"flag"
	"fmt"
	"mall/service/order/rpc/internal/config"
	"mall/service/order/rpc/internal/server"
	"mall/service/order/rpc/internal/svc"
	"mall/service/order/rpc/types/order"

	"github.com/zeromicro/go-zero/core/conf"
	"github.com/zeromicro/go-zero/core/service"
	"github.com/zeromicro/go-zero/zrpc"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

var configFile = flag.String("f", "etc/order.yaml", "the config file")

// 服务注册源码解析
// https://blog.csdn.net/pyf511765/article/details/122015861
// https://www.cnblogs.com/leescre/p/14799586.html

/*
grpc 支持多种url schemes连接grpc服务 即 grpc.DialContext(timeCtx, target, options...),target可以是下边的scheme
- dns:ip:port
- unix://path
- ipv4:ip:port
- discov://ip:port/key // 自动获取etcd注册的服务地址并建立连接
*/

// go-zero 负载均衡算法 https://learnku.com/articles/60059

func main() {
	flag.Parse()

	var c config.Config
	conf.MustLoad(*configFile, &c)
	ctx := svc.NewServiceContext(c)
	svr := server.NewOrderServer(ctx)

	s := zrpc.MustNewServer(c.RpcServerConf, func(grpcServer *grpc.Server) {
		order.RegisterOrderServer(grpcServer, svr)

		if c.Mode == service.DevMode || c.Mode == service.TestMode {
			reflection.Register(grpcServer)
		}
	})
	defer s.Stop()

	fmt.Printf("Starting rpc server at %s...\n", c.ListenOn)
	s.Start()
}
