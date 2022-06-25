package service

import (
	"117503445/mall-gf-dapr/app/user/dao"
	"117503445/mall-gf-dapr/app/user/model/entity"
	"context"
)

var User = new(userService)

type userService struct{}

func (s *userService) GetUserbyName(ctx context.Context, name string) (user *entity.User, err error) {
	err = dao.User.Ctx(ctx).Where(dao.User.Columns().Name, name).Scan(&user)
	return user, err
}

func (s *userService) CountUserByName(ctx context.Context, name string) (count int, err error) {
	return dao.User.Ctx(ctx).Where(dao.User.Columns().Name, name).Count()
}

func (s *userService) CreateUser(ctx context.Context, user *entity.User) (err error) {
	_, err = dao.User.Ctx(ctx).Data(user).Insert()
	return err
}
