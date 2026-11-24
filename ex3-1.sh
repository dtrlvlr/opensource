#!/usr/bin/env bash
set -eu
if (( $# != 2 )); then echo "사용법: $0 정수1 정수2" >&2; exit 1; fi
for n in "$@"; do [[ $n =~ ^-?[0-9]+$ ]] || { echo "정수만 입력하세요: $n" >&2; exit 1; }; done
a=$1; b=$2
printf '덧셈: %d\n뺄셈: %d\n곱셈: %d\n' "$((a+b))" "$((a-b))" "$((a*b))"
if (( b == 0 )); then echo '나눗셈: 0으로 나눌 수 없습니다.'; else printf '나눗셈(정수 몫): %d\n' "$((a/b))"; fi
