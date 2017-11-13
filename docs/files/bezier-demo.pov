
/*
This file shows how to use the bezier.inc include file that can be
downloaded from the same webpage from which you got this file.
First, at the top of your file, with the other #include statements,
be sure to include bezier.inc, as shown here.  Of course, you'll
therefore need to ensure that bezier.inc is in the same folder as the
.pov file which is using it.  Also, bezier.inc depends on the file
vector-functions.inc, so be sure to have that one, too; it is also
available on the same website as this file.
*/

#include "bezier.inc"

/*
Now I will set up an empty scene with one camera and one light.
*/

camera {
	perspective 
	location < 0, 2, -5>
	angle 60
	look_at < 0.0, 0.5, 0>
}

light_source {
	< 3, 6, -5>
	rgb <1,1,1>
}

/*
There are four things you can do with bezier.inc, four commands defined
in that file.  I discuss each one here.

First, you can test out cubic Bezier curves by drawing them in space.
I say "test out" because you'll probably mostly be wanting to use
Bezier curves for paths of motion, so drawing one in a scene is usually
a quick test to see if an animation path you're planning looks correct.
You can do so by using two commands defined in the file.

#1  If you have four control points C1,C2,C3,C4 and want the
cubic Bezier curve based on them,
		(1-t)^3*C1 + 3t(1-t)^2*C2 + 3t^2(1-t)*C3 + t^3*C4,
then you can use the command
		CubicBezierCurve(C1,C2,C3,C4,radius)
to make a tube that goes along that path.  You should wrap this in an
object block and give it a color, as shown here.
*/

object {
  CubicBezierCurve(<-2,0,0>,<-2,2,0>,<0,2,0>,<0,0,0>)
  pigment { color rgb <1,1,1> }
}

/*
#2  If you don't want to go through the trouble of converting
data of the form P1,P2,v1,v2 (initial and final position and initial
and final velocities) into control points, then you can have POV do it
for you, using a different command.
		CubicBezierCurvePV(P1,v1,P2,v2,radius)
works just like CubicBezierCurve except the data is the positions and
velocities rather than the control points.  Here is an example.
*/

object {
  CubicBezierCurvePV(<0.5,0,1>,<0,4,0>,<2,0,1>,<0,-2,0>)
  pigment { color rgb <1,0,1> }
}

/*
So much for testing out paths.  How about animating objects?

#3  Many times, you want to translate an object to points along a
cubic Bezier curve.  So I have a command that creates for you the
long vector expression you should put after a translate command.

To get the expression in POV that means
		(1-t)^3*C1 + 3t(1-t)^2*C2 + 3t^2(1-t)*C3 + t^3*C4,
you should type
		CubicBezierFunction(C1,C2,C3,C4,t),
as in the following example.
*/

box {
  <-0.3,-0.3,-0.3>,<0.3,0.3,0.3>
  translate CubicBezierFunction(<-2,0,0>,<-2,2,0>,<0,2,0>,<0,0,0>,clock)
  pigment { color rgb <0,0,1> }
}

/*
#4  And just as there is a way to plot the curve from P1,v1,P2,v2 data,
there's a version of CubicBezierFunction that uses the same type of data.
If you prefer using P1,v1,P2,v2, then instead of CubicBezierFunction, use
the command CubicBezierFunctionPV, as shown here.
*/

box {
  <-0.3,-0.3,-0.3>,<0.3,0.3,0.3>
  translate CubicBezierFunctionPV(<0.5,0,1>,<0,4,0>,<2,0,1>,<0,-2,0>,clock)
  pigment { color rgb <0,1,1> }
}

