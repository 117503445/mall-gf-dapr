package controller

import (
	v1 "117503445/mall-gf-dapr/app/order/api/v1"
	"117503445/mall-gf-dapr/app/utility"
	"context"
)

var (
	Hello = cHello{}
)

type cHello struct{}

func (c *cHello) Home(ctx context.Context, req *v1.HelloReq) (res *v1.HelloRes, err error) {
	return &v1.HelloRes{
		MetaInfo: utility.RspMetaInfo{
			Code: 0,
			Msg:  "ok",
		},
		Version: "2022-0712-2357",
	}, nil
}
