package main

import (
	"117503445/mall-gf-dapr/app/order/internal/cmd"

	"github.com/gogf/gf/v2/os/gctx"
)

func main() {
	cmd.Main.Run(gctx.New())
}
