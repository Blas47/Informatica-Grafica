#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"        
 camera {
 location <0,10,-15>
 look_at <0,2,0>
 
}
// Punto de luz
light_source {
 <1,10,10>
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

        



