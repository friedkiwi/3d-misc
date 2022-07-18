// soap bottle holder parametters
bottle_diameter = 80;
holder_height = 50;
shower_tube_diameter = 30;
bottle_clearance = 10;
mating_hole_size = 10;
drip_hole_radius = 10;


// intermediate values 
bottle_radius = bottle_diameter / 2;
shower_tube_radius = shower_tube_diameter / 2;


difference() {
    // base
    union() {
        translate([ 0 - (bottle_radius + bottle_clearance + shower_tube_diameter)  , 0, 0]) {
            cylinder(holder_height, r = (bottle_radius + bottle_clearance));
        };
        translate([0 - (bottle_radius + bottle_clearance + shower_tube_diameter), 0 - (bottle_radius + bottle_clearance), 0]) {
            cube([bottle_diameter + 2 * bottle_clearance + shower_tube_diameter * 2, (bottle_diameter + 2 * bottle_clearance), holder_height]);
        };
        translate([ (bottle_radius + bottle_clearance + shower_tube_diameter)  , 0, 0]) {
            cylinder(holder_height, r = (bottle_radius + bottle_clearance));
        };
    }
    // bottle holders
    translate([0 - (bottle_radius + bottle_clearance + shower_tube_diameter), 0, bottle_clearance]) {
        cylinder(holder_height, r = bottle_radius);
        translate([0, 0, 0 - bottle_clearance - 1]) {
            cylinder(bottle_clearance + 2, r1 = drip_hole_radius, r2 = bottle_radius + 3);
        };
    }
    translate([bottle_radius + bottle_clearance + shower_tube_diameter, 0, bottle_clearance]) {
        cylinder(holder_height, r = bottle_radius);
        translate([0, 0, 0 - bottle_clearance - 1]) {
            cylinder(bottle_clearance + 2, r1 = drip_hole_radius, r2 = bottle_radius + 3);
        };
    }
    // bottle leak through
    
    // shower tube hole 
    translate([0, bottle_radius + bottle_clearance - shower_tube_radius * 0.33 , 0 - ( holder_height / 2)]) {
        cylinder(holder_height * 2, r = shower_tube_radius);
    };
    
    // shower tube mating holes 
    translate([ shower_tube_radius + mating_hole_size / 2, bottle_radius + bottle_clearance - shower_tube_radius * 0.33, holder_height / 2 - mating_hole_size / 2]) {
        cube(mating_hole_size);
    }
    translate([ 0 - ( shower_tube_radius + mating_hole_size * 1.5), bottle_radius + bottle_clearance - shower_tube_radius * 0.33, holder_height / 2 - mating_hole_size / 2]) {
        cube(mating_hole_size);
    }
}

// clamp cover
translate([0, bottle_diameter, 0]) {
    union() {
        difference() {
            // shower tube hole 
            cylinder(holder_height, r = shower_tube_radius + bottle_clearance * 2);
        
            translate([0,0, 0 - ( holder_height / 2)]) {
                cylinder(holder_height * 2, r = shower_tube_radius);
                translate([0 - ((shower_tube_radius) * 2) - bottle_clearance, 0-(shower_tube_diameter + bottle_clearance * 1.5), 0]) {
                    cube([(shower_tube_diameter + bottle_clearance) * 2, shower_tube_diameter + bottle_clearance * 2, holder_height * 2]);
                };
            };   
        };
        // locking pegs
        translate([shower_tube_radius + (mating_hole_size + 1) / 2, 0, holder_height / 2 - (mating_hole_size - 1) / 2]) {
            cube(mating_hole_size - 1);
        };
        translate([0 - (shower_tube_radius + (mating_hole_size) * 1.5) + 0.5, 0, holder_height / 2 - (mating_hole_size - 1) / 2]) {
            cube(mating_hole_size - 1);
        };
    }
};

translate([0, bottle_diameter * 2, 0]) {
    
};

