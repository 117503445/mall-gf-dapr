package v1

import (
	"117503445/mall-gf-dapr/app/utility"

	"github.com/gogf/gf/v2/frame/g"
)

type CreateReq struct {
	g.Meta    `path:"/" tags:"order" method:"post"`
	ProductId uint64
	Amount    uint
}

type CreateRes struct {
	g.Meta   `mime:"application/json"`
	MetaInfo utility.RspMetaInfo `json:"-"`
	Id       int
}
