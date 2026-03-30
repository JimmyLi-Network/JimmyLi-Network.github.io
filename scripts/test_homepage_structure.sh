#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$(mktemp -d "${TMPDIR:-/tmp}/homepage-build.XXXXXX")"
trap 'rm -rf "$BUILD_DIR"' EXIT

cd "$ROOT_DIR"

bundle exec jekyll build --destination "$BUILD_DIR" >/dev/null

INDEX_HTML="$BUILD_DIR/index.html"
FAVICON_FILE="$BUILD_DIR/favicon.ico"
NORMALIZED_INDEX="$BUILD_DIR/index.normalized.txt"

if [[ ! -f "$INDEX_HTML" ]]; then
  echo "FAIL: generated homepage not found at $INDEX_HTML" >&2
  exit 1
fi

if [[ ! -f "$FAVICON_FILE" ]]; then
  echo "FAIL: generated favicon not found at $FAVICON_FILE" >&2
  exit 1
fi

tr '\n' ' ' <"$INDEX_HTML" | tr -s '[:space:]' ' ' >"$NORMALIZED_INDEX"

assert_contains() {
  local needle="$1"

  if ! grep -Fq -- "$needle" "$NORMALIZED_INDEX"; then
    echo "FAIL: expected homepage to contain: $needle" >&2
    exit 1
  fi
}

assert_contains "News / Updates"
assert_contains "Ongoing Research"
assert_contains "Selected Publications"
assert_contains "Google Scholar"
assert_contains "favicon.ico"
assert_contains "human sensing and on-device AI for wearable platforms"
assert_contains "LiveTag: Sensing Human-Object Interaction through Passive Chipless WiFi Tags"

if grep -Fq -- "HotMobile 2021" "$NORMALIZED_INDEX"; then
  echo "FAIL: homepage should not feature HotMobile 2021 in selected publications" >&2
  exit 1
fi

echo "PASS: homepage contains the expected structure markers"
