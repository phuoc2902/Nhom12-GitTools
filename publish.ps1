# Build, tag và push image lên Docker Hub

$tag = 'phuoc4/truonghuyphuoc:v1.0'

Write-Host "Building image $tag..."
docker build -t $tag .

Write-Host "Pushing image $tag to Docker Hub..."
docker login
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

docker push $tag
