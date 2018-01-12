PARAMETER offset.

//Use the Trajectories mod to find the the ground altitude above Sea leveal a the coordinates of the current point of impact
SET iPAlt TO ADDONS:TR:IMPACTPOS:TERRAINHEIGHT.

LOCK v to SHIP:VERTICALSPEED.

SET g TO BODY:MU/(BODY:RADIUS+iPAlt)^2.
LOCK a to SHIP:MAXTHRUST/SHIP:MASS - g.
LOCK gAlt TO ALT:RADAR-offset.
LOCK d TO v^2/(2*a).
LOCK idThr TO d/gAlt.
LOCK t TO gAlt/abs(v).

//Prep
RCS ON.
BRAKES ON.
LOCK STEERING TO SRFRETROGRADE.
WHEN t<3 THEN {GEAR ON.}

//execute burn
WAIT UNTIL gAlt<d.
LOCK THROTTLE TO idThr.

//finish burn
WAIT UNTIL v>-0.01.
LOCK THROTTLE TO 0.
RCS OFF.