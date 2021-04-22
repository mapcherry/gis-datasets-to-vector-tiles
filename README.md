# From custom GIS datasets to web friendly vector tiles - Workshop

Integrate your custom GIS data into web / mobile friendly applications.

This workshop will focus on transforming custom GIS data (shapefiles, geojsons) to web friendly vector tiles. Our work will be divided into 3 parts - Data acquisition , Data tiling and Data presentation.


## Agenda

1. Introduction
2. Data aquisition
3. Data tiling
4. Data presentation
5. Q&A

## Introduction

https://mapcherry.github.io/gis-datasets-to-vector-tiles/

### Prerequisites

 - Docker Desktop installed 
 - QGIS installed
 - Windows 10 64 bit (Home/Pro/Enterprise/Education)
 - Minimum 4GB system RAM

## Data aquisition

## Data tiling


### Parkanlagen mbtiles
```
docker run -v "%CD%\data:/data" -v "%CD%\tiles:/tiles" --rm --name generate-parkanlagen-layer dorinoltean/tippecanoe:1.36.0 /bin/bash -c "tippecanoe --name=\"Parkanlagen vector tiles\" --layer=parkanlagen -o /tiles/parkanlagen.mbtiles  /data/parkanlagen.geojson"
```


### Waste baskets mbtiles
```
docker run -v "%CD%\data:/data" -v "%CD%\tiles:/tiles" --rm --name generate-wastebaskets-layer dorinoltean/tippecanoe:1.36.0 /bin/bash -c "tippecanoe --name=\"Waste baskets vector tiles\" --layer=wastebaskets -r1 --cluster-distance=10 -o /tiles/wastebaskets.mbtiles  /data/wastebaskets.geojson"
```



### Merge mbtiles


```
docker run -v %CD%\data:/data -v %CD%\tiles:/tiles --rm --name merge-parkanlagen-and-wastebaskets  dorinoltean/tippecanoe:1.36.0  /bin/bash -c "tile-join --name=\"Parkanlagen and Waste basketsvector tiles\" -pk -o /tiles/parkanlagen-wastebaskets.mbtiles /tiles/parkanlagen.mbtiles /tiles/wastebaskets.mbtiles"
```


## Data presentation

`klokantech/tileserver-gl-light`

## Q&A
