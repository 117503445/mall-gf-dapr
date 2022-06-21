package v1

import (
	"github.com/gogf/gf/v2/frame/g"
)

type RigesterReq struct {
	g.Meta   `path:"/api/user/register" tags:"user" method:"post" summary:"user register"`
	Name     string
	Gender   int
	Mobile   string
	Password string
}

type RigesterRes struct {
	g.Meta `mime:"text/json"`
}
