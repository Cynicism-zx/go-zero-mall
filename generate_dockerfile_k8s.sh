#! /bin/bash

# shellcheck disable=SC2164
# user 服务
cd /home/user1/projects/go-zero-mall/service/user/api
# 生成dockerfile
goctl docker -go user.go
# 编译镜像
#docker build -t user:v1 .
# 推送镜像到镜像仓库
#docker push user:v1
# 生成k8s部署文件
goctl kube deploy -name user-api -namespace mall -image user:v1 -o user.yaml -port 8001

cd /home/user1/projects/go-zero-mall/service/user/rpc
# 生成dockerfile
goctl docker -go user.go
# 编译镜像
#docker build -t user_rpc:v1 .
# 生成k8s部署文件
goctl kube deploy -name user-rpc -namespace mall -image user_rpc:v1 -o user.yaml -port 9006

# pay 服务
cd /home/user1/projects/go-zero-mall/service/pay/api
# 生成dockerfile
goctl docker -go pay.go
# 编译镜像
#docker build -t pay:v1 .
# 生成k8s部署文件
goctl kube deploy -name pay-api -namespace mall -image pay:v1 -o pay.yaml -port 8003

cd /home/user1/projects/go-zero-mall/service/pay/rpc
# 生成dockerfile
goctl docker -go pay.go
# 编译镜像
#docker build -t pay_rpc:v1 .
# 生成k8s部署文件
goctl kube deploy -name pay-rpc -namespace mall -image pay_rpc:v1 -o pay.yaml -port 9003

# product 服务
cd /home/user1/projects/go-zero-mall/service/product/api
# 生成dockerfile
goctl docker -go product.go
# 编译镜像
#docker build -t product:v1 .
# 生成k8s部署文件
goctl kube deploy -name product-api -namespace mall -image product:v1 -o product.yaml -port 8008

cd /home/user1/projects/go-zero-mall/service/product/rpc
# 生成dockerfile
goctl docker -go product.go
# 编译镜像
#docker build -t product_rpc:v1 .
# 生成k8s部署文件
goctl kube deploy -name product-rpc -namespace mall -image product_rpc:v1 -o product.yaml -port 9005

# order 服务
cd /home/user1/projects/go-zero-mall/service/order/api
# 生成dockerfile
goctl docker -go order.go
# 编译镜像
#docker build -t order:v1 .
# 生成k8s部署文件
goctl kube deploy -name order-api -namespace mall -image order:v1 -o order.yaml -port 8002

cd /home/user1/projects/go-zero-mall/service/order/rpc
# 生成dockerfile
goctl docker -go order.go
# 编译镜像
#docker build -t order_rpc:v1 .
# 生成k8s部署文件
goctl kube deploy -name order-rpc -namespace mall -image order_rpc:v1 -o order.yaml -port 9002