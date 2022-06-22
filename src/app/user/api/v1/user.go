package v1

import (
	"github.com/gogf/gf/v2/frame/g"
)

type RigesterReq struct {
	g.Meta   `path:"/register" tags:"user" method:"post" summary:"user register"`
	Name     string
	Gender   int
	Mobile   string
	Password string
}

type RigesterRes struct {
	g.Meta `mime:"application/json"`
}

type LoginReq struct {
	g.Meta   `path:"/login" tags:"user" method:"post" summary:"user login"`
	Mobile   string
	Password string
}

type LoginRes struct {
	g.Meta `mime:"application/json"`
}

type InfoReq struct {
	g.Meta `path:"/info" tags:"user" method:"get" summary:"user info"`
	Id     int64
}

type InfoRes struct {
	g.Meta `mime:"application/json"`
}
