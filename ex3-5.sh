#!/usr/bin/env bash
set -u
while true; do
  cat <<'MENU'
====================
1) 사용자 정보
2) CPU/GPU 사용률
3) 메모리 사용량
4) 디스크 사용량
5) 종료
====================
MENU
  read -r -p '선택: ' choice || break
  case "$choice" in
    1) id ;;
    2) if command -v nvidia-smi >/dev/null 2>&1; then nvidia-smi --query-gpu=name,utilization.gpu,memory.used,memory.total --format=csv; elif command -v top >/dev/null 2>&1; then top -b -n 1 | head -n 8; else echo 'top 또는 nvidia-smi를 찾을 수 없습니다.'; fi ;;
    3) if command -v free >/dev/null 2>&1; then free -h; else awk '/MemTotal|MemAvailable/ {print}' /proc/meminfo; fi ;;
    4) df -h ;;
    5) echo '종료합니다.'; break ;;
    *) echo '1~5 중에서 선택하세요.' ;;
  esac
done
