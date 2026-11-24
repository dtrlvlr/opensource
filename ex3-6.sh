#!/usr/bin/env bash
set -euo pipefail
if (( $# != 1 )); then echo "사용법: $0 폴더이름" >&2; exit 1; fi
dir=$1
if [[ -e $dir && ! -d $dir ]]; then echo "폴더가 아닌 경로입니다: $dir" >&2; exit 1; fi
mkdir -p -- "$dir"
for i in {0..4}; do printf 'This is file %s.\n' "$i" > "$dir/file$i.txt"; done
(cd -- "$dir" && tar -czf files.tar.gz file{0..4}.txt)
mkdir -p -- "$dir/files"
tar -xzf "$dir/files.tar.gz" -C "$dir/files"
echo '완료: 파일 5개, files.tar.gz, 압축 해제 폴더 files/'
