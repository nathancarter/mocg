
// This scene file requires tinker-toy-project.inc to be in the same folder.
// Obtain that file from the Mathematics of Computer Graphics textbook website,
// where you obtained this file.
// Nathan Carter, April 2013

#include "colors.inc"
#include "tinker-toy-project.inc"
#declare CAMERA_ZOOM = 2;

camera {
  perspective 
  location <1,1.2,-1.9>*CAMERA_ZOOM
  right x * CAMERA_ZOOM * image_width / image_height
  up y * CAMERA_ZOOM
  look_at < 0, 1.4, 0.1>
}
light_source {
  < 3.5, 15, -10>
  rgb <1.000000, 1.000000, 1.000000>
  area_light
  <2, 0, 0> <0, 0, 2> // lights spread out across this distance (x * z)
  8, 8                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
}
light_source {
  < -3.5, 15, -10>
  rgb <1.000000, 1.000000, 1.000000>
  area_light
  <2, 0, 0> <0, 0, 2> // lights spread out across this distance (x * z)
  8, 8                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
}

#declare AXES_REACH = CAMERA_ZOOM*0.65;
#declare AXES_RADIUS = 0.01;
#declare Axes = union {
  cylinder {
    <-AXES_REACH,0,0>,<AXES_REACH,0,0>,AXES_RADIUS
    pigment { color Black }
  }
  cylinder {
    <0,-cos(pi/6)*AXES_REACH,0>,<0,cos(pi/6)*AXES_REACH,0>,AXES_RADIUS
    pigment { color Black }
  }
  cylinder {
    <0,0,-AXES_REACH>,<0,0,AXES_REACH>,AXES_RADIUS
    pigment { color Black }
  }
  no_shadow
}
//object { Axes }

#declare P_WoodGrain1A =
pigment {
    wood
    turbulence 0.04
    octaves 3
    scale <0.05, .05, 1>
}
#declare P_WoodGrain1B =
pigment {
    wood
    turbulence <0.1, 0.5, 1>
    octaves 5
    lambda 3.25
    scale <0.15, .5, 1>
    rotate <5, 10, 5>
    translate -x*2
}
#declare M_Wood13A = 
color_map { 
    [0.0, 0.1 color rgb <0.60, 0.35, 0.20>
              color rgb <0.60, 0.35, 0.20>]
    [0.1, 0.9 color rgb <0.60, 0.35, 0.20>
              color rgb <0.90, 0.65, 0.30>]
    [0.9, 1.0 color rgb <0.90, 0.65, 0.30>
              color rgb <0.60, 0.35, 0.20>]
}
#declare M_Wood13B = 
color_map { 
    [0.0, 0.4 color rgbt <1.00, 1.00, 1.00, 1.00>
              color rgbt <0.90, 0.65, 0.30, 0.30>]
    [0.4, 0.5 color rgbt <0.90, 0.65, 0.30, 0.00>
              color rgbt <0.90, 0.65, 0.30, 0.30>]
    [0.5, 1.0 color rgbt <0.90, 0.65, 0.30, 0.30>
              color rgbt <1.00, 1.00, 1.00, 1.00> ] 
}
#declare T_Wood23 =
    texture {  pigment{ P_WoodGrain1A color_map { M_Wood13A }}}
    texture {  pigment{ P_WoodGrain1B color_map { M_Wood13B }}}
union {
  union {
    object { Stick2 pigment { color Red } }
    object { Flag translate (2-StickSink)*x pigment { color Yellow } }
    translate (WheelRadius-StickSink)*x
    rotate 90*x
    rotate 45*z
  }
  object {
    Wheel texture { T_Wood23 rotate 45*y translate WheelRadius/2 scale 2 }
  }
  translate (2-StickSink/2)*z
}
union {
  union {
    object { Stick3 pigment { color Blue } }
    object { Flag translate (3-StickSink)*x pigment { color Green } }
    translate (WheelRadius-StickSink)*x
    rotate 90*x
    rotate 135*z
  }
  object {
    Wheel texture { T_Wood23 rotate 45*y translate WheelRadius/2 scale 2 }
  }
  translate -(2-StickSink/2)*z
}
object { Stick4 translate -2*x rotate 90*y pigment { color <0.8,0,0.8> } }
plane {
  <0.0, 1.0, 0.0>, -WheelRadius
  pigment { color rgb <1,0.7,0.6> }
}
sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.7,0.8,1.0>]
      [0.7 rgb <0.1,0.2,1.0>]
    }
  }
}
//object { Stick2 pigment { color Red } }
//object { Stick5 pigment { color Green } }
//object { Wheel texture { T_Wood23 rotate 45*y translate WheelRadius/2 scale 2 } }
//object { Flag pigment { color Yellow } }
