$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.ultraedit.com/main/ue/win/ue_english.exe'
  url64bit       = 'https://downloads.ultraedit.com/main/ue/win/ue_english_64.exe'
  softwareName   = 'UltraEdit'
  checksum       = '33DBB9743FC760723E1C18FF36A0CAB132815B2D67DDA45BC64A9154F1348B72'
  checksumType   = 'sha256'
  checksum64     = 'AA32582D4736B5A5CB3C4D57C670C8BCDE76C1F93058EB8BAC11AB8DC5C08EB2'
  checksumType64 = 'sha256'
  silentArgs     = "/S"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
