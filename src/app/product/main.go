package main

import (
	"github.com/gogf/gf/v2/os/gctx"
	"117503445/mall-gf-dapr/app/product/internal/cmd"
)

func main() {
	cmd.Main.Run(gctx.New())
}
