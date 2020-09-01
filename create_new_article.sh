#!/bin/bash

CMDNAME=`basename $0`
if [ $# -ne 1 ]; then
  echo "Usage: $CMDNAME filename (ex. ttime2019summer)" 1>&2
  exit 1
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    FILENAME="_posts/articles/$(gdate --date '1 day ago' '+%Y-%m-%d')-$1.md"
    DATE="$(gdate --date '1 day ago' '+%Y-%m-%dT%H:%M:%S.%3NZ')"
    IMG_PATH="$(gdate '+%Y/%m/')_thumbnail.jpg"
else
    FILENAME="_posts/articles/$(date --date '1 day ago' '+%Y-%m-%d')-$1.md"
    DATE="$(date --date '1 day ago' '+%Y-%m-%dT%H:%M:%S.%3NZ')"
    IMG_PATH="$(date '+%Y/%m/')_thumbnail.jpg"
fi

touch "$FILENAME"
cat <<EOF > "$FILENAME"
---
published: true
layout: post
title: タイトル
date: "$DATE"
categories:
  - brochure
  - campus-life
  - event
  - dept-intro
  - others
img: "$IMG_PATH"
---

本文
EOF
echo "Created: $FILENAME"
