package controller

import (
	v1 "117503445/mall-gf-dapr/app/product/api/v1"
	"117503445/mall-gf-dapr/app/product/internal/service"
	"117503445/mall-gf-dapr/app/product/model/entity"
	"117503445/mall-gf-dapr/app/utility"
	"context"

	"github.com/gogf/gf/v2/util/gconv"
)

var (
	Product = cProduct{}
)

type cProduct struct{}

func (c *cProduct) Create(ctx context.Context, req *v1.CreateReq) (*v1.CreateRes, error) {

	userID, err := utility.GetUserID(ctx)

	if err != nil {
		return nil, err
	}

	product := &entity.Product{CreatorId: userID}
	if err = gconv.Struct(req, &product); err != nil {
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

	if product == nil {
		return &v1.GetRes{
			MetaInfo: utility.RspMetaInfo{
				Code: 1,
				Msg:  "产品不存在",
			},
		}, nil
	}

	res := &v1.GetRes{}

	if err := gconv.Struct(product, &res); err != nil {
		return nil, err
	}

	return res, nil
}

func (c *cProduct) DeleteById(ctx context.Context, req *v1.DeleteReq) (*v1.DeleteRes, error) {
	err := service.Product.DeleteById(ctx, req.Id)
	if err != nil {
		return nil, err
	}

	return nil, nil
}

func (c *cProduct) UpdateById(ctx context.Context, req *v1.UpdateReq) (*v1.UpdateRes, error) {
	product, err := service.Product.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}

	if product == nil {
		return &v1.UpdateRes{
			MetaInfo: utility.RspMetaInfo{
				Code: 1,
				Msg:  "产品不存在",
			},
		}, nil
	}

	userID, err := utility.GetUserID(ctx)
	if err != nil {
		return nil, err
	}

	if product.CreatorId != userID {
		return &v1.UpdateRes{
			MetaInfo: utility.RspMetaInfo{
				Code: 2,
				Msg:  "非产品创建者",
			},
		}, nil
	}

	// TODO(QHT): check 库存小于已售物品

	product = &entity.Product{}

	if err := gconv.Struct(req, &product); err != nil {
		return nil, err
	}

	err = service.Product.UpdateById(ctx, req.Id, product)
	if err != nil {
		return nil, err
	}

	return nil, nil
}
