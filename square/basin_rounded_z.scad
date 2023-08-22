include <../util/rounded_cube.scad>
include <parameters.scad>

module basin() {
  color("cyan") difference() {
    roundedcube(size = [ $width, $depth, $height ], center = true, radius = 2.5,
                apply_to = "z");

    // DIFF
    translate([ 0, 0, $margin ])
        cube(size = [ $width - $margin, $depth - $margin, $height + $margin ],
             center = true);
  }
}
basin();