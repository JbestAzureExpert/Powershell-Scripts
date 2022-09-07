Get-Command -Module DnsServer -Name *policy* 

Add-DnsServerPrimaryZone -Name hmm.com -ReplicationScope Domain

Add-DnsServerClientSubnet -Name 64_Subnet -IPv4Subnet "192.168.1.64/26"
Add-DnsServerClientSubnet -Name 128_Subnet -IPv4Subnet "192.168.1.128/26"

Add-DnsServerZoneScope -ZoneName hmm.com -Name "64_Scope"
Add-DnsServerZoneScope -ZoneName hmm.com -Name "128_Scope"

Add-DnsServerResourceRecord -ZoneName hmm.com -A -Name srv-xyz -IPv4Address "22.22.22.22" -ZoneScope "64_Scope"
Add-DnsServerResourceRecord -ZoneName hmm.com -A -Name srv-xyz -IPv4Address "33.33.33.33" -ZoneScope "128_Scope"

Add-DnsServerQueryResolutionPolicy -Name "64_Policy" -Action ALLOW -ClientSubnet "eq,64_Subnet" -ZoneScope "64_Scope,1" -ZoneName hmm.com
Add-DnsServerQueryResolutionPolicy -Name "128_Policy" -Action ALLOW -ClientSubnet "eq,128_Subnet" -ZoneScope "128_Scope,1" -ZoneName hmm.com
