# Link VS Code config from this repo (Windows).
# Run:  powershell -ExecutionPolicy Bypass -File .\install.ps1
# Symlinks need Developer Mode (Settings > System > For developers) or an admin shell;
# otherwise files are copied and you must re-run after `git pull`.
# Overrides: -CodeBin codium  -UserDir C:\path\to\User
param(
  [string]$CodeBin = 'code',
  [string]$UserDir = (Join-Path $env:APPDATA 'Code\User')
)
$ErrorActionPreference = 'Stop'
$Repo  = Split-Path -Parent $MyInvocation.MyCommand.Path
$Stamp = Get-Date -Format 'yyyyMMdd-HHmmss'

function Link([string]$Src, [string]$Dst) {
  New-Item -ItemType Directory -Force -Path (Split-Path $Dst) | Out-Null
  $item = Get-Item -LiteralPath $Dst -Force -ErrorAction SilentlyContinue
  if ($item -and $item.LinkType -eq 'SymbolicLink' -and (@($item.Target) -contains $Src)) {
    Write-Host "ok     $Dst"; return
  }
  if ($item) {
    Move-Item -LiteralPath $Dst -Destination "$Dst.bak-$Stamp"
    Write-Host "backup $Dst.bak-$Stamp"
  }
  try {
    New-Item -ItemType SymbolicLink -Path $Dst -Target $Src | Out-Null
    Write-Host "link   $Dst -> $Src"
  } catch {
    Copy-Item -LiteralPath $Src -Destination $Dst
    Write-Warning "symlink failed; copied $Dst instead. Enable Developer Mode, then re-run."
  }
}

Link (Join-Path $Repo 'vscode\settings.json')    (Join-Path $UserDir 'settings.json')
Link (Join-Path $Repo 'vscode\keybindings.json') (Join-Path $UserDir 'keybindings.json')

if (Get-Command $CodeBin -ErrorAction SilentlyContinue) {
  Get-Content (Join-Path $Repo 'vscode\extensions.txt') |
    Where-Object { $_.Trim() -and $_ -notmatch '^\s*#' } |
    ForEach-Object {
      $ext = $_.Trim()
      & $CodeBin --install-extension $ext 2>&1 | Out-Null
      if ($LASTEXITCODE -eq 0) { Write-Host "ext    $ext" } else { Write-Warning "FAILED $ext" }
    }
} else {
  Write-Warning "'$CodeBin' not on PATH; skipped extensions."
}
Write-Host 'done'
