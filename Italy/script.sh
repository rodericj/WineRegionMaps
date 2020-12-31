#!/bin/bash
for i in {100..855}
do
   wget https://dopigp.politicheagricole.gov.it/bedopigp/v1/disciplinari/$i/mapOpenData -o $i.geojson
done
