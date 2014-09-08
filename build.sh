#/bin/bash
#
# Build script to build GPL userland components of the Fairphone Android build.
# 
# The components released are dbus, dnsmasq, e2fsprogs, iproute2
#  iptables, mdnsresponder,  ppp
#
# To build this component you need to setup an environement to build 4.2.2
# please follow the basic steps described here 
# https://source.android.com/source/index.html
#
# The offical build platform for the Fairphone Android 4.2.2 build is 
# Ubuntu 10.04 LTS with a sun java 1.6 jdk and official builds are created
# inside a lucid chroot on a Ubuntu trusty 12.04 LTS relase.
#
# Building the components requires checking out a standard Android build and replacing
# components.
#
set -e
#set -x


mkdir -p build
cd build

#
# Create a build directory and to a checkout of Android 4.2.2
#
function prepare() {
	#
	# do a checkout of the offical Android
	#
	repo init -u https://android.googlesource.com/platform/manifest -b  android-4.2.2_r1.2b
	repo sync
}


function dolink() {
	#
	# Replace the components
	#
	for i in dbus  dnsmasq  e2fsprogs  iproute2  iptables  mdnsresponder  ppp
	do
		rm -rf external/$i
		ln -s ../../external/$i external/$i
	done
}

function build(){
	. build/envsetup.sh
	lunch full-eng
	make
}

prepare
dolink
build
echo Please find your binaries in build/out/target/product/
