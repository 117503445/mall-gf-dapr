package v1

import (
	"117503445/mall-gf-dapr/app/utility"

	"github.com/gogf/gf/v2/frame/g"
)

type CreateReq struct {
	g.Meta  `path:"/" tags:"pay" method:"post"`
	OrderID uint64
}

type CreateRes struct {
	g.Meta   `mime:"application/json"`
	MetaInfo utility.RspMetaInfo `json:"-"`
	Id       int
	Status   int
}

type GetReq struct {
	g.Meta `path:"/:id" tags:"pay" method:"get"`
	Id     int
}

type GetRes struct {
	g.Meta   `mime:"application/json"`
	MetaInfo utility.RspMetaInfo `json:"-"`
	Id       int
	Status   int
}

type CallbackReq struct {
	g.Meta `path:"/callback" tags:"pay" method:"post"`

	Id     int
	Amount int

	Source string
	Sign   string
}

type CallbackRes struct {
	g.Meta   `mime:"application/json"`
	MetaInfo utility.RspMetaInfo `json:"-"`
}


type CancelReq struct {
	g.Meta `path:"/cancel/:id" tags:"pay" method:"post"`

	Id     int
}

type CancelRes struct {
	g.Meta   `mime:"application/json"`
	MetaInfo utility.RspMetaInfo `json:"-"`

	Status int
}
