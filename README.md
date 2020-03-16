# investigate-neuralcoref-appositives

## Quickstart

```
REPOSITORY=aljohri/investigate-neuralcoref-appositives
docker pull $REPOSITORY
docker run -it $REPOSITORY
```

## Development

When locally building the image for the first time, re-use the cache from the existing image.

```
docker build . --cache-from $REPOSITORY --tag $REPOSITORY
```

Link `main.py` to run changes without re-building the image.

```
docker run -v $(pwd)/main.py:/app/main.py -it $REPOSITORY
```
