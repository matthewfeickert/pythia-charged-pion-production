default: image

all: image

image:
	docker build . \
	-f Dockerfile \
	--build-arg BASE_IMAGE=scailfin/madgraph5-amc-nlo-centos:mg5_amc3.2.0 \
	-t matthewfeickert/pythia-charged-pion:latest
