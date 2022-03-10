// Ejemplos de texturas con fractales en Pov-ray
//https://www.povray.org/documentation/view/3.6.1/377/
// http://www.f-lohmueller.de/pov_tut/tex/tex_760e.htm


camera {
location <0,0,-3> look_at 0
}

sky_sphere { pigment { color rgb 1 } } 
light_source {< 20, 10, -50> color rgb <1,1,1> }


//Pigmento Mandel. Caso base
/*
sphere{0,1	 	
	pigment{ mandel 50 exponent 2 //2...33
	         scale 0.60 translate<0.3,0,0>
	         color_map{[0.00 color rgb <0.5,0,0.25>]
	                   [0.08 color rgb <0.8,0,0.10>]
	                   [0.20 color rgb <1,0.4,0>]
	                   [0.30 color rgb <1,0.7,0>]
	                   [1.0 color rgb <1,1,1>]}
	        } 
}
*/
////Pigmento Mandel. Aplicación normal
sphere{0,1	 	
	pigment{ color rgb <1,1		,1>}
	normal { mandel 125  //Número máximo de iteraciones
	         scale 0.50 translate<0.15,0,0>
		} 
}


////Pigmento Julia. Caso base
/*
sphere{0,1	 	
pigment{ julia <0.360, 0.250>, 20
         interior 1, 1  
         scale 0.60
         color_map{[0.0 color rgb <0,0,0>]
                   [0.2 color rgb <1,0,0>]
                   [0.4 color rgb <1,1,0>]
                   [1.0 color rgb <1,1,1>]
                   [1.0 color rgb <0,0,0>]}
        } // end of pigment
}
*/

////Pigmento Julia. Aplicación normal
/*
sphere{0,1	 	
	pigment{ color rgb <1,1,1>}
	normal { julia <0.360, 0.250>, 20
	         scale 0.50
	} 
}
*/