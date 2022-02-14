#include "colors.inc"          
#include "woods.inc"

// La posicion de la camara
camera {
 location <0,20,-20>
 look_at <0,2,0>
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
difference{ 
//Cuenco
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