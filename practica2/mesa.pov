#include "colors.inc"          
#include "woods.inc"
#include "textures.inc"
#include "rand.inc"
/// La posicion de la camara
camera {
 //location <0,1,-10>
 location <10,10,10>
 right x
 look_at <0,2,0>
	 angle 40
}
// Punto de luz
light_source {
 <-10,30,20>
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
 #declare Pigment_1 =
pigment{ magnet 1 // magnet type 1 or 2
         julia <0.360, 0.250>, 2  interior 1, 1
         scale 0.26 rotate<0,40,0>
         color_map{[0.0 color rgb <1,0.5,0>]
                   [0.1 color rgb <1,0,0.5>]
                   [0.4 color rgb <1,1,0>]
                   [1.0 color rgb <1,1,1>]
                   [1.0 color rgb <0,0,0>]}
         } // end of pigment -------------------

#declare radioCilindro = 0.2;
#declare alturaPata = 2;

#declare alturaMesa = 0.5;
#declare anchoMesa = 2;
#declare largoMesa = 3;
#declare pata = 
 cylinder {
    <0, 0, 0>,
    <0, alturaPata, 0>,     
    radioCilindro   
   pigment{ magnet 1 // magnet type 1 or 2
         julia <0.360, 0.250>, 20  interior 1, 1
         scale 0.26 rotate<0,40,0>
         color_map{[0.0 color rgb <1,0.5,0>]
                   [0.1 color rgb <1,0,0.5>]
                   [0.4 color rgb <1,1,0>]
                   [1.0 color rgb <1,1,1>]
                   [1.0 color rgb <0,0,0>]}
        } // end of pigment
	
  }
 #declare angulo = 0;
#declare base = union{
 object{pata
 	translate<-anchoMesa*3/4,0,-largoMesa*3/4>
 	}
  object{pata
 	translate<-anchoMesa*3/4,0,largoMesa*3/4>}
  object{pata
 	translate<anchoMesa*3/4,0,largoMesa*3/4>}
  object{pata
 	translate<anchoMesa*3/4,0,-largoMesa*3/4>}
}
#declare tabla = 
 box{ 
 	<-anchoMesa,0,-largoMesa>, 
 	<anchoMesa,alturaMesa, largoMesa>
 	translate <0,2,0>
 	 pigment{ magnet 1 // magnet type 1 or 2
         julia <0.360, 0.250>, 30  interior 1, 1
         scale 0.16 rotate<90,10,0>
         color_map{[0.0 color rgb <1,0.5,0>]
                   [0.1 color rgb <1,0,0.5>]
                   [0.4 color rgb <1,1,0>]
                   [1.0 color rgb <1,1,1>]
                   [1.0 color rgb <0,0,0>]}
        } // end of pigment
 	
 }

 #declare mesa = union{
 	object{base}
 	object{tabla}
 	
 		}
 
 mesa