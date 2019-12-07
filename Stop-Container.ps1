$cid = Get-Content .cid
echo $cid
docker stop $cid
rm .cid
