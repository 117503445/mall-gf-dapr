package utility

import (
	"context"
	"io/ioutil"
	
	"github.com/casdoor/casdoor-go-sdk/auth"
	"github.com/gogf/gf/v2/frame/g"
)

func InitCasdoor(ctx context.Context) {
	g.Log().Line(true).Debug(ctx, "InitCasdoor")

	endpoint := g.Cfg().MustGet(ctx, "casdoor.endpoint").String()
	clientId := g.Cfg().MustGet(ctx, "casdoor.clientId").String()
	clientSecret := g.Cfg().MustGet(ctx, "casdoor.clientSecret").String()
	organizationName := g.Cfg().MustGet(ctx, "casdoor.organizationName").String()
	applicationName := g.Cfg().MustGet(ctx, "casdoor.applicationName").String()

	pem, err := ioutil.ReadFile("./manifest/config/pub.pem")
	if err != nil {
		panic(err)
	}
	jwtPublicKey := string(pem)

	// g.Log().Line(true).Debugf(ctx, "endpoint = %v", endpoint)
	// g.Log().Line(true).Debugf(ctx, "clientId = %v", clientId)
	// g.Log().Line(true).Debugf(ctx, "clientSecret = %v", clientSecret)
	// g.Log().Line(true).Debugf(ctx, "organizationName = %v", organizationName)
	// g.Log().Line(true).Debugf(ctx, "applicationName = %v", applicationName)
	// g.Log().Line(true).Debugf(ctx, "jwtPublicKey = %v", jwtPublicKey)

	auth.InitConfig(endpoint, clientId, clientSecret, jwtPublicKey, organizationName, applicationName)
}
