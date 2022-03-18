#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"  
#include "Tecla.pov"     
#include "Mesa.pov"
#include "Teclado.pov"
#include "p1.pov"
#include "Pantalla.pov"
/// La posicion de la camara
camera {
 location <0,5,-10>
 right x
 look_at <0,2,1 >
	 angle 40
}
// Punto de luz
light_source {
 <-10,1050,20>
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

object{mesa}  
object{pantalla scale 0.25 translate<0,2.5,2.5>}
object{TecladoFinal scale 0.005 translate<0,2.5,-1.75>}  
object{p1fractal scale 0.05 translate<0,2.5,1>}    