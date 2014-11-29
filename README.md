# Zabbix disk statistics template

In this repo you will find some simple scripts and zabbix template for showing some disk statistics.

###What you can see
- Reads per second (read.bytes)
- Writes per second (write.bytes)
- Kbytes read per second (read.ops)
- Kbytes written per second (write.ops)
- Average number of transactions that are waiting for service (queue.length)
- Average number of transactions that are actively being serviced (io.active)
- Average service time, in milliseconds (io.ms)
- Percentage of time that the queue is not empty (busy.queue)
- Percentage of time that the disk is busy (busy.disk)
 
### Files
- copy custom_userparameters.conf to etc/zabbix-agentd.conf.d folder of zabbix agent
- copy scripts to scripts folder
- load zabbix disk template
- add the following to your root crontab on your solaris server:
```sh
 * * * * * [ -x /opt/zabbix/scripts/iostat.sh ] && /opt/zabbix/scripts/iostat.sh
```

### Other
Statistics about pool have to be interpretted differently than that from drives. Take a look at HardForum, where I wrote about that: http://hardforum.com/showthread.php?p=1041023767#post1041023767.
