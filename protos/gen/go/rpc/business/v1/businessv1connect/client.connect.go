// Code generated by protoc-gen-connect-go. DO NOT EDIT.
//
// Source: business/v1/client.proto

package businessv1connect

import (
	connect "connectrpc.com/connect"
	context "context"
	errors "errors"
	v1 "github.com/karibu-cap/sabitou/protos/gen/go/rpc/business/v1"
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
	// BusinessClientServiceName is the fully-qualified name of the BusinessClientService service.
	BusinessClientServiceName = "business.v1.BusinessClientService"
)

// These constants are the fully-qualified names of the RPCs defined in this package. They're
// exposed at runtime as Spec.Procedure and as the final two segments of the HTTP route.
//
// Note that these are different from the fully-qualified method names used by
// google.golang.org/protobuf/reflect/protoreflect. To convert from these constants to
// reflection-formatted method names, remove the leading slash and convert the remaining slash to a
// period.
const (
	// BusinessClientServiceCreateBusinessClientProcedure is the fully-qualified name of the
	// BusinessClientService's CreateBusinessClient RPC.
	BusinessClientServiceCreateBusinessClientProcedure = "/business.v1.BusinessClientService/CreateBusinessClient"
	// BusinessClientServiceGetBusinessClientProcedure is the fully-qualified name of the
	// BusinessClientService's GetBusinessClient RPC.
	BusinessClientServiceGetBusinessClientProcedure = "/business.v1.BusinessClientService/GetBusinessClient"
	// BusinessClientServiceUpdateBusinessClientProcedure is the fully-qualified name of the
	// BusinessClientService's UpdateBusinessClient RPC.
	BusinessClientServiceUpdateBusinessClientProcedure = "/business.v1.BusinessClientService/UpdateBusinessClient"
	// BusinessClientServiceDeleteBusinessClientProcedure is the fully-qualified name of the
	// BusinessClientService's DeleteBusinessClient RPC.
	BusinessClientServiceDeleteBusinessClientProcedure = "/business.v1.BusinessClientService/DeleteBusinessClient"
)

// BusinessClientServiceClient is a client for the business.v1.BusinessClientService service.
type BusinessClientServiceClient interface {
	// Creates a new client.
	CreateBusinessClient(context.Context, *connect.Request[v1.CreateBusinessClientRequest]) (*connect.Response[v1.CreateBusinessClientResponse], error)
	// Gets a client by id.
	GetBusinessClient(context.Context, *connect.Request[v1.GetBusinessClientRequest]) (*connect.Response[v1.GetBusinessClientResponse], error)
	// Updates a client.
	// Note:Only the fields that are set will be updated.
	UpdateBusinessClient(context.Context, *connect.Request[v1.UpdateBusinessClientRequest]) (*connect.Response[v1.UpdateBusinessClientResponse], error)
	// Deletes a client.
	DeleteBusinessClient(context.Context, *connect.Request[v1.DeleteBusinessClientRequest]) (*connect.Response[v1.DeleteBusinessClientResponse], error)
}

