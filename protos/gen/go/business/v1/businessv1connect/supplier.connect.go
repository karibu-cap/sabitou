// Code generated by protoc-gen-connect-go. DO NOT EDIT.
//
// Source: business/v1/supplier.proto

package businessv1connect

import (
	connect "connectrpc.com/connect"
	context "context"
	errors "errors"
	v1 "github.com/karibu-cap/sabitou/protos/gen/go/business/v1"
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
	// SupplierServiceName is the fully-qualified name of the SupplierService service.
	SupplierServiceName = "business.v1.SupplierService"
)

// These constants are the fully-qualified names of the RPCs defined in this package. They're
// exposed at runtime as Spec.Procedure and as the final two segments of the HTTP route.
//
// Note that these are different from the fully-qualified method names used by
// google.golang.org/protobuf/reflect/protoreflect. To convert from these constants to
// reflection-formatted method names, remove the leading slash and convert the remaining slash to a
// period.
const (
	// SupplierServiceCreateSupplierProcedure is the fully-qualified name of the SupplierService's
	// CreateSupplier RPC.
	SupplierServiceCreateSupplierProcedure = "/business.v1.SupplierService/CreateSupplier"
	// SupplierServiceGetSupplierProcedure is the fully-qualified name of the SupplierService's
	// GetSupplier RPC.
	SupplierServiceGetSupplierProcedure = "/business.v1.SupplierService/GetSupplier"
	// SupplierServiceGetBusinessSuppliersProcedure is the fully-qualified name of the SupplierService's
	// GetBusinessSuppliers RPC.
	SupplierServiceGetBusinessSuppliersProcedure = "/business.v1.SupplierService/GetBusinessSuppliers"
	// SupplierServiceUpdateSupplierProcedure is the fully-qualified name of the SupplierService's
	// UpdateSupplier RPC.
	SupplierServiceUpdateSupplierProcedure = "/business.v1.SupplierService/UpdateSupplier"
	// SupplierServiceDeleteSupplierProcedure is the fully-qualified name of the SupplierService's
	// DeleteSupplier RPC.
	SupplierServiceDeleteSupplierProcedure = "/business.v1.SupplierService/DeleteSupplier"
)

// SupplierServiceClient is a client for the business.v1.SupplierService service.
type SupplierServiceClient interface {
	// Creates a new supplier.
	CreateSupplier(context.Context, *connect.Request[v1.CreateSupplierRequest]) (*connect.Response[v1.CreateSupplierResponse], error)
	// Gets a supplier by id.
	GetSupplier(context.Context, *connect.Request[v1.GetSupplierRequest]) (*connect.Response[v1.GetSupplierResponse], error)
	// Gets all suppliers of a business.
	GetBusinessSuppliers(context.Context, *connect.Request[v1.GetBusinessSuppliersRequest]) (*connect.Response[v1.GetBusinessSuppliersResponse], error)
	// Updates a supplier.
	// Note:Only the fields that are set will be updated.
	UpdateSupplier(context.Context, *connect.Request[v1.UpdateSupplierRequest]) (*connect.Response[v1.UpdateSupplierResponse], error)
	// Deletes a supplier.
	DeleteSupplier(context.Context, *connect.Request[v1.DeleteSupplierRequest]) (*connect.Response[v1.DeleteSupplierResponse], error)
}

// NewSupplierServiceClient constructs a client for the business.v1.SupplierService service. By
// default, it uses the Connect protocol with the binary Protobuf Codec, asks for gzipped responses,
// and sends uncompressed requests. To use the gRPC or gRPC-Web protocols, supply the
// connect.WithGRPC() or connect.WithGRPCWeb() options.
//
// The URL supplied here should be the base URL for the Connect or gRPC server (for example,
// http://api.acme.com or https://acme.com/grpc).
func NewSupplierServiceClient(httpClient connect.HTTPClient, baseURL string, opts ...connect.ClientOption) SupplierServiceClient {
	baseURL = strings.TrimRight(baseURL, "/")
	supplierServiceMethods := v1.File_business_v1_supplier_proto.Services().ByName("SupplierService").Methods()
	return &supplierServiceClient{
		createSupplier: connect.NewClient[v1.CreateSupplierRequest, v1.CreateSupplierResponse](
			httpClient,
			baseURL+SupplierServiceCreateSupplierProcedure,
			connect.WithSchema(supplierServiceMethods.ByName("CreateSupplier")),
			connect.WithClientOptions(opts...),
		),
		getSupplier: connect.NewClient[v1.GetSupplierRequest, v1.GetSupplierResponse](
			httpClient,
			baseURL+SupplierServiceGetSupplierProcedure,
			connect.WithSchema(supplierServiceMethods.ByName("GetSupplier")),
			connect.WithClientOptions(opts...),
		),
		getBusinessSuppliers: connect.NewClient[v1.GetBusinessSuppliersRequest, v1.GetBusinessSuppliersResponse](
			httpClient,
			baseURL+SupplierServiceGetBusinessSuppliersProcedure,
			connect.WithSchema(supplierServiceMethods.ByName("GetBusinessSuppliers")),
			connect.WithClientOptions(opts...),
		),
		updateSupplier: connect.NewClient[v1.UpdateSupplierRequest, v1.UpdateSupplierResponse](
			httpClient,
			baseURL+SupplierServiceUpdateSupplierProcedure,
			connect.WithSchema(supplierServiceMethods.ByName("UpdateSupplier")),
			connect.WithClientOptions(opts...),
		),
		deleteSupplier: connect.NewClient[v1.DeleteSupplierRequest, v1.DeleteSupplierResponse](
			httpClient,
			baseURL+SupplierServiceDeleteSupplierProcedure,
			connect.WithSchema(supplierServiceMethods.ByName("DeleteSupplier")),
			connect.WithClientOptions(opts...),
		),
	}
}

