package cmd

import (
	"context"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gcmd"

	"117503445/mall-gf-dapr/app/user/internal/controller"
	"117503445/mall-gf-dapr/app/utility"
)

var (
	Main = gcmd.Command{
		Name:  "main",
		Usage: "main",
		Brief: "start http server",
		Func: func(ctx context.Context, parser *gcmd.Parser) (err error) {
			s := g.Server()
			s.Group("/", func(group *ghttp.RouterGroup) {
				group.Middleware(utility.CORS)
				group.Middleware(utility.HTTPLog)
				group.Middleware(utility.Response)
				group.Group("/api", func(group *ghttp.RouterGroup) {
					group.Group("/user", func(group *ghttp.RouterGroup) {
						group.Bind(
							controller.User,
						)
					})
					group.Group("/operation", func(group *ghttp.RouterGroup) {
						group.Bind(
							controller.Operation,
						)
					})
				})
			})
			s.Run()
			return nil
		},
	}
)
