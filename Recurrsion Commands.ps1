Set-DnsServerRecursionScope -Name . -EnableRecursion $false 
Add-DnsServerRecursionScope -Name "OurPeople" -EnableRecursion $true
Add-DnsServerQueryResolutionPolicy -Name "OurRecursionPolicy" -Action ALLOW -ApplyOnRecursion -RecursionScope "OurPeople" -ServerInterfaceIP "EQ,192.168.1.100"

