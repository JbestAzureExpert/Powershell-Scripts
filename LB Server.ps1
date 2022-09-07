Add-DnsServerPrimaryZone -Name "loadbalance.com" -ReplicationScope Domain 
Add-DnsServerZoneScope -ZoneName "loadbalance.com" -Name "Scope-Heavy"
Add-DnsServerZoneScope -ZoneName "loadbalance.com" -Name "Scope-Light"
Get-DnsServerZoneScope -ZoneName "loadbalance.com"
Add-DnsServerResourceRecord -ZoneName "loadbalance.com" -A -Name "LB-www" -IPv4Address "192.168.1.11" 
Add-DnsServerResourceRecord -ZoneName "loadbalance.com" -A -Name "LB-www" -IPv4Address "192.168.1.22" -ZoneScope "Scope-Light"
Add-DnsServerResourceRecord -ZoneName "loadbalance.com" -A -Name "LB-www" -IPv4Address "192.168.1.33" -ZoneScope "Scope-Heavy"

Add-DnsServerQueryResolutionPolicy -Name "Our-LB-Policy" -Action ALLOW -Fqdn "EQ,*" -ZoneScope "loadbalance.com,1;Scope-Light,1;Scope-Heavy,9" -ZoneName "loadbalance.com"
Get-DnsServerQueryResolutionPolicy -ZoneName "loadbalance.com"

Get-Command *-dnsserver*
Get-DnsServer 
