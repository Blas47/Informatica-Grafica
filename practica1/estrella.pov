#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

// La posicion de la camara
camera {
 location <0,50,-10>
 look_at <0,0,-10>
}
// Punto de luz
light_source {
 <3,30,30>
 color rgb <1,1,1> // White
}                    

plane { // Floor
    <0,1,0>, 0 //Normal and distance
    texture { 
        pigment {
            color Gray
            } 
    } 
}

background{
    color Black
}  
//////////////// Estrella
#declare trapecio = 
prism {
	linear_sweep
    0, // sweep the following shape from here ...
    4, // ... up through here
    5, // the number of points making up the shape ...
    < 3,  5>, 
    < -5, 1>, 
    < -5, -1>, 
    < 3, -5>, 
    < 3,  5>
    pigment { Green }


  }
 #declare rombo = 
  prism {
	linear_sweep
    1, // sweep the following shape from here ...
    4, // ... up through here
    5, // the number of points making up the shape ...
    <3,-5>,
    <0,-3.5>,
    <0,-6.5>,
    <3,-8>,
    <3,-5>
    pigment { Blue }
  }
 #declare anguloCircu = 7*pi/6;
 #declare angulo = 300;
 #declare xval =0;
 #declare yval = 0;
 #declare cont = 0;
 #declare xval = 8.66 + 10 * cos(anguloCircu);
#declare yval  = -5 + 10*sin(anguloCircu) ;


#for( cont,0, 5,1)
	#declare posx = 8.66 + 10 * cos(anguloCircu);
	#declare posy  = -5 + 10*sin(anguloCircu) ;
	#declare xval = posx - 3;
	#declare yval = posy - 5;
	#declare anguloCircu = anguloCircu + pi/3;
	#declare anguloCircu = mod(anguloCircu,2*pi); 
	object{ trapecio 
	rotate <0,angulo,0>
	translate <xval,0,yval>
	}
	#declare angulo = angulo -60 ;
	#declare angulo = mod(angulo,360); 
	object{
	sphere{
		<posx,0, posy>, 2 
		texture{ Ruby_Glass 
		pigment{color Red filter 0.8 }
		} 
	}
	}
	
	
#end

	
