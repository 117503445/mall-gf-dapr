FROM registry.cn-hangzhou.aliyuncs.com/117503445/dev-golang

RUN pacman -Syyu nodejs npm yarn protobuf --noconfirm
RUN yarn config set registry https://registry.npmmirror.com/
RUN wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest