/*
Copyright (c) 2017 Paul Austin - SDG

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

// Set fragement count for curved solids
$fn = 60;

// The main shaft hub
linear_extrude(3.5)
difference() {
    circle(d=7.0);
    circle(d=4.7);
}


// Splines on the inside of the hub
color("red") linear_extrude(3.5)
for ( rib = [0:18:360]) {
    // Pivot aroung origin
    rotate([0,0,rib])
    // Move out from origin
    translate([2.38,0,0])
    // Make corner face origin
    rotate([0,0,45])
    // Make a square
    square([0.43,0.43], center = true);
}

difference() {
    // The rim
    translate([0,0,1.75]) {
        color("blue") rotate_extrude() {
            difference() {
                translate([9.8,0,0]) square([14.0,3.5], center = true);
                translate([17.5,0,0]) circle(d=3.0);
            }
        }
    }
    
    // The spiral of holes
    linear_extrude(3.5)    
    for (step = [1:1:6]) {
        // Pivot aroung origin
        rotate([0,0,step*45])
        // Move out from origin
        translate([6 + (step *1.1), 0,0])
        // Make corner face origin
        rotate([0,0,45])
        // Make a square
        circle(d=4.9);
    }
}
