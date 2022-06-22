package utility

import (
	"bytes"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"io/ioutil"
	"net/url"
)

// HTTPLog middleware print the HTTP request and response
func HTTPLog(r *ghttp.Request) {
	u := r.URL.String()
	if decodedUrl, err := url.QueryUnescape(u); err == nil {
		u = decodedUrl
	}

	requestMethod := r.Request.Method

	requestBody := ""
	if requestBodyBytes, err := ioutil.ReadAll(r.Request.Body); err == nil && len(requestBodyBytes) > 0 {
		requestBody = string(requestBodyBytes)
		r.Request.Body = ioutil.NopCloser(bytes.NewBuffer(requestBodyBytes))
	}

	g.Log().Info(r.Context(), "[Req] ", requestMethod, u, requestBody)
	r.Middleware.Next()

	statusCode := r.Response.Status
	responseBody := string(r.Response.Buffer())

	g.Log().Info(r.Context(), "[Resp]", statusCode, responseBody)
}
