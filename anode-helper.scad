// Holder for holding an Anode by the Nut, allowing to align straight the anode with the hole.
toolWidth=36;
toolLength=100;
toolHoleSize=20;
nutEdgeWidth=27;
nutEdgeHeight=5;
wallThickness=1;
threadDepth=2;
threadDiameter=26.8;
variance=4.25;

%translate([0,0,nutEdgeHeight/2]) {
    cube([nutEdgeWidth, nutEdgeWidth, nutEdgeHeight], true);
}
difference() {
    cylinder(h=toolLength, d=toolWidth, $fn=6);
    cylinder(h=toolLength, d=toolHoleSize, $fn=360);
    translate([0,0,threadDepth]) {
        hull() {
            cylinder(h=nutEdgeHeight, d=nutEdgeWidth+variance, $fn=6);
            translate([10,0,0]) {
                cylinder(h=nutEdgeHeight, d=nutEdgeWidth+variance, $fn=6);
            }
        }
    }
    hull() {
        cylinder(h=threadDepth, d=threadDiameter, $fn=360);
        translate([10,0,0]) {
            cylinder(h=threadDepth, d=threadDiameter, $fn=360);
        }
    }
    translate([0,0,nutEdgeHeight+threadDepth]) {
        hull() {
            cylinder(h=nutEdgeHeight, d=toolHoleSize, $fn=360);
            translate([10,0,0]) {
                cylinder(h=nutEdgeHeight, d=toolHoleSize, $fn=360);
            }
        }
    }
}


