Get-Module DNSServer -ListAvailable 
Remove-DnsServerZone -Name practice.com -Force
Remove-DnsServerZone -Name 23.22.21.in-addr.arpa -Force

Add-DnsServerPrimaryZone -Name practice.com -ReplicationScope Domain
Add-DnsServerPrimaryZone -NetworkId '21.22.23.0/24' -ReplicationScope Domain

Add-DnsServerResourceRecord -A -Name srv5 -IPv4Address 21.22.23.5 -ZoneName practice.com -TimeToLive 01:00:00 -CreatePtr
Add-DnsServerResourceRecordA -Name srv6 -IPv4Address 21.22.23.6 -ZoneName practice.com 
Add-DnsServerResourceRecordPtr -Name 6 -PtrDomainName srv6.practice.com -ZoneName 23.22.21.in-addr.arpa
Add-DnsServerResourceRecordCName -Name www -ZoneName practice.com -HostNameAlias srv6.practice.com 
Add-DnsServerResourceRecordAAAA -Name srv7 -IPv6Address 2001:DB8:6783::7 -ZoneName practice.com
Add-DnsServerResourceRecordMX -Name smtp-mail -ZoneName practice.com -MailExchange srv5.practice.com -Preference 11
Add-DnsServerResourceRecord -Srv -DomainName www.practice.com -Name web -Port 80 -Priority 20  -Weight 30 -ZoneName practice.com
Add-DnsServerResourceRecord -Txt -ZoneName practice.com -Name Our_Text -DescriptiveText "Hello World" 
Get-DnsServerResourceRecord -ZoneName practice.com 
Get-DnsServerResourceRecord -ZoneName practice.com | Sort-Object RecordType

Get-DnsServerResourceRecord -ZoneName practice.com -RRType A

Add-DnsServerResourceRecord -Name The_Great -RecordData 6783 -Type 52 -ZoneName practice.com 

Set-DnsServerZoneAging practice.com -Aging $true -ScavengeServers 192.168.1.100
Start-DnsServerScavenging -Force

