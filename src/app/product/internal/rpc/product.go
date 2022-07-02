package rpc

import (
	v1 "117503445/mall-gf-dapr/app/product/api/v1"
	"117503445/mall-gf-dapr/app/product/internal/service"
	"context"

	"github.com/dapr/go-sdk/service/common"
	"github.com/gogf/gf/v2/util/gconv"
	"google.golang.org/protobuf/proto"
)

func GetProduct(ctx context.Context, in *common.InvocationEvent) (out *common.Content, err error) {
	req := &v1.GetProductRPCReq{}
	if err := proto.Unmarshal(in.Data, req); err != nil {
		return nil, err
	}

	product, err := service.Product.GetById(ctx, int(req.Id))
	if err != nil {
		return nil, err
	}

	if product == nil {
		res := &v1.GetProductRPCRes{
			Code: 1,
		}
		if data, err := proto.Marshal(res); err != nil {
			return nil, err
		} else {
			return &common.Content{
				Data:        data,
				ContentType: in.ContentType,
				DataTypeURL: in.DataTypeURL,
			}, nil
		}
	}

	res := &v1.GetProductRPCRes{}
	if err := gconv.Struct(product, &res); err != nil {
		return nil, err
	}

	if data, err := proto.Marshal(res); err != nil {
		return nil, err
	} else {
		return &common.Content{
			Data:        data,
			ContentType: in.ContentType,
			DataTypeURL: in.DataTypeURL,
		}, nil
	}
}
