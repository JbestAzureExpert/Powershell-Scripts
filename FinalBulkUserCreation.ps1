#Import AD module for running AD cmdlets 
Import-Module activedirectory 

#Store the data from ADUsers.csv in the $ADUsers Variable 
$Users = Import-CSV C:\HealthPlusUsers\FinalUserImport.csv

#Loop through each row containing user details in the CSV file
foreach ($User in $Users) {
# Read User Data from eachfield in each row 
# the username is used more often, so to prevent typing, save that in a variable 
$Username = $User.SamAccountName

# Check to see if the user already exists in AD 
if (Get-ADUser -F {SamAccountName -eq $Username}) {
#if user does exist give a warning
Write-Warning "A user Account with username $Username already exsists in Active Directory."
}
else {
#User does not exist then proceed to create the new user account 

<# New-ADUser Params for the csv, use to fill out Spreadsheet/ make script for adding information
Soured From https://docs.microsoft.com/en-us/powershell/module/activedirectory/new-aduser?view=windowsserver2022-ps

   [-WhatIf]
   [-AccountExpirationDate <DateTime>]
   [-AccountNotDelegated <Boolean>]
   [-AccountPassword <SecureString>]
   [-AllowReversiblePasswordEncryption <Boolean>]
   [-AuthenticationPolicy <ADAuthenticationPolicy>]@ {}
   [-AuthenticationPolicySilo <ADAuthenticationPolicySilo>] @ {}
   [-AuthType <ADAuthType>]
   [-CannotChangePassword <Boolean>] ""
   [-Certificates <X509Certificate[]>] ""
   [-ChangePasswordAtLogon <Boolean>]
   [-City <String>]
   [-Company <String>] ""
   [-CompoundIdentitySupported <Boolean>]
   [-Country <String>]
   [-Credential <PSCredential>]
   [-Department <String>] ""
   [-Description <String>]
   [-DisplayName <String>]
   [-Division <String>]
   [-EmailAddress <String>]
   [-EmployeeID <String>]
   [-EmployeeNumber <String>]
   [-Enabled <Boolean>]
   [-Fax <String>]
   [-GivenName <String>] ""firstName Josh""
   [-HomeDirectory <String>]
   [-HomeDrive <String>]
   [-HomePage <String>]
   [-HomePhone <String>]
   [-Initials <String>]
   [-Instance <ADUser>]
   [-KerberosEncryptionType <ADKerberosEncryptionType>] ""
   [-LogonWorkstations <String>]
   [-Manager <ADUser>] ""
   [-MobilePhone <String>]
   [-Name] <String> Ricky Chan
   [-Office <String>]
   [-OfficePhone <String>]
   [-Organization <String>]
   [-OtherAttributes <Hashtable>]
   [-OtherName <String>]
   [-PassThru]
   [-PasswordNeverExpires <Boolean>]
   [-PasswordNotRequired <Boolean>]
   [-Path <String>]
   [-POBox <String>]
   [-PostalCode <String>]
   [-PrincipalsAllowedToDelegateToAccount <ADPrincipal[]>] ""
   [-ProfilePath <String>]
   [-SamAccountName <String>] ""
   [-ScriptPath <String>]
   [-Server <String>]
   [-ServicePrincipalNames <String[]>] ""
   [-SmartcardLogonRequired <Boolean>]
   [-State <String>]
   [-StreetAddress <String>]
   [-Surname <String>] ""
   [-Title <String>] ""
   [-TrustedForDelegation <Boolean>]
   [-Type <String>]
   [-UserPrincipalName <String>] ""
   [<CommonParameters>]
   #>
#create a hashtable for splatting the paramaters.
$userprops = @{
SamAccountName = $User.SamAccountName
GivenName = $User.GivenName
Surname = $User.Surname
Name = $User.Name
Title = $User.Title
DisplayName = $User.DisplayName
Description = $User.Description
OfficePhone = $User.OfficePhone
EmailAddress = $User.EmailAddress
UserPrincipalName = $User.UserPrincipalName
Company = $User.Company
Department = $User.Department
Manager = $User.Manager
Path = $User.path
HomePage = $User.HomePage
AccountPassword = (ConvertTo-SecureString $User.password -AsPlainText -Force) 
Enabled = $true
ChangePasswordAtLogon = $true
}    #end userprops   

         New-ADUser @userProps
       #  Write-Host "The user account $User is created." -ForegroundColor Cyan
   

    } #end else
   
}

