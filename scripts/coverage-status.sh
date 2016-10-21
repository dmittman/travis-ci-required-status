#!/usr/bin/env bash

# In this test, we always succeed.

context="continuous-integration/coverage"
state="success";
description="You have achieved the required coverage!"

curl -XPOST -H "Authorization: token $GITHUB_TOKEN" $GITHUB_API_URL/repos/$TRAVIS_REPO_SLUG/statuses/$(git rev-parse HEAD) \
    -d "{\"state\": \"$state\", \"target_url\": "\"$TRAVIS_URL/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID\"", \"description\": \"$description\", \"context\": \"$context\"}"

# End
