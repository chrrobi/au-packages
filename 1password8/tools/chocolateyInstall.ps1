$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = '1password8'
  fileType       = 'msi'
  softwareName   = '1Password 8'

  checksum       = '4c0855316934fbb9af712df2bdbc7c11e46b4569af2e6f2d4d7e6574d13f05cb'
  checksumType   = 'sha256'
  url            = 'https://downloads.1password.com/win/1PasswordSetup-latest.msi'

  silentArgs     = '/qn'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
