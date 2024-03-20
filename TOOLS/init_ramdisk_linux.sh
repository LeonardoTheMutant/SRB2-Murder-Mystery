#RamDisk initialization script
#Use in Linux only!

if ! [ -d /media/ramdisk ]; then
	sudo mkdir /media/ramdisk
fi

#64M = 64 Megabytes, change this number to something else if needed
sudo mount -t tmpfs -o size=64M tmpfs /media/ramdisk
echo "Ramdisk is (re)initialized at /media/ramdisk"
