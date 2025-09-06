set shell := ["/bin/bash", "-c"]

[private]
default:
        @just --list

[doc("Start building fsrs-browser")]
build:
	docker build --tag fsrs-browser-build .

[doc("Copy the build result to the specified directory")]
copy-output output-dir="./output/":
	container_id=$(docker create fsrs-browser-build) && \
		mkdir -p {{output-dir}} && \
		docker cp $container_id:/output/. {{output-dir}} && \
		docker rm $container_id