// supplierServiceClient implements SupplierServiceClient.
type supplierServiceClient struct {
	createSupplier       *connect.Client[v1.CreateSupplierRequest, v1.CreateSupplierResponse]
	getSupplier          *connect.Client[v1.GetSupplierRequest, v1.GetSupplierResponse]
	getBusinessSuppliers *connect.Client[v1.GetBusinessSuppliersRequest, v1.GetBusinessSuppliersResponse]
	updateSupplier       *connect.Client[v1.UpdateSupplierRequest, v1.UpdateSupplierResponse]
	deleteSupplier       *connect.Client[v1.DeleteSupplierRequest, v1.DeleteSupplierResponse]
}

// CreateSupplier calls business.v1.SupplierService.CreateSupplier.
func (c *supplierServiceClient) CreateSupplier(ctx context.Context, req *connect.Request[v1.CreateSupplierRequest]) (*connect.Response[v1.CreateSupplierResponse], error) {
	return c.createSupplier.CallUnary(ctx, req)
}

// GetSupplier calls business.v1.SupplierService.GetSupplier.
func (c *supplierServiceClient) GetSupplier(ctx context.Context, req *connect.Request[v1.GetSupplierRequest]) (*connect.Response[v1.GetSupplierResponse], error) {
	return c.getSupplier.CallUnary(ctx, req)
}

// GetBusinessSuppliers calls business.v1.SupplierService.GetBusinessSuppliers.
func (c *supplierServiceClient) GetBusinessSuppliers(ctx context.Context, req *connect.Request[v1.GetBusinessSuppliersRequest]) (*connect.Response[v1.GetBusinessSuppliersResponse], error) {
	return c.getBusinessSuppliers.CallUnary(ctx, req)
}

// UpdateSupplier calls business.v1.SupplierService.UpdateSupplier.
func (c *supplierServiceClient) UpdateSupplier(ctx context.Context, req *connect.Request[v1.UpdateSupplierRequest]) (*connect.Response[v1.UpdateSupplierResponse], error) {
	return c.updateSupplier.CallUnary(ctx, req)
}

// DeleteSupplier calls business.v1.SupplierService.DeleteSupplier.
func (c *supplierServiceClient) DeleteSupplier(ctx context.Context, req *connect.Request[v1.DeleteSupplierRequest]) (*connect.Response[v1.DeleteSupplierResponse], error) {
	return c.deleteSupplier.CallUnary(ctx, req)
}

// SupplierServiceHandler is an implementation of the business.v1.SupplierService service.
type SupplierServiceHandler interface {
	// Creates a new supplier.
	CreateSupplier(context.Context, *connect.Request[v1.CreateSupplierRequest]) (*connect.Response[v1.CreateSupplierResponse], error)
	// Gets a supplier by id.
	GetSupplier(context.Context, *connect.Request[v1.GetSupplierRequest]) (*connect.Response[v1.GetSupplierResponse], error)
	// Gets all suppliers of a business.
	GetBusinessSuppliers(context.Context, *connect.Request[v1.GetBusinessSuppliersRequest]) (*connect.Response[v1.GetBusinessSuppliersResponse], error)
	// Updates a supplier.
	// Note:Only the fields that are set will be updated.
	UpdateSupplier(context.Context, *connect.Request[v1.UpdateSupplierRequest]) (*connect.Response[v1.UpdateSupplierResponse], error)
	// Deletes a supplier.
	DeleteSupplier(context.Context, *connect.Request[v1.DeleteSupplierRequest]) (*connect.Response[v1.DeleteSupplierResponse], error)
}

