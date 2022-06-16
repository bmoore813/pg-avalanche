DOWN_OPTS = --remove-orphans
PRUNE_OPTS = -f
BUILDKIT = 1
BUILD_OPTS = 


.PHONY: pull-iceberg
pull-iceberg:
	cd docker && git clone https://github.com/memiiso/debezium-server-iceberg | echo "already exists"

.PHONY: copy-application-properties
copy-application-properties:
	cp application.properties 

.PHONY: clean
clean: down prune


.PHONY: run
run: clean build-local up
	echo "exiting..."

.PHONY: down
down:
	docker-compose down ${DOWN_OPTS}


.PHONY: prune
prune:
	docker system prune ${PRUNE_OPTS}

.PHONY: build-local
build-local: build-debezium-base
	DOCKER_BUILDKIT=${BUILDKIT} COMPOSE_DOCKER_CLI_BUILD=${BUILDKIT} \
	rootlesskit docker-compose build ${BUILD_OPTS}

.PHONY: build-debezium-base
build-debezium-base: # Build the base image
	DOCKER_BUILDKIT=${BUILDKIT} COMPOSE_DOCKER_CLI_BUILD=${BUILDKIT} \
	docker build -t debezium-base -f docker/debezium-server-iceberg/Dockerfile docker/debezium-server-iceberg


.PHONY: up
up: # build the system
	docker-compose up 