docker buildx build \
--platform linux/arm64,linux/amd64 \
--cache-from=type=registry,ref=registry.cn-hangzhou.aliyuncs.com/ls-2018/knative:helloworld-go \
--cache-to=type=inline \
--pull -t registry.cn-hangzhou.aliyuncs.com/ls-2018/knative:helloworld-go --push .
