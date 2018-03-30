#!/bin/bash
set -e

rm -rf _site
bundle exec jekyll build
cd _site

. ../SECRETS
aws s3 sync --delete . s3://hernanex3.com
