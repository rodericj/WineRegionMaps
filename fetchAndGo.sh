echo "fetching $1 and storing it as $2.geojson"

wget -O map.osm $1 

echo "converting"
 ogr2ogr -f GeoJSON map.geojson map.osm multipolygons 

echo "Writing to $2.geojson"

cat map.geojson | jq '. | {type: .type, name: .name, crs: .crs, features: [.features[] | select(.properties.type == "boundary")]}' > $2.geojson

echo "cleaning up"
rm map.osm map.geojson 
