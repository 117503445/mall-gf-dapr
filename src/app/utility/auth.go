package utility

import (
	"context"

	"github.com/casdoor/casdoor-go-sdk/auth"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
)

const CTX_USER_ID = "user-casdoor-id"

// Auth parse token in header, set user id in ctx
func Auth(r *ghttp.Request) {
	ctx := r.Context()
	if tokenList, ok := r.Request.Header["Authorization"]; ok && len(tokenList) > 0 {
		token := tokenList[0]

		UnsafeLogin := false

		if !UnsafeLogin {
			if len(token) > len("Bearer ") {
				token = token[len("Bearer "):]

				claims, err := auth.ParseJwtToken(token)
				if err != nil {
					g.Log().Line(true).Debug(ctx, "parse token failed", "token", token, "err", err)
				} else {
					userId := claims.User.Id
					r.SetCtxVar(CTX_USER_ID, userId)
				}
			} else {
				g.Log().Line(true).Notice(ctx, "too short token:", token)
			}
		} else {
			userId := token
			g.Log().Line(true).Warning(ctx, "UnsafeLogin, userId =", userId)
			r.SetCtxVar(CTX_USER_ID, userId)
		}
	}

	r.Middleware.Next()
}

// GetUser get user id from ctx
func GetUserID(ctx context.Context) (id string, err error) {
	casdoorId, ok := ctx.Value(CTX_USER_ID).(string)
	if casdoorId != "" && ok {
		return casdoorId, nil
	}

	// failed to get user
	return "", ExpectedError{
		Code: 401,
		Msg:  "need login",
	}
}
