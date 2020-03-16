#!/bin/sh

docker run \
	-v $(pwd)/main.py:/app/main.py \
	-it investigate-neuralcoref-appositives \
	"$@"
