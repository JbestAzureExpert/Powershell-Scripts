Get-NetIPAddress -InterfaceAlias "Ethernet 1" -AddressFamily IPv4 
Clear-DnsClientCache
Resolve-DnsName -Name srv-xyz.hmm.com

netsh interface ipv4 set address name="Ethernet 1" static 192.168.1.129 255.255.255.0 192.168.1.1 
Get-NetIPAddress -InterfaceAlias "Ethernet 1" -AddressFamily IPv4
Clear-DnsClientCache
Resolve-DnsName -Name srv-xyz.hmm.com

netsh interface ipv4 set address name="Ethernet 1" static 192.168.1.120 255.255.255.0 192.168.1.1
