# WineRegionMaps
Some wine region data I've found on the web

In order to create a new geojson for a specific appellation, do the following.

1. Search [OpenStreetMaps.org](https://geojson.io) for the appropriate map data
2. Once the appropriate boundary looking shape is shown, tap the export button
   - This will likely produce an error as the map size is too large: `You requested too many nodes (limit is 50000). Either request a smaller area, or use planet.osm`
3. Below the export call to action are more exporting options. Tap `Overpass API`. This will download the map data with all information that OpenStreetMaps contains
4. Convert the osm file with the following command: 
  - `ogr2ogr -f GeoJSON map.geojson map-3 multipolygons`
  - For additional reading: [OGR Instructions](https://www.compose.com/articles/how-to-transform-and-use-openstreetmap-data-into-geojson-using-gdal/)
5. Filter out the generated geojson file so that we only show administrative boundaries with the following command: 
 - `cat map.geojson | jq '. | {type: .type, name: .name, crs: .crs, features: [.features[] | select(.properties.type == "boundary")]}' > filteredMap.geojson` 
6. Test the output on: [GeoJson.io](https://geojson.io)
7. Commit to the appropriate Region and Subregion directory in this repo