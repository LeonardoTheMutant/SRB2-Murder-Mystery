#RamDisk initialization script
#Use in Linux only!

if ! [ -d /media/ramdisk ]; then
	sudo mkdir /media/ramdisk
	sudo mount -t tmpfs -o size=64M tmpfs /media/ramdisk #64M = 64 Megabytes, change this number to something else if needed
	echo "Ramdisk created at /media/ramdisk"
else
	echo "Ramdisk is already initialized at /media/ramdisk"
fi