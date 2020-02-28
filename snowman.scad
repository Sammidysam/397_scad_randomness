//This program builds a snowman with a random body
//Sam Craig and Rob Klock

//Set random variables and transfer values for our snowman body

// Set up seed
custom_seed = 0;

seed = (custom_seed == 0) ? floor(rands(1,9999999,1)[0]) : custom_seed;

show_seed = true;

if (show_seed) {
    labelString=str(floor(seed/1000000)%10, floor(seed/100000)%10, 
                floor(seed/10000)%10, floor(seed/1000)%10, 
                floor(seed/100)%10, floor(seed/10)%10, 
                floor(seed/1)%10);
    
    rotate([180,180,0])
    translate([0, -40, 0])
    color("gray")
    %linear_extrude(height=1)
        text(labelString, size=10, halign="center");
}

//Make Frosty the Snowman instead of a regular snowman
frosty = true;

rad = rands(10,20,1,seed)[0];
color([1,1,1]) sphere(rad);
rad2 = rands(rad * .33, rad * .75, 1,seed)[0];


trans = (rad2 + rad - 2);
translate([0,0, trans])
color([1,1,1]) sphere(rad2);

//arms 
armlength = rands(rad2, rad2 * 2, 1,seed)[0];
color([0.6,0.4,0.0])
hull(){
    
    arm_angle = rands(trans - rad2,trans + rad2, 2, seed)[0];
    translate([armlength,0,arm_angle])
    
    color([0.6,0.4,0.0]) sphere(r = rad2 / 10);
    translate([0,0, trans])
    color([0.6,0.4,0.0]) sphere(r = rad2 / 10);
}

color([0.6,0.4,0.0])
hull(){
    
    arm_angle = rands(trans - rad2,trans + rad2, 2, seed)[1];
    translate([-armlength,0, arm_angle])
    
    sphere(r = rad2 / 10);
    translate([0,0, trans])
    sphere(r = rad2 / 10);
}
rad3 = rands(rad2 * .33, rad2 * .75, 1, seed)[0];
trans2 = (rad3 + trans + rad2 - 2);
translate([0,0, trans2])
color([1,1,1]) sphere(rad3);

//hat
hat_base_rad = rad3 + (rad3/4); 
translate([0,0, trans2+rad3 - 0.7])
color([0,0,0])
cylinder(rad3/10, hat_base_rad, hat_base_rad);


hat_height = rands(rad3, rad, 1, seed)[0];
hat_top_rad = hat_base_rad / 2;
translate([0,0, trans2 + rad3 - 0.5])
color([0,0,0])
cylinder(hat_height, hat_top_rad, hat_top_rad);

//eye rad is a reallllly funny param to mess with
eye_rad = ln(rad3) * .7;

//eyes

translate([rad3 * .33, rad3 - .2*(eye_rad), trans2 + rad3 * .33])
color([0,0,0])
sphere(r= eye_rad);

translate([-1 * (rad3 * .33), rad3 - .2*(eye_rad), trans2 + rad3 * .33])
color([0,0,0])
sphere(r= eye_rad);

//nose

if (frosty){
   
    translate([0, rad3 - 0.2, trans2 + rad3 * .1])
    color([1, 0, 0]) 
    sphere(r = eye_rad * .66);
    
    color([0.5, 0.3, 0.1])
    hull(){
        translate([rad3 / 6 , rad3 / 2, trans2 + rad3 * .25 - (rad3 * .7)])
        sphere(r = eye_rad * .3);
        
        translate([rad3 * .8  , rad3 + rad3, trans2 + rad3 * .2])
        sphere(r = eye_rad * .3);
        
    }
    translate([rad3 * .8  , rad3 + rad3, trans2 + rad3 * .2])
    color([0.5, 0.3, 0.1])
    cylinder(eye_rad * 2, eye_rad, eye_rad, true);
}

else{
    
color([0.9, 0.5, 0.1]) 
hull(){
    translate([0, 0, trans2 + rad3 * .25])
    color([0.9, 0.5, 0.1]) sphere(r = eye_rad * .55);
    translate([0, rad3 + rad3, trans2 + rad3 * .2])
    color([0.9, 0.5, 0.1]) sphere(r = eye_rad * .55);
}
}


