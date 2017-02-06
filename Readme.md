# vectortile-infra
Lab environment serving load-balanced vector tiles for use in kibana map visualizations.
Vagrant is the environment controller using VirtualBox.
Ansible is used for configuration management.
The [5.2-vector-map branch](https://github.com/lrakai/kibana/tree/5.2-vector-map) of kibana is used to support the vector map in kibana.  

# Raster/Vector Map Comparison
## Official Kibana Raster Tile Map
Currently limited to 8 resolutions.

![The official raster map in Kibana](images/kibana-raster.gif)

## Vector Map Served by vectortile-infra
![The vector map in Kibana](images/kibana-vector.gif)

# Usage
```
vagrant up
vagrant ssh
./init.sh
```
then explore the map directly with the included index.html, at https://localhost:8080 or in Kibana at http://localhost:15601.

# Shout outs
Thanks to the many geo open source projects that made this possible: [OpenMapTiles](https://github.com/openmaptiles), [tileserver-gl](https://github.com/klokantech/tileserver-gl), [Mapbox GL JS](https://www.mapbox.com/mapbox-gl-js/api/), [Mapbox Vector Tiles](https://www.mapbox.com/vector-tiles/specification/), and [Maputnik](https://github.com/maputnik/editor)
