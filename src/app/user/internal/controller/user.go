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

func (c *cUser) Hello(ctx context.Context, req *v1.RigesterReq) (res *v1.RigesterRes, err error) {
	// g.RequestFromCtx(ctx).Response.Writeln("Hello World!")
	return
}
