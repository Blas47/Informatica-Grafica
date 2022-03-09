#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

// La posicion de la camara
camera {
 location <-5,40,-70>
 right x
 look_at <-5,2,0>
	 angle 40
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
//Cuenco
#declare cuenco = 
difference{ 
    sor {
        5,//Number of points, at least 4
        <0,0>, <3,0>, <2.75,1>,<6,6>, <2,6>
        
    }
    sphere {
         <0,7,0>, 6       
    } 
    texture{ 
        pigment{ color rgb<1,0.95,0.8>} 
        normal { bumps 0.5 scale 0.01}
        finish { phong 0.1 }
     }
}
//esfera
//vrand
#declare RandomSeed = seed(777);
#declare MiEsfera =
	sphere{
		<-15,5,-5>, 5 
		texture{ Ruby_Glass 
		pigment{color Red filter 0.8 }
		} 
	}
#declare ZonaEsfera = 
	sphere {
		<-15,5,-5>, 4
		texture{ Glass 
		pigment{ color White filter 1
		}			
		}	
}
 #local Cntr = 1; // start
 #declare esfera = 	
union{
	object{MiEsfera}
	#for(Cntr, 1, 150, 1)
	sphere{
		<0,0,0>, 0.5
		
		translate VRand_In_Obj(ZonaEsfera, rand(RandomSeed))
		texture{
			Ruby_Glass
			}
		}
	
	#end
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
	object{base }
	object{forma}
	}
#declare figuraEstrella = union{
	object{estrella}
	object {resta translate <0,1,0> scale<0,2.4,0>}

}
//objetos finales
object{cuenco}
object{esfera}
object{figuraEstrella
	texture { NBbeerbottle }
	 pigment {Green}
	 rotate<0,70,0>
	 translate <-10,0,20>}

