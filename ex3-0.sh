#!/usr/bin/env bash
set -eu
export MYENV='Hello Shell'
line='export MYENV="Hello Shell"'
touch "$HOME/.bashrc"
if ! grep -Fqx "$line" "$HOME/.bashrc"; then printf '\n%s\n' "$line" >> "$HOME/.bashrc"; fi
printf '현재 셸: MYENV=%s\n' "$MYENV"
echo '새 셸 확인: source ~/.bashrc; printf "%s\n" "$MYENV"'
echo '현재 셸에서 해제: unset MYENV (영구 해제는 ~/.bashrc의 export 행도 삭제)'
