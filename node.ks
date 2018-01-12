PARAMETER isp.

SET n TO NEXTNODE.
SET nv TO n:DELTAV
SET ve TO isp*9.81.
SET e TO CONSTANT:E.
SET mt TO SHIP:MAXTHRUST.
SET mfr TO mt/ve.
SET m TO ship:Mass.
SET dv TO nv:MAG.
LOCK maxAcc TO mt/m.

SET t TO (m - m/(e^(dv/ve))) / mfr.
SET t2 TO (m - m/(e^((dv/2)/ve))) / mfr.

//set steering to point at the node
//I want the y axis and the sun to be in the same plane. Needs modification to acheive this.
LOCK STEERING TO nv.

WAIT UNTIL n:ETA <= t2.

//Set throttle to max, and set to decrease at last second.
LOCK THROTTLE TO nv:MAG/(mt/ship:Mass).

//initial deltav
set dv0 to n:deltav.
until done
{
    if vdot(dv0, nd:deltav) < 0
    {
        lock throttle to 0.
        break.
    }
    //Debug section:
    print "throttle: " + nv:MAG/(mt/ship:Mass) + " vdot: " + vdot(dv0, nd:deltav).
    WAIT 0.
}

unlock all.
SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.