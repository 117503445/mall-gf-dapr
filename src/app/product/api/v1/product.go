package v1

import (
	"117503445/mall-gf-dapr/app/utility"

	"github.com/gogf/gf/v2/frame/g"
)

type CreateReq struct {
	g.Meta `path:"/" tags:"product" method:"post"`
	Name   string
	Desc   string
	Stock  int
	Price  int
}

type CreateRes struct {
	g.Meta   `mime:"application/json"`
	MetaInfo utility.RspMetaInfo `json:"-"`
}