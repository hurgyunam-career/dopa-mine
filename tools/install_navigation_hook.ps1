$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path "$PSScriptRoot\.."
$source = Join-Path $repoRoot ".githooks\pre-commit"
$targetDir = Join-Path $repoRoot ".git\hooks"
$target = Join-Path $targetDir "pre-commit"

if (!(Test-Path $source)) {
  throw "Hook source not found: $source"
}

if (!(Test-Path $targetDir)) {
  throw "Git hooks directory not found: $targetDir"
}

Copy-Item -Path $source -Destination $target -Force
Write-Output "Installed pre-commit hook: $target"
