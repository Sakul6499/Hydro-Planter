include <parameters.scad>

module basin() {
  color("cyan") difference() {
    cube(size = [ $width, $depth, $height ], center = true);

    // DIFF
    translate([ 0, 0, $margin ])
        cube(size = [ $width - $margin, $depth - $margin, $height + $margin ],
             center = true);
  }
}
basin();