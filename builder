echo Version?
read version
echo App name?
read app
echo Environment?
read env

package=$app".tar.gz"

echo $package

echo Building upgrade release locally
MIX_ENV=$env mix do phx.digest, release --env=prod --upgrade

echo Building upgrade release of $app $version in docker container
docker build --build-arg MIX_ENV=$env -t build -f Dockerfilebuilder .
docker run -it --name build -d build sh
docker commit build
docker cp build:/app/_build/$env/rel/$app/releases/$version/$app".tar.gz" ./rel_alpine/
docker rm -f build
echo Release copied to rel_alpine/ and container removed
