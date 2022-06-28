package controller

import (
	v1 "117503445/mall-gf-dapr/app/product/api/v1"
	"117503445/mall-gf-dapr/app/product/internal/service"
	"117503445/mall-gf-dapr/app/product/model/entity"
	"context"

	"github.com/gogf/gf/v2/util/gconv"
)

var (
	Product = cProduct{}
)

type cProduct struct{}

func (c *cProduct) Create(ctx context.Context, req *v1.CreateReq) (*v1.CreateRes, error) {

	product := &entity.Product{CreatorId: "TODO"}
	if err := gconv.Struct(req, &product); err != nil {
		return nil, err
	}

	if err := service.Product.Create(ctx, product); err != nil {
		return nil, err
	}

	return nil, nil
}

func (c *cProduct) GetById(ctx context.Context, req *v1.GetReq) (*v1.GetRes, error) {
	product, err := service.Product.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}

	res := &v1.GetRes{}

	if err := gconv.Struct(product, &res); err != nil {
		return nil, err
	}

	return res, nil
}
