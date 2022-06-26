package v1

import "github.com/gogf/gf/v2/frame/g"

type InitDBReq struct {
	g.Meta `path:"/initDB" tags:"operation" method:"post"`
}

type InitDBRes struct {
	g.Meta `mime:"application/json"`
}
