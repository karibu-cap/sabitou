// Code generated by protoc-gen-connect-go. DO NOT EDIT.
//
// Source: order/v1/order.proto

package orderv1connect

import (
	connect "connectrpc.com/connect"
	context "context"
	errors "errors"
	v1 "github.com/karibu-cap/sabitou/protos/gen/go/rpc/order/v1"
	http "net/http"
	strings "strings"
)

// This is a compile-time assertion to ensure that this generated file and the connect package are
// compatible. If you get a compiler error that this constant is not defined, this code was
// generated with a version of connect newer than the one compiled into your binary. You can fix the
// problem by either regenerating this code with an older version of connect or updating the connect
// version compiled into your binary.
const _ = connect.IsAtLeastVersion1_13_0

const (
	// OrderServiceName is the fully-qualified name of the OrderService service.
	OrderServiceName = "order.v1.OrderService"
)

// These constants are the fully-qualified names of the RPCs defined in this package. They're
// exposed at runtime as Spec.Procedure and as the final two segments of the HTTP route.
//
// Note that these are different from the fully-qualified method names used by
// google.golang.org/protobuf/reflect/protoreflect. To convert from these constants to
// reflection-formatted method names, remove the leading slash and convert the remaining slash to a
// period.
const (
	// OrderServiceCreateOrderProcedure is the fully-qualified name of the OrderService's CreateOrder
	// RPC.
	OrderServiceCreateOrderProcedure = "/order.v1.OrderService/CreateOrder"
	// OrderServiceGetOrderProcedure is the fully-qualified name of the OrderService's GetOrder RPC.
	OrderServiceGetOrderProcedure = "/order.v1.OrderService/GetOrder"
	// OrderServiceDeleteOrderProcedure is the fully-qualified name of the OrderService's DeleteOrder
	// RPC.
	OrderServiceDeleteOrderProcedure = "/order.v1.OrderService/DeleteOrder"
)

// OrderServiceClient is a client for the order.v1.OrderService service.
type OrderServiceClient interface {
	// Creates a new order.
	CreateOrder(context.Context, *connect.Request[v1.CreateOrderRequest]) (*connect.Response[v1.CreateOrderResponse], error)
	// Gets an order by id.
	GetOrder(context.Context, *connect.Request[v1.GetOrderRequest]) (*connect.Response[v1.GetOrderResponse], error)
	// Deletes an order.
	DeleteOrder(context.Context, *connect.Request[v1.DeleteOrderRequest]) (*connect.Response[v1.DeleteOrderResponse], error)
}

// NewOrderServiceClient constructs a client for the order.v1.OrderService service. By default, it
// uses the Connect protocol with the binary Protobuf Codec, asks for gzipped responses, and sends
// uncompressed requests. To use the gRPC or gRPC-Web protocols, supply the connect.WithGRPC() or
// connect.WithGRPCWeb() options.
//
// The URL supplied here should be the base URL for the Connect or gRPC server (for example,
// http://api.acme.com or https://acme.com/grpc).
func NewOrderServiceClient(httpClient connect.HTTPClient, baseURL string, opts ...connect.ClientOption) OrderServiceClient {
	baseURL = strings.TrimRight(baseURL, "/")
	orderServiceMethods := v1.File_order_v1_order_proto.Services().ByName("OrderService").Methods()
	return &orderServiceClient{
		createOrder: connect.NewClient[v1.CreateOrderRequest, v1.CreateOrderResponse](
			httpClient,
			baseURL+OrderServiceCreateOrderProcedure,
			connect.WithSchema(orderServiceMethods.ByName("CreateOrder")),
			connect.WithClientOptions(opts...),
		),
		getOrder: connect.NewClient[v1.GetOrderRequest, v1.GetOrderResponse](
			httpClient,
			baseURL+OrderServiceGetOrderProcedure,
			connect.WithSchema(orderServiceMethods.ByName("GetOrder")),
			connect.WithClientOptions(opts...),
		),
		deleteOrder: connect.NewClient[v1.DeleteOrderRequest, v1.DeleteOrderResponse](
			httpClient,
			baseURL+OrderServiceDeleteOrderProcedure,
			connect.WithSchema(orderServiceMethods.ByName("DeleteOrder")),
			connect.WithClientOptions(opts...),
		),
	}
}

// orderServiceClient implements OrderServiceClient.
type orderServiceClient struct {
	createOrder *connect.Client[v1.CreateOrderRequest, v1.CreateOrderResponse]
	getOrder    *connect.Client[v1.GetOrderRequest, v1.GetOrderResponse]
	deleteOrder *connect.Client[v1.DeleteOrderRequest, v1.DeleteOrderResponse]
}

