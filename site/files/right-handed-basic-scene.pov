// Persistence of Vision Ray Tracer Scene Description File
// File: right-handed-basic-scene.pov
// Vers: 3.6
// Desc: Basic Scene Example, converted to a right-handed coordinate system
// Date: 09/15/12
// Auth: Nathan Carter, modifying POV's built-in basic scene template
//

#version 3.6;

#include "colors.inc"

global_settings {
  assumed_gamma 1.0
}

// ----------------------------------------

camera {
  location  <3,-3,1>
  look_at   <0,0,0>
  sky       <0,0,1>
  right     -x*image_width/image_height
}

sky_sphere {
  pigment {
    gradient z
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}

light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
  translate <-30,-30,30>
}

// ----------------------------------------

plane {
  z, -1
  pigment { color rgb <0.7,0.5,0.3> }
}

sphere {
  0.0, 1
  texture {
    pigment {
      radial
      frequency 8
      color_map {
        [0.00 color rgb <1.0,0.4,0.2> ]
        [0.33 color rgb <0.2,0.4,1.0> ]
        [0.66 color rgb <0.4,1.0,0.2> ]
        [1.00 color rgb <1.0,0.4,0.2> ]
      }
    }
    finish{
      specular 0.6
    }
  }
}

