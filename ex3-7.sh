#!/usr/bin/env bash
set -euo pipefail
if (( $# != 1 )); then echo "사용법: $0 폴더이름" >&2; exit 1; fi
root=$1
if [[ -e $root && ! -d $root ]]; then echo "폴더가 아닌 경로입니다: $root" >&2; exit 1; fi
mkdir -p -- "$root"
for i in {0..4}; do
  name="file$i.txt"
  printf 'This is %s.\n' "$name" > "$root/$name"
  mkdir -p -- "$root/file$i"
  ln -sfn "../$name" "$root/file$i/$name"
done
echo '완료: 파일 5개와 각 파일의 하위 폴더 및 심볼릭 링크를 만들었습니다.'
