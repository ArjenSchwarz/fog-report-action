#!/bin/bash

/usr/sbin/fog report --latest --output markdown --stackname "$1" --file resultfile
while read p; do
  echo "$p" >> $GITHUB_STEP_SUMMARY
done <resultfile
