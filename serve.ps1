param(
  [int]$Port = 4173
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$site = Join-Path $root 'site'

if (-not (Test-Path (Join-Path $site 'index.html'))) {
  throw "Не найден $site\index.html"
}

$url = "http://127.0.0.1:$Port/"
Write-Host "Портфолио: $url  (Ctrl+C — остановить)" -ForegroundColor Green
Start-Process $url
python -m http.server $Port --directory $site --bind 127.0.0.1
