
N_conf = NCON()
Nsamples = 150


FOR i,1,N_conf, 1
	FORMAT "%#02i" LIT
	SETCONFIG(i)
	outputdir$= $PATHNAME() + "\ExtremeAnglesForFN\ExtremeAngles" + $STR(i) ".txt"
	OUTPUT  outputdir$

	N = NSUR()
!Order is Hx, Hy, (-1,0), (1,0), (0,-1), (0,1)
	print "Hx Hy l m n l m n l m n l m n"
	
	FORMAT 16.8 EXP
	FOR j, -1, 1, (2/Nsamples)
		FOR k,-1, 1, (2/Nsamples)
			IF (j*j + k*k < 1.0)
    		    RAYTRACE j, k, -1, 0, 1
    			CX1 = RAYL(N)
				CY1 = RAYM(N)
				CZ1 = RAYN(N)
				
				RAYTRACE j, k, 1, 0, 1
    			CX2 = RAYL(N)
				CY2 = RAYM(N)
				CZ2 = RAYN(N)
				
				RAYTRACE j, k, 0, -1, 1
    			CX3 = RAYL(N)
				CY3 = RAYM(N)
				CZ3 = RAYN(N)
			
				RAYTRACE j, k, 0, 1, 1
    			CX4 = RAYL(N)
				CY4 = RAYM(N)
				CZ4 = RAYN(N)
				toPrint$ =  $STR(j) + $STR(k) + $STR(CX1) + $STR(CY1) + $STR(CZ1) + $STR(CX2) + $STR(CY2) + $STR(CZ2)+ $STR(CX3) + $STR(CY3) + $STR(CZ3)+ $STR(CX4) + $STR(CY4) + $STR(CZ4)
				print toPrint$
    		ENDIF
		NEXT
	NEXT
NEXT