// Persistence of Vision Ray Tracer Scene Description File
// File: three-keys.pov
// Vers: 3.6
// Desc: Basic Scene Template with beach ball turned into three keys
// Date: 9/15/12
// Auth: Nathan Carter
//

#version 3.6;

#include "colors.inc"

global_settings {
  assumed_gamma 1.0
}

// ----------------------------------------

camera {
  location  <0.0, 3.5, -4.0>*1.5
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <0.0, 0.0,  0.0>
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}

light_source {
  0*x                 // light's position (translated below)
  color rgb 1.0       // light's color
  area_light
  <8, 0, 0> <0, 0, 8> // lights spread out across this distance (x * z)
  4, 4                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
  circular            // make the shape of the light circular
  orient              // orient light
  translate <-30,30,-30>   // <x y z> position of light
}
light_source {
  0*x                 // light's position (translated below)
  color rgb 1.0       // light's color
  area_light
  <8, 0, 0> <0, 0, 8> // lights spread out across this distance (x * z)
  4, 4                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
  circular            // make the shape of the light circular
  orient              // orient light
  translate <0,3.5,4>*5   // <x y z> position of light
}


// ----------------------------------------

plane {
  y, 0
  pigment { color rgb <0.6,0.6,0.7> }
}

// Here I say that a key is the union of the five shapes described in the text,
// minus the hole cut in each key for a keyring.
#declare key = difference {
  union {
    cylinder { <0,0,0>,<0,0.1,0>, 1 }
    box { <0,0,-1/2>,<3,0.1,1/2> }
    box { <0,0,0>,<1,0.1,1> rotate <0,135,0> translate <1.5,0,0.5> }
    box { <0,0,0>,<1,0.1,1> rotate <0,135,0> translate <2.25,0,0.5> }
    box { <0,0,0>,<1,0.1,1> rotate <0,135,0> translate <3,0,0.5> }
  }
  cylinder { <-0.5,-1,0>,<-0.5,1,0>,0.25 }
  translate <0,0,1>
}

// Here I put the three keys together, giving each a color and its own
// transformations to place it within the fan of keys,
// then rotate and translate the set of three to sit in front of the camera.
union {
  object {
    key rotate -8*x
    pigment { color rgb <0.8,0.6,0.2> }
  }
  object {
    key rotate -4*x translate 1.5*x rotate -30*y
    pigment { color rgb <0.8,0.8,0.8> }
  }
  object {
    key translate 3*x rotate -60*y
    pigment { color rgb <0.6,0.4,0.1> }
  }
  rotate 120*y
  translate <-1.75,0,3>
}

