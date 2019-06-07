plate_width = 200;
plate_length = 102;
plate_height = 2;

plate_bottom_border = 10;
plate_top_border = 10;
plate_left_border = 9;
plate_right_border = 0;
plate_border_height = plate_height;

cup_upper_diameter = 36;
cup_lower_diameter = 28;
cup_height = 40;
cup_thickness = 1.5;

draw_plate();


module draw_plate() {
    module draw_surface() {
        surface_width = plate_width - plate_left_border - plate_right_border;
        surface_length = plate_length - plate_bottom_border - plate_top_border;
        
        cols = 5;
        x_spacing = (surface_width - cols * (cup_upper_diameter + cup_thickness)) / (cols + 1);
        difference() {
            cube([surface_width, surface_length, plate_height], false);
                
            for(col = [1:cols]) {
                x_offset = (cup_upper_diameter + cup_thickness + x_spacing) * col - (cup_upper_diameter + cup_thickness) / 2;
                
                translate([x_offset, (cup_upper_diameter + cup_thickness) / 2, -cup_height + plate_height])
                    cylinder(d1 = cup_lower_diameter + cup_thickness, d2 = cup_upper_diameter + cup_thickness, h = cup_height);
                translate([x_offset, surface_length - (cup_upper_diameter + cup_thickness) / 2, -cup_height + plate_height])
                    cylinder(d1 = cup_lower_diameter + cup_thickness, d2 = cup_upper_diameter + cup_thickness, h = cup_height);
            }
        
        }
        
        for(col = [1:cols]) {
            x_offset = (cup_upper_diameter + cup_thickness + x_spacing) * col - (cup_upper_diameter + cup_thickness) / 2;
            
            translate([x_offset, (cup_upper_diameter + cup_thickness) / 2, -cup_height + plate_height])
                draw_cup();
            translate([x_offset, surface_length - (cup_upper_diameter + cup_thickness) / 2, -cup_height + plate_height])
                draw_cup();
        }
    }
    
    translate([plate_left_border, plate_bottom_border, 0]) {
        draw_surface();
    }
    
    
    // Draw border: B, T, L, R
    color("blue")
        cube([plate_width, plate_bottom_border, plate_border_height]);

    color("teal")
    translate([0, plate_length - plate_top_border, 0])
        cube([plate_width, plate_top_border, plate_border_height]);

    color("lime")
        cube([plate_left_border, plate_length, plate_border_height]);

    color("red")
    translate([plate_width - plate_right_border, 0, 0])
        cube([plate_right_border, plate_length, plate_border_height]);
}

module draw_cup() {
    difference() {
        cylinder(d1 = cup_lower_diameter + cup_thickness, d2 = cup_upper_diameter + cup_thickness, h = cup_height);
        cylinder(d1 = cup_lower_diameter, d2 = cup_upper_diameter, h = cup_height);
    }
}