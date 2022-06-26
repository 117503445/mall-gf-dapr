package controller

import (
	"context"

	// "github.com/gogf/gf/v2/frame/g"

	v1 "117503445/mall-gf-dapr/app/user/api/v1"
	"117503445/mall-gf-dapr/app/user/internal/service"
	"117503445/mall-gf-dapr/app/user/model/entity"
	"117503445/mall-gf-dapr/app/utility"

	"github.com/gogf/gf/v2/frame/g"
)

var (
	User = cUser{}
)

type cUser struct{}

func (c *cUser) Rigester(ctx context.Context, req *v1.RigesterReq) (*v1.RigesterRes, error) {
	num, err := service.User.CountUserByName(ctx, req.Name)
	if err != nil {
		return nil, err
	}

	g.Log().Info(ctx, g.Map{"name": req.Name, "num": num})

	if num > 0 {
		return &v1.RigesterRes{
			MetaInfo: utility.RspMetaInfo{
				Code: 1,
				Msg:  "用户已注册",
			},
		}, nil
	}

	err = service.User.CreateUser(ctx, &entity.User{
		Name:     req.Name,
		Gender:   uint(req.Gender),
		Mobile:   req.Mobile,
		Password: req.Password,
	})
	if err != nil {
		return nil, err
	}

	return &v1.RigesterRes{}, nil
}

func (c *cUser) Login(ctx context.Context, req *v1.LoginReq) ( *v1.LoginRes,  error) {
	return &v1.LoginRes{}, nil
}

func (c *cUser) Info(ctx context.Context, req *v1.InfoReq) ( *v1.InfoRes,  error) {
	return &v1.InfoRes{}, nil
}
