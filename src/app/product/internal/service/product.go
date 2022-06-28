package service

import (
	"117503445/mall-gf-dapr/app/product/dao"
	"117503445/mall-gf-dapr/app/product/model/entity"
	"context"
)

var Product = new(productService)

type productService struct{}

func (s *productService) Create(ctx context.Context, product *entity.Product) (err error) {
	_, err = dao.Product.Ctx(ctx).Data(product).Insert()
	return err
}
