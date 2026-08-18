param(
  [Parameter(Mandatory=$true)]
  [string]$File
)

if (-not (Test-Path -LiteralPath $File)) {
  Write-Host "File not found: $File" -ForegroundColor Red
  exit 1
}

$item = Get-Item -LiteralPath $File
$hash = Get-FileHash -LiteralPath $File -Algorithm SHA256

Write-Host ""
Write-Host "MARY Update / Package Metadata"
Write-Host "=============================="
Write-Host "File:   $($item.Name)"
Write-Host "Bytes:  $($item.Length)"
Write-Host "SHA256: $($hash.Hash.ToLower())"
Write-Host ""
