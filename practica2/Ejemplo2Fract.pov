#include "colors.inc"          
#include "woods.inc"

/// La posicion de la camara
camera {
 location <-30,10,0>
 right x
 look_at <-30,0,0>
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

#local alturaTeclado = 2;
#local anchoTeclado = 1;
#local largoTeclado = 3;
#local factorEscaladoTeclado = 10;
#local superficieTeclado =
box{ <-factorEscaladoTeclado*largoTeclado,0,-factorEscaladoTeclado*anchoTeclado>, <factorEscaladoTeclado*largoTeclado,alturaTeclado,factorEscaladoTeclado*anchoTeclado>	 	
	pigment{ color Red}
	
}   
#local tecla =
box{ <-1,0,-1>, <1,1,1>	 	
	pigment{ color Blue}  
	scale 0.5
	
}  

object{superficieTeclado}
object{tecla
    translate <-factorEscaladoTeclado*largoTeclado,alturaTeclado,0>
}