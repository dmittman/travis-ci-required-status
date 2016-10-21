#!/usr/bin/env bash

# In this test, we randomly determine success and failure.

context="security"
if [ $((RANDOM % 4)) == 0 ]; then
    state="failure";
    description="The security test has failed!"
  else
    state="success";
    description="The security test has succeeded!"
fi

curl -XPOST -H "Authorization: token $GITHUB_TOKEN" $GITHUB_API_URL/repos/$TRAVIS_REPO_SLUG/statuses/$(git rev-parse HEAD) \
    -d "{\"state\": \"$state\", \"target_url\": "\"$TRAVIS_URL/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID\"", \"description\": \"$description\", \"context\": \"$context\"}"

# End
