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
	dt, err := proto.Marshal(&productV1.GetProductRPCReq{
		Id: int32(req.ProductId),
	})
	if err != nil {
		return nil, err
	}

	content := &dapr.DataContent{
		ContentType: "application/json",
		Data:        dt,
	}

	resp, err := service.DaprClient.InvokeMethodWithContent(ctx, "product", "GetProduct", "post", content)
	if err != nil {
		return nil, err
	}

	rs := &productV1.GetProductRPCRes{}
	if err := proto.Unmarshal(resp, rs); err != nil {
		return nil, err
	}

	if rs.Code == 1 {
		return nil, utility.ExpectedError{
			Code: 1,
			Msg:  "产品不存在",
		}
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

	id, err := service.Order.Create(ctx, order)
	if err != nil {
		return nil, err
	}

	return &v1.CreateRes{
		Id: int(id),
	}, nil
}
