#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"

// La posicion de la camara
camera {
 location <-5,30,-60>
 right x
 look_at <-10,2,0>
	 angle 40
}
// Punto de luz
light_source {
 <0,30,30>
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
//CUENCO
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
/////FLORERO

#local bordeEnvaseExterior = cylinder {<0,1,0>, <0,5.75,0>, 1.5}
      
#local envaseConBorde =     
    difference
    {  

        object {bordeEnvaseExterior}
        cylinder {<0,1,0>, <0,5.7,0>, 1.3}   
        cylinder {<0,1,0>, <0,5.76,0>, 0.7}
        texture {Glass3 finish {reflection 0.1 phong 0.3}}   
        normal { bumps 0.4 scale 0.2 }
    }       
#local macetero = box {<-3,0,-3>, <3,6,3>}
#local agujero = cylinder {<0,3,-3.001>, <0,3,3.001>, 1.95}  
#local Agujeroenvase = cylinder {<0,2,0>, <0,6.001,0>, 1}
#local maceta =    
    difference
    {  
        object {macetero}  
        object {bordeEnvaseExterior}
        object {agujero} 
        object {Agujeroenvase}  //make it a little bigger so stays open 
                      
        texture {T_Wood2 finish {phong 0.7}}
    }   


     
#declare florero =
    union
    { 
        object{maceta}
        object{envaseConBorde}       
    }          
    
#local palo = 
    cylinder
    { 
        <0,0,0>, <0,12,0>, 0.15
        texture {pigment{ color ForestGreen}} 
    }
#declare floreroFigura =     
union
{
     object{florero}
    //palo izq a derecha /
    object
    {
      palo
      rotate<2,0,-19>
      translate <-1.5,0,-0.3>   
    }
    object
    {
      palo
      rotate<-2,0,19>
      translate <1.5,0,-0.3>
    }  
    object
    {
      palo
      rotate<13,0,2>
      translate <0.1,0,-0.85>
    } 
    object{bordeEnvaseExterior
    texture{ Water }
    normal{ bumps 0.03
         scale <1,0.25,0.25>*1
         turbulence 0.6
               }
        scale<0,0.2,0>
        }
}     

//OBJETOS FINALES
object{cuenco}
object{esfera}
object{figuraEstrella
	texture { NBbeerbottle }
	 pigment {White}
	 //rotate<0,70,0>
	 translate <-20,0,30>}
object{floreroFigura
		translate<-5,0,20>}

