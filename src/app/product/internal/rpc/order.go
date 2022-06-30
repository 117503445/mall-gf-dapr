package rpc

import (
	"context"

	"github.com/dapr/go-sdk/service/common"
	"github.com/gogf/gf/v2/frame/g"
)

func EchoHandler(ctx context.Context, in *common.InvocationEvent) (out *common.Content, err error) {
	g.Log().Line(true).Debug(ctx, "echo - ContentType:%s, Verb:%s, QueryString:%s, %+v", in.ContentType, in.Verb, in.QueryString, string(in.Data))
	// do something with the invocation here
	out = &common.Content{
		Data:        in.Data,
		ContentType: in.ContentType,
		DataTypeURL: in.DataTypeURL,
	}
	return
}
