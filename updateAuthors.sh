#!/bin/bash
#TODO move this to a rake task
git log --pretty=format:"%an"| env LC_ALL=C sort| env LC_ALL=C uniq | env LC_ALL=C sort -u > AUTHORS

