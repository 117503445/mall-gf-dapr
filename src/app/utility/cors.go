package utility

import "github.com/gogf/gf/v2/net/ghttp"

// CORS middleware manage cors
func CORS(r *ghttp.Request) {
	// TODO(QHT): Load allowed domains from config
	r.Response.CORSDefault()
	r.Middleware.Next()
}
