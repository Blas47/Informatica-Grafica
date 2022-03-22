#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

#include "p1.pov"

/// La posicion de la camara
camera {
 location <5,7,-4>
 right x
 look_at <0,0,1>
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


#declare base = difference {
 sphere{ 
 	<0,0,0>, 
 	1
 	
 }
 	plane{<0,1,0>, 0}
 	
 
}
#declare rueda = 
	cylinder {
	<0,0,0>, 
	<0,1,0>
	1 
	pigment{
		color White
		}
	}

//object{raton scale <0,0,2>}
#declare raton = union{
	object{base scale <0,0,2> 
		pigment{ magnet 1 // magnet type 1 or 2
         julia <0.360, 0.250>, 20  interior 1, 1
         scale 0.1 rotate<90,90,0> translate<0,0,0.39>
         color_map{
         		 [0.0 color rgb <0,0.5,0>]
                   [0.2 color rgb <0,0,1>]
                   [0.4 color rgb <1,0.5,0>]
                   [1.0 color rgb <1,1,1>]
                   [1.0 color rgb <0,0,0>]}
         } // end of pigment -------------------        
         }
	object{rueda rotate <0,0,90> translate <0.5,3.5,2>  scale 0.25}
	}
	

	
	
	