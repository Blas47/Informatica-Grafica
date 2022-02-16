#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"        
                
// La posicion de la camara
camera {
 location <3,20,-10>
 look_at <3,3,3>
}
// Punto de luz
light_source {
 <3,3,-10>
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

union{
    difference{ 
    //CAJA
        box {
         
            <0,0,0>, <6,6,6> 
            
        }
        cylinder
        {
            <3,3,-0.001>, <3,3,6.001>, 2
        }     
        
        texture{ 
            T_Wood2
            finish { phong 0.7 }
         }
    }   
    
    cylinder
    {
        <3,0,3>, <3,6,3>, 1.5
        texture {  
            Glass3
        } 
    }   
}           

//palo derecha
cylinder
    {
        <4.15,0,4>, <1.5,12,0>, 0.15
        texture {  
           pigment{ color ForestGreen}  
           
        } 
    } 
    
//palo izquierda
cylinder
    {
        <1.5,0,3>, <5,12,2>, 0.15
        texture {  
           pigment{ color Blue}  
           
        } 
    }   
    
//palo izquierda
cylinder
    {
        <3,0,1.5>, <4,12,5>, 0.15
        texture {  
           pigment{ color Red}  
           
        } 
    }   