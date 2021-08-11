Very minor modification of gcr.io/kaggle-images/python, which makes it easy for terminal user.

- for docker users: run `sed -i 's/podman/docker/g' Makefile`
- for gpu users: run `sed -i '1s/kaggle-images/kaggle-gpu-images/g' Dockerfile`
