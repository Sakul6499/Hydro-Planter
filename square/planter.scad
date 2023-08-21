include <parameters.scad>

module planter() {
  union() {
    difference() {
      difference() {
        union() {
          // Top part of planter
          color("lime") difference() {
            cube(size = [ $width, $depth, $height - $connection ],
                 center = true);

            // DIFF
            translate([ 0, 0, $margin ]) cube(
                size =
                    [ $width - $margin, $depth - $margin, $height + $margin ],
                center = true);
          }

          // Bottom connector
          color("tomato") translate([ 0, 0, -($height / 2) ]) {
            union() {
              // Connector part
              cube(size =
                       [
                         $width - $margin * 2, $depth - $margin * 2,
                         $connection
                       ],
                   center = true);

              // Connecting bit to outer shell
              translate([ 0, 0, $connection ])
                  cube(size = [ $width, $depth, $connection ], center = true);
            }
          }
        }
        // DIFF
        translate([ 0, 0, -$height / 2 + $margin * 2 ])
            cube(size =
                     [
                       $width - $margin * 4, $depth - $margin * 4,
                       $connection + $margin * 2
                     ],
                 center = true);
      }

      // Drainage holes
      translate([ 0, 0, -$height ]) cylinder($height, $hole_dia, $hole_dia);
      for (i = [0:5]) {
        rotate([ 0, 0, 360 / 6 * i ])
            translate([ $hole_dia * 2 + $margin, 0, -$height ])
                cylinder($height, $hole_dia, $hole_dia);
      }
    }

    color("violet") translate([ 0, 0, -$height / 2 - $margin * 1.25 ]) {
      difference() {
        cylinder($height, $hole_dia, $hole_dia);
        translate([ 0, 0, -$margin ])
            cylinder($height + $margin * 2, $hole_dia - $margin * 0.5,
                     $hole_dia - $margin * 0.5);
      }
    }
  }
}
planter();