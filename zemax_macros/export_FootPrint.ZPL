!Sweeps over all configurations in current file and saves
!footprint plots
!
!Usage: Just run the script, the key variables here is VEC1
!This variable sets in which surface the footprint will
!be generated.
!
!Note that ray aiming should be turned off in order to 
!change the lyot stop to be the actual stop of the system.
!
!OPENANALYSISWINDOW "Foo"
!OPENANALYSISWINDOW type, settingsfilename
!PRINT "Just opened window ", WINL(), "."
PAUSE TIME, 500

!Here the surface numbers you want to evaluate
!Primary, secondary, L1, L2, Lyot, L3
VEC1 1, 11
VEC1 2, 14
VEC1 3, 26
VEC1 4,	44
VEC1 5, 49
VEC1 6, 56
VEC1 7, 58
VEC1 8, 63

N = NCON()

fnamebase$ = $PATHNAME() + "\Footprints\"
MAKEFOLDER fnamebase$
FORMAT "%#03i" LIT

FOR i, 1, 8, 1
	surface = VEC1(i)
	MODIFYSETTINGS "C:\Users\pag227\Documents\Zemax\Configs\FOO.CFG", FOO_SURFACE, surface, Foo
	OPENANALYSISWINDOW "Foo"
	WindowNumber = WINL()
	PAUSE THREADS
	FOR c, 1, N, 1
		PRINT "Configuration " + $STR(c) + " of " + $STR(N) + "SURFACE: " + $STR(surface)
		SETCONFIG c
			
		bmpfname$ = fnamebase$ + "Footprint" + "_surface_" + $STR(surface) + "_Conf_" + $STR(c)
		txtfname$ = fnamebase$ + "Footprint" + "_surface_" + $STR(surface) + "_Conf_" + $STR(c) + ".footprint" 
		UPDATE ALL
		PAUSE THREADS
		PAUSE TIME, 100
		EXPORTBMP WindowNumber, bmpfname$, 250
		GETTEXTFILE txtfname$, Foo
	NEXT
	CLOSEWINDOW WindowNumber
NEXT