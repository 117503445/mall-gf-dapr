package controller

import (
	v1 "117503445/mall-gf-dapr/app/pay/api/v1"
	"117503445/mall-gf-dapr/app/pay/internal/service"
	"117503445/mall-gf-dapr/app/pay/model/entity"
	"117503445/mall-gf-dapr/app/utility"
	"context"

	// dapr "github.com/dapr/go-sdk/client"
	"github.com/gogf/gf/v2/util/gconv"
	// "google.golang.org/protobuf/proto"
	// productV1 "117503445/mall-gf-dapr/app/product/api/v1"
)

var (
	Pay = cPay{}
)

type cPay struct{}

func (c *cPay) Create(ctx context.Context, req *v1.CreateReq) (*v1.CreateRes, error) {

	pay := &entity.Pay{}
	if err := gconv.Struct(req, &pay); err != nil {
		return nil, err
	}

	userID, err := utility.GetUserID(ctx)
	if err != nil {
		return nil, err
	}
	pay.ConsumerId = userID

	id, err := service.Pay.Create(ctx, pay)
	if err != nil {
		return nil, err
	}

	return &v1.CreateRes{
		Id: int(id),
	}, nil
}

func (c *cPay) GetById(ctx context.Context, req *v1.GetReq) (*v1.GetRes, error) {
	pay, err := service.Pay.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}

	if pay == nil {
		return &v1.GetRes{
			MetaInfo: utility.RspMetaInfo{
				Code: 1,
				Msg:  "支付订单不存在",
			},
		}, nil
	}

	res := &v1.GetRes{}
	if err := gconv.Struct(pay, &res); err != nil {
		return nil, err
	}

	return res, nil
}