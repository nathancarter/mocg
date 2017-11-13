
This page contains links to all resources mentioned in POV Break G of the
textbook.

## Suggested code structure

The following code appears in the textbook, but is included here as well for
easier copying and pasting into your own .pov scene files.

```pov
// Declare the 16 points of the control net.
￼￼￼￼￼￼￼#declare C11 = <0,0,0>;
#declare C12 = <0,0,1>;
#declare C13 = <0,0,2>;
#declare C14 = <0,0,3>;
#declare C21 = <1,0,0>;
#declare C22 = <1,0,1>;
#declare C23 = <1,0,2>;
#declare C24 = <1,0,3>;
#declare C31 = <2,0,0>;
#declare C32 = <2,0,1>;
#declare C33 = <2,0,2>;
#declare C34 = <2,0,3>;
#declare C41 = <3,0,0>;
#declare C42 = <3,0,1>;
#declare C43 = <3,0,2>;
#declare C44 = <3,0,3>;

// Use them to create the surface.
bicubic_patch {
  type 1 flatness 0 u_steps 5 v_steps 5
  C11 C12 C13 C14
  C21 C22 C23 C24
  C31 C32 C33 C34
  C41 C42 C43 C44
  pigment { color Blue }
};

// Use them to show the control net.
union {
  sphere { C11,0.1 }  sphere { C12,0.1 }  sphere { C13,0.1 }  sphere { C14,0.1 }
  sphere { C21,0.1 }  sphere { C22,0.1 }  sphere { C23,0.1 }  sphere { C24,0.1 }
  sphere { C31,0.1 }  sphere { C32,0.1 }  sphere { C33,0.1 }  sphere { C34,0.1 }
  sphere { C41,0.1 }  sphere { C42,0.1 }  sphere { C43,0.1 }  sphere { C44,0.1 }
  cylinder { C11,C12,0.03 }  cylinder { C12,C13,0.03 }  cylinder { C13,C14,0.03 }
  cylinder { C21,C22,0.03 }  cylinder { C22,C23,0.03 }  cylinder { C23,C24,0.03 }
  cylinder { C31,C32,0.03 }  cylinder { C32,C33,0.03 }  cylinder { C33,C34,0.03 }
  cylinder { C41,C42,0.03 }  cylinder { C42,C43,0.03 }  cylinder { C43,C44,0.03 }
  cylinder { C11,C21,0.03 }  cylinder { C21,C31,0.03 }  cylinder { C31,C41,0.03 }
  cylinder { C12,C22,0.03 }  cylinder { C22,C32,0.03 }  cylinder { C32,C42,0.03 }
  cylinder { C13,C23,0.03 }  cylinder { C23,C33,0.03 }  cylinder { C33,C43,0.03 }
  cylinder { C14,C24,0.03 }  cylinder { C24,C34,0.03 }  cylinder { C34,C44,0.03 }
  pigment { color Green }
}
```

## Animations

<iframe width="560" height="315" src="https://www.youtube.com/embed/C6tpHJoUPT4" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/0RT_ofNtu-Q" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/NzfbFcXJJdg" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/4omZzrZexDM" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/rKlEtXPs7Cw" frameborder="0" allowfullscreen></iframe>
