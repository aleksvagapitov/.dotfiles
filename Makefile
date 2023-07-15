build:
	docker build . -f Dockerfile -t workstation

run:
	docker run --rm -it workstation bash
