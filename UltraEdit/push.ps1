$package = Get-ChildItem -Name "ultraedit.*.nupkg" | Select-Object -Last 1

choco push $package --source https://push.chocolatey.org/
