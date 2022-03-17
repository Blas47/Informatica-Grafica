#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"
//ESTRELLA DE CRISTAL
#declare trapecio = 
prism {
	linear_sweep
    0, // sweep the following shape from here ...
    7, // ... up through here
    5, // the number of points making up the shape ...
    < -3,  -5.196>, 
    < 3, -5.196>, 
    < 1, -8>, 
    < -1, -8>, 
    < -3,  -5.196>

  }
  #declare base = 
  prism {
  	linear_sweep
  	0,
  	1,
  	7,
  	<6,0>,
  	<3,5.196>,
  	<-3,5.196>,
    <-6,0>,
  	<-3,-5.196>,
   	<3,-5.196>,
  	<6,0>

  	  	}
#declare angulo = 0;
#declare altura =  1 ;
#declare resta = 
	difference{
	object{
		base  
			translate <0,0,0> 
			scale <1.4,1,1.4> 
		}
	object{
		base 
			translate <0,0,0>
			scale <1,1.01,1> 
		}
	translate<0,-0.5,0>
	}
#declare forma = 
object{
union{
#for( cont,1, 6,1)
	object {
		trapecio
			rotate<0,angulo,0>
			scale<0, 1 + 0.4*mod(altura,2),0>		
	}
	#declare angulo = angulo + 60;
	#declare altura = altura +1;	
#end
}
}
#declare estrella = 
union{
	object{base }
	object{forma}
	}
#declare figuraEstrella = union{
	object{estrella scale<0.9,1.3,0.9>}
	object {resta translate <0,1,0> scale<0.8,5,0.8>}

}