#!/usr/bin/env bash
          
# STL Folder
mkdir square/stl

# STL Exports
for i in {50..300..50}
do
openscad -o "square/stl/Basin ${i}mm x ${i}mm.stl" -p square/parameters.json -P ${i}mmx${i}mm --export-format asciistl square/basin.scad
openscad -o "square/stl/Basin rounded Z ${i}mm x ${i}mm.stl" -p square/parameters.json -P ${i}mmx${i}mm --export-format asciistl square/basin_rounded_z.scad
openscad -o "square/stl/Basin rounded All ${i}mm x ${i}mm.stl" -p square/parameters.json -P ${i}mmx${i}mm --export-format asciistl square/basin_rounded_all.scad

openscad -o "square/stl/Planter ${i}mm x ${i}mm.stl" -p square/parameters.json -P ${i}mmx${i}mm --export-format asciistl square/planter.scad
openscad -o "square/stl/Planter rounded Z ${i}mm x ${i}mm.stl" -p square/parameters.json -P ${i}mmx${i}mm --export-format asciistl square/planter_rounded_z.scad
openscad -o "square/stl/Planter rounded All ${i}mm x ${i}mm.stl" -p square/parameters.json -P ${i}mmx${i}mm --export-format asciistl square/planter_rounded_all.scad
done

# README Update
SQUARE_BASIN_STL="$(cat 'square/stl/Basin 100mm x 100mm.stl')"
SQUARE_BASIN_ROUNDED_Z_STL="$(cat 'square/stl/Basin rounded Z 100mm x 100mm.stl')"
SQUARE_BASIN_ROUNDED_ALL_STL="$(cat 'square/stl/Basin rounded All 100mm x 100mm.stl')"
SQUARE_PLANTER_STL="$(cat 'square/stl/Planter 100mm x 100mm.stl')"
SQUARE_PLANTER_ROUNDED_Z_STL="$(cat 'square/stl/Planter rounded Z 100mm x 100mm.stl')"
SQUARE_PLANTER_ROUNDED_ALL_STL="$(cat 'square/stl/Planter rounded All 100mm x 100mm.stl')"

README_TEMPLATE="$(cat README.md.template)"
README="${README_TEMPLATE/"### SQUARE_BASIN_TEMPLATE ###"/$SQUARE_BASIN_STL}"
README="${README/"### SQUARE_PLANTER_TEMPLATE ###"/$SQUARE_PLANTER_STL}"
README="${README/"### SQUARE_BASIN_ROUNDED_Z_TEMPLATE ###"/$SQUARE_BASIN_ROUNDED_Z_STL}"
README="${README/"### SQUARE_PLANTER_ROUNDED_Z_TEMPLATE ###"/$SQUARE_PLANTER_ROUNDED_Z_STL}"
README="${README/"### SQUARE_BASIN_ROUNDED_ALL_TEMPLATE ###"/$SQUARE_BASIN_ROUNDED_ALL_STL}"
README="${README/"### SQUARE_PLANTER_ROUNDED_ALL_TEMPLATE ###"/$SQUARE_PLANTER_ROUNDED_ALL_STL}"

cat <<EOF > README.md
$README
EOF
