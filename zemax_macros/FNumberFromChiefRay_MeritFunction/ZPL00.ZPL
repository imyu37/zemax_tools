# Return F/# computed from chief ray for a given field.
#Receives: Hx, Hy
#DO NOT USE: Px, Py, they are returned in memory address:
# 0,1,2,3,4 as center, xp, xm, yp, ym

PI = 2*ACOS(0)

hx = PVHX()
hy = PVHY()
#px = PVPX()
#py = PVPY()

w = pwav()
n = NSUR()

#chief ray
RAYTRACE hx, hy, 0, 0, w
cl=rayl(n)
cm=raym(n)
cn=rayn(n)

#extreme pupil position x
RAYTRACE hx, hy, 1, 0, w
rl=rayl(n)
rm=raym(n)
rn=rayn(n)

cos_angle_xp = cl * rl + cm * rm + cn*rn

RAYTRACE hx, hy, -1, 0, w
rl=rayl(n)
rm=raym(n)
rn=rayn(n)

cos_angle_xm = cl * rl + cm * rm + cn*rn

RAYTRACE hx, hy, 0, 1, w
rl=rayl(n)
rm=raym(n)
rn=rayn(n)

cos_angle_yp = cl * rl + cm * rm + cn*rn

RAYTRACE hx, hy, 0, -1, w
rl=rayl(n)
rm=raym(n)
rn=rayn(n)

cos_angle_ym = cl * rl + cm * rm + cn*rn


FNUMBER_XP = 1/(2 * TANG(ACOS(cos_angle_xp)))
FNUMBER_XM = 1/(2 * TANG(ACOS(cos_angle_xm)))
FNUMBER_YP = 1/(2 * TANG(ACOS(cos_angle_yp)))
FNUMBER_YM = 1/(2 * TANG(ACOS(cos_angle_ym)))

FNUMBER = 0.25 * (FNUMBER_XP + FNUMBER_XM + FNUMBER_YP + FNUMBER_YM)

OPTRETURN 0, FNUMBER
OPTRETURN 1, FNUMBER_XP
OPTRETURN 2, FNUMBER_XM
OPTRETURN 3, FNUMBER_YP
OPTRETURN 4, FNUMBER_YM
