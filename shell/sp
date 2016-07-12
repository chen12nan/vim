#!/usr/bin/expect

set timeout 1

set type [ lindex $argv 0]
set file [lindex $argv 1]
set greplog [lindex $argv 2]


# if { "$type" == "-s" } {
#    if { "$file" == "bl" } {    	
#        spawn scp /home/xkd/works/blacklist-daemon/syberos-blacklist-daemon/blacklistd  developer@192.168.100.100:/home/developer
#    }  
# }

if { "$type" == "-d" } {
	spawn ssh-keygen -f "/home/xkd/.ssh/known_hosts" -R 192.168.100.100
	spawn scp $file $greplog developer@192.168.100.100:~
}

if { "$type" == "pull" } {
	spawn scp developer@192.168.100.100:~/$file ./
} else {
	spawn scp $type $file $greplog developer@192.168.100.100:~
}

expect {
"yes/no" { send "yes\r"; exp_continue}
"password:" { send "system\r" }
}

interact





    
