# combos

```
mkdir -p experiments/run_0001
cp parameters.xml experiments/run_0001/parameters.xml
docker run -it --rm -v "$(pwd -W)/experiments/run_0001://app/combos/volume" combos
```
