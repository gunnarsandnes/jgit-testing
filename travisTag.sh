#!/usr/bin/env bash
set -e


toEnvironment=TEST
DATETIME=`date "+%Y-%m-%dT%H_%M_%S"`

echo "Setting origin to use correct username and password"
git remote set-url origin https://${GITHUB_USERNAME}:${GITHUB_PASSWORD}@github.com/gunnarsandnes/jgit-testing.git

echo "Git deleting remote tag: ${toEnvironment}_latest"
git push --delete origin ${toEnvironment}_latest || true

echo "Git deleting local tag: ${toEnvironment}_latest"
git tag --delete ${toEnvironment}_latest || true

echo "Git tagging ${toEnvironment}_latest"
git tag ${toEnvironment}_latest

echo "Git tagging ${toEnvironment}_${DATETIME}"
git tag ${toEnvironment}_${DATETIME}

echo "Git pushing"
git push origin --tags

echo "Git pushed, done."