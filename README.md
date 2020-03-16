# investigate-neuralcoref-appositives

## Quickstart

```
REPOSITORY=aljohri/investigate-neuralcoref-appositives
docker pull $REPOSITORY
docker build . --cache-from $REPOSITORY --tag $REPOSITORY
docker run -v $(pwd)/main.py:/app/main.py -it $REPOSITORY
```
