package cmd

import (
	"context"
	"net/http"

	daprd "github.com/dapr/go-sdk/service/http"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gcmd"

	"117503445/mall-gf-dapr/app/pay/internal/controller"
	"117503445/mall-gf-dapr/app/utility"
)

var (
	Main = gcmd.Command{
		Name:  "main",
		Usage: "main",
		Brief: "start http server",
		Func: func(ctx context.Context, parser *gcmd.Parser) (err error) {
			utility.InitCasdoor(ctx)

			s := g.Server()
			s.Group("/", func(group *ghttp.RouterGroup) {
				group.Middleware(utility.CORS)
				group.Middleware(utility.HTTPLog)
				group.Middleware(utility.Response)
				group.Middleware(utility.Auth)

				group.Bind(
					controller.Hello,
				)

				group.Group("/api", func(group *ghttp.RouterGroup) {
					group.Group("/pay", func(group *ghttp.RouterGroup) {
						group.Bind(
							controller.Pay,
						)
					})
					group.Group("/operation", func(group *ghttp.RouterGroup) {
						group.Bind(
							controller.Operation,
						)
					})
				})
			})

			go func() {
				daprServer := daprd.NewService(":28003")

				g.Log().Line(true).Debug(ctx, "starting dapr server")
				if err := daprServer.Start(); err != nil && err != http.ErrServerClosed {
					g.Log().Line(true).Error(ctx, err)
				}
			}()

			s.Run()
			return nil
		},
	}
)
