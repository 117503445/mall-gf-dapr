package controller

import (
	v1 "117503445/mall-gf-dapr/app/user/api/v1"
	"117503445/mall-gf-dapr/app/utility"
	"context"
)

var (
	Operation = cOperation{}
)

type cOperation struct{}

func (c *cOperation) InitDB(ctx context.Context, req *v1.InitDBReq) (res *v1.InitDBRes, err error) {
	utility.InitDB(ctx)
	return nil, nil
}
