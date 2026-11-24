#!/usr/bin/env bash
set -euo pipefail
if (( $# != 1 )); then echo "사용법: $0 이름검색어" >&2; exit 1; fi
if [[ ! -f DB.txt ]]; then echo 'DB.txt 파일이 없습니다.' >&2; exit 1; fi
if ! awk -v q="$1" 'index($1,q)==1 {print; found=1} END {exit !found}' DB.txt; then
  echo "'$1'로 시작하는 팀원을 찾지 못했습니다."
  exit 1
fi
