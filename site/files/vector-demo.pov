
/*
 *  This scene file demonstrates how to use vector-functions.inc.
 *
 *  1. Ensure that vector-functions.inc is in the same folder as your .pov scene file.
 *  2. Ensure that your .pov scene file contains the #include line for vector-functions.inc,
 *     as shown just a few lines below.
 *  3. Include some use of the plotcurve macro in your scene.
 *     (The one in this file is at the very end.)
 *  4. Your scene should render correctly.
 *  5. To customize the color, thickness, or accuracy of the curve, see the comments at the end of this file.
 *
 */

#version 3.6;

#include "colors.inc" 
#include "vector-functions.inc"     // <------ THIS is the #include line you need.

global_settings {
  assumed_gamma 1.0
}

camera {
  location  <0.0, 5, -14.0>
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
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
  translate <-30, 30, -30>
}

plane {
  y, -1
  pigment { color rgb <0.7,0.5,0.3> }
}


// ----------------------------------------


/*
 *
 *  This example graphs the function f(t)=<sin t,cos t,0.1t>:
 *
 */

plotcurve(
  function (T) { sin(T) }, // x component of vector function
  function (T) { cos(T) }, // y component of vector function
  function (T) { 0.1*T },  // z component of vector function
  0,         // initial value of parameter T
  10*3.14159 // final value of parameter T
  )
  

// ----------------------------------------


/*
 *  To customize the thickness of the curve, place a line like the following before the use of plotcurve:
 *
 *  #declare plotcurve_radius = 0.05;
 *
 *  (The default thickness is 0.1.)
 *
 *
 *  The curve is created by computing the value of the vector function at many steps along its path,
 *  and connecting those tiny steps with spheres and cylinders.  Thus it is not perfectly smooth,
 *  but usually its little steps are invisible to the naked eye.  In some circumstances, however, this is not so.
 *  To increase or decrease the size of those steps (in terms of the parameter T), place a line like the
 *  following before the use of plotcurve:
 *
 *  #declare plotcurve_step = 0.05;
 *
 *  (The default step size is 0.01.)
 *
 *
 *  To modify the created object in any way (such as to give it a color, or translate/rotate/scale it)
 *  wrap the use of plotcurve in an object block, as follows.
 *
 *  object {
 *    plotcurve(
 *      ... )
 *    pigment { color Red }
 *    scale <1,1,5>
 *  }
 *
 */