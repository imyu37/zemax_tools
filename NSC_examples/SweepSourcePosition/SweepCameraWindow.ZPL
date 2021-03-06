! Sweeps the camera with a crosNs going throught the center.
!Note that in order to run it, you need two graphical windows set up, one with a 
!3d view and another with the polar plot pointing to the correspondig ray database
!where the raytrace is saved

X0 = 0
Y0 = 0
numsteps = 3
D = 10
Nrays = 1e4
SourceN = 1
SETNSCPARAMETER 1, SourceN, 2, Nrays

fnamebase$ = $PATHNAME() + "\sweepResults\"
MAKEFOLDER fnamebase$

img = 1
FOR x, X0-D, X0+D, 2*D/(numsteps-1)
	FOR y, Y0-D, Y0+D, 2*D/(numsteps-1)
		FORMAT "%#03i" LIT
		PRINT "iteration " + $STR(img) + " of " + $STR(numsteps * numsteps)
		fname1$ = fnamebase$ +"3dView_img_"     + $STR(img) + "_X" + $STR(x-X0) + "_Y" + $STR(y-Y0)
		fname2$ = fnamebase$ +"SidelobeMap_img_"+ $STR(img) + "_X" + $STR(x-X0) + "_Y" + $STR(y-Y0)
		fname3$ = fnamebase$ +"SidelobeData_Data_"+ $STR(img) + "_X" + $STR(x-X0) + "_Y" + $STR(y-Y0) + ".txt"
		SETNSCPOSITION 1, 1, 1, x
		SETNSCPOSITION 1, 1, 2, y
		NSTR 1, 0, 0, 0, 0, 1, 0, 1, "WindowSweep.ZRD"
		UPDATE ALL
		PAUSE TIME, 2000
		EXPORTBMP 1, fname1$
		EXPORTBMP 2, fname2$
		GETTEXTFILE fname3$ , DVR, WindowSweep.CFG, 1
		img = img + 1
	NEXT
NEXT