DELETEPATH("1:/boot/booster.ks").
COPYPATH("0:/land.ks", "").

//Save the current coordinates as the target landing coordinates.



//Wait until current stage's liquid fuel hits 200

//STAGE.
//SET THROTTLE TO 0.
//WAIT 0.                         
//RCS ON.

//Pitch straight up.

//determine starting heading
//find a direction on that heading with roll=180 degrees (No roll after pitch manouvre)
//When difference between current heading and new heading is 30 degrees, lock steering to the above.

//When difference is 1 degree or less:

//initialise a new PID
