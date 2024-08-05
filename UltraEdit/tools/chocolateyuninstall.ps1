$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'UltraEdit*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
  $key | % {
    $uninstallString = "$($_.UninstallString)"

    # Use regex to properly split the uninstall string
    if ($uninstallString -match '(".*?\.exe")\s*(.*)') {
      $exePath = $matches[1].Trim('"')
      $exeArgs = $matches[2].Trim()
      
      # Update the packageArgs
      $packageArgs['file'] = $exePath
      $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) $exeArgs"

      Uninstall-ChocolateyPackage @packageArgs
    } else {
      Write-Error "Failed to parse the uninstall string: $uninstallString"
    }
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$($packageArgs['packageName']) has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)"}
}
