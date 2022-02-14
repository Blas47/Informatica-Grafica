#include "colors.inc"          
#include "woods.inc"

// La posicion de la camara
camera {
 location <0,5,-10>
 look_at <0,2,0>
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
            color White
            } 
    } 
}

background{
    color Black
}

sphere {
     <0,1,0>, 1  
     texture{
        pigment{color Blue}
       }         
} 
            