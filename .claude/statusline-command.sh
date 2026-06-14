#!/bin/sh
# Claude Code statusLine script
# Combines ccusage statusline output with a color-coded 5-hour / weekly rate limit display.

input=$(cat)

# Run ccusage with the saved input
ccusage_out=$(echo "$input" | bun x ccusage statusline 2>/dev/null)

# Extract rate limits (present only for Claude.ai Pro/Max after the first API response)
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty' 2>/dev/null)
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty' 2>/dev/null)

# ANSI colors (embed the real ESC char so `printf %s` renders them)
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
RED=$(printf '\033[31m')
DIM=$(printf '\033[2m')
RESET=$(printf '\033[0m')

# Color by usage: <50% green, 50-79% yellow, >=80% red
color_for() {
  if [ "$1" -ge 80 ]; then
    printf '%s' "$RED"
  elif [ "$1" -ge 50 ]; then
    printf '%s' "$YELLOW"
  else
    printf '%s' "$GREEN"
  fi
}

# Build "5h NN% · 7d NN%" with a leading icon and per-value coloring
segs=""
if [ -n "$five_pct" ]; then
  p=$(printf '%.0f' "$five_pct")
  segs="5h $(color_for "$p")${p}%${RESET}"
fi
if [ -n "$week_pct" ]; then
  p=$(printf '%.0f' "$week_pct")
  [ -n "$segs" ] && segs="${segs} ${DIM}·${RESET} "
  segs="${segs}Weekly $(color_for "$p")${p}%${RESET}"
fi
rate=""
[ -n "$segs" ] && rate="⏳ ${segs}"

# Output: ccusage result + rate limits
if [ -n "$ccusage_out" ] && [ -n "$rate" ]; then
  printf '%s %s|%s %s' "$ccusage_out" "$DIM" "$RESET" "$rate"
elif [ -n "$ccusage_out" ]; then
  printf '%s' "$ccusage_out"
elif [ -n "$rate" ]; then
  printf '%s' "$rate"
fi
