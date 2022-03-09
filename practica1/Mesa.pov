#include "colors.inc"          
#include "woods.inc"
#include "florero.pov"
#include "cuenco.pov"
// La posicion de la camara
camera {
 location <0,10,-20>
 look_at <0,2,0>
 
}
// Punto de luz
light_source {
 <1,10,10>
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


object{floreroFigura
    translate<-10,0,10>
}     
object{cuenco
    scale 0.5
    
}