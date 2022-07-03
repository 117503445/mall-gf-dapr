package rpc

import (
	v1 "117503445/mall-gf-dapr/app/product/api/v1"
	"117503445/mall-gf-dapr/app/product/internal/service"
	"context"

	"github.com/dapr/go-sdk/service/common"
	"google.golang.org/protobuf/proto"
	"google.golang.org/protobuf/reflect/protoreflect"
)

func Purchase(ctx context.Context, in *common.InvocationEvent) (out *common.Content, err error) {
	req := &v1.PurchaseReq{}
	if err := proto.Unmarshal(in.Data, req); err != nil {
		return nil, err
	}

	product, err := service.Product.GetById(ctx, int(req.Id))
	if err != nil {
		return nil, err
	}

	if product == nil {
		return makeResponse(&v1.PurchaseRes{
			Code: 1,
		}, in)
	}

	if product.Stock < uint(req.Amount) {
		return makeResponse(&v1.PurchaseRes{
			Code: 2,
		}, in)
	}

	product.Stock -= uint(req.Amount)

	err = service.Product.UpdateById(ctx, int(product.Id), product)
	if err != nil {
		return nil, err
	}

	return makeResponse(&v1.PurchaseRes{
		Code: 0,
	}, in)
}

func makeResponse(response protoreflect.ProtoMessage, in *common.InvocationEvent) (out *common.Content, err error) {
	if data, err := proto.Marshal(response); err != nil {
		return nil, err
	} else {
		return &common.Content{
			Data:        data,
			ContentType: in.ContentType,
			DataTypeURL: in.DataTypeURL,
		}, nil
	}
}
