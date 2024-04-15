$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = '1password8'
  fileType       = 'msi'
  softwareName   = '1Password 8'

  checksum       = '2842A176BD3505033578FDC190D663EB947F21005ECD9CB8169FFC27476D08BA'
  checksumType   = 'sha256'
  url            = 'https://c.1password.com/dist/1P/win8/1PasswordSetup-8.10.27.msi'

  silentArgs     = '/qn'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
