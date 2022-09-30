 #Path used to search directory 
 $path = 'C:\Users'

 #Username of directory where password was found
$ExportUser = $env:USERNAME

 #place where file can be found after export
$ExportPath= 'Filepathgoeshere\'+$ExportUser + '.csv'

$ExportPathClear= 'Filepathgoeshere\'+$ExportUser + 'Cleared' +'.csv'

#Get the target files in the specified directory that include the value of password
# If file is found with the name password then it will declare it and send out more details. Else, will Declare its clear of violations

 $target_files = Get-ChildItem $path -recurse -include *password*
        if($target_files){
    write-host "$Env:COMPUTERNAME has identified a file with cleartext passwords for $ExportUser"
    Get-Childitem -Path $path -Include *password* -Recurse -ErrorAction SilentlyContinue | Export-csv $ExportPath -NoTypeInformation
}
else{
    write-host "$Env:COMPUTERNAME is clear of violations"
    Get-Childitem -Path $path -Include *password* -Recurse -ErrorAction SilentlyContinue | Export-csv $ExportPathClear + -NoTypeInformation
}

# Decide on a Location for files to go to. 
# Decide on a deployment method. 