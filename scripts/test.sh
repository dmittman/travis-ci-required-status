#!/usr/bin/env bash

./node_modules/jshint/bin/jshint hello.js

./scripts/coverage-status.sh
./scripts/security-status.sh

# End
