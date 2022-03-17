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



#declare alturaTeclado = 2;
#declare anchoTeclado = 1;
#declare largoTeclado = 3;
#declare factorEscaladoTeclado = 10; 
#declare paddingTeclado = 0.3;
#declare relacionProxTeclado = 4;
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
              
#local Xcount = 0;   
#local Zcount = 0; 
#local numeroFilasTeclado = 7;


declare mediaFilaSuperioTeclas =   
union{
    #while( Xcount < (factorEscaladoTeclado*largoTeclado)-paddingTeclado)
        object{tecla
            translate <Xcount,alturaTeclado,(factorEscaladoTeclado*anchoTeclado)-anchoTeclado>
        }
        
        #declare Xcount =  Xcount + 2*anchoTeclado + paddingTeclado;
    #end
} 
 
declare FilaSuperiorTeclas =
union{   
    object{mediaFilaSuperioTeclas}   
    object{mediaFilaSuperioTeclas
        scale<-1,0,0>
    }        
}    
     

declare TeclasFilas =   
union{
    #while( Zcount < numeroFilasTeclado)
        object{FilaSuperiorTeclas
            translate <0,0,-Zcount * (factorEscaladoTeclado * paddingTeclado)>
        }
        
        #declare Zcount =  Zcount + 1;
    #end
}    

#declare indicadorProxTeclado = box{ <-largoTeclado,0,-anchoTeclado>, <largoTeclado,alturaTeclado,anchoTeclado>  
    scale (relacionProxTeclado+paddingTeclado)
	pigment{ color Red}	
}            
    

                