// CreateOrder calls order.v1.OrderService.CreateOrder.
func (c *orderServiceClient) CreateOrder(ctx context.Context, req *connect.Request[v1.CreateOrderRequest]) (*connect.Response[v1.CreateOrderResponse], error) {
	return c.createOrder.CallUnary(ctx, req)
}

// GetOrder calls order.v1.OrderService.GetOrder.
func (c *orderServiceClient) GetOrder(ctx context.Context, req *connect.Request[v1.GetOrderRequest]) (*connect.Response[v1.GetOrderResponse], error) {
	return c.getOrder.CallUnary(ctx, req)
}

// DeleteOrder calls order.v1.OrderService.DeleteOrder.
func (c *orderServiceClient) DeleteOrder(ctx context.Context, req *connect.Request[v1.DeleteOrderRequest]) (*connect.Response[v1.DeleteOrderResponse], error) {
	return c.deleteOrder.CallUnary(ctx, req)
}

// OrderServiceHandler is an implementation of the order.v1.OrderService service.
type OrderServiceHandler interface {
	// Creates a new order.
	CreateOrder(context.Context, *connect.Request[v1.CreateOrderRequest]) (*connect.Response[v1.CreateOrderResponse], error)
	// Gets an order by id.
	GetOrder(context.Context, *connect.Request[v1.GetOrderRequest]) (*connect.Response[v1.GetOrderResponse], error)
	// Deletes an order.
	DeleteOrder(context.Context, *connect.Request[v1.DeleteOrderRequest]) (*connect.Response[v1.DeleteOrderResponse], error)
}

// NewOrderServiceHandler builds an HTTP handler from the service implementation. It returns the
// path on which to mount the handler and the handler itself.
//
// By default, handlers support the Connect, gRPC, and gRPC-Web protocols with the binary Protobuf
// and JSON codecs. They also support gzip compression.
func NewOrderServiceHandler(svc OrderServiceHandler, opts ...connect.HandlerOption) (string, http.Handler) {
	orderServiceMethods := v1.File_order_v1_order_proto.Services().ByName("OrderService").Methods()
	orderServiceCreateOrderHandler := connect.NewUnaryHandler(
		OrderServiceCreateOrderProcedure,
		svc.CreateOrder,
		connect.WithSchema(orderServiceMethods.ByName("CreateOrder")),
		connect.WithHandlerOptions(opts...),
	)
	orderServiceGetOrderHandler := connect.NewUnaryHandler(
		OrderServiceGetOrderProcedure,
		svc.GetOrder,
		connect.WithSchema(orderServiceMethods.ByName("GetOrder")),
		connect.WithHandlerOptions(opts...),
	)
	orderServiceDeleteOrderHandler := connect.NewUnaryHandler(
		OrderServiceDeleteOrderProcedure,
		svc.DeleteOrder,
		connect.WithSchema(orderServiceMethods.ByName("DeleteOrder")),
		connect.WithHandlerOptions(opts...),
	)
	return "/order.v1.OrderService/", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch r.URL.Path {
		case OrderServiceCreateOrderProcedure:
			orderServiceCreateOrderHandler.ServeHTTP(w, r)
		case OrderServiceGetOrderProcedure:
			orderServiceGetOrderHandler.ServeHTTP(w, r)
		case OrderServiceDeleteOrderProcedure:
			orderServiceDeleteOrderHandler.ServeHTTP(w, r)
		default:
			http.NotFound(w, r)
		}
	})
}

// UnimplementedOrderServiceHandler returns CodeUnimplemented from all methods.
type UnimplementedOrderServiceHandler struct{}

func (UnimplementedOrderServiceHandler) CreateOrder(context.Context, *connect.Request[v1.CreateOrderRequest]) (*connect.Response[v1.CreateOrderResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("order.v1.OrderService.CreateOrder is not implemented"))
}

func (UnimplementedOrderServiceHandler) GetOrder(context.Context, *connect.Request[v1.GetOrderRequest]) (*connect.Response[v1.GetOrderResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("order.v1.OrderService.GetOrder is not implemented"))
}

func (UnimplementedOrderServiceHandler) DeleteOrder(context.Context, *connect.Request[v1.DeleteOrderRequest]) (*connect.Response[v1.DeleteOrderResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("order.v1.OrderService.DeleteOrder is not implemented"))
}
