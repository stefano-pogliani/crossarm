NAME ?= thermal_build
TAG ?= rpi3

DOCKER ?= docker
OUT_DIR = $(PWD)/out/thermal


rpi3:
	$(DOCKER) build --tag "$(NAME):$(TAG)" --rm --file RPi3.docker .
	mkdir -p "$(OUT_DIR)/rpi3"
	$(DOCKER) run --tty --interactive --rm \
		--volume "$(OUT_DIR)/rpi3:/mnt" \
		"$(NAME):$(TAG)" cp thermal/out/thermal /mnt/thermal
