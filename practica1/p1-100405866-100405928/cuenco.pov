#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"
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