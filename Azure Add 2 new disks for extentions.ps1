$disks = Get-Disk | where paritionstyle -eq 'raw' | sort Number

$letters = 70..89 | ForEach-Object { [char]$_ }
$count = 0
$labels = "data1","data2"

foreach ($disk in $disks) {
$driveLetter = $letters[$count].ToString()
$disk |
Initalize-Disk -PartitionStyle MBR -PassThru |
New-Partition -UseMaximumSize -DriveLetter $driveLetter |
Format-Volume -FileSystem NTFS -NewFileSystemLabel $labels[count] -Confirm:$False -force
$Count++
}