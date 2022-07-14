package controller

import (
	v1 "117503445/mall-gf-dapr/app/pay/api/v1"
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
		Version: "order 2022-0713-0053",
	}, nil
}
