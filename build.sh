#!/usr/bin/env bash
          
# STL Folder
mkdir square/stl

# STL Exports
openscad -o square/stl/basin_50x50.stl -p square/square.json -P Basin_50x50 --export-format asciistl square/square.scad 
openscad -o square/stl/basin_100x100.stl -p square/square.json -P Basin_100x100 --export-format asciistl square/square.scad 
openscad -o square/stl/basin_150x150.stl -p square/square.json -P Basin_150x150 --export-format asciistl square/square.scad 
openscad -o square/stl/planter_50x50.stl -p square/square.json -P Planter_50x50 --export-format asciistl square/square.scad 
openscad -o square/stl/planter_100x100.stl -p square/square.json -P Planter_100x100 --export-format asciistl square/square.scad 
openscad -o square/stl/planter_150x150.stl -p square/square.json -P Planter_150x150 --export-format asciistl square/square.scad 

# README Update
SQUARE_BASIN_STL="$(cat square/stl/basin_100x100.stl)"
SQUARE_PLANTER_STL="$(cat square/stl/planter_100x100.stl)"

README_TEMPLATE="$(cat README.md.template)"
README="${README_TEMPLATE/"### SQUARE_BASIN_TEMPLATE ###"/$SQUARE_BASIN_STL}"
README="${README/"### SQUARE_PLANTER_TEMPLATE ###"/$SQUARE_PLANTER_STL}"

cat <<EOF > README.md
$README
EOF
