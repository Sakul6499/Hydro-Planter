include <parameters.scad>

module basin() {
  color("cyan") difference() {
    cylinder(h = $height / 2, r = $radius / 2, $fn = 6);

    // DIFF
    translate([ 0, 0, $margin ])
        cylinder(h = $height / 2, r = $radius / 2 - $margin, $fn = 6);
  }
}
basin();
