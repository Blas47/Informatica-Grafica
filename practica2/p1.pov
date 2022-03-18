#include "colors.inc"          
#include "woods.inc"
#include "florero.pov"
#include "cuenco.pov"
#include "estrella.pov"
#include "esfera.pov"
/// La posicion de la camara
camera {
 location <0,100,0>
 right x
 look_at <-0,0,0>
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
#declare escenaFinal =
union {
//OBJETOS FINALES
object{cuenco
        scale 0.9
        translate <25,0,-10>}
object{esfera translate <-10,0,-5>}
object{figuraEstrella
	texture { NBbeerbottle }
	 pigment {White}
	 //rotate<0,70,0>
	 translate <-23,0,20>}
object{floreroFigura
        rotate <0,-180,0>
		translate<-5,0,8>
		scale 1.5
		translate<32,0,8>
		}
}

    

#declare p1fractal = object {escenaFinal };
#declare iteration = 0; 
#while (iteration<10) 
 #declare p1fractal = 
 union { 
     object { escenaFinal}   
     object { p1fractal scale 0.5 rotate <0,iteration*pi,0>} 
 } 
 #declare iteration = iteration + 1; 
#end 
//object{p1fractal}