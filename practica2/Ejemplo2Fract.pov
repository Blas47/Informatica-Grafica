#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"  
#include "Tecla.pov"
/// La posicion de la camara
camera {
 location <0,100,10>
 right x
 look_at <0,0,10>
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
#declare superficieTeclado =
box{ <-largoTeclado,0,-anchoTeclado>, <largoTeclado,alturaTeclado,anchoTeclado>
    scale <factorEscaladoTeclado,0,factorEscaladoTeclado>	 	
	pigment{ color Red}
	
}         



object{superficieTeclado}

//object{tecla
//    translate <-(factorEscaladoTeclado*largoTeclado)+anchoTeclado,alturaTeclado,(factorEscaladoTeclado*anchoTeclado)-anchoTeclado>
//}    


     
     
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
    	
	pigment{ color Blue}	
}            
    

#declare TotalTeclas = 
difference {
     object{TeclasFilas}
     object{indicadorProxTeclado 
        //translate <0,2,-(factorEscaladoTeclado*anchoTeclado)+2*anchoTeclado>
        translate <0,1.9,-(factorEscaladoTeclado*anchoTeclado)+2*(anchoTeclado-paddingTeclado)>
     } 
}  

object{TotalTeclas}    
     

  

