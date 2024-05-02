$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://builds.balsamiq.com/bwd/Balsamiq_Wireframes_4.7.5_x86_Setup.exe'
  url64bit       = 'https://builds.balsamiq.com/bwd/Balsamiq_Wireframes_4.7.5_x64_Setup.exe'
  softwareName   = 'Balsamiq Wireframes'
  checksum       = 'EC71860708E75D987F0E35B932B8026E438A2D40261C623A0A13C280E2B5A28B'
  checksumType   = 'sha256'
  checksum64     = 'EFE6D0FEC19B91458F1E80E970E8169DF453D63179695D8973D15012B6D4D0DF'
  checksumType64 = 'sha256'
  silentArgs     = "/VERYSILENT /NORESTART /ALLUSERS"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
