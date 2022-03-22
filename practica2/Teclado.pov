 #include "Tecla.pov"
/// La posicion de la camara
camera {
 location <0,100,-350>
 right x
 look_at <0,50,100>
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

#declare alturaTeclado = 2;
#declare anchoTeclado = 1;
#declare largoTeclado = 3;
#declare factorEscaladoTeclado = 10; 
#declare paddingTeclado = 0.3;  
#declare relacionProxTeclado = 4;
#declare superficieTeclado =
box{ <-largoTeclado,0,-anchoTeclado>, <largoTeclado,alturaTeclado,anchoTeclado>
    scale <factorEscaladoTeclado,0,factorEscaladoTeclado>	 	
	pigment{ color Red}
	
}         

#declare tecladoEntero = 
union{
    object{superficieTeclado}     
    object{TeclasFilas}
    translate<0,0,anchoTeclado*factorEscaladoTeclado>  
}



 
#declare TecladoConHueco = 
difference {
     object{tecladoEntero}
     object{indicadorProxTeclado
        translate<0,0,relacionProxTeclado+2*paddingTeclado>} 
     pigment {color Red} 
} 

       

                       
                       


#declare fractal = object { TecladoConHueco pigment {color Red} };
#declare iteration = 0; 
#while (iteration<5) 
 #declare fractal = 
 union { 
     object { TecladoConHueco pigment {color Red} }   
     object { fractal scale 0.439 translate <0,1.1,0.2> } 
 } 
 #declare iteration = iteration + 1; 
#end                                          

#declare TecladoFinal = 
union
{
    object { fractal pigment {color Red} scale <10,0,10>}   

    object { tecladoEntero scale <0.066,0.06,0.06> translate <0,1.8,3.66> } 
}