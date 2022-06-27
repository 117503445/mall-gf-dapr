# mall-gf-dapr

microservice mall based on goframe and dapr

## dev

```sh
docker-compose -f docker-compose-dev.yml up -d
cd /root/project/mall-gf-dapr/src/app/user && gf run main.go
cd /root/project/mall-gf-dapr/src/app/template && gf run main.go
cd /root/project/mall-gf-dapr/src/mall-js-sdk && node main.js

cd /root/project/mall-gf-dapr/src && gf gen dao --path ./app/user -l "mysql:root:12345678@tcp(db:3306)/user"
```

## api

<https://learnku.com/articles/64567>

<https://github.com/nivin-studio/go-zero-mall>

## services

- casdoor http://localhost:18000
- apisix 
- user
- product http://localhost:8001
- order http://localhost:8002
- pay http://localhost:8003
