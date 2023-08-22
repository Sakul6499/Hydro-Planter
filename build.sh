#!/usr/bin/env bash
          
# STL Folders
mkdir square/stl
mkdir hexagon/stl

# STL Exports
for i in {50..300..50}
do
openscad -o "square/stl/Basin ${i}mm x ${i}mm.stl" -p parameters.json -P ${i}mmx${i}mm --export-format asciistl square/basin.scad
openscad -o "square/stl/Planter ${i}mm x ${i}mm.stl" -p parameters.json -P ${i}mmx${i}mm --export-format asciistl square/planter.scad

openscad -o "hexagon/stl/Basin ${i}mm x ${i}mm.stl" -p parameters.json -P ${i}mmx${i}mm --export-format asciistl hexagon/basin.scad
openscad -o "hexagon/stl/Planter ${i}mm x ${i}mm.stl" -p parameters.json -P ${i}mmx${i}mm --export-format asciistl hexagon/planter.scad
done

# README Update
SQUARE_BASIN_STL="$(cat 'square/stl/Basin 100mm x 100mm.stl')"
SQUARE_PLANTER_STL="$(cat 'square/stl/Planter 100mm x 100mm.stl')"
HEXAGON_BASIN_STL="$(cat 'hexagon/stl/Basin 100mm x 100mm.stl')"
HEXAGON_PLANTER_STL="$(cat 'hexagon/stl/Planter 100mm x 100mm.stl')"

README_TEMPLATE="$(cat README.md.template)"
# << Square >>
README="${README_TEMPLATE/"### SQUARE_BASIN_TEMPLATE ###"/$SQUARE_BASIN_STL}"
README="${README/"### SQUARE_PLANTER_TEMPLATE ###"/$SQUARE_PLANTER_STL}"
# << Hexagon >>
README="${README/"### HEXAGON_BASIN_TEMPLATE ###"/$HEXAGON_BASIN_STL}"
README="${README/"### HEXAGON_PLANTER_TEMPLATE ###"/$HEXAGON_PLANTER_STL}"

cat <<EOF > README.md
$README
EOF
