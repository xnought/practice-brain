#!/bin/bash

if [[ -x `which s5cmd` ]]; then
	s5cmd sync s3://openneuro.org/ds000102/* ds000102/
elif [[ -x `which aws` ]]; then
	aws s3 sync --no-sign-request s3://openneuro.org/ds000102 ds000102/
else
	echo "aws not found, please download the CLI or install s5cmd for fast downloads for s3 buckets"
fi