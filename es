#!/usr/bin/expect

set timeout 1

set type [ lindex $argv 0]
set command [lindex $argv 1]
set greplog [lindex $argv 2]

spawn /srv/syberos/sdks/sdk/syberos-sdk-chroot enter

expect "password:"
send "xingkd!@#123\r"

expect "~$*"

if { "$type" == "-d" } {
#  send "ls -l\r"
	send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu make distclean\r"
	send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu qmake\r"
	send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu make\r"
    send "exit\r"
}

if { "$type" == "-p" } {
	if { "$greplog" != "-n" } {
		send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu make distclean\r"
	}
	send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu rpmbuild --build-in-place --bb $command\r"
	send "exit\r"
}

if { "$type" == "-spec" } {
	send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu make distclean\r"
	
	if { "$command" == "sq" } {
       send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu rpmbuild --build-in-place --bb ../rpm/syberos-qt.spec\r"	   
	   
	   if { "$greplog" == "in" } {
		   send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu -m sdk-install -R rpm -ivh --force --nodeps /home/xkd/rpmbuild/RPMS/armv7tnhl/syberos-qt-0.1.0-1.armv7tnhl.rpm /home/xkd/rpmbuild/RPMS/armv7tnhl/syberos-qt-system-devel-0.1.0-1.armv7tnhl.rpm\r"
	   }
	}
	
	if { "$command" == "v" } {
       send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu rpmbuild --build-in-place --bb ../voicecall.spec\r"
	}

	if { "$command" == "nc" } {
       send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu rpmbuild --build-in-place --bb ./rpm/nemo-qml-plugin-contacts-qt5.spec\r"
	   
	   if { "$greplog" == "in" } {
		   send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu -m sdk-install -R rpm -ivh --force --nodeps /home/xkd/rpmbuild/RPMS/armv7tnhl/nemo-qml-plugin-contacts-qt5-0.0.0.syberos-1.armv7tnhl.rpm\r"
	   }
	}

	if { "$command" == "c" } {
       send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu rpmbuild --build-in-place --bb ../contact.spec\r"
	}

	if { "$command" == "nm" } {
       send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu rpmbuild --build-in-place --bb ./rpm/nemo-qml-plugin-messages-internal-qt5.spec\r"
	}

	send "exit\r"
}

if { "$type" == "-n" } {
    send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu qmake\r"
	send "sb2 -t syberos-target-armv7tnhl-ginkgo_xuanwu make\r"
    send "exit\r"
}

#send "scp ./src/voicecall developer@192.168.100.100:/home/developer\r"
#expect "password:"
#send "system\r"

#send "scp-phone -s bl\r"

interact

