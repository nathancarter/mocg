//Persistence of Vision Ray Tracer Scene Description File

#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "stones.inc"

#macro HSV2RGB(H,S,V)
    #if (S=0)
        <V,V,V>
    #else
        #local varh=H*6;
        #if (varh=6)
            #local varh=0;
        #end
        #local vari=floor(varh);
        #local var1=V*(1-S);
        #local var2=V*(1-S*(varh-vari));
        #local var3=V*(1-S*(1-(varh-vari)));
        #if (vari=0)
            <V,var3,var1>
        #else
            #if (vari=1)
                <var2,V,var1>
            #else
                #if (vari=2)
                    <var1,V,var3>
                #else
                    #if (vari=3)
                        <var1,var2,V>
                    #else
                        #if (vari=4)
                            <var3,var1,V>
                        #else
                            <V,var1,var2>
                        #end
                    #end
                #end
            #end
        #end
    #end
#end

#declare num_props = 8;
#declare SURFACE_U_STEPS = 41;
#declare SURFACE_V_STEPS = 11;
#declare prop_fluff = 3; // 1.75;
#macro SURFACE_FUNCTION (U,V)
	#declare my_theta = 2*pi*U;//pow(U,0.35);
	#declare my_theta2 = 2*pi*((1-prop_fluff)/2+prop_fluff*U);
	#declare my_height = sin(2*pi*(0.25+U/2));
	#declare my_radius = V*sin(my_theta/2);
	#declare pointy = 1/6;
	#if ( U < pointy )
		#declare my_radius = V*U/pointy;
	#else
		#declare my_radius = V*(1-U)/(1-pointy);
	#end
	<my_radius*cos(my_theta2/num_props),my_radius*sin(my_theta2/num_props),my_height>
#end
#macro NICE_TRIANGLE(P1,P2,P3)
	#if (((P1.x=P2.x) * (P1.y=P2.y) * (P1.z=P2.z)) + ((P2.x=P3.x) * (P2.y=P3.y) * (P2.z=P3.z)))
		// nothing
	#else
		triangle { P1,P2,P3 }
	#end
#end
#macro QUAD(P1,P2,P3,P4) // points listed LL,LR,UL,UR order, not in CW or CCW order
	NICE_TRIANGLE(P1,P2,P3)
	NICE_TRIANGLE(P2,P3,P4)
#end
#macro MAKE_SURFACE ()
	#local U_STEP = 1 / SURFACE_U_STEPS;
	#local V_STEP = 1 / SURFACE_V_STEPS;
	union {
		#local U_COUNTER = 0;
		#while (U_COUNTER < 1 - U_STEP/2)
			#local NEXT_U = U_COUNTER + U_STEP;
			#local V_COUNTER = 0;
			#while (V_COUNTER < 1 - V_STEP/2)
				#local NEXT_V = V_COUNTER + V_STEP;
				#local P1 = SURFACE_FUNCTION(U_COUNTER,V_COUNTER);
				#local P2 = SURFACE_FUNCTION(NEXT_U,V_COUNTER);
				#local P3 = SURFACE_FUNCTION(U_COUNTER,NEXT_V);
				#local P4 = SURFACE_FUNCTION(NEXT_U,NEXT_V);
				QUAD(P1,P2,P3,P4)
				#local V_COUNTER = NEXT_V;
			#end
			#local U_COUNTER = NEXT_U;
		#end
	}
#end

#declare Ball = sphere {
	<0.0, 0.0, 0.0>, 0.5
	pigment { color Red }
}
#declare Pencil = union {
	cylinder { <0,0.35,0>,<0,0.5,0>,0.45 pigment { color rgb <1,0.3,0.3> } }
	cylinder { <0,0.35,0>,<0,0.4,0>,0.5 pigment { color Silver } }
	intersection {
		union {
			#declare theta=pi/6;
			box { <-cos(theta),-1,-sin(theta)>,<cos(theta),1,sin(theta)> }
			box { <-cos(theta),-1,-sin(theta)>,<cos(theta),1,sin(theta)>
			      rotate 60*y }
			box { <-cos(theta),-1,-sin(theta)>,<cos(theta),1,sin(theta)>
			      rotate 120*y }
			scale 0.52
		}
		cone { <0,-0.5,0>,0,<0,0.35,0>,2 }
		cylinder { <0,-0.5,0>,<0,0.5,0>,0.5 }
		pigment { color Yellow }
	}
	intersection {
	  cone { <0,-0.5,0>,0,<0,0.35,0>,2 }
	  cylinder { <0,-0.5,0>,<0,0.5,0>,0.45 }
	  pigment { color Orange }
	  translate -0.001*y
	}
	intersection {
	  cone { <0,-0.5,0>,0,<0,0.35,0>,2 }
	  cylinder { <0,-0.5,0>,<0,0.5,0>,0.2 }
	  pigment { color Black }
	  translate -0.002*y
	}
};
#declare Box = box {
	<-0.5,-0.5,-0.5>,<0.5,0.5,0.5>
	pigment { color Brown }
};
#declare Can = union {
	cylinder { <0,-0.5,0>,<0,0.5,0>,0.5 }
	torus { 0.5, 0.03 translate  0.5*y }
	torus { 0.5, 0.03 translate -0.5*y }
	torus { 0.5, 0.02 translate  0.1*y }
	torus { 0.5, 0.02 translate -0.1*y }
	pigment { P_Silver3 }
	finish { F_MetalB }
};
#declare Book = union {
	#declare bsquish = 0.2;
	#declare bth = 0.1;
	union {
		intersection {
			union {
				superellipsoid { <0.3,0.3>  scale <0.5,0.5,bth/2>  translate -(1-bth)/2*z }
				superellipsoid { <0.3,0.3>  scale <0.5,0.5,bth/2>  translate  (1-bth)/2*z }
			}
			box { <-0.5+bsquish,-1,-1>,<1,1,1> }
		}
		difference {
			union {
				cylinder { <0,-0.5+bth,0>,<0,0.5-bth,0>,0.5 }
				torus { 0.5-bth/2, bth/2  translate -(1-bth)/2*y }
				torus { 0.5-bth/2, bth/2  translate  (1-bth)/2*y }
			}
			cylinder { <0,-0.6,0>,<0,0.6,0>,0.5-bth }
			box { <0,-1,-1>,<1,1,1> }
			scale <2*bsquish,1,1>
			translate <-0.5+bsquish,0,0>
		}
		pigment { color Green }
	}
	difference {
		box { <-0.5+bsquish,-0.5+bth/2,-0.5+bth/2>,<0.5-bth/2,0.5-bth/2,0.5-bth/2> }
		cylinder { <0,-0.5,0>,<0,0.5,0>,0.5
		           scale <2*bsquish,1,1>  translate <-0.6+bsquish,0,0> }
		texture { T_Wood3  rotate 90*y  scale <1,0.1,1> }
	}
};
#declare Glass = difference {
	cylinder { <0,-0.5,0>,<0,0.5,0>,0.5 }
	#declare sides = 8;
	#declare theta = pi/sides;
	#warning concat("Sin=",str(sin(theta),0,5))
	#declare counter = 0;
	#while ( counter < sides )
	  box {
	  	<-0.1,-0.4,-sin(theta)*0.45>,<cos(theta)*0.45,0.6,sin(theta)*0.45>
	  	rotate 360/pi*theta*counter*y
	  }
    #declare counter = counter + 1;		
	#end
	pigment { rgbt <1,1,1,0.3> }
	finish { F_MetalB }
};
#declare Gumdrop = union {
	merge {
		#declare gdskew = 0.8;
		#declare gdctr = 0.5-gdskew;
		intersection {
			sphere { <0,0,0>,0.5
							 scale <1,2*gdskew,1>  translate gdctr*y }
			box { <-1,gdctr,-1>,<1,1,1> }
		}
		intersection {
			sphere { <0,0,0>,0.5  scale <1,2*(1-gdskew),1>  translate gdctr*y }
			box { <-1,-1,-1>,<1,gdctr,1> }
		}
    pigment { color rgbt <0.3,0.3,1,0.5,0.5> }
	}
	#declare height = 0.4;
	#while ( height > 0.2 )
		#declare ang = 0;
		#while ( ang < 2*pi )
			#declare rad = sqrt(0.25-height*height);
			#declare acy = gdctr+2*gdskew*height;
			box { <-1,-1,-1>,<1,1,1>
			      scale 0.03
			      rotate <77*ang,77*ang,77*ang>
			      translate <cos(ang+8*height)*rad,acy,sin(ang+8*height)*rad>
			      pigment { color rgbt <1,1,0.5,0.5> } }
			#declare ang = ang + pi*2/5;
		#end
		#declare height = height - 0.1;
	#end
};
#declare Pinwheel = union {
	#declare squish = 0.3;
	#declare endsize = 0.3;
	#declare prop = union {	MAKE_SURFACE() };
  #declare counter = 0;
  #while ( counter < num_props )
    object {
      prop
      rotate 360*counter/num_props*z
      pigment { color rgb HSV2RGB(counter/num_props,1,1) }
    }
  	#declare counter = counter + 1;
  #end
  union {
		cylinder { <0,0,-1>,<0,0,1+endsize>,0.2 }
		pigment { color rgb 0.8 }
  }
  scale <1,1,squish>
  no_shadow
  rotate 7*360/8*z
  scale 0.5
};
#declare Bucket = union {
	difference {
		cone { <0.0, -0.5, 0.0>, 0.4,  <0.0, 0.5, 0.0>, 0.5 }
		cone { <0.0, -0.4, 0.0>, 0.4,  <0.0, 0.7, 0.0>, 0.5 }
		texture { T_Wood19 rotate 65*x scale 0.7 }
	}
	union {
		difference {
			cylinder { <0,0.1,0>,<0,0.2,0>,0.48 }
			cylinder { <0,0.0,0>,<0,0.3,0>,0.45 }
		}
		difference {
			cylinder { <0,-0.1,0>,<0,-0.2,0>,0.45 }
			cylinder { <0,-0.0,0>,<0,-0.3,0>,0.42 }
		}
		pigment { P_Brass1 }
		finish { F_MetalA }
	}
};
#declare Ring = union {
	torus {
		0.4, 0.03
		rotate 90*x rotate 25*y translate -0.05*y
		pigment { P_Gold1 }
		finish { F_MetalC }
	}
	union {
		box {
			<0,0,0>,0.2*<1,1,1>
			rotate 45*z rotate -45*x translate 0.32*y
		}
		box {
			<0,0,0>,0.2*<1,1,1>
			rotate 45*z rotate -45*x rotate 45*y translate 0.32*y
		}
		pigment { color rgbt <1,0,0,0.5> }
		finish { F_MetalC }
	}
};
#declare Heart = merge {
	#declare hrr = 0.1;
	#declare hrR = (1-2*hrr)/3;
	box { <hrr+hrR,hrr,-hrr>,<1-hrr,1-hrr-hrR,hrr> }
	cylinder { <hrr+hrR,hrr+hrR,-hrr>,<hrr+hrR,hrr+hrR,hrr>,hrR }
	cylinder { <1-hrr-hrR,1-hrr-hrR,-hrr>,<1-hrr-hrR,1-hrr-hrR,hrr>,hrR }
	cylinder { <hrr+hrR,hrr,0>,<1-hrr,hrr,0>,hrr }
	cylinder { <1-hrr,1-hrr-hrR,0>,<1-hrr,hrr,0>,hrr }
	sphere { <1-hrr,hrr,0>,hrr }
	torus { hrR,hrr  rotate 90*x  translate <hrr+hrR,hrr+hrR> }
	torus { hrR,hrr  rotate 90*x  translate <1-hrr-hrR,1-hrr-hrR> }
	translate <-0.57,-0.43,0>
	rotate -45*z
	scale 0.88
	pigment { color Red }
};
#declare Sword = union {
	#declare hiltpart = 0.15;
	#declare hiltbits = 4;
	#declare hiltr = 0.15;
	#declare blang = 5;
	#declare blwid = 0.05;
	#declare hiltmeet = 0.5-hiltpart-hiltr/2;
	intersection {
		union {
			#declare counter = 0;
			#while ( counter < hiltbits )
				sphere { <0,0.5-hiltpart+hiltpart*(counter/hiltbits),0>,hiltr }
				#declare counter = counter + 1;
			#end
			cylinder { <0,0.5-hiltpart+hiltpart*((hiltbits-1)/hiltbits)-0.01,0>,
			           <0,0.5-hiltpart+hiltpart*((hiltbits-1)/hiltbits)+0.01,0>,1.7*hiltr }
		}
		box { <-1,hiltmeet,-1>,<1,1,1> }
		pigment { P_Brass1 } finish { F_MetalC }
	}
	box { <-4*hiltr,hiltmeet,-hiltr>,<4*hiltr,hiltmeet+hiltr/4,hiltr>
		    pigment { color rgb <1,1,1>*0.1 } finish { F_MetalC } }
	difference {
		box { <-2*hiltr,hiltmeet,-hiltr>,<2*hiltr,-0.5,hiltr> }
		box { <-1,-1,0>,<1,1,1>  rotate       blang*y  translate  blwid*z }
		box { <-1,-1,0>,<1,1,1>  rotate      -blang*y  translate  blwid*z }
		box { <-1,-1,0>,<1,1,1>  rotate (180+blang)*y  translate -blwid*z }
		box { <-1,-1,0>,<1,1,1>  rotate (180-blang)*y  translate -blwid*z }
		box { <-1,-1,-1>,<1,0,1>  rotate  30*z  translate -0.5*y }
		box { <-1,-1,-1>,<1,0,1>  rotate -30*z  translate -0.5*y }
		box { <-1,-1,-1>,<1,0,1>  rotate  80*x  translate -0.5*y }
		box { <-1,-1,-1>,<1,0,1>  rotate -80*x  translate -0.5*y }
		pigment { P_Chrome1 } finish { F_MetalE }
	}
};
#declare Die = union {
	#declare dr = 0.2;
	#declare ds = 0.5;
	#macro SPH ( pt )
		//difference { sphere { pt,dr } sphere { pt,0.7*dr } }
		sphere { pt, dr }
	#end
	box { <-1,-1,-1>,<1,1,1>  scale 0.48  pigment { color rgbt <0,0,1,0.5> } }
	intersection {
		union {
			// 1
			SPH( <0,0,1> )
			// 6
			SPH( <ds,ds,-1> ) SPH( <ds,0,-1> ) SPH( <ds,-ds,-1> )
			SPH( <-ds,ds,-1> ) SPH( <-ds,0,-1> ) SPH( <-ds,-ds,-1> )
			// 2
			SPH( <ds,1,ds> ) SPH( <-ds,1,-ds> )
			// 5
			SPH( <ds,-1,ds> ) SPH( <ds,-1,-ds> ) SPH( <0,-1,0> )
			SPH( <-ds,-1,ds> ) SPH( <-ds,-1,-ds> )
			// 3
			SPH( <1,ds,ds> ) SPH( <1,0,0> ) SPH( <1,-ds,-ds> )
			// 4
			SPH( <-1,ds,ds> ) SPH( <-1,ds,-ds> )
			SPH( <-1,-ds,ds> ) SPH( <-1,-ds,-ds> )
			scale 0.498
		}
		box { <-1,-1,-1>,<1,1,1> scale 0.5 }
		pigment { color White }
	}
};
#declare Spring = union {
	#declare twists = 3;
	#declare thrg = twists*2*pi;
	#declare delta = 0.1;
	#declare theta = -thrg;
	#while ( theta < thrg )
		sphere { <0.5*cos(theta),(thrg-theta)/(2*thrg)-0.5,0.5*sin(theta)>,0.05 }
		cylinder { <0.5*cos(theta),(thrg-theta)/(2*thrg)-0.5,0.5*sin(theta)>,
		           <0.5*cos(theta+delta),(thrg-theta-delta)/(2*thrg)-0.5,0.5*sin(theta+delta)>,
		           0.05 }
		#declare theta = theta + delta;
	#end
	sphere { <0.5*cos(thrg),0.5,0.5*sin(thrg)>,0.05 }
	pigment { P_Chrome1 } finish { F_MetalB }
};
#declare Star = prism {	linear_spline	linear_sweep	-0.2, 0.2, 11	<0.95106, 0.30902>,	<0.29389, 0.40451>,	<-0.00000, 1.00000>,	<-0.29389, 0.40451>,	<-0.95106, 0.30902>,	<-0.47553, -0.15451>,	<-0.58779, -0.80902>,	<0.00000, -0.50000>,	<0.58779, -0.80902>,	<0.47553, -0.15451>,	<0.95106, 0.30902>	sturm
	pigment { color Yellow }
	rotate -90*x
	translate -0.05*y
	scale 0.55};

