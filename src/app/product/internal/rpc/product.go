package rpc

import (
	v1 "117503445/mall-gf-dapr/app/product/api/v1"
	"117503445/mall-gf-dapr/app/product/internal/service"
	"context"

	"github.com/dapr/go-sdk/service/common"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
)

func GetProduct(ctx context.Context, in *common.InvocationEvent) (out *common.Content, err error) {
	req := new(v1.GetProductRPCReq)
	// if j, err := gjson.DecodeToJson(in.Data); err != nil {
	// 	panic(err)
	// } else {
	// 	if err := j.Scan(req); err != nil {
	// 		panic(err)
	// 	}
	// }
	req.Id = 1
	product, err := service.Product.GetById(ctx, req.Id)
	if err != nil {
		panic(err)
	}

	g.Log().Line(true).Debug(ctx, "product == nil", product == nil)

	var res *v1.GetProductRPCRes

	if err := gconv.Struct(product, &res); err != nil {
		panic(err)
	}

	data, err := gjson.Encode(res)
	if err != nil {
		panic(err)
	}

	out = &common.Content{
		Data:        data,
		ContentType: in.ContentType,
		DataTypeURL: in.DataTypeURL,
	}
	return
}
