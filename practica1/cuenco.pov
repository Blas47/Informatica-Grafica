#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

<<<<<<< HEAD
// La posicion de la camara
camera {
 location <-5,15,-50>
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
=======
  
//Cuenco      
#declare cuenco =
>>>>>>> 7358fa5c7ce0843fcc372d36dbfa40748dda5319
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
<<<<<<< HEAD
//esfera
//vrand
#declare RandomSeed = seed(777);
#declare MiEsfera =
	sphere{
		<-15,7,-5>, 7 
		texture{ Ruby_Glass 
		pigment{color Red filter 0.8 }
		} 
	}
#declare ZonaEsfera = 
	sphere {
		<-15,7,-5>, 6
		texture{ Glass 
		pigment{ color White filter 1
		}			
		}	
}
 #local Cntr = 1; // start
	 	 			
	
union{
	object{MiEsfera}
	#for(Cntr, 1, 300, 1)
	sphere{
		<0,0,0>, 0.5
		
		translate VRand_In_Obj(ZonaEsfera, rand(RandomSeed))
		texture{
			Ruby_Glass
			}
		}
	
	#end
}
//Estrella
=======
>>>>>>> 7358fa5c7ce0843fcc372d36dbfa40748dda5319







