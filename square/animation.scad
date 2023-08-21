include <parameters.scad>
use <basin.scad>
use <planter.scad>

translate([ $width / 2, $depth / 2, $height / 2 ]) basin();
translate([
  $width / 2, $depth / 2,
  $height / 2 + $height - $connection + $height - $height *$t
]) planter();