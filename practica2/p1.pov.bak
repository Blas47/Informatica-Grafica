#include "colors.inc"          
#include "woods.inc"
#include "florero.pov"
#include "cuenco.pov"
#include "estrella.pov"
#include "esfera.pov"
/// La posicion de la camara
camera {
 location <10,30,-50>
 right x
 look_at <-10,0,20>
	 angle 40
}
// Punto de luz
light_source {
 <-10,30,20>
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


//OBJETOS FINALES
object{cuenco
        scale 0.9}
object{esfera}
object{figuraEstrella
	texture { NBbeerbottle }
	 pigment {White}
	 //rotate<0,70,0>
	 translate <-23,0,20>}
object{floreroFigura
        rotate <0,-180,0>
		translate<-5,0,8>
		scale 1.5
		
		}
