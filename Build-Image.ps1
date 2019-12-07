[CmdletBinding()]
param (
    [Parameter()]
    [switch]
    $RerunNpm,

    [Parameter()]
    [switch]
    $RunImage
)


if ($RerunNpm -and (Test-Path ${pwd}\site\node_modules)) {
  Remove-Item ${pwd}\site\node_modules -Recurse -Force
}

docker build --rm -f "Dockerfile" -t mynode .

# if ($RunImage) {
  .\Run-Container.ps1
# }
