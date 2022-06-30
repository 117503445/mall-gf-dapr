package controller

import (
	v1 "117503445/mall-gf-dapr/app/order/api/v1"
	"117503445/mall-gf-dapr/app/order/internal/service"
	"context"

	dapr "github.com/dapr/go-sdk/client"
	"github.com/gogf/gf/v2/frame/g"
)

var (
	Order = cOrder{}
)

type cOrder struct{}

func (c *cOrder) Create(ctx context.Context, req *v1.CreateReq) (*v1.CreateRes, error) {
	g.Log().Line(true).Debug(ctx, g.Map{"M": "order create"})
	content := &dapr.DataContent{
		ContentType: "application/json",
		Data:        []byte(`{ "id": "a123", "value": "demo", "valid": true }`),
	}

	resp, err := service.DaprClient.InvokeMethodWithContent(ctx, "product", "echo", "post", content)
	if err != nil {
		g.Log().Line(true).Error(ctx, err)
	} else {
		g.Log().Line(true).Debug(ctx, g.Map{"resp": resp})
	}

	// userID, err := utility.GetUserID(ctx)

	// g.Log().Line(true).Debug(ctx, g.Map{"userID": userID})

	// if err != nil {
	// 	return nil, err
	// }

	// order := &entity.Order{}
	// if err = gconv.Struct(req, &order); err != nil {
	// 	return nil, err
	// }

	// id, err := service.Order.Create(ctx, order)
	// if err != nil {
	// 	return nil, err
	// }

	return &v1.CreateRes{
		// Id: int(id),
	}, nil
}
