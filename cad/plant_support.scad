$fn = 50;

size = 1;

spike_height = 50 * size;
spike_max_radius = 1 * size;
spike_min_radius = 0.5 * size;

spike_spacing = 16 * size;
clasp_height = 2;
clasp_opening = 4 * size;

draw();

module draw() {
    module the_spike() {
        translate([0, -spike_spacing / 2 - spike_max_radius / 2, 0])
            draw_spike();
    }
    
    the_spike();
    rotate([0, 0, 120]) the_spike();
    rotate([0, 0, -120]) the_spike();
    
    translate([0, 0, spike_height])
        draw_clasp();
    
    spiralize();
}

module spiralize() {
    for (i = [-1:2:1]) {
        color((i == -1) ? "red" : "blue")
        translate([0, 0, spike_height / 4])
            rotate([0, 0, 120 * i])
            linear_extrude(height = spike_height / 2, center = false, twist = 240 * i, slices = $fn * size, scale=[1, 1])
                translate([0, -spike_spacing / 2 - spike_max_radius / 2, 0])
                    circle(r = (spike_max_radius - spike_min_radius) / 4 + spike_min_radius);
    }
}

module draw_clasp() {
    translate([0, 0, clasp_height / 2])
    difference() {
        cylinder(r = spike_spacing / 2 + spike_max_radius * 3 / 2, h = clasp_height, center = true);
        cylinder(r = spike_spacing / 2 - spike_max_radius / 2, h = clasp_height, center = true);
        
        // Opening
        translate([0, spike_spacing / 4 + spike_max_radius * 3 / 4, 0])
            cube([clasp_opening, spike_spacing / 2 + spike_max_radius * 3 / 2, clasp_height], center = true);
    }
}

module draw_spike() {
    translate([0, 0, spike_height / 2])
        cylinder(h = spike_height, r1 = spike_min_radius, r2 = spike_max_radius, center = true);
}