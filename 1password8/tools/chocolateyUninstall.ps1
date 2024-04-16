$ErrorActionPreference = 'Stop';
1
$packageName = '1password'

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName "$packageName*"

if ($key.Count -eq 1) {
  $key | % {
    $uninstall_command=$_.UninstallString.Trim('"')
    $uninstall_command = $uninstall_command -ireplace [regex]::Escape("msiexec"),"C:\windows\system32\msiexec"
    $uninstall_command = $uninstall_command.split(" ")
    $uninstall_exec=$uninstall_command[0]
    $uninstall_param=$uninstall_command[1]
    Write-Host "cmd=$uninstall_exec\n param=$uninstall_param"
    & $uninstall_exec $uninstall_param
  } 
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $_.DisplayName"}
}
