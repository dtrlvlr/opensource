#!/usr/bin/env bash
set -euo pipefail
if (( $# != 2 )); then echo "사용법: $0 이름 생일또는전화번호" >&2; exit 1; fi
touch DB.txt
printf '%s %s\n' "$1" "$2" >> DB.txt
echo "기록했습니다: $1 $2 (DB.txt)"
