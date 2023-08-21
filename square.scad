// Square hydro-wicked planter.
// Size customizable via below parameters

// << Parameters >>

$width = 100;
$depth = 100;
$height = 50;

$margin = 2;

$connection = 5;

$hole_dia = 4;

$show_present = false;
$show_print_basin = false;
$show_print_planter = true;

// << Modules >>

module basin() {
  color("cyan") difference() {
    cube(size = [ $width, $depth, $height ], center = true);

    // DIFF
    translate([ 0, 0, $margin ])
        cube(size = [ $width - $margin, $depth - $margin, $height + $margin ],
             center = true);
  }
}

module planter() {
  difference() {
    difference() {
      union() {
        // Top part of planter
        color("lime") difference() {
          cube(size = [ $width, $depth, $height - $connection ], center = true);

          // DIFF
          translate([ 0, 0, $margin ]) cube(
              size = [ $width - $margin, $depth - $margin, $height + $margin ],
              center = true);
        }

        // Bottom connector
        color("tomato") translate([ 0, 0, -($height / 2) ]) {
          union() {
            // Connector part
            cube(
                size =
                    [ $width - $margin * 2, $depth - $margin * 2, $connection ],
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
}

// << Presenting >>

module present($gap) {
  translate([ $width / 2, $depth / 2, $height / 2 ]) basin();
  translate(
      [ $width / 2, $depth / 2, $height / 2 + $height - $connection + $gap ])
      planter();
}

if ($show_present) {
  for (i = [0:2]) {
    translate([ ($width + $width / 2) * i, 0, 0 ]) present(8.3 * i);
  }
}

if ($show_print_basin) {
  basin();
}

if ($show_print_planter) {
  planter();
}