$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.ultraedit.com/main/ue/win/ue_english.exe'
  url64bit       = 'https://downloads.ultraedit.com/main/ue/win/ue_english_64.exe'
  softwareName   = 'UltraEdit'
  checksum       = '017DBC039795E70A547F19881C5541C935593F45D368651C517C18DB2D7754AC'
  checksumType   = 'sha256'
  checksum64     = 'DABD22CDC51C7A56EEEE20B5A403D6A3480A009899E84970887A9A50C7831A2E'
  checksumType64 = 'sha256'
  silentArgs     = "/S"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
