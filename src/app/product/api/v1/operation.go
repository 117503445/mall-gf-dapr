package v1

import (
	"117503445/mall-gf-dapr/app/utility"

	"github.com/gogf/gf/v2/frame/g"
)

type InitDBReq struct {
	g.Meta `path:"/initDB" tags:"operation" method:"post"`
}

type InitDBRes struct {
	g.Meta   `mime:"application/json"`
	MetaInfo utility.RspMetaInfo `json:"-"`
}
