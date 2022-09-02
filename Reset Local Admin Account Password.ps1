$Username = "src_cyberarkserver"
$Password = "16g!Uqshhv70$g" 

$Group = "Administrators"

$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$Exisiting = $adsi.children | where {$_.SchemaClassName -eq 'user' -and $_.Name -eq $Username }

if ($existing -eq $Null) {

write-Host "Creating new local user $Username."
& NET USER $Username $Password /add /y /expires:never

Write-Host "adding local user $Username to $Group."
& NET LOCALGROUP  $Group $Username /add

}
else {
Write-Host "Setting password for exisiting local user $Username."
$Exisiting.SetPassword($Password)
}
Write-Host "Ensuring password for $Username never expires."
& WMIC USERACCOUNT WHERE "Name='$USERNAME'" SET PasswordExpires=FALSE

net localgroup users $Username /delete

## Use this line of code if we want to remove local admin account Administrator
## net localgroup Administrators Administrator /delete

## This is script to remove the user if something goes wrong. 
## net localgroup Administrators $Username /delete
