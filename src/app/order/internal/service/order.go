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

func (s *orderService) GetById(ctx context.Context, id int) (order *entity.Order, err error) {
	err = dao.Order.Ctx(ctx).Where(dao.Order.Columns().Id, id).Scan(&order)
	return order, err
}

func (s *orderService) DeleteById(ctx context.Context, id int) (err error) {
	_, err = dao.Order.Ctx(ctx).Where(dao.Order.Columns().Id, id).Delete()
	return err
}

func (s *orderService) GetListByUserId(ctx context.Context, userId string) (orders []*entity.Order, err error) {
	err = dao.Order.Ctx(ctx).Where(dao.Order.Columns().ConsumerId, userId).Scan(&orders)
	return orders, err
}