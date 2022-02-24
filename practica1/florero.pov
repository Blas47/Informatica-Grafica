#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"        
                
// La posicion de la camara
camera { 
    location <0,6,-10>
    look_at <0,3,3>
 //right 1
}
// Punto de luz
light_source {
 <0,10,-10>
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
         
#declare macetero = box {<-3,0,-3>, <3,6,3>}
#declare agujero = cylinder {<0,3,-3.001>, <0,3,3.001>, 1.95}  
#declare Agujeroenvase = cylinder {<0,2,0>, <0,6.001,0>, 1}
#declare maceta =    
    difference
    {  
        object {macetero}
        object {agujero} 
        object {Agujeroenvase}  //make it a little bigger so stays open                
        texture {T_Wood2 finish {phong 0.7}}
    } 
      
#declare envaseConBorde =     
    difference
    {  

        cylinder {<0,1,0>, <0,5.75,0>, 1.5}
        cylinder {<0,1,0>, <0,5.7,0>, 1.3}   
        cylinder {<0,1,0>, <0,5.76,0>, 0.7}
        texture {Glass2 finish {reflection 0.1 phong 0.3}} 
    }
     
#declare florero =
    union
    { 
        object{maceta}
        object{envaseConBorde}       
    }          
    
#declare palo = 
    cylinder
    { 
        <0,0,0>, <0,12,0>, 0.15
        texture {pigment{ color ForestGreen}} 
    }     

union
{
     object{florero}
    //palo izq a derecha /
    object
    {
      palo
      rotate<2,0,-19>
      translate <-1.75,0,-0.3>   
    }
    object
    {
      palo
      rotate<-2,0,19>
      translate <1.75,0,-0.3>
    }  
    object
    {
      palo
      rotate<12,0,2>
      translate <0.1,0,-0.75>
    } 
  
}            
