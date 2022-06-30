package service

import "github.com/dapr/go-sdk/client"

var DaprClient client.Client

func InitDapr() {
	var err error
	DaprClient, err = client.NewClient()
	if err != nil {
		panic(err)
	}
}
