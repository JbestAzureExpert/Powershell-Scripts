#BULK-USER IMPORT TEMPLATE SCRIPT FROM CSV FILE


#You will need a csv file with the following variables along with the information you need in order to import these users to the correct directory
## BULK COPY OPERATIONS ##
#File for suppfiles must be available at the c drive location for this to work.
#Also its Important that the domain and the Contain match to where they would like the users to be created 

# import users from a CSV
Import-Csv c:\HealthPlusUsers\ad-users.csv | foreach 
{New-ADUser -SamAccountName $_.SAMAccountName -Name ($_.FirstName + " " + $_.LastName) 
-GivenName $_.FirstName 
-Surname $_.LastName 
-EmployeeID $_.Title 
-StreetAddress $_.StreetAddress 
-City $_.City 
-PostalCode $_.PostalCode 
-State $_.State 
-Department $_.Department 
-EmailAddress $_.Email 
-OfficePhone $_.PhoneNumber 
-wWWHomePage $_.wWWHomePage
-UserPrincipalName $_.UserPrincipalName
-Title $_.JobTitle
-Company $_.Company
-Department $_.Department
-Manger $_.Manager
-Path "CN=Health Plus,DC=integra,DC=com" $_.UserPrincipal
-Enabled $true -ChangePasswordAtLogon $true   -AccountPassword (ConvertTo-SecureString -AsPlainText 'WelcomeToAnthem987!' -Force)}
