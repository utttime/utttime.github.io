#!/bin/bash

CMDNAME=`basename $0`
if [ $# -ne 1 ]; then
  echo "Usage: $CMDNAME filename (ex. ttime2019summer)" 1>&2
  exit 1
fi

FILENAME="_posts/$(date --date '1 day ago' '+%Y-%m-%d')-$1.md"

touch "$FILENAME"
cat <<EOF > "$FILENAME"
---
published: true
layout: post
title: タイトル
date: $(date --date '1 day ago' '+%Y-%m-%dT%H:%M:%S.%3NZ')
categories:
  - カテゴリ
img: $(date '+%Y/%m/')img_name.jpeg
---

本文
EOF
echo "Created: $FILENAME"
