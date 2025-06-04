# Use the offical Golang image to create a build artifact.
# This is based on Debian and sets the GOPATH to /go.
# https://hub.docker.com/_/golang
FROM registry.cn-hangzhou.aliyuncs.com/ls-2018/mygo:v1.24.1 as builder

# Copy local code to the container image.
WORKDIR /go/src/github.com/knative-sample/helloworld
COPY . .

# Build the command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
RUN go build -v -o helloworld

# Use a Docker multi-stage build to create a lean production image.
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM registry.cn-hangzhou.aliyuncs.com/ls-2018/mygo:v1.24.1
# RUN apk add --no-cache ca-certificates

# Copy the binary to the production image from the builder stage.
COPY --from=builder /go/src/github.com/knative-sample/helloworld/helloworld /helloworld

# Run the web service on container startup.
CMD ["/helloworld"]
