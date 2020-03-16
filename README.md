# investigate-neuralcoref-appositives

## Quickstart

```
docker pull aljohri/investigate-neuralcoref-appositives
docker run -it aljohri/investigate-neuralcoref-appositives
```

## Development

Build image:

```
docker build . \
	--cache-from aljohri/investigate-neuralcoref-appositives \
	--tag aljohri/investigate-neuralcoref-appositives
```

Run container with linked volume to skip constantly re-building the image:

```
docker run -v $(pwd)/main.py:/app/main.py -it aljohri/investigate-neuralcoref-appositives
```

Push image:

```
docker push aljohri/investigate-neuralcoref-appositives
```
