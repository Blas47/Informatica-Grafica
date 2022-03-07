#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

// La posicion de la camara
camera {
 location <-5,30,-20>
 right x
 look_at <0,0,0>
}

// Punto de luz
light_source {
 <0,30,0>
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
    //texture { Ruby_Glass }
      pigment{Blue}


  }
  #declare base = 
  prism {
  	linear_sweep

  	0,
  	3,
  	7,
  	<6,0>,
  	<3,5.196>,
  	<-3,5.196>,
    <-6,0>,
  	<-3,-5.196>,
   	<3,-5.196>,
  	<6,0>
  	//texture { Ruby_Glass }
  	pigment{Blue}
  	}
#declare angulo = 0;
#declare altura =  1 ;
#declare resta = 
	difference{
	object{
		base  
			translate <0,0,0> 
			scale <1.2,1,1.2> 
		}
	object{
		base 
			translate <0,0,0>
			scale <1,1.00001,1> 
		}
	}
#declare forma = 
object{
union{
#for( cont,1, 6,1)
	object {
		trapecio
			rotate<0,angulo,0>
			scale<0, 1 + 0.5*mod(altura,2),0>		
	}
	#declare angulo = angulo + 60;
	#declare altura = altura +1;	
#end
}
}
#declare estrella = 
union{
	object{base pigment{Blue}}
	object{forma}
	}
#declare figura = union{
	object{estrella}
	object {resta translate <0,2,0>}
	}
object{figura}


