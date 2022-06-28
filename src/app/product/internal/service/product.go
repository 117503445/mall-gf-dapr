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

func (s *productService) GetById(ctx context.Context, id int) (product *entity.Product, err error) {
	err = dao.Product.Ctx(ctx).Where(dao.Product.Columns().Id, id).Scan(&product)
	return product, err
}

func (s *productService) DeleteById(ctx context.Context, id int) (err error) {
	_, err = dao.Product.Ctx(ctx).Where(dao.Product.Columns().Id, id).Delete()
	return err
}

func (s *productService) UpdateById(ctx context.Context, id int, product *entity.Product) (err error) {
	_, err = dao.Product.Ctx(ctx).Where(dao.Product.Columns().Id, id).Data(product).Update()
	return err
}
