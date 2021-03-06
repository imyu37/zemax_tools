# F Number from chief ray merit function operand

Computes the F/# for a given field (Hx, Hy). It uses the angles of incidence relative to the chief ray to report an average F/# in the merit function.

F Numbers for extreme directions are also reported in memory locations 1-4.

## Usage

Copy the macro in your macro folder. 

In the merit function, call ZPLM and give argument 0 for the Mac#. You need to specify the field location Hx, Hy, entries Px, Py are not used.

In the image below, an average F/# is reported, also x+, x-, y+ and y- F/#s are displayed in the following rows.

![example](https://github.com/patogallardo/zemax_tools/blob/master/zemax_macros/FNumberFromChiefRay_MeritFunction/Capture.PNG)
