Debug a yaml error:

```
helm template ./spacestudio/ -f secrets-dev.yaml -n ss --debug
```

Where `spacestudio` contains `Chart.yaml`, `templates`, etc.
