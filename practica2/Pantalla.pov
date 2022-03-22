#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

#include "p1.pov"

/// La posicion de la camara
camera {
 location <0,2.5,-20>
 right x
 look_at <0,2.5,0>
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

#declare base = 
cylinder{
    <0,0,0>, <0,0.25,0>,1
    scale <2,1,1>
}      

#declare tronco = 
cylinder{
    <0,0,0>, <0,1.75,0>,0.2
    
} 

#declare marco = 
box{
    <0,0,0>,<16,9,1>
} 
#declare huecoPantalla = 
box{
    <0,0,-0.01>,<15,8,0.5>
}    

#declare infoPantalla = 
box{
    <0,0,-0.01>,<15,8,0.15> 
   pigment{ julia <0.360, 0.250>, 31
         interior 1, 1  scale 16
         color_map{[0.0 color rgb <0,0,0>]
                   [0.2 color rgb <1,0,0>]
                   [0.4 color rgb <1,1,0>]
                   [1.0 color rgb <1,1,1>]
                   [1.0 color rgb <0,0,0>]}
        } 
} 
#declare screen = 
difference{ 
    object{marco pigment {color Black}}
    object{huecoPantalla translate<0.5,0.5,0>}

}              
 
#declare screenConImagen = 
union
{     
    object{screen}
    object{infoPantalla translate<0.5,0.5,0.1>}

}
#declare pantalla = 
union{
        object{tronco pigment { color Black}}
        object{base pigment { color Black}}   
        object{screenConImagen scale 0.5 translate<-4,1.75,0> }
        pigment {color Red}  
}                        



