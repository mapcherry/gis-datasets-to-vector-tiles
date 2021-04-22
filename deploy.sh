#!/usr/bin/env sh

# abort on errors
set -e

mkdir -p dist

cp index.html dist/index.html
apikey="$( cat .apikey )"
sed -i "s/{mapcherry_api_key}/$apikey/g" dist/index.html

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'


git push -f git@github.com:mapcherry/gis-datasets-to-vector-tiles.git master:gh-pages


# cd -
# rm -rf dist/