package cmd

import (
	"context"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gcmd"

	"117503445/mall-gf-dapr/app/template/internal/controller"
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
					group.Group("/template", func(group *ghttp.RouterGroup) {
						group.Bind(
							controller.template,
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
