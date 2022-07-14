package controller

import (
	v1 "117503445/mall-gf-dapr/app/pay/api/v1"
	"117503445/mall-gf-dapr/app/utility"
	"context"
)

var (
	Operation = cOperation{}
)

type cOperation struct{}

func (c *cOperation) InitDB(ctx context.Context, req *v1.InitDBReq) (res *v1.InitDBRes, err error) {
	utility.InitDB(ctx)
	return &v1.InitDBRes{
		MetaInfo: utility.RspMetaInfo{
			Code: 0,
			Msg:  "ok",
		},
	}, nil
}
