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

type GetReq struct {
	g.Meta `path:"/:id" tags:"order" method:"get"`
	Id     int
}

type GetRes struct {
	g.Meta     `mime:"application/json"`
	MetaInfo   utility.RspMetaInfo `json:"-"`
	ConsumerId string
	ProductId  uint64
	Amount     uint
}

type DeleteReq struct {
	g.Meta `path:"/:id" tags:"order" method:"delete"`
	Id     int
}

type DeleteRes struct {
	g.Meta   `mime:"application/json"`
	MetaInfo utility.RspMetaInfo `json:"-"`
}

type GetListReq struct {
	g.Meta `path:"/me" tags:"order" method:"get"`
}

type GetListRes struct {
	g.Meta   `mime:"application/json"`
	MetaInfo utility.RspMetaInfo `json:"-"`

	Items []struct {
		ProductId uint64
		Amount    uint
	}
}
