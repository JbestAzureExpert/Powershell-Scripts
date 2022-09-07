Get-NetAdapter -Name "Ethernet 1" 
Get-NetIPAddress -InterfaceIndex 6 -AddressFamily IPv4

Resolve-DnsName srv-xyz.hmm.com
nslookup -type=A srv-xyz.hmm.com
