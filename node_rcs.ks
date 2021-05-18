PARAMETER isp,thr.
SET n TO NEXTNODE.
SET dv TO n:DELTAV.
LOCK m TO ship:Mass.
LOCK STEERING TO LOOKDIRUP(n:DELTAV,SUN:POSITION).

LIST RCS IN rL.
FOR r in rL {
    SET r:FOREBYTHROTTLE to TRUE.
    SET r:FOREENABLED to TRUE.
}
WAIT UNTIL (n:ETA + 1) <= (m - m/(CONSTANT:E^((dv:MAG/2)/(isp*9.81)))) / (thr/(isp*9.81))..
RCS ON.
LOCK THROTTLE TO MAX(0.051,n:DELTAV:MAG/(thr/m)).
UNTIL FALSE{
    IF VDOT(dv, n:DELTAV) < 0{
        UNLOCK ALL.
        SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.
        RCS OFF.
        FOR r in rL {
            SET r:FOREBYTHROTTLE to FALSE.
        }
        BREAK.
    }
    WAIT 0.
}