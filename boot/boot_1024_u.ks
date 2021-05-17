DELETEPATH("1:/boot/boot_1024_u.ks").
COPYPATH("0:/boot/boot_yToSun.ks","1:/boot/").
PRINT "Old boot file name is: " + CORE:BOOTFILENAME.
SET CORE:BOOTFILENAME TO "/boot/boot_yToSun.ks".
COPYPATH("0:/node_u.ks", "").
COPYPATH("0:/yToSun.ks", "").
PRINT "New boot file name is: " + CORE:BOOTFILENAME.
PRINT "Copied the following scripts over:".
LIST.
