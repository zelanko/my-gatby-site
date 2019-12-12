# Remove-Item .cid

$SrcPath = Resolve-Path .\site
Write-Output $SrcPath

docker run -it --rm -p 8000:8000 -v ${SrcPath}:/site  my-gatsby-developer

# $cname = docker ps --format "{{.Names}}"

# docker exec $cname rm /site/*
# docker exec $cname rm -rf /site/src

# Get-ChildItem . | ForEach-Object {
#   docker -l "debug" cp (Resolve-Path $_.Name) ${cname}:/site/${_.Name}
# }

# docker cp site\src ${cid}:site/src
