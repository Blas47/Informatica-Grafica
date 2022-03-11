#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"
/// La posicion de la camara
camera {
 location <0,2,-2>
 right x
 look_at <0,0,0>
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

#declare tecla =
union{
    box{ <-anchoTeclado,0,-anchoTeclado>, <anchoTeclado,anchoTeclado,anchoTeclado>	 	
	    pigment{color Blue}  
	    scale 0.5
	}
	sphere{ 
		<0,anchoTeclado/2,0>, 0.25 
		texture{ 
		    Ruby_Glass 
		    pigment{color Red filter 0.8 }   
		}
	}   
	sphere{ 
		<0,anchoTeclado/2,0>, 0.15 
		texture{ 
		    Ruby_Glass 
		    pigment{color White filter 0.8 }   
		}
	}   
}
              

object{tecla}