// NewBusinessClientServiceClient constructs a client for the business.v1.BusinessClientService
// service. By default, it uses the Connect protocol with the binary Protobuf Codec, asks for
// gzipped responses, and sends uncompressed requests. To use the gRPC or gRPC-Web protocols, supply
// the connect.WithGRPC() or connect.WithGRPCWeb() options.
//
// The URL supplied here should be the base URL for the Connect or gRPC server (for example,
// http://api.acme.com or https://acme.com/grpc).
func NewBusinessClientServiceClient(httpClient connect.HTTPClient, baseURL string, opts ...connect.ClientOption) BusinessClientServiceClient {
	baseURL = strings.TrimRight(baseURL, "/")
	businessClientServiceMethods := v1.File_business_v1_client_proto.Services().ByName("BusinessClientService").Methods()
	return &businessClientServiceClient{
		createBusinessClient: connect.NewClient[v1.CreateBusinessClientRequest, v1.CreateBusinessClientResponse](
			httpClient,
			baseURL+BusinessClientServiceCreateBusinessClientProcedure,
			connect.WithSchema(businessClientServiceMethods.ByName("CreateBusinessClient")),
			connect.WithClientOptions(opts...),
		),
		getBusinessClient: connect.NewClient[v1.GetBusinessClientRequest, v1.GetBusinessClientResponse](
			httpClient,
			baseURL+BusinessClientServiceGetBusinessClientProcedure,
			connect.WithSchema(businessClientServiceMethods.ByName("GetBusinessClient")),
			connect.WithClientOptions(opts...),
		),
		updateBusinessClient: connect.NewClient[v1.UpdateBusinessClientRequest, v1.UpdateBusinessClientResponse](
			httpClient,
			baseURL+BusinessClientServiceUpdateBusinessClientProcedure,
			connect.WithSchema(businessClientServiceMethods.ByName("UpdateBusinessClient")),
			connect.WithClientOptions(opts...),
		),
		deleteBusinessClient: connect.NewClient[v1.DeleteBusinessClientRequest, v1.DeleteBusinessClientResponse](
			httpClient,
			baseURL+BusinessClientServiceDeleteBusinessClientProcedure,
			connect.WithSchema(businessClientServiceMethods.ByName("DeleteBusinessClient")),
			connect.WithClientOptions(opts...),
		),
	}
}

// businessClientServiceClient implements BusinessClientServiceClient.
type businessClientServiceClient struct {
	createBusinessClient *connect.Client[v1.CreateBusinessClientRequest, v1.CreateBusinessClientResponse]
	getBusinessClient    *connect.Client[v1.GetBusinessClientRequest, v1.GetBusinessClientResponse]
	updateBusinessClient *connect.Client[v1.UpdateBusinessClientRequest, v1.UpdateBusinessClientResponse]
	deleteBusinessClient *connect.Client[v1.DeleteBusinessClientRequest, v1.DeleteBusinessClientResponse]
}

// CreateBusinessClient calls business.v1.BusinessClientService.CreateBusinessClient.
func (c *businessClientServiceClient) CreateBusinessClient(ctx context.Context, req *connect.Request[v1.CreateBusinessClientRequest]) (*connect.Response[v1.CreateBusinessClientResponse], error) {
	return c.createBusinessClient.CallUnary(ctx, req)
}

// GetBusinessClient calls business.v1.BusinessClientService.GetBusinessClient.
func (c *businessClientServiceClient) GetBusinessClient(ctx context.Context, req *connect.Request[v1.GetBusinessClientRequest]) (*connect.Response[v1.GetBusinessClientResponse], error) {
	return c.getBusinessClient.CallUnary(ctx, req)
}

// UpdateBusinessClient calls business.v1.BusinessClientService.UpdateBusinessClient.
func (c *businessClientServiceClient) UpdateBusinessClient(ctx context.Context, req *connect.Request[v1.UpdateBusinessClientRequest]) (*connect.Response[v1.UpdateBusinessClientResponse], error) {
	return c.updateBusinessClient.CallUnary(ctx, req)
}

// DeleteBusinessClient calls business.v1.BusinessClientService.DeleteBusinessClient.
func (c *businessClientServiceClient) DeleteBusinessClient(ctx context.Context, req *connect.Request[v1.DeleteBusinessClientRequest]) (*connect.Response[v1.DeleteBusinessClientResponse], error) {
	return c.deleteBusinessClient.CallUnary(ctx, req)
}

// BusinessClientServiceHandler is an implementation of the business.v1.BusinessClientService
// service.
type BusinessClientServiceHandler interface {
	// Creates a new client.
	CreateBusinessClient(context.Context, *connect.Request[v1.CreateBusinessClientRequest]) (*connect.Response[v1.CreateBusinessClientResponse], error)
	// Gets a client by id.
	GetBusinessClient(context.Context, *connect.Request[v1.GetBusinessClientRequest]) (*connect.Response[v1.GetBusinessClientResponse], error)
	// Updates a client.
	// Note:Only the fields that are set will be updated.
	UpdateBusinessClient(context.Context, *connect.Request[v1.UpdateBusinessClientRequest]) (*connect.Response[v1.UpdateBusinessClientResponse], error)
	// Deletes a client.
	DeleteBusinessClient(context.Context, *connect.Request[v1.DeleteBusinessClientRequest]) (*connect.Response[v1.DeleteBusinessClientResponse], error)
}

// NewBusinessClientServiceHandler builds an HTTP handler from the service implementation. It
// returns the path on which to mount the handler and the handler itself.
//
// By default, handlers support the Connect, gRPC, and gRPC-Web protocols with the binary Protobuf
// and JSON codecs. They also support gzip compression.
func NewBusinessClientServiceHandler(svc BusinessClientServiceHandler, opts ...connect.HandlerOption) (string, http.Handler) {
	businessClientServiceMethods := v1.File_business_v1_client_proto.Services().ByName("BusinessClientService").Methods()
	businessClientServiceCreateBusinessClientHandler := connect.NewUnaryHandler(
		BusinessClientServiceCreateBusinessClientProcedure,
		svc.CreateBusinessClient,
		connect.WithSchema(businessClientServiceMethods.ByName("CreateBusinessClient")),
		connect.WithHandlerOptions(opts...),
	)
	businessClientServiceGetBusinessClientHandler := connect.NewUnaryHandler(
		BusinessClientServiceGetBusinessClientProcedure,
		svc.GetBusinessClient,
		connect.WithSchema(businessClientServiceMethods.ByName("GetBusinessClient")),
		connect.WithHandlerOptions(opts...),
	)
	businessClientServiceUpdateBusinessClientHandler := connect.NewUnaryHandler(
		BusinessClientServiceUpdateBusinessClientProcedure,
		svc.UpdateBusinessClient,
		connect.WithSchema(businessClientServiceMethods.ByName("UpdateBusinessClient")),
		connect.WithHandlerOptions(opts...),
	)
	businessClientServiceDeleteBusinessClientHandler := connect.NewUnaryHandler(
		BusinessClientServiceDeleteBusinessClientProcedure,
		svc.DeleteBusinessClient,
		connect.WithSchema(businessClientServiceMethods.ByName("DeleteBusinessClient")),
		connect.WithHandlerOptions(opts...),
	)
	return "/business.v1.BusinessClientService/", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch r.URL.Path {
		case BusinessClientServiceCreateBusinessClientProcedure:
			businessClientServiceCreateBusinessClientHandler.ServeHTTP(w, r)
		case BusinessClientServiceGetBusinessClientProcedure:
			businessClientServiceGetBusinessClientHandler.ServeHTTP(w, r)
		case BusinessClientServiceUpdateBusinessClientProcedure:
			businessClientServiceUpdateBusinessClientHandler.ServeHTTP(w, r)
		case BusinessClientServiceDeleteBusinessClientProcedure:
			businessClientServiceDeleteBusinessClientHandler.ServeHTTP(w, r)
		default:
			http.NotFound(w, r)
		}
	})
}

// UnimplementedBusinessClientServiceHandler returns CodeUnimplemented from all methods.
type UnimplementedBusinessClientServiceHandler struct{}

func (UnimplementedBusinessClientServiceHandler) CreateBusinessClient(context.Context, *connect.Request[v1.CreateBusinessClientRequest]) (*connect.Response[v1.CreateBusinessClientResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("business.v1.BusinessClientService.CreateBusinessClient is not implemented"))
}

func (UnimplementedBusinessClientServiceHandler) GetBusinessClient(context.Context, *connect.Request[v1.GetBusinessClientRequest]) (*connect.Response[v1.GetBusinessClientResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("business.v1.BusinessClientService.GetBusinessClient is not implemented"))
}

func (UnimplementedBusinessClientServiceHandler) UpdateBusinessClient(context.Context, *connect.Request[v1.UpdateBusinessClientRequest]) (*connect.Response[v1.UpdateBusinessClientResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("business.v1.BusinessClientService.UpdateBusinessClient is not implemented"))
}

func (UnimplementedBusinessClientServiceHandler) DeleteBusinessClient(context.Context, *connect.Request[v1.DeleteBusinessClientRequest]) (*connect.Response[v1.DeleteBusinessClientResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("business.v1.BusinessClientService.DeleteBusinessClient is not implemented"))
}
