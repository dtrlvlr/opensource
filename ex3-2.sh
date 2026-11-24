#!/usr/bin/env bash
set -eu
if (( $# < 2 )); then echo "사용법: $0 실수1 실수2 [실수...]" >&2; exit 1; fi
for x in "$@"; do [[ $x =~ ^-?([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]] || { echo "실수가 아닙니다: $x" >&2; exit 1; }; done
awk -v args="$*" 'BEGIN { n=split(args,a," "); for (i=1; i<=n; i++) s += a[i]+0; printf "y = %.6g\n", 0.5*(s/n)^2 }'
