#!/usr/bin/env bash

jq_() {
  jq -r "${1}" "${2}" 2> /dev/null \
    | grep -v "^null$"
}
version=`jq_ ".version" "info.json"`
modname=`jq_ ".name" "info.json"`
echo "Releasing  ${modname} ${version}..."

git mv migrations/*.json migrations/${modname}_${version}.json
git add migrations/${modname}_${version}.json

if ! grep "${version}" changelog.txt; then
    echo "Version ${version} not found in changelog.txt"
    exit 1
fi

git commit -m "Release ${version}"
git tag -a "v${version}" -m "Release ${version}"
git push origin main --follow-tags

cd ..
zip -r "${modname}_${version}.zip" "${modname}" > /dev/null
echo "Released ${modname} ${version}!"
echo "Don't forget to upload the zip file to the mod portal!"
echo "The zip file is located at: `realpath ${modname}_${version}.zip`"