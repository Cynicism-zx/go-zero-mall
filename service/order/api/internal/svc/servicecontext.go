package svc

import (
	"github.com/zeromicro/go-zero/rest"
	"mall/service/order/api/internal/config"
	"mall/service/order/api/internal/middleware"
	"mall/service/order/rpc/order"
	"mall/service/product/rpc/product"

	"github.com/zeromicro/go-zero/zrpc"
)

type ServiceContext struct {
	Config config.Config

	OrderRpc   order.Order
	ProductRpc product.Product
	Example    rest.Middleware
}

func NewServiceContext(c config.Config) *ServiceContext {
	return &ServiceContext{
		Config:     c,
		OrderRpc:   order.NewOrder(zrpc.MustNewClient(c.OrderRpc)),
		ProductRpc: product.NewProduct(zrpc.MustNewClient(c.ProductRpc)),
		Example:    middleware.NewExampleMiddleware().Handle,
	}
}
