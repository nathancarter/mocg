---
id: 121
title: POV Break G Resources
date: 2013-04-17T14:17:53+00:00
author: monks
layout: page
guid: http://mocg.wordpress.com/?page_id=121
---
<p style="text-align:right;">
  <a title="POV Break F Resources" href="http://mocg.wordpress.com/pov-break-f-resources/">< Back to POV Break F Resources</a>
</p>

This page contains links to all resources mentioned in POV Break G of the textbook.

## Suggested code structure

The following code appears in the textbook, but is included here as well for easier copying and pasting into your own .pov scene files.

<pre>// Declare the 16 points of the control net.
￼￼￼￼￼￼￼#declare C11 = &lt;0,0,0&gt;;
#declare C12 = &lt;0,0,1&gt;;
#declare C13 = &lt;0,0,2&gt;;
#declare C14 = &lt;0,0,3&gt;;
#declare C21 = &lt;1,0,0&gt;;
#declare C22 = &lt;1,0,1&gt;;
#declare C23 = &lt;1,0,2&gt;;
#declare C24 = &lt;1,0,3&gt;;
#declare C31 = &lt;2,0,0&gt;;
#declare C32 = &lt;2,0,1&gt;;
#declare C33 = &lt;2,0,2&gt;;
#declare C34 = &lt;2,0,3&gt;;
#declare C41 = &lt;3,0,0&gt;;
#declare C42 = &lt;3,0,1&gt;;
#declare C43 = &lt;3,0,2&gt;;
#declare C44 = &lt;3,0,3&gt;;

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
}</pre>

## Animations

\[youtube=http://www.youtube.com/watch?v=C6tpHJoUPT4\] \[youtube=http://www.youtube.com/watch?v=0RT_ofNtu-Q\] \[youtube=http://www.youtube.com/watch?v=NzfbFcXJJdg\] \[youtube=http://www.youtube.com/watch?v=4omZzrZexDM\][youtube=http://www.youtube.com/watch?v=rKlEtXPs7Cw]