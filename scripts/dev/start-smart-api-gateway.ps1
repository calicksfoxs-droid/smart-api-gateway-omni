$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$appUrl = "http://127.0.0.1:20128/login"

function Test-GatewayPort {
  $client = New-Object System.Net.Sockets.TcpClient
  try {
    $connection = $client.BeginConnect("127.0.0.1", 20128, $null, $null)
    return $connection.AsyncWaitHandle.WaitOne(1000) -and $client.Connected
  } catch {
    return $false
  } finally {
    $client.Close()
  }
}

Set-Location $projectRoot
$Host.UI.RawUI.WindowTitle = "Smart API Gateway Next"

Write-Host "Smart API Gateway Next" -ForegroundColor Cyan
Write-Host "Starting the gateway. The first launch may take two minutes..." -ForegroundColor Green

if (Test-GatewayPort) {
  Start-Process $appUrl
  Write-Host "The gateway is already running." -ForegroundColor Green
  exit 0
}

$env:OMNIROUTE_USE_TURBOPACK = "0"
$server = Start-Process -FilePath "npm.cmd" -ArgumentList "run", "dev:windows" -WorkingDirectory $projectRoot -PassThru -NoNewWindow

$ready = $false
for ($attempt = 0; $attempt -lt 180; $attempt++) {
  if ($server.HasExited) {
    throw "Smart API Gateway Next could not be started."
  }

  if (Test-GatewayPort) {
    $ready = $true
    break
  }

  Start-Sleep -Seconds 1
}

if (-not $ready) {
  throw "Startup timed out. Close this window and try again."
}

Start-Process $appUrl
Write-Host "The gateway is open. Keep this window open while using it." -ForegroundColor Green
Wait-Process -Id $server.Id
