build:
	docker build . -f Dockerfile -t workstation

run:
	docker run --rm -it -v ${HOME}/.ssh:/tmp/.ssh:ro workstation bash 
