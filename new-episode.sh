#!/usr/bin/env bash
# 새 회차 발행:  ./new-episode.sh <audio.mp3> "회차 제목" "설명/쇼노트"
# (회차 번호는 자동. 오디오→릴리스 업로드→feed 갱신→push, Spotify/Apple 자동 수집)
exec ~/.agents/skills/shared/podcast-publish/scripts/publish.sh \
  --repo "$(cd "$(dirname "$0")" && pwd)" \
  --audio "$1" --title "$2" --desc "${3:-}"
