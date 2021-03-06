!Sweeps over all configurations in current file and wavelengths in 
! [1000, 2000, 3000, 7000] um and export the image quality
!data and plots.
!configuration of this analysis is stored in C:\Users\pag227\Documents\Zemax\Configs\RFM.cfg
!you need to change stuff there if you want to increase resolution.
!

PAUSE TIME, 500
OPENANALYSISWINDOW "Rfm"
WindowNumber = WINL()
PAUSE THREADS

!sets the wavelength at which we want imgqual only for the center tube conf 1
WAVELENGTHCENTER = 350 

N = NCON()
FORMAT "%#03i" LIT
VEC1 1, 350
VEC1 2, 750
VEC1 3, 1100
VEC1 4, 2000
VEC1 5, 3000
VEC1 6, 7000

fnamebase$ = $PATHNAME() + "\ImgQual\"
MAKEFOLDER fnamebase$

!wavelength
FOR i, 6, 6, 1
	w = VEC1(i)
	SETSYSTEMPROPERTY 202, 1, w
	FOR c, 1, N, 1
		IF ((w==WAVELENGTHCENTER) & (c>1))
			PRINT "Skipping Conf " +$STR(c) + " wavelength " +$STR(w)
		ELSE			
			PRINT "Configuration " + $STR(c) + " of " + $STR(N) + ", wavelength " + $STR(w) + "um"
			SETCONFIG c
			bmpfname$ = fnamebase$ + "imgQualConf_" + $STR(c) + "_wavelength_" + $STR(w)
			txtfname$ = fnamebase$ + "imgQualConf_" + $STR(c) + "_wavelength_" + $STR(w) + ".txt"
			UPDATE ALL
			PAUSE TIME, 250
	
			EXPORTBMP WindowNumber, bmpfname$
			GETTEXTFILE txtfname$, Rfm, "Phils_19_tube_design_srd_wedgec.CFG", 1
		ENDIF
	NEXT
NEXT