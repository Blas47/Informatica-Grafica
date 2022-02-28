#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

// La posicion de la camara
camera {
 location <0,50,-10>
 look_at <0,0,0>
}
// Punto de luz
light_source {
 <3,30,30>
 color rgb <1,1,1> // White
}                    

plane { // Floor
    <0,1,0>, 0 //Normal and distance
    texture { 
        pigment {
            color Gray
            } 
    } 
}

background{
    color Black
}  
#declare trapecio = 
prism {
	linear_sweep
    0, // sweep the following shape from here ...
    4, // ... up through here
    5, // the number of points making up the shape ...
 
    < 3,  5>, // point#2  ... THIS POINT ...
    < -5, 1>, // point#3
    < -5, -1>, 
    < 3, -5>, // point#4
    < 3,  5>
    pigment { Green }


  }
 #declare rombo = 
  prism {
	linear_sweep
    1, // sweep the following shape from here ...
    4, // ... up through here
    5, // the number of points making up the shape ...
    <3,-5>,
    <0,-3.5>,
    <0,-6.5>,
    <3,-8>,
    <3,-5>
    pigment { Blue }
  }
 #local angulo = 60;
 #local xval =0;
 #local yval = 0;
 /*
#for(angulo,60, 360, 60)
	#local xval = 8.66 + 10 * cos(angulo);
	#local yval  = -5 + 10*sin(angulo) ;
	object{ trapecio 
	rotate <0,angulo,0>
	translate <xval,0,yval>

	}
#end
*/
object{
	trapecio
	translate <-3,0,-5>
	rotate <0,60,0>
	}
object{
	trapecio
	translate <-6,0,-5>
	rotate <0,180,0>
	}	
