package service

import (
	"117503445/mall-gf-dapr/app/pay/dao"
	"117503445/mall-gf-dapr/app/pay/model/entity"
	"context"
)

var Pay = new(payService)

type payService struct{}

func (s *payService) Create(ctx context.Context, pay *entity.Pay) (id int64, err error) {
	result, err := dao.Pay.Ctx(ctx).Data(pay).Insert()
	if err != nil {
		return 0, nil
	}

	id, err = result.LastInsertId()
	if err != nil {
		return 0, err
	}

	return id, nil
}

func (s *payService) GetById(ctx context.Context, id int) (pay *entity.Pay, err error) {
	err = dao.Pay.Ctx(ctx).Where(dao.Pay.Columns().Id, id).Scan(&pay)
	return pay, err
}

func (s *payService) DeleteById(ctx context.Context, id int) (err error) {
	_, err = dao.Pay.Ctx(ctx).Where(dao.Pay.Columns().Id, id).Delete()
	return err
}
