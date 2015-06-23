#!/usr/bin/env ruby
#run this script to install binary service ssp
require 'socket'

#contact me : w.zongyu@gmail.com

puts "This script to download and setup the real service ssp"
puts "I will remove /home/ssp/binary"
print "Ready(y/n) ?"
check = gets.chomp

if check == "y" 
    `rm /home/ssp/binary`
    ip=`/sbin/ifconfig tun0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
    s=TCPSocket.new '10.8.0.1', 9999
    s.puts "#{ip}"
    while line = s.gets
        puts line
    end 
    s.close
end
