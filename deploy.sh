#!/bin/bash
set -e

. ./SECRETS
bundle exec jekyll build
cd _site
aws s3 sync --delete . s3://hernanex3.com
