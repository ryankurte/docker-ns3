
NAME=ryankurte/docker-ns3

build: Dockerfile
	docker build -t $(NAME) .

setup-xhost:
	ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
	xhost + $ip

run-xhost:
	docker run --rm -it -v `pwd`:/root/work -e DISPLAY=$$ip:0 -v /tmp/.X11-unix:/tmp/.X11-unix $(NAME)
