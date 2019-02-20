# Golang Docker Multi-stage build example

Multi-stage build example of a Golang app.<br>
We use multi-stage builder to build the Go app and then use the scratch image to run the generated binary.<br>
With this strategy you get a small image size of a few MBs.<br>

All depenencies are managed with go dep.<br>

This example use Gin to run a http server.<br>

Build docker image:<br>
<code>docker build -t go-docker-example .</code>

Run generated image:<br>
<code>docker run -it -p 8080:8080 go-docker-example</code>

Now test it:
<code>http://localhost:8080/ping</code>