#!/bin/sh

YR=2023
DAY=$1
UA="https://github.com/JeffESchmitz/aoc2023"

if [ -z "$DAY" ]; then
    if [ "$(date +%m)" != "12" ]; then
        echo "usage: $0 day   (defaults to today's day only during December)" >&2
        exit 1
    fi
    DAY=$(date +%e | tr -d " ")
fi

case "$DAY" in
    *[!0-9]*) DAY=0 ;;
esac
DAY=$(expr "$DAY" + 0)
if [ "$DAY" -lt 1 ] || [ "$DAY" -gt 25 ]; then
    echo "day must be a number from 1 to 25" >&2
    exit 1
fi

if [ -r .aoc-session ]; then
    AOC_SESSION=$(cat .aoc-session)
fi

if [ -z "$AOC_SESSION" ]; then
    echo "no session found" >&2
    exit 1
fi

D2=$(printf "%02d" "$DAY")
OUT="Sources/Inputs/Day$D2+Input.swift"

echo "getting puzzle input for day $DAY"

INPUT=$(mktemp) || exit 1
trap 'rm -f "$INPUT"' EXIT

if ! curl -fsS "https://adventofcode.com/$YR/day/$DAY/input" \
        --cookie "session=$AOC_SESSION" -H "User-Agent: $UA" -o "$INPUT"; then
    echo "download failed (puzzle not unlocked yet, or session cookie expired?)" >&2
    echo "$OUT was not changed" >&2
    exit 1
fi

{
cat <<END
//
// Advent of Code $YR - input for day $D2
//

extension Day$D2 {
static let input = #"""
END

cat "$INPUT"

cat <<END
"""#
}
END
} >"$OUT"

echo "wrote $OUT"
