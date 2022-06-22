package controller

import (
	"context"

	// "github.com/gogf/gf/v2/frame/g"

	v1 "117503445/mall-gf-dapr/app/user/api/v1"
)

var (
	User = cUser{}
)

type cUser struct{}

func (c *cUser) Rigester(ctx context.Context, req *v1.RigesterReq) (res *v1.RigesterRes, err error) {
	return
}

func (c *cUser) Login(ctx context.Context, req *v1.LoginReq) (res *v1.LoginRes, err error) {
	return
}

func (c *cUser) Info(ctx context.Context, req *v1.InfoReq) (res *v1.InfoRes, err error) {
	return
}
