!/bin/bash
#script to do wrapnmap and store result to tmp/folder


send_ip=10.192.34.0/24
src_ip=10.192.34.193

now=$(date)
echo -e "##########################################\nCurrent date: $now\nStarting WrapNmap on $send_ip\n##########################################\n" >> /tmp/data.txt

wrap_result=$(/usr/bin/nmap --reason -PE -PS161,162,22,23 -PP -sn --max-rtt-timeout 10000ms --max-retries 10 --min-parallelism 10 --send-eth -e eth1 -S $src_ip -n --send-ip $send_ip)

echo -e "$wrap_result\n\n\n" >> /tmp/data.txt
