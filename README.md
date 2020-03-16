# investigate-neuralcoref-appositives

## Quickstart

```
REPOSITORY=aljohri/investigate-neuralcoref-appositives
docker pull $REPOSITORY
docker build . --cache-from $REPOSITORY --tag $REPOSITORY
docker run -it $REPOSITORY
```

## Development

Link `main.py` to run code without re-building docker container.

```
docker run -v $(pwd)/main.py:/app/main.py -it $REPOSITORY
```
