package main

import (
	_ "117503445/mall-gf-dapr/app/user/internal/packed"

	"github.com/gogf/gf/v2/os/gctx"

	"117503445/mall-gf-dapr/app/user/internal/cmd"
)

func main() {
	cmd.Main.Run(gctx.New())
}
