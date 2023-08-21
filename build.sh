#!/usr/bin/env bash
          
# STL Folder
mkdir square/stl

# STL Exports
for i in {50..300..50}
do
openscad -o "square/stl/Basin ${i}mm x ${i}mm.stl" -p square/parameters.json -P ${i}mmx${i}mm --export-format asciistl square/basin.scad

openscad -o "square/stl/Planter ${i}mm x ${i}mm.stl" -p square/parameters.json -P ${i}mmx${i}mm --export-format asciistl square/planter.scad
done

# README Update
SQUARE_BASIN_STL="$(cat 'square/stl/Basin 100mm x 100mm.stl')"
SQUARE_PLANTER_STL="$(cat 'square/stl/Planter 100mm x 100mm.stl')"

README_TEMPLATE="$(cat README.md.template)"
README="${README_TEMPLATE/"### SQUARE_BASIN_TEMPLATE ###"/$SQUARE_BASIN_STL}"
README="${README/"### SQUARE_PLANTER_TEMPLATE ###"/$SQUARE_PLANTER_STL}"

cat <<EOF > README.md
$README
EOF
