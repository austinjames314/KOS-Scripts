DELETEPATH("1:/boot/boot_general.ks").
COPYPATH("0:/boot/boot_yToSun.ks","1:/boot/").
SET CORE:KOSPROCESSOR:BOOTFILENAME TO "boot_yToSun.ks".
COPYPATH("0:/node.ks", "").
COPYPATH("0:/yToSun.ks", "").
COPYPATH("0:/land.ks", "").
PRINT "New boot file name is: " + CORE:KOSPROCESSOR:BOOTFILENAME.
PRINT "Copied the following scripts over:".
LIST.
