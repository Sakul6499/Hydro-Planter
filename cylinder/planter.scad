include <parameters.scad>

module planter() {
  union() {
    difference() {
      difference() {
        union() {
          // Top part of planter
          color("lime") difference() {
            cylinder(h = $height - $connection, r = $radius, $fn = $roundness,
                     center = true);

            // DIFF
            translate([ 0, 0, $margin ])
                cylinder(h = $height, r = $radius - $margin, center = true,
                         $fn = $roundness);
          }

          // Bottom connector
          color("tomato") translate([ 0, 0, -($height / 2) ]) {
            union() {
              // Connector part
              cylinder(h = $connection, r = $radius - $margin, $fn = $roundness,
                       center = true);

              // Connecting bit to outer shell
              translate([ 0, 0, $connection ])
                  cylinder(h = $connection, r = $radius - .1, $fn = $roundness,
                           center = true);
            }
          }
        }
        // DIFF
        translate([ 0, 0, -$height / 2 + $margin * 2 ])
            cylinder(h = $connection + $margin * 2, r = $radius - $margin * 4,
                     $fn = $roundness, center = true);
      }

      // Drainage holes
      translate([ 0, 0, -$height ]) cylinder($height, $hole_dia, $hole_dia);
      for (i = [0:5]) {
        rotate([ 0, 0, 360 / 6 * i ])
            translate([ $hole_dia * 2 + $margin, 0, -$height ])
                cylinder($height, $hole_dia, $hole_dia);
      }
    }
  }
}
planter();