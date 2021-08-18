#!/bin/bash


NewVersionNumber=$1
changeLog=$2

if [[ "$NewVersionNumber"x == "x" ]]; then
echo "Please provide NewVersionNumber!!!"
exit
fi

if [[ "$changeLog"x == "x" ]]; then
echo "Please provide changeLog!!!"
exit
fi

./gitConfig.sh

VersionString=`grep -E 's.version.*=' HOFA.podspec`
VersionNumber=`tr -cd [0-9,.] <<<"$VersionString"`
VersionNumber=${VersionNumber:1}
LineNumber=`grep -nE 's.version.*=' HOFA.podspec | cut -d : -f1`

# 3s/1.0.4/1.0.5/g
sed -i "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" HOFA.podspec
echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git add .
git commit -m "${changeLog}"
git push

git tag ${NewVersionNumber}
git push origin ${NewVersionNumber}

pod trunk push ./HOFA.podspec --verbose --use-libraries --allow-warnings

./gitConfig.sh 1