#include "colors.inc"
#include "basic-shapes.inc" // this assumes the file is in the same folder

global_settings {
  assumed_gamma 1.0
}

// ----------------------------------------

camera {
  location  <0.0, 3.5, -14.0>
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <0.0, 0.5,  0.0>
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

// ----------------------------------------

plane {
  y, -1
  pigment { color rgb <0.7,0.5,0.3> }
}
            
union {

  // The letter N:

  // left column
  object {
    Pencil
    scale <0.5,4,0.5>
    translate -5*x+0.5*y
  }             
  // diagonal        
  object {
    Sword
    scale <1,4,1>  
    rotate -40*y
    rotate 20*z
    translate -4*x+0.5*y
  }               
  // right column
  object {
    Spring
    scale <0.5,4,0.5>
    translate -3*x+0.5*y
  }          
  
  // The first letter C:
  
  // top star
  object {
    Star
    translate 2*y-0.5*x
  }
  // gumdrop one step that star's right
  object {
    Gumdrop
    translate x+2*y-0.5*x
  }
  // left gumdrop
  object {
    Gumdrop
    translate -x+y-0.5*x
  }
  // star beneath that gumdrop
  object {
    Star
    translate -x-0.5*x
  }
  // bottom gumdrop
  object {
    Gumdrop
    translate -y-0.5*x
  }
  // star one step to that gumdrop's right
  object {
    Star
    translate x-y-0.5*x
  }
  
  // The second letter C:
  
  // each die proceeds in counterclockwise order around the C,
  // starting at the top right, using rotations to place them
  object {
    Die      
    rotate <80,20,30>
    translate 1.5*x
    rotate 60*z
    translate 4*x+0.5*y
  }
  object {
    Die      
    rotate <30,100,20>
    translate 1.5*x
    rotate 120*z
    translate 4*x+0.5*y
  }
  object {
    Die      
    rotate <4,60,100>
    translate 1.5*x
    rotate 180*z
    translate 4*x+0.5*y
  }
  object {
    Die       
    rotate <0,10,90>
    translate 1.5*x
    rotate 240*z
    translate 4*x+0.5*y
  }
  object {
    Die       
    rotate <3,30,300>
    translate 1.5*x
    rotate 300*z
    translate 4*x+0.5*y
  }
  translate 0.5*y
}
