up:
	cd service/user/rpc && go run user.go -f "etc/user.yaml"
	cd service/user/api && go run user.go -f "etc/user.yaml"

	cd service/order/rpc && go run order.go -f "etc/order.yaml"
	cd service/order/api && go run order.go -f "etc/order.yaml"