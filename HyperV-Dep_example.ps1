# EXAMPLE POWERSHELL SCRIPT FOR LAUNCHING A HYPERV VM, UNKNOWN AUTHOR

$partition = Read-Host -Prompt "Type in which partition would you like to create a virtual machine in"
$VMname = Read-Host -Prompt "Type name of the server which will be created"
New-Item "$partition\$VMname" -type directory
Copy-Item -Path "\\NAS\location\test.vhdx" -Destination "$partition\$VMname"
Rename-Item -Path "$partition\$VMname\test.vhdx" -NewName "$VMname.vhdx"
New-VM -Name $VMname -MemoryStartupBytes 16GB -Generation 2 -VHDPath "$partition\$VMname\$VMname.vhdx"