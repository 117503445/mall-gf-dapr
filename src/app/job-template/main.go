package main

import (
	_ "mall-gf-dapr/app/job-template/internal/packed"

	"github.com/gogf/gf/v2/os/gctx"

	"mall-gf-dapr/app/job-template/internal/cmd"
)

func main() {
	cmd.Main.Run(gctx.New())
}
