# investigate-neuralcoref-appositives

## Quickstart

```
docker pull aljohri/investigate-neuralcoref-appositives
docker run -it aljohri/investigate-neuralcoref-appositives
```

## Development

When locally building the image for the first time, re-use the cache from the existing image.

```
docker build . --cache-from aljohri/investigate-neuralcoref-appositives --tag aljohri/investigate-neuralcoref-appositives
```

Link `main.py` to run changes without re-building the image.

```
docker run -v $(pwd)/main.py:/app/main.py -it aljohri/investigate-neuralcoref-appositives
```
