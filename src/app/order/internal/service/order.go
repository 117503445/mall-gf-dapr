package service

import (
	"117503445/mall-gf-dapr/app/order/dao"
	"117503445/mall-gf-dapr/app/order/model/entity"
	"context"
)

var Order = new(orderService)

type orderService struct{}

func (s *orderService) Create(ctx context.Context, order *entity.Order) (id int64, err error) {
	result, err := dao.Order.Ctx(ctx).Data(order).Insert()
	if err != nil {
		return 0, nil
	}

	id, err = result.LastInsertId()
	if err != nil {
		return 0, err
	}

	return id, nil
}

// GetProductSoldAmount return the number of products sold
func (s *orderService) GetProductSoldAmount(ctx context.Context, productId int) (amount int64, err error){
	// TODO
	return 0, nil
}