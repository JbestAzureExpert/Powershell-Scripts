Get-Date -DisplayHint Time 

Get-DnsServerQueryResolutionPolicy -ZoneName hmm.com

Add-DnsServerQueryResolutionPolicy -zoneName hmm.com -Name "Time-Policy" -Action DENY -TimeOfDay "eq,04:00-23:00" -ProcessingOrder 2 
Get-DnsServerQueryResolutionPolicy -ZoneName hmm.com

Set-DnsServerQueryResolutionPolicy -ZoneName hmm.com -Name "Time-Policy" -ProcessingOrder 1
Get-DnsServerQueryResolutionPolicy -ZoneName hmm.com

Remove-DnsServerQueryResolutionPolicy -zoneName hmm.com -Name "Time-Policy" -Force
Add-DnsServerQueryResolutionPolicy -zoneName hmm.com -Name "Time-Policy" -Action IGNORE -TimeOfDay "eq,04:00-23:00" -ProcessingOrder 1 

Remove-DnsServerQueryResolutionPolicy -zoneName hmm.com -Name "Time-Policy" -Force

Get-Date -DisplayHint Time
Add-DnsServerQueryResolutionPolicy -zoneName hmm.com -Name "Time-Policy" -Action DENY -TimeOfDay "eq,23:00-23:59" -ProcessingOrder 1 
Get-DnsServerQueryResolutionPolicy -ZoneName hmm.com

Set-DnsServerQueryResolutionPolicy -ZoneName hmm.com -Name "Time-Policy" -ProcessingOrder 3
Get-DnsServerQueryResolutionPolicy -ZoneName hmm.com
