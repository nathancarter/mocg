
// This file comes with no internal documentation.
// See POV Break D of the textbook Mathematics of Computer Graphics for detailed documentation.
// Nathan Carter, April 2013

#declare StickRadius = 1/6;
#declare SlitHeight = 0.07;
#declare StickSink = 1/2;
#macro Stick ( len )
  difference {
    cylinder { <0,0,0>,<len,0,0>,StickRadius }
    box { <-1,-SlitHeight/2,-2*StickRadius>,<StickSink,SlitHeight/2,2*StickRadius> }
    box { <len+1,-SlitHeight/2,-2*StickRadius>,<len-StickSink,SlitHeight/2,2*StickRadius> }
    normal { bumps 0.2 scale <0.1,0.01,0.01> }
  }
#end
#declare Stick2 = Stick(2);
#declare Stick3 = Stick(3);
#declare Stick4 = Stick(4);
#declare Stick5 = Stick(5);
#declare Stick6 = Stick(6);
#declare Stick7 = Stick(7);
#declare Stick8 = Stick(8);
#declare Stick9 = Stick(9);
#declare Stick10 = Stick(10);
#declare Stick11 = Stick(11);
#declare Stick12 = Stick(12);
#declare WheelHeight = StickSink;
#declare WheelRadius = 1;
#declare GrooveRadius = 1/20;
#declare Wheel = difference {
	cylinder { <0,0,-WheelHeight/2>,<0,0,WheelHeight/2>,WheelRadius }
	torus { WheelRadius+GrooveRadius/3,GrooveRadius rotate 90*x }
	#declare counter = 0;
	#while ( counter < 360 )
		cylinder { <WheelRadius-StickSink,0,0>,<2*WheelRadius,0,0>,StickRadius rotate counter*z }
	  #declare counter = counter + 45;
	#end
	cylinder { <0,0,-WheelHeight>,<0,0,WheelHeight>,StickRadius }
}
#declare FlagRight = <1,0,2>;
#declare FlagLeft = <-1,0,2>;
#declare FlagHeight = SlitHeight;
#declare FlagCurve = StickSink;
#declare Flag = union {
	sphere { <0,0,0>,FlagCurve/2 }	sphere { FlagRight,FlagCurve/2 }  sphere { FlagLeft,FlagCurve/2 }
	cylinder { <0,0,0>,FlagRight,FlagCurve/2 }
	cylinder { FlagRight,FlagLeft,FlagCurve/2 }
	cylinder { FlagLeft,<0,0,0>,FlagCurve/2 }
	polygon { 4,<0,0>,<FlagRight.x,FlagRight.z>,<FlagLeft.x,FlagLeft.z>,<0,0>
		rotate 90*x translate FlagCurve/2*y }
	polygon { 4,<0,0>,<FlagRight.x,FlagRight.z>,<FlagLeft.x,FlagLeft.z>,<0,0>
	  rotate 90*x translate -FlagCurve/2*y }
	scale <1,FlagHeight/FlagCurve,1>
	rotate 90*y
	translate StickSink/2*x
}
