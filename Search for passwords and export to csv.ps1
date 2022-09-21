$path = 'Examplefilediryouwantsearch'
$ExportPath = 'Examplefilepathwhere you want your report to be saved to.csv.'



Get-Childitem -Path $path -Include *password* -Recurse -ErrorAction SilentlyContinue | Export-csv $ExportPath -NoTypeInformation