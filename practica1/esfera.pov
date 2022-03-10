#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

//ESFERA
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



