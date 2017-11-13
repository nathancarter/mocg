

// Persistence of Vision Ray Tracer Scene Description File
// File: car-turns.pov
// Vers: 3.6
// Desc: Car on a track illustration, from Chapter 11
// Date: June 14, 2013
// Auth: Nathan Carter


   /////////////////////////////////////////////////////////////////////
   //                                                                 //
   //  READ THIS -- READ THIS -- READ THIS -- READ THIS -- READ THIS  //
   //                                                                 //
   /////////////////////////////////////////////////////////////////////
   //                                                                 //
   //  The majority of this file simply sets up the scene with the    //
   //  car and the track.  Readers of the text who wish to try the    //
   //  exercise that involves rotating the car should proceed to the  //
   //  VERY END OF THE FILE, where the object { Car ... } block is,   //
   //  and modify the code in that block as you see fit, to complete  //
   //  the exercise.                                                  //
   //                                                                 //
   /////////////////////////////////////////////////////////////////////


#version 3.6;

#include "colors.inc"
#include "bezier.inc"

global_settings {
  assumed_gamma 1.0
}

// ----------------------------------------

camera {
  location  <-2, 3, -5>*4/3
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <-2, 0,  0.0>*4/3
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

// brighten things a bit with two light sources
light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
  translate <-30, 30, -30>
}
light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
  translate <30, 30, -30>
}

// ----------------------------------------

// a flat brown plane on which to place the track and the car
plane {
  y, 0
  pigment { color rgb <0.7,0.5,0.3> }
}

// the following defines the car shape
#declare Depth = 1;
#declare Bit = 0.01;
#declare Car = union {
  difference {
    union {
      cylinder { <-0.5,0.15,0>,<-0.5,0.15,Depth>,0.2 }
      cylinder { < 0.5,0.15,0>,< 0.5,0.15,Depth>,0.2 }
      pigment { color rgb <0.5,0.5,0.5> }
    }
    box { <-5,-5,0.1>,<5,5,Depth-0.1> }
  }
  union {
    cylinder { <-0.5,0.15,-Bit>,<-0.5,0.15,Depth+Bit>,0.1 }
    cylinder { < 0.5,0.15,-Bit>,< 0.5,0.15,Depth+Bit>,0.1 }
    pigment { color rgb <0.3,0.3,0.3> }
  }
  union {
    intersection {
      cylinder { <0,0,Bit>,<0,0,Depth-Bit>,1 }
      box { <0,0,0>,<-1,1,Depth> }
      scale <0.5,0.4,1> translate <-0.5,0.1,0>
    }
    intersection {
      cylinder { <0,0,Bit>,<0,0,Depth-Bit>,1 }
      box { <-1,0,0>,<1,1,Depth> }
      scale <0.5,0.25,1> translate <0,0.5,0>
    }
    box { <-0.5,0.1,Bit>,<0.5,0.5,Depth-Bit> }
    prism {                                
      linear_sweep linear_spline
      Bit, Depth-Bit,
      5, <0.5,0.1>,<1,0.1>,<0.9,0.35>,<1,0.6>,<0.5,0.5>
      rotate 90*x scale -y
    }
    pigment { color rgb <1,0.2,0.2> }
  }
  translate <0,0.05,-Depth/2>
  scale 3/4
}

// the following places the track in the scene
#declare Itty = 0.0001;
union {
  box { <-2,0,1>,<2,Itty,2> }
  box { <-2,0,-1>,<2,Itty,-2> }
  difference {
    cylinder { <2,0,0>,<2,Itty,0>,2 }
    cylinder { <2,-1,0>,<2,1,0>,1 }
    box { <-1,-1,-3>,<2,1,3> }
  }
  difference {
    cylinder { <-2,0,0>,<-2,Itty,0>,2 }
    cylinder { <-2,-1,0>,<-2,1,0>,1 }
    box { <1,-1,-3>,<-2,1,3> }
  }
  pigment { color rgb <0.7,0.7,1> }
  translate 2*x
  scale 4/3
  translate -2*x
}


   /////////////////////////////////////////////////////////////////////
   //                                                                 //
   //  The block below should be modified to fix the car's rotation.  //
   //                                                                 //
   /////////////////////////////////////////////////////////////////////


object {
  Car
  rotate -90*y*clock
  translate <2*pow(clock,2)-4*clock-2,
             0,-2*pow(clock,2)+2>
}