// NewSupplierServiceHandler builds an HTTP handler from the service implementation. It returns the
// path on which to mount the handler and the handler itself.
//
// By default, handlers support the Connect, gRPC, and gRPC-Web protocols with the binary Protobuf
// and JSON codecs. They also support gzip compression.
func NewSupplierServiceHandler(svc SupplierServiceHandler, opts ...connect.HandlerOption) (string, http.Handler) {
	supplierServiceMethods := v1.File_business_v1_supplier_proto.Services().ByName("SupplierService").Methods()
	supplierServiceCreateSupplierHandler := connect.NewUnaryHandler(
		SupplierServiceCreateSupplierProcedure,
		svc.CreateSupplier,
		connect.WithSchema(supplierServiceMethods.ByName("CreateSupplier")),
		connect.WithHandlerOptions(opts...),
	)
	supplierServiceGetSupplierHandler := connect.NewUnaryHandler(
		SupplierServiceGetSupplierProcedure,
		svc.GetSupplier,
		connect.WithSchema(supplierServiceMethods.ByName("GetSupplier")),
		connect.WithHandlerOptions(opts...),
	)
	supplierServiceGetBusinessSuppliersHandler := connect.NewUnaryHandler(
		SupplierServiceGetBusinessSuppliersProcedure,
		svc.GetBusinessSuppliers,
		connect.WithSchema(supplierServiceMethods.ByName("GetBusinessSuppliers")),
		connect.WithHandlerOptions(opts...),
	)
	supplierServiceUpdateSupplierHandler := connect.NewUnaryHandler(
		SupplierServiceUpdateSupplierProcedure,
		svc.UpdateSupplier,
		connect.WithSchema(supplierServiceMethods.ByName("UpdateSupplier")),
		connect.WithHandlerOptions(opts...),
	)
	supplierServiceDeleteSupplierHandler := connect.NewUnaryHandler(
		SupplierServiceDeleteSupplierProcedure,
		svc.DeleteSupplier,
		connect.WithSchema(supplierServiceMethods.ByName("DeleteSupplier")),
		connect.WithHandlerOptions(opts...),
	)
	return "/business.v1.SupplierService/", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch r.URL.Path {
		case SupplierServiceCreateSupplierProcedure:
			supplierServiceCreateSupplierHandler.ServeHTTP(w, r)
		case SupplierServiceGetSupplierProcedure:
			supplierServiceGetSupplierHandler.ServeHTTP(w, r)
		case SupplierServiceGetBusinessSuppliersProcedure:
			supplierServiceGetBusinessSuppliersHandler.ServeHTTP(w, r)
		case SupplierServiceUpdateSupplierProcedure:
			supplierServiceUpdateSupplierHandler.ServeHTTP(w, r)
		case SupplierServiceDeleteSupplierProcedure:
			supplierServiceDeleteSupplierHandler.ServeHTTP(w, r)
		default:
			http.NotFound(w, r)
		}
	})
}

// UnimplementedSupplierServiceHandler returns CodeUnimplemented from all methods.
type UnimplementedSupplierServiceHandler struct{}

func (UnimplementedSupplierServiceHandler) CreateSupplier(context.Context, *connect.Request[v1.CreateSupplierRequest]) (*connect.Response[v1.CreateSupplierResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("business.v1.SupplierService.CreateSupplier is not implemented"))
}

func (UnimplementedSupplierServiceHandler) GetSupplier(context.Context, *connect.Request[v1.GetSupplierRequest]) (*connect.Response[v1.GetSupplierResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("business.v1.SupplierService.GetSupplier is not implemented"))
}

func (UnimplementedSupplierServiceHandler) GetBusinessSuppliers(context.Context, *connect.Request[v1.GetBusinessSuppliersRequest]) (*connect.Response[v1.GetBusinessSuppliersResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("business.v1.SupplierService.GetBusinessSuppliers is not implemented"))
}

func (UnimplementedSupplierServiceHandler) UpdateSupplier(context.Context, *connect.Request[v1.UpdateSupplierRequest]) (*connect.Response[v1.UpdateSupplierResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("business.v1.SupplierService.UpdateSupplier is not implemented"))
}

func (UnimplementedSupplierServiceHandler) DeleteSupplier(context.Context, *connect.Request[v1.DeleteSupplierRequest]) (*connect.Response[v1.DeleteSupplierResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("business.v1.SupplierService.DeleteSupplier is not implemented"))
}
