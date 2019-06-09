$fn = 100;

size = 1;

spike_height = 50 * size;
spike_max_radius = 2 * size;
spike_min_radius = 1 * size;

clasp_inner_diameter = 20 * size;
clasp_ring_width = spike_max_radius + 2;
clasp_height = size;
clasp_opening = 4 * size;
clasp_text_height = 0.5;


clasp_outer_diameter = clasp_inner_diameter + 2 * clasp_ring_width;

print();

module print() {
    spacing = 4;
    
    draw_clasp(spike_height - clasp_height);
    translate([clasp_outer_diameter + spacing, 0, 0])
        draw_clasp(spike_height / 3 - clasp_height);
    
    for (i = [1:3]) {
        translate([spike_height - clasp_outer_diameter / 2, clasp_outer_diameter / 2 + spike_max_radius * 2 * i + (i - 1) *  spacing, 0])
            rotate([270, 0, 90])
                draw_spike();
    }
}

module draw() {
    module the_spike() {
        translate([0, -clasp_inner_diameter / 2 - clasp_ring_width / 2 + spike_max_radius / 2, 0])
            draw_spike();
    }
    
    the_spike();
    rotate([0, 0, 120]) the_spike();
    rotate([0, 0, -120]) the_spike();

    translate([0, 0, spike_height - clasp_height])
        draw_clasp(spike_height - clasp_height);
    translate([0, 0, spike_height / 3 - clasp_height])
        draw_clasp(spike_height / 3 - clasp_height);
}

module draw_clasp(z_coordinate) {
    module the_spike() {
        translate([0, -clasp_inner_diameter / 2 - clasp_ring_width / 2 + spike_max_radius / 2, 0])
            draw_spike();
    }
    
    // Inspired by https://openhome.cc/eGossip/OpenSCAD/TextCircle.html
    module the_text() {
        top_text = "Top";
        PI = 3.141592653585;
        font_size = clasp_ring_width * 0.9;
        step_angle = 60 / len(top_text);
        translate([0, 0, clasp_height]) rotate([0, 0, 140]) linear_extrude(height = clasp_text_height)
            for(i = [0 : len(top_text) - 1]) {
                rotate(-i * step_angle) 
                    translate([0, clasp_inner_diameter / 2 + font_size / 2, 0]) 
                        text(top_text[i], font = "Arial Black", size = font_size, valign = "center", halign = "center");
            }
    }
        
    translate([0, 0, clasp_height / 2])
    difference() {
        cylinder(r = clasp_outer_diameter / 2, h = clasp_height, center = true);
        cylinder(r = clasp_inner_diameter / 2, h = clasp_height, center = true);

        // Leg cutouts
        translate([0, 0, -z_coordinate]) {
            the_spike();
            rotate([0, 0, 120]) the_spike();
            rotate([0, 0, -120]) the_spike();
        }
        
        // Opening
        translate([0, clasp_outer_diameter / 4, 0])
            cube([clasp_opening, clasp_outer_diameter / 2, clasp_height], center = true);
    }
    
    the_text();
}

module draw_spike() {
    translate([0, 0, spike_height / 2])
    intersection() {
        cylinder(h = spike_height, r1 = spike_min_radius, r2 = spike_max_radius, center = true);
        translate([0, -spike_max_radius / 2, 0])
            cube([spike_max_radius * 2, spike_max_radius, spike_height], true);
    }
}
