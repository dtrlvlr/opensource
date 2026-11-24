#!/usr/bin/env bash
set -eu
scores=()
while true; do
  cat <<'MENU'
====================
1) 과목 성적 추가
2) 입력된 모든 점수 보기
3) 평균 점수 확인
4) 평균 등급 (GPA) 변환
5) 종료
====================
MENU
  read -r -p '선택: ' choice || break
  case "$choice" in
    1) read -r -p '과목 점수(0~100): ' score
       if [[ $score =~ ^[0-9]+$ ]] && (( score <= 100 )); then scores+=("$score"); echo '추가했습니다.'; else echo '0~100 정수를 입력하세요.'; fi ;;
    2) if (( ${#scores[@]} == 0 )); then echo '입력된 점수가 없습니다.'; else printf '%s\n' "${scores[@]}" | nl -w1 -s'. '; fi ;;
    3) if (( ${#scores[@]} == 0 )); then echo '입력된 점수가 없습니다.'; else awk '{s+=$1} END {printf "평균: %.2f점\n",s/NR}' < <(printf '%s\n' "${scores[@]}"); fi ;;
    4) if (( ${#scores[@]} == 0 )); then echo '입력된 점수가 없습니다.'; continue; fi
       avg=$(awk '{s+=$1} END {printf "%.6f",s/NR}' < <(printf '%s\n' "${scores[@]}"))
       awk -v a="$avg" 'BEGIN {if(a>=95)g="A+ (4.5)";else if(a>=90)g="A (4.0)";else if(a>=85)g="B+ (3.5)";else if(a>=80)g="B (3.0)";else if(a>=75)g="C+ (2.5)";else if(a>=70)g="C (2.0)";else if(a>=65)g="D+ (1.5)";else if(a>=60)g="D (1.0)";else g="F (0.0)";printf "평균 %.2f점 -> %s\n",a,g}' ;;
    5) echo '종료합니다.'; break ;;
    *) echo '1~5 중에서 선택하세요.' ;;
  esac
done
