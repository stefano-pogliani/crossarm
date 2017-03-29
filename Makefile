# Tools
DOCKER ?= docker


# Options.
NAMESPACE ?= spogliani
CTNG_REPO ?= crosstoolng
CTNG_VER  ?= 1.22.0
XARM_REPO ?= crossarm


# CrossTool-NG targets.
ctng-image: crosstoolng/Dockerfile
	$(DOCKER) build \
		--tag "$(NAMESPACE)/$(CTNG_REPO):$(CTNG_VER)" \
		crosstoolng/

rpi3-image: rpi3/Dockerfile rpi3/crosstoolng.config
	$(DOCKER) build \
		--tag "$(NAMESPACE)/$(XARM_REPO):rpi3" \
		rpi3/
