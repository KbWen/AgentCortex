param(
    [string]$Target = '.'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Normalize-PathString {
    param([string]$Path)
    if ($Path -and $Path.StartsWith('\\?\')) { return $Path.Substring(4) }
    return $Path
}

$scriptDir = $PSScriptRoot
if (-not $scriptDir) { $scriptDir = Split-Path -Parent $PSCommandPath }
if (-not $scriptDir) { $scriptDir = (Get-Location).Path }
$scriptDir = Normalize-PathString $scriptDir
$bashScript = [System.IO.Path]::Combine($scriptDir, 'deploy_brain.sh')

if (-not (Test-Path -Path $bashScript -PathType Leaf)) {
    Write-Error "cannot find deploy script: $bashScript"
    exit 1
}

$bashCmd = Get-Command bash -ErrorAction SilentlyContinue
if (-not $bashCmd) {
    Write-Error 'bash is not installed. Install Git Bash or WSL, then rerun deploy_brain.ps1.'
    exit 1
}

& $bashCmd.Source $bashScript $Target
exit $LASTEXITCODE