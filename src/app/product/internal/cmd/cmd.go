package cmd

import (
	"context"
	"net/http"

	daprd "github.com/dapr/go-sdk/service/http"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gcmd"

	"117503445/mall-gf-dapr/app/product/internal/controller"
	"117503445/mall-gf-dapr/app/product/internal/rpc"
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

				group.Group("/api", func(group *ghttp.RouterGroup) {
					group.Group("/product", func(group *ghttp.RouterGroup) {
						group.Bind(
							controller.Product,
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
				daprServer := daprd.NewService(":28001")

				if err := daprServer.AddServiceInvocationHandler("GetProduct", rpc.GetProduct); err != nil {
					g.Log().Line(true).Error(ctx, err)
				}
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
