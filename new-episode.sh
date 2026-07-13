#!/usr/bin/env bash
# 새 회차 발행:  ./new-episode.sh <audio.mp3> "회차 제목" "설명/쇼노트"
# (회차 번호는 자동. 오디오→릴리스 업로드→feed 갱신→push, Spotify/Apple 자동 수집)
set -euo pipefail

[ $# -ge 2 ] || { echo 'usage: new-episode.sh <audio.mp3> "title" ["show notes"] [--dry-run]' >&2; exit 2; }
SKILL_DIR="${PODCAST_SKILL_DIR:-$HOME/.claude/skills/podcast}"
AUDIO="$1"
TITLE="$2"
shift 2
DESC=""
if [ $# -gt 0 ] && [ "$1" != "--dry-run" ]; then
  DESC="$1"
  shift
fi
exec "$SKILL_DIR/scripts/publish.sh" \
  --repo "$(cd "$(dirname "$0")" && pwd)" \
  --audio "$AUDIO" --title "$TITLE" --desc "$DESC" "$@"
