#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

#include "p1.pov"

/// La posicion de la camara
camera {
 location <0,2.5,-20>
 right x
 look_at <0,2.5,0>
	 angle 40
}
// Punto de luz
light_source {
 <-10,30,-20>
 color rgb <1,1,1> // White
}                 

plane { // Floor
    <0,1,0>, 0 //Normal and distance
    texture { 
        pigment {
            color White
            } 
    } 
}

background{
    color Black
}


