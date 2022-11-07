#Certificate Scripts

#LIST ALL Avaliable Certificate 

Get-ChildItem -Path Cert:\LocalMachine\My    
Directory: Microsoft.PowerShell.Security\Certificate::LocalMachine\My
<# EXAMPLEOUTPUT
Thumbprint                                Subject
----------                                -------EC225A0183DC64D864C8BEA1477822858FCEC767  CN=WMSvc-EXSRV02
E2BC29B1445FD267E5A2823591A5221D67D0D94F  CN=Microsoft Exchange Server Auth Certificate
D8EE794A39A8E04BE32A1E8BED93A3C46D15E0EF  CN=EXSRV02
60246A87C12BEB365E7B4044C926587590A3D7B6  CN=mobile.mcmemail.de, O=mcmemail, C=DE
5F103D6C61BF57D86DB4AAA05597B0D1E8155884  CN=EXSRV02.mcmemail.de, CN=EXSRV02, CN=127.0.0.1, CN=localhost, O=Trend Micro.
#>


# RETREIEVE CERTIFICATE DETAILS 

$cert = Get-ChildItem -Path Cert:\LocalMachine\My\5F103D6C61BF57D86DB4AAA05597B0D1E8155884
$cert | fl

#EXPORT CERTIFICATE 
$cert | Export-Certificate -FilePath C:tmpcert1.p7b -Type p7b

#EXPORT MULTIPLE CERTS 
$certarray = @()
$certarray += $cert
$cert = Get-ChildItem -Path Cert:\LocalMachine\My\D8EE794A39A8E04BE32A1E8BED93A3C46D15E0EF
$certarray += $cert
$certarray

Directory: Microsoft.PowerShell.Security\Certificate::LocalMachine\My
<# EXAMPLE OUTPUT
Thumbprint                                Subject
----------                                -------
60246A87C12BEB365E7B4044C926587590A3D7B6  CN=mobile.mcmemail.de, O=mcmemail, C=DE
D8EE794A39A8E04BE32A1E8BED93A3C46D15E0EF  CN=EXSRV02

$certarray | Export-Certificate -FilePath c:tmpcerts.sst -Type SST    
Directory: C:tmp
Mode                LastWriteTime     Length Name
----                -------------     ------ ----
-a---        23.12.2014     11:58       3056 certs.sst 
#> 