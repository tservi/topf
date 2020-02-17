// first version : plate for ware
// units : micrometers = 10^-6 m = 10^-3 mm
/* 
    3D
   **********   
  3     2
    7 6
    4 5
  0     1
 
    Dev
   **********   
   
   7 6
   4 5 6 7 4
   0 1 2 3 0
   3 2

    Coords
   **********   
   
0,1,3,2
4,5,1,0
7,6,5,4
5,6,2,1
6,7,3,2
7,4,0,3

*/

Show_Rendering_Error=true; 
// hauptplatte
l       = 50000             ; // length = x axis
w       = l                 ; // width = y axis
t       = 2000              ; // thickness
// central point
radius  = 1000              ; // radius
height  = 1000              ; // height
// borders
thick   = 1000              ; // thickness
// all plate 
delta   = 15000             ; // delta beetween plates



translate([delta,delta,0])   
    all_plate(l,w,t,radius,height,thick);

translate([delta+l,delta , 2* delta+ l])    
    rotate([0,180,0])
        all_plate(l,w,t,radius,height,thick);

translate([delta,0 , delta +l ])    
    rotate([-90,0,0])
        all_plate(l,l,t,radius,height,thick);

translate([delta, 2*delta + w , delta ])    
    rotate([90,0,0])
        all_plate(l,l,t,radius,height,thick);


translate([2*delta+l,delta , delta])    
    rotate([0,-90,0])
        all_plate(l,w,t,radius,height,thick);
translate([0, delta, delta+l])
    rotate([0,90,0])
        all_plate(l,w,t,radius,height,thick);


module all_plate(l,w,t,radius,height,thick){
    translate([l/2, w/2, 0]){ 
        color([1,0,0]) 
        cylinder(height,radius, radius*0.6); 
        };
    translate([t,t,0])
        border(l,thick, height, radius, t );

    translate([t+thick,t,0])
        rotate([0,0,90])
            border(w,thick, height, radius, t );

    translate([t,w-2*t+thick,0])
        border(l,thick, height, radius, t );

    translate([l-t,t,0])
        rotate([0,0,90])
            border(w,thick, height, radius, t );
        
    translate([0,0,height]) chamfered_plate(l,w,t);
    }

module border(length, thickness, height, radius, t){
    border_length = (length-2*t-2*radius)/2 ;
    color([0,1,0])
    cube([border_length , thickness, height]);
    translate([(length-2*t-2*radius)/2+2*radius,0,0])
        color([0,0,1])
        cube([border_length, thickness, height]);
    }
    
module chamfered_plate(l,w,t){
        
    polyhedron(
        points = [
            [0      ,0      ,0],        // 0
            [l      ,0      ,0],        // 1
            [l      ,w      ,0],        // 2
            [0      ,w      ,0],        // 3
            [t      ,t      ,t],        // 4
            [l-t    ,t      ,t],        // 5
            [l-t    ,w-t    ,t],        // 6
            [t      ,w-t    ,t]         // 7
            ],
        faces = [
            [0,1,2,3],                  // bottom
            [4,5,1,0],                  // front
            [7,6,5,4],                  // top
            [5,6,2,1],                  // right
            [6,7,3,2],                  // back
            [7,4,0,3]                   // left
            ]
        );
        
    }
    
