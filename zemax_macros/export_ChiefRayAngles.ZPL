
N_conf = NCON()
Nsamples = 150


FOR i,1,N_conf, 1
	FORMAT "%#02i" LIT
	SETCONFIG(i)
	outputdir$= $PATHNAME() + "\ChiefRay\ChiefRayCosines_Conf" + $STR(i) ".txt"
	OUTPUT  outputdir$

	N = NSUR()
	print "Hx Hy l m n"
	
	FORMAT 16.8 EXP
	FOR j, -1, 1, (2/Nsamples)
		FOR k,-1, 1, (2/Nsamples)
			IF (j*j + k*k < 1.0)
    		    RAYTRACE j, k, 0, 0, 1
    			CX = RAYL(N)
				CY = RAYM(N)
				CZ = RAYN(N)
				toPrint$ =  $STR(j) + $STR(k) + $STR(CX) + $STR(CY) + $STR(CZ)
				print toPrint$
    		ENDIF
		NEXT
	NEXT
NEXT