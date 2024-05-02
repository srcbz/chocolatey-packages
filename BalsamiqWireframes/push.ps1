$package = Get-ChildItem -Name "balsamiqwireframes.*.nupkg" | Select-Object -First 1

choco push $package --source https://push.chocolatey.org/
