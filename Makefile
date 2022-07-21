# 如果project没有被定义过，那么变量project的值就是“bar”，如果project先前被定义过，那么这条语将什么也不做
project ?= $(shell pwd)/service
all: user user-api order order-api product product-api pay pay-api

user:
	cd $(project)/user/rpc && go run user.go -f "etc/user.yaml"
user-api:
	cd $(project)/user/api && go run user.go -f "etc/user.yaml"
order:
	cd $(project)/order/rpc && go run order.go -f "etc/order.yaml"
order-api:
	cd $(project)/order/api && go run order.go -f "etc/order.yaml"
product:
	cd $(project)/product/rpc && go run product.go -f "etc/product.yaml"
product-api:
	cd $(project)/product/api && go run product.go -f "etc/product.yaml"
pay:
	cd $(project)/pay/rpc && go run pay.go -f "etc/pay.yaml"
pay-api:
	cd $(project)/pay/api && go run pay.go -f "etc/pay.yaml"
.PHONY : clean
clean:
	-rm all