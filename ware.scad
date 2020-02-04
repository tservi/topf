$fn=200;


l       = 86        ; // length
w       = 46        ; // width
h       = 19        ; // height
t       = 3         ; // thickness
int_l   = l-2*t     ;
int_w   = w-2*t     ;
int_h   = h-t       ;

length = l;
width= w;
height = h;
thickness = t;
int_length = int_l;
int_width = int_w;
int_height = int_h;
cornerRadius = 0;
height_of_top_and_bottom = 5;

echo(l      ) ;
echo(w      ) ;
echo(h      ) ;
echo(int_l  ) ;
echo(int_w  ) ;
echo(int_h  ) ;

difference (){
    box(l,w,h);
    translate([t, t, t]){
        box(int_l,int_w,int_h);
        }
}


module box(length,width,height)
{
    cube(size=[length,width,height]);    
}
//rainures( 200,200,1);
/*
translate([0, 0, 0]){
    difference() {
            roundedBox(length, width, height, cornerRadius); 
            translate([1,1,1]) {
                roundedBox(length-2, width-2, height-1, cornerRadius); 
            }
            
            translate([widht/2,0,0]) {
                rainures( 1, 10, 1); 
            }
            
    }
}
*/
/*
translate([width*2 +1 , 0, 0]){
    mirror([1,0,0]) {
        roundedBox(length, width, 1, cornerRadius);
        difference() {
            translate([1,1,0]) {
                roundedBox(length-2,width-2,4,cornerRadius);
            }
            
            translate([2,2,0]) {
                roundedBox(length-4,width-4,4,cornerRadius);
            }
            
            translate([width*2 +1 ,20,0]){
                    rainures(length, width, 1);
                }
        }
    }
}
*/
//handle
/*
translate([0,length,0]) {
    difference() {
        difference() {
            cylinder(h=2, r=10);
            cylinder(h=2, r=5);

        }
        translate([0,-10,0]) {
            cube(size=[10,10,2]);        
        }
    }
}
*/
/*
module rainures(lenght,width,height)
{
        cube(size=[length,width,height]);
}

module roundedBox(length, width, height, radius)
{
    dRadius = 2*radius;

    //cube bottom right
    translate([width-dRadius,-radius,0]) {
        cube(size=[radius,radius,height+ height_of_top_and_bottom]);
    }
    
    
    //cube top left
    translate([-radius,length-dRadius,0]) {
        cube(size=[radius,radius,height+ height_of_top_and_bottom ]);
    }
    
    
    //base rounded shape
    minkowski() {
        cube(size=[width-dRadius,length-dRadius, height]);
        cylinder(r=radius, h=height_of_top_and_bottom);
    }
  
    
  
}
*/