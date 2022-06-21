package utility

import (
	"fmt"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/net/gtrace"
)

// ExpectedError is expected error
type ExpectedError struct {
	Code int
	Msg  string
}

func (e ExpectedError) Error() string {
	return fmt.Sprintf("ExpectedError: Code = %d, Msg = %s", e.Code, e.Msg)
}

// Response handling res object to http response.
func Response(r *ghttp.Request) {
	r.Middleware.Next()

	err := r.GetError()

	if err == nil && r.Response.BufferLength() > 0 {
		// The response has been written, so this middleware does not continue to write
		return
	}

	if err != nil {
		// when panic, GoFrame will write Error msg to Response
		// but we need return http response in {"code" "msg" "data"} format
		// so clear previous response
		r.Response.ClearBuffer()
	}

	var (
		msg  string
		code int
	)

	if err == nil {
		code = 0
		msg = "success"
	} else {
		if expectedError, ok := err.(ExpectedError); ok {
			code = expectedError.Code
			msg = expectedError.Msg
		} else {
			code = 500
			msg = fmt.Sprintf("服务器内部错误, 请联系开发者, 请求 ID = %v", gtrace.GetTraceID(r.Context()))
		}
	}

	internalErr := r.Response.WriteJson(ghttp.DefaultHandlerResponse{
		Code:    code,
		Message: msg,
		Data:    r.GetHandlerResponse(),
	})
	if internalErr != nil {
		g.Log().Errorf(r.Context(), "internalErr = %+v", internalErr)
	}
}
