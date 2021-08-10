.PHONY: help
help:
	cat Makefile


.PHONY: install
install:
	podman build . -t tak0kada/kaggle-python


.PHONY: up
up:
	podman run -e DISPLAY=$$DISPLAY \
	           -v /tmp/.X11-unix:/tmp/.X11-unix \
	           -v `xauth info | awk 'NR<=1{print $$3}'`:/root/.Xauthority \
		   --memory 2G \
	           -v $${HOME}:$${HOME} \
	           -w $${PWD} \
	           --name tmp-tak0kada-kaggle-python \
	           -dt --rm tak0kada/kaggle-python


.PHONY: login
login:
	podman exec -it tmp-tak0kada-kaggle-python /bin/bash


.PHONY: down
down:
	podman container stop tmp-tak0kada-kaggle-python || \
	podman container rm tmp-tak0kada-kaggle-python


.PHONY: clean
clean:
	podman image rm tak0kada/kaggle-python

