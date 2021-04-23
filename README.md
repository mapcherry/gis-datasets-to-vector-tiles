# From custom GIS datasets to web friendly vector tiles - Workshop

Integrate your custom GIS data into web / mobile friendly applications.

This workshop will focus on transforming custom GIS data (shapefiles, geojsons) to web friendly vector tiles. Our work will be divided into 3 parts - Data acquisition , Data tiling and Data presentation.


## Agenda

1. Introduction
2. Data aquisition
3. Data tiling
4. Data presentation
5. Q&A

### Prerequisites

 - Docker Desktop installed 
 - QGIS installed
 - Windows 10 64 bit (Home/Pro/Enterprise/Education)
 - Minimum 4GB system RAM


## Introduction

https://mapcherry.github.io/gis-datasets-to-vector-tiles/


## Data aquisition
1. Park data for Rostock https://data.europa.eu/data/datasets/a9486089-80ce-43ae-87fd-97f81260f34c?locale=en
2. Overpass-api query OSM on nodes with 'amenity' = 'waste_basket' tags for Rostock area  https://overpass-turbo.eu/s/16lR


## Data tiling

In this step we will take the geojson files prepared in the previous step and we'll convert them to datatiles.

We are going to use tippecanoe to convert geojson to mbtiles.

### Parkanlagen mbtiles


Generate mbtiles for parks:

```
docker run -v "%CD%\data:/data" -v "%CD%\tiles:/tiles" --rm --name generate-parkanlagen-layer dorinoltean/tippecanoe:1.36.0 /bin/bash -c "tippecanoe --name=\"Parkanlagen vector tiles\" --layer=parkanlagen -o /tiles/parkanlagen.mbtiles  /data/parkanlagen.geojson"
```


### Waste baskets mbtiles


Generate clustered 

```
docker run -v "%CD%\data:/data" -v "%CD%\tiles:/tiles" --rm --name generate-wastebaskets-layer dorinoltean/tippecanoe:1.36.0 /bin/bash -c "tippecanoe --name=\"Waste baskets vector tiles\" --layer=wastebaskets -z 15 -r1 --cluster-distance=60 -o /tiles/wastebaskets.mbtiles  /data/wastebaskets.geojson"
```

```
docker run -v "%CD%\data:/data" -v "%CD%\tiles:/tiles" --rm --name generate-wastebaskets-layer dorinoltean/tippecanoe:1.36.0 /bin/bash -c "tippecanoe --name=\"Waste baskets vector tiles\" --layer=wastebaskets --maximum-zoom=16 --minimum-zoom=16 -r1 -o /tiles/wastebaskets-z16.mbtiles  /data/wastebaskets.geojson"
```


### Merge mbtiles



```
docker run -v %CD%\data:/data -v %CD%\tiles:/tiles --rm --name merge-parkanlagen-and-wastebaskets  dorinoltean/tippecanoe:1.36.0  /bin/bash -c "tile-join --name=\"Parkanlagen and Waste basketsvector tiles\" -pk -o /tiles/parkanlagen-wastebaskets.mbtiles /tiles/parkanlagen.mbtiles /tiles/wastebaskets.mbtiles /tiles/wastebaskets-z16.mbtiles"
```


## Data presentation

`klokantech/tileserver-gl-light`

## Q&A
