# Arch Linux Installation guide

## Table of contents
1. [Download Arch Linux](#download-arch-linux)
1. [Make bootable disk](#make-bootable-disk)
1. [Boot environment](#boot-environment)
1. [Installation procedure](#installation-procedure)

## Download Arch Linux
Download arch linux iso from [https://archlinux.org/download/](https://archlinux.org/download/) 

## Make Bootable Disk
In ubuntu right click on the downloaded archlinux iso and click to _Open with_ menu then click on __Disk Image Writer__ option. When ask for the Destination drive select your usb drive and click to Start restoring.

In Windows use __Rufus__ to write your iso image to the usb drive.

## Boot environment
Every laptop has its key defined to open boot menu. Your laptop might have "F9" key assigned to open boot loader menu when restarting your machine. When boot loader is open select your bootable usb drive and then press enter.

## Installation procedure

### Configure Internet connection
When boot is complete you will be greeted with a zsh shell. In this shell the installation will be done. But first, you need to configure your internet connection. If you have wifi connection available. Then folow the steps.

To verify that you have a active internet connection enter following command:

```bash
ip addr show
```
It will show IP address in a specific device from devices list when internet is active.

For wifi we have a dedicated command that's going to help us to initiate and establish a connection. 

```bash
iwctl
```
Run the above command and press enter. That will bring us to shell prompt to facilitate connecting to wifi. If you don't already know what is your wireless device name actually is then run:

```
$ device list
                            Devices
---------------------------------------------------------------
Name        Adress              Powered     Adapter     Mode
---------------------------------------------------------------
wlan0       40:ec:98:72:40:8f   on          phy0        station
```

If you don't see any wifi devices in the result, then most probably you don't have any wifi devices working in your machine. So, use external wifi device if your in built wifi device is not working. Installing Arch Linux needs active internet connection to download packages for installation. So without internet connection it is impossible to install Arch Linux.

Next we are going to scan our local area network and find all the wifi access point we can connect to. And the command for that:

```
station wlan0 scan
```

And that basically initiate a scan, it will not show any output. But the above command triggers the wifi card to scan the local area.

Next, we can get a list of the wifi network that were found by running:

```
$ station wlan0 get-networks
            Available networks
----------------------------------------
Network name        Security    Signal
POCO_M2_Pro         psk         ****
SURAJIT             psk         ****
```

Make sure the wifi network you want to connect is on the available networks list.

And finally we can connect to the wireless of our choice by running:
```
$ station wlan0 connect "SURAJIT"
Type the network passphrase for SURAJIT psk.
Passphrase: 
```

Type your wireless connection passphrase and press enter. It will take a few seconds for your wifi card to connect. When you fill enough time has past, you can exit the iwctl prompt. (Press `ctrl-d` to exit)

Type below command again to see the ip address assigned to the __wlan0__ device:

```bash
ip a
```
```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp2s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
    link/ether 58:8a:5a:34:05:76 brd ff:ff:ff:ff:ff:ff
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 5c:ea:1d:10:c9:8d brd ff:ff:ff:ff:ff:ff
    inet 192.168.210.201/24 brd 192.168.210.255 scope global dynamic noprefixroute wlp3s0
       valid_lft 2871sec preferred_lft 2871sec
    inet6 2409:4060:2e89:d3c7:5a69:9aaa:4e91:f3e7/64 scope global temporary dynamic
       valid_lft 2909sec preferred_lft 2909sec
    inet6 2409:4060:2e89:d3c7:c08c:faa5:44d6:beb4/64 scope global dynamic mngtmpaddr noprefixroute
       valid_lft 2909sec preferred_lft 2909sec
    inet6 fe80::6ffb:d9b5:6784:8a2e/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

So, at this point you should be connected to your netowrk and have a internet access. And to verify that you can run following command:

```bash
ping -c 5 8.8.8.8
```

```
NG 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=112 time=345 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=112 time=80.8 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=112 time=70.1 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=112 time=80.4 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=112 time=75.0 ms

--- 8.8.8.8 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4005ms
rtt min/avg/max/mdev = 70.067/130.167/344.573/107.275 ms
```

If you see the above result then you do have an active internet connection.

So, you can go ahead and continue to the installation.

### Setting up the Disk (with UEFI)
It is a recommented step if your computer does support UEFI. Before you continue though make sure that UEFI is enabled in the BIOS of your computer. If you don't do that then later on you might get the error UEFI extension are not supported on the system. And if you get that error, that basically means you did not enabled UEFI in the BIOS.

First we need to know what the device name is of the hard drive that we want to work with. And for that we can run:

```
$ fdisk -l
```

```
Disk /dev/sda: 230 GiB, 246960619520 bytes, 1048576000 sectors
Disk model: XXXXXX
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

```
$ fdisk /dev/sda
Welcome to fdisk (util-linux 2.36.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x635f5266.

Command (m for help): p

Disk /dev/sda: 230 GiB, 246960619520 bytes, 1048576000 sectors
Disk model: XXXXXX
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

Command (m for help): g
Created a new GPT disklabel (GUID: 597E4B4C-665A-C04B-84CF-DC0453593B68)

Command (m for help): n
Partition number (1-128, default 1):
First secotr (2048-1048575966, default 2048): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-1048575966, default 1048575966): +500M

Created a new partition 1 of type 'Linux filesystem' and of size 500 Mib.

Command (m for help): t
Selected partition 1
Partition type or alias (type L to list all): 1
Changed type of partition 'Linux filesystem' to 'EFI System'.

Command (m for help): p
Disk /dev/sda: 230 GiB, 246960619520 bytes, 1048576000 sectors
Disk model: XXXXXX
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 597E4B4C-665A-C04B-84CF-DC0453593B68

Device      Start   End     Sectors Size Type
/dev/sda1    2048   1026047 1024000 500M EFI System

Command (m for help): n
Partition number (2-128, default 2):
First sector (1026048-1048575966, default: 1026048):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (1026048-1048575966, default 1048575966): 

Created a new partition 2 of type 'Linux filesystem' and of size 229.5 GiB.

Command (m for help): t
Partition number (1,2, default 2):
Partition type or alias (type L to list all): 43

Partition type of partition 'Linux filesystem' to 'Linux LVM'.

Command (m for help): p
Disk /dev/sda: 230 GiB, 246960619520 bytes, 1048576000 sectors
Disk model: XXXXXX
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 9AD2F011-1125-674C-8AAE-4810991A3805

Device      Start       End         Sectors         Size Type
/dev/sda1    2048       1026047     1024000         500M EFI System
/dev/sda2    1026048    1048575966  1047549919    239.1G Linux LVM

Command (m for help): w
The parition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

```
$ mkfs.fat -F32 /dev/sda1
mkfs.fat 4.1 (2022-12-25)

$ pvcreate --dataalignment 1m /dev/sda2
Physical volume "/dev/sda2" successfully created.

$ vgcreate volgroup0 /dev/sda2
Volume group "volgroup0" successfully created

$ lvcreate -L 40GB volgroup0 -n lv_root
Logical volume "lv_root" created.

$ lvcreate -l 100%FREE volgroup0 -n lv_home
Logical volume "lv_home" created.

$ modprobe dm_mod
$ vgscan
Found volume group "volgroup0" using metadata type lvm2

$ vgchange -ay
2 logical volume(s) in volume group "volgroup0" now active

$ mkfs.ext4 /dev/volgroup0/lv_root
mke2fs 1.45.6 (25-Dec-2022)
Creating filesystem with 7864320 4k blocks and 1966080 inodes
filesystem UUID: b593c481-a46d-47c7-a831-3c0480ee72a7
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 4096000

Allocating group tables: done
Writing indoe tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting informtion: done

$ mount /dev/volgroup0/lv_root /mnt
mkfs.ext4 /dev/volgroup0/lv_home
mke2fs 1.45.6 (25-Dec-2022)
Creating filesystem with 123078656 4k blocks and 30777344 indoes
Filesystem UUID: 3eb1936d-fb49-4913-bc23-04415aefc5d8
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
        10240000

Allocating group tables: done
Writing inode tables: done
Creating journal (262144 blocks): done
Writing superblocks and filesystem accounting information: done

$ mkdir /mnt/home
$ mount /dev/volgroup0/lv_home /mnt/home
$ mkdir /mnt/etc
$ genfstab -U -p /mnt >> /mnt/etc/fstab
$ cat /mnt/etc/fstab
# /dev/mapper/volgroup0-lv_root UUID=b593c481-a46d-47c7-a831-3c0480ee72a7       /           ext4        rw,relatime         0 1
# /dev/mapper/volgroup0-lv_home UUID=3eb1936d-fb49-4913-bc23-04415aefc5d8       /home       ext4        rw,relatime         0 2
```

### Installing Arch Linux
So, at this point you should have your disk prepared and ready to go for Arch Linux. We are going to install all the components that are required for Arch Linux to function.
Now, we are going to install all of the base packages for arch linux. And to do that we can run:

```
$ pacstrap -i /mnt base
```
It will take some times depending on the package size and network speed your internet connection have.

```
Total Download Size:    114.24 MiB
Total Installed Size:   478.31 MiB

:: Proceed with installation? (Y/n)
```
Press enter to install all downloaded packages.
Wait until installation is finished.

Now, we need to configure our installation.
And for that we run:

```
$ arch-chroot /mnt
```

This command essentially gives us access to the arch Linux installation. The command prompt that we have now on the screen that actually attached to the work in progress installation. So, we are actually using our installation right now in a chroot environment. But it is not going to boot just yet though because it is missing pretty much all of the requirements it needs in order to boot. So, we are going to make this installation independent of the boot media. And after we are done, it should able to function on its own.

Install Linux kernels:

```
$ pacman -S linux linux-headers linux-lts linux-lts-headers
resolving dependencies...
:: There are 2 providers available for initramfs:
:: Repository core
   1) mkinitcpio
:: Repository extra
   2) dracut

Enter a number (default=1):
looking for conflicting packages...

Packages (7) diffutils-3.7-3 mkinitcpio-29-1 mkinitcpio-busybox-1.32.1-2
             linux-5.10.11.arch-1 linux-headers-5.10.11.arch1-1
             linux-lts-5.4.94-1 linux-lts-headers-5.4.94-1

Total Download Size:    189.27 MiB
Total Installed Size:   397.41 MiB

:: Proceed with installation? [Y/n] 
```

Now press enter 2 times and wait for the installation to finish.

Now install some required packages:

```
$ pacman -S nano vim base-devel openssh
```

```
$ systemctl enable sshd
$ pacman -S networkmanager wpa_supplicant wireless_tools netctl
```

```
$ pacman -S dialog
```

```
$ systemctl enable NetworkManager
```

```
$ pacman -S lvm2
```

```
$ nano /etc/mkinitcpio.conf
```

Search for the __HOOKS__ word, it will have many occurrences. Stop only on that occurrence which does not have comment symbol (#) in front of it.

Now inside the parenthesis, between block and filesystems add lvm2.

```
HOOKS=(base udev autodetect modconf block lvm2 filesystems keyboard fsck)
```

After changing the file, save the file and exit from the nano.

```
$ mkinitcpio -p linux
$ mkinitcpio -p linux-lts
```

```
$ nano /etc/locale.gen

en_IN UTF-8 UTF-8
```
```
$ locale-gen
```

```
$ passwd
New Password:
Retype new password: 
passwd: password updated successfully
```

```
$ useradd -m -g users -G wheel surajit
$ passwd surajit
New Password:
Retype new password: 
passwd: password updated successfully
```

```
$ pacman -S sudo
$ which sudo
/usr/bin/sudo
```

```
$ EDITOR=nano visudo

%wheel ALL=(ALL) ALL
```

### Installing GRUB
```
$ pacman -S grub efibootmgr dosfstools os-prober mtools
```

```
$ mkdir /boot/EFI
$ mount /dev/sda1 /boot/EFI
```

```
$ grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
Installing for x86_64-efi platform.
Installation finished. No error reported.
```

```
$ ls -l /boot/grub
$ mkdir /boot/grub/locale
```

```
$ cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
```

```
$ grub-mkconfig -o /boot/grub/grub.cfg
$ exit
$ umount -a
$ reboot
```
