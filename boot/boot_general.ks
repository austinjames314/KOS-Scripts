DELETEPATH("1:/boot/boot_general.ks").
COPYPATH("0:/boot/boot_yToSun.ks","1:/boot/").
PRINT "Old boot file name is: " + CORE:BOOTFILENAME.
SET CORE:BOOTFILENAME TO "/boot/boot_yToSun.ks".
COPYPATH("0:/node.ks", "").
COPYPATH("0:/yToSun.ks", "").
COPYPATH("0:/land.ks", "").
COPYPATH("0:/vacland.ks", "").
PRINT "New boot file name is: " + CORE:BOOTFILENAME.
PRINT "Copied the following scripts over:".
LIST.
