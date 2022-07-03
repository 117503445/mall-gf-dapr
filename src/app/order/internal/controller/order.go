package controller

import (
	v1 "117503445/mall-gf-dapr/app/order/api/v1"
	"117503445/mall-gf-dapr/app/order/internal/service"
	"117503445/mall-gf-dapr/app/order/model/entity"
	"117503445/mall-gf-dapr/app/utility"
	"context"

	dapr "github.com/dapr/go-sdk/client"
	"github.com/gogf/gf/v2/util/gconv"
	"google.golang.org/protobuf/proto"

	productV1 "117503445/mall-gf-dapr/app/product/api/v1"
)

var (
	Order = cOrder{}
)

type cOrder struct{}

func (c *cOrder) Create(ctx context.Context, req *v1.CreateReq) (*v1.CreateRes, error) {
	data, err := proto.Marshal(&productV1.PurchaseReq{
		Id:     int32(req.ProductId),
		Amount: int32(req.Amount),
	})
	if err != nil {
		return nil, err
	}

	order := &entity.Order{}
	if err = gconv.Struct(req, &order); err != nil {
		return nil, err
	}

	userID, err := utility.GetUserID(ctx)
	if err != nil {
		return nil, err
	}
	order.ConsumerId = userID

	resp, err := service.DaprClient.InvokeMethodWithContent(ctx, "product", "Purchase", "post", &dapr.DataContent{
		ContentType: "application/json",
		Data:        data,
	})
	if err != nil {
		return nil, err
	}

	rs := &productV1.PurchaseRes{}
	if err := proto.Unmarshal(resp, rs); err != nil {
		return nil, err
	}

	switch rs.Code {
	case 1:
		return nil, utility.ExpectedError{
			Code: 1,
			Msg:  "产品不存在",
		}
	case 2:
		return nil, utility.ExpectedError{
			Code: 2,
			Msg:  "产品库存不足",
		}
	}

	id, err := service.Order.Create(ctx, order)
	if err != nil {
		return nil, err
	}

	// TODO 分布式事务

	return &v1.CreateRes{
		Id: int(id),
	}, nil
}

func (c *cOrder) GetById(ctx context.Context, req *v1.GetReq) (*v1.GetRes, error) {
	order, err := service.Order.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}

	if order == nil {
		return &v1.GetRes{
			MetaInfo: utility.RspMetaInfo{
				Code: 1,
				Msg:  "订单不存在",
			},
		}, nil
	}

	res := &v1.GetRes{}
	if err := gconv.Struct(order, &res); err != nil {
		return nil, err
	}

	return res, nil
}

func (c *cOrder) DeleteById(ctx context.Context, req *v1.DeleteReq) (*v1.DeleteRes, error) {
	// TODO 恢复库存
	order, err := service.Order.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}

	if order == nil {
		return &v1.DeleteRes{
			MetaInfo: utility.RspMetaInfo{
				Code: 1,
				Msg:  "订单不存在",
			},
		}, nil
	}

	userID, err := utility.GetUserID(ctx)
	if err != nil {
		return nil, err
	}

	if order.ConsumerId != userID {
		return &v1.DeleteRes{
			MetaInfo: utility.RspMetaInfo{
				Code: 2,
				Msg:  "非订单创建者",
			},
		}, nil
	}

	err = service.Order.DeleteById(ctx, req.Id)
	if err != nil {
		return nil, err
	}

	return nil, nil
}
