// hvac hose plate receptacle
// units are in mm, fuck imperial units

// configuration:
hose_diameter = 168;
receptacle_thickness = 6;
receptacle_height = 70;
screw_hole_diameter = 4;
base_thickness = 4;
receptacle_clearance = 7;
screw_clearance = 10;

// intermediate values:
base_side_length = hose_diameter + receptacle_thickness * 2 + receptacle_clearance;
screw_hole_offset = (base_side_length / 2) - screw_clearance - screw_hole_diameter ;
receptacle_diameter = (hose_diameter / 2) + receptacle_thickness;


difference() {
    union() {
        // draw receptacle
        cylinder(receptacle_height, receptacle_diameter, receptacle_diameter);
        // draw base
        difference() {
            translate([0 - (receptacle_diameter + receptacle_clearance / 2), 0 - (receptacle_diameter + receptacle_clearance / 2) , 0]) {
                cube([base_side_length, base_side_length, base_thickness]);
            };
            // screw holes
            translate([screw_hole_offset, screw_hole_offset, 0-(base_thickness * 0.2)]) {
                cylinder(base_thickness * 2, screw_hole_diameter, screw_hole_diameter);
            };
            translate([0 - screw_hole_offset, screw_hole_offset, 0-(base_thickness * 0.2)]) {
                cylinder(base_thickness * 2, screw_hole_diameter, screw_hole_diameter);
            };
            translate([screw_hole_offset, 0 - screw_hole_offset, 0-(base_thickness * 0.2)]) {
                cylinder(base_thickness * 2, screw_hole_diameter, screw_hole_diameter);
            };
            translate([0 - screw_hole_offset, 0 - screw_hole_offset, 0-(base_thickness * 0.2)]) {
                cylinder(base_thickness * 2, screw_hole_diameter, screw_hole_diameter);
            };
        };
    };
// hose cutout:
    translate([0, 0, 0 - (receptacle_height / 2)]) {
        cylinder(receptacle_height * 2, hose_diameter / 2, hose_diameter / 2);
    };
};



