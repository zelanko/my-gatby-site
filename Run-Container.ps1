# Remove-Item .cid

docker run -it --rm --entrypoint  /bin/sh -p 8000:8000 -p 22:22 mynode

$cname = docker ps --format "{{.Names}}"

docker exec $cname rm /site/*
docker exec $cname rm -rf /site/src

Get-ChildItem . | ForEach-Object {
  docker -l "debug" cp (Resolve-Path $_.Name) ${cname}:/site/${_.Name}
}

docker cp site\src ${cid}:site/src
