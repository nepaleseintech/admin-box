New-Item C:\admin-box\servers\admin.box -type directory
Copy-Item -Path C:\admin-box\app\files\admin\templates\admin.box\* -Destination C:\admin-box\servers\admin.box -recurse -Force
$command = 'vagrant up'
cd C:\admin-box\servers\admin.box
& Invoke-Expression $command