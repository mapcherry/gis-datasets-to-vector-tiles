## Generate mbtiles


### Parkanlagen mbtiles
```
docker run -v "%CD%\data:/data" -v "%CD%\tiles:/tiles" --rm --name generate-parkanlagen-layer tippecanoe:1.36.0 /bin/bash -c "tippecanoe --name=\"Parkanlagen vector tiles\" --layer=parkanlagen -o /tiles/parkanlagen.mbtiles  /data/parkanlagen.geojson"
```


## Waste baskets mbtiles
```
docker run -v "%CD%\data:/data" -v "%CD%\tiles:/tiles" --rm --name generate-wastebaskets-layer tippecanoe:1.36.0 /bin/bash -c "tippecanoe --name=\"Waste baskets vector tiles\" --layer=wastebaskets -r1 --cluster-distance=10 -o /tiles/wastebaskets.mbtiles  /data/wastebaskets.geojson"
```



## Merge mbtiles


```
docker run -v %CD%\data:/data -v %CD%\tiles:/tiles --rm --name merge-parkanlagen-and-wastebaskets  tippecanoe:1.36.0  /bin/bash -c "tile-join --name=\"Parkanlagen and Waste basketsvector tiles\" -pk -o /tiles/parkanlagen-wastebaskets.mbtiles /tiles/parkanlagen.mbtiles /tiles/wastebaskets.mbtiles"
```