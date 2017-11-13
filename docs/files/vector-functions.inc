
#declare plotcurve_radius = 0.1;
#declare plotcurve_step = 0.01;
#macro plotcurve ( xp, yp, zp, a, b )
	union {
		#declare counter = a;
		#while ( counter < b )
			#declare next = min( counter+plotcurve_step, b );
			#declare cpt = <xp(counter),yp(counter),zp(counter)>;
			#declare npt = <xp(next),yp(next),zp(next)>;
			sphere { cpt,plotcurve_radius }
			#if ( vlength(cpt-npt)>plotcurve_radius/10 )
  			cylinder { cpt,npt,plotcurve_radius }
			#end
			#declare counter = next;
		#end
		sphere { npt,plotcurve_radius }
		pigment { color <1,1,1> }
	}
#end

