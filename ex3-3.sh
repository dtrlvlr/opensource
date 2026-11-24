#!/usr/bin/env bash
set -eu
if (( $# < 1 )); then echo "사용법: $0 점수 [점수 ...] (0~100)" >&2; exit 1; fi
sum=0
for score in "$@"; do
  [[ $score =~ ^[0-9]+$ ]] && (( score <= 100 )) || { echo "점수는 0~100 정수여야 합니다: $score" >&2; exit 1; }
  if (( score >= 90 )); then grade=A; else grade=B; fi
  printf '%s점: %s\n' "$score" "$grade"; sum=$((sum + score))
done
awk -v s="$sum" -v n="$#" 'BEGIN {printf "평균: %.2f점\n평균 등급: %s\n", s/n, (s/n>=90 ? "A" : "B")}'
