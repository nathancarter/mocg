
/*
A detailed description of how to use the commands in this file,
together with examples, is included in the file bezier-demo.pov.
You can get that file from the same place on the wiki from which
you got this file.
*/

#include "vector-functions.inc"

#macro CubicBezierCurve ( C1, C2, C3, C4 )
  #local C1x = C1.x;
  #local C1y = C1.y;
  #local C1z = C1.z;
  #local C2x = C2.x;
  #local C2y = C2.y;
  #local C2z = C2.z;
  #local C3x = C3.x;
  #local C3y = C3.y;
  #local C3z = C3.z;
  #local C4x = C4.x;
  #local C4y = C4.y;
  #local C4z = C4.z;
  plotcurve (
	  function ( r ) { pow(1-r,3)*C1x + 3*r*pow(1-r,2)*C2x
	                 + 3*(1-r)*pow(r,2)*C3x + pow(r,3)*C4x },
	  function ( r ) { pow(1-r,3)*C1y + 3*r*pow(1-r,2)*C2y
	                 + 3*(1-r)*pow(r,2)*C3y + pow(r,3)*C4y },
	  function ( r ) { pow(1-r,3)*C1z + 3*r*pow(1-r,2)*C2z
	                 + 3*(1-r)*pow(r,2)*C3z + pow(r,3)*C4z },
    0, 1 )
#end

#macro CubicBezierFunction ( C1, C2, C3, C4, tvalue )
  ( pow(1-tvalue,3)*C1 + 3*tvalue*pow(1-tvalue,2)*C2
  + 3*pow(tvalue,2)*(1-tvalue)*C3 + pow(tvalue,3)*C4 )
#end

#macro CubicBezierCurvePV ( P1, v1, P2, v2 )
  CubicBezierCurve( P1, P1+v1/3, P2-v2/3, P2 )
#end

#macro CubicBezierFunctionPV ( P1, v1, P2, v2, tvalue )
  CubicBezierFunction( P1, P1+v1/3, P2-v2/3, P2, tvalue )
#end
