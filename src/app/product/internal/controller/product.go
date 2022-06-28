package controller

import (
	v1 "117503445/mall-gf-dapr/app/product/api/v1"
	"117503445/mall-gf-dapr/app/product/internal/service"
	"117503445/mall-gf-dapr/app/product/model/entity"
	"context"
)

var (
	Product = cProduct{}
)

type cProduct struct{}

func (c *cProduct) Create(ctx context.Context, req *v1.CreateReq) (*v1.CreateRes, error) {
	err := service.Product.Create(ctx, &entity.Product{
		Name:      req.Name,
		Desc:      req.Desc,
		Stock:     uint(req.Stock),
		Price:     uint(req.Price),
		CreatorId: "TODO",
	})
	if err != nil {
		return nil, err
	}

	return &v1.CreateRes{}, nil
}
