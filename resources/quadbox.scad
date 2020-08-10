height = 33;

function in(x) = x * 25.4;
module featherholes(d=2.7) {
    for(x=[in(.1), in(1.9)])
    for(y=[in(.1), in(0.8)])
    translate([x,y])
    circle(d=d);
}

module quadholes() {
    for(x=[in(0), in(2.05)])
    for(y=[in(0), in(0.95)])
    translate([x,y])
    featherholes();

}

if(1) {
    linear_extrude(height=1.2)
    difference() {
        offset(1)
        square([in(4.05), in(1.85)]);
        quadholes($fn=24);
    }

    difference() {
        linear_extrude(height=height, convexity=4)
        difference() {
            offset(1.5, $fn=24)
            square([in(4.05), in(1.85)]);
            offset(.75, $fn=24)
            square([in(4.05), in(1.85)]);
        }

        translate([0, in(0.45), 3.2])
        cube([5, 12, 7], center=true);

        translate([in(4.05), in(0.45), 3.2])
        cube([5, 12, 15], center=true);
    }

} else {
    difference() {
        offset(1)
        square([in(4.05), in(1.85)]);
        quadholes($fn=24);
    }
}
