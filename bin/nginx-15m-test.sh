#!/usr/bin/env bash

set -u

URL="${1:-http://127.0.0.1/}"
DURATION_SECONDS=$((15 * 60))
INTERVAL_SECONDS=1
TOTAL_REQUESTS=$((DURATION_SECONDS / INTERVAL_SECONDS))
SUCCESS=0
FAIL=0

echo "Starting 15-minute test against: ${URL}"
echo "Requests: ${TOTAL_REQUESTS} (1 request/second)"

for ((i=1; i<=TOTAL_REQUESTS; i++)); do
  if curl -fsS --max-time 5 "${URL}" > /dev/null; then
    SUCCESS=$((SUCCESS + 1))
    printf "[%04d/%04d] OK\n" "${i}" "${TOTAL_REQUESTS}"
  else
    FAIL=$((FAIL + 1))
    printf "[%04d/%04d] FAIL\n" "${i}" "${TOTAL_REQUESTS}"
  fi

  sleep "${INTERVAL_SECONDS}"
done

echo
echo "Test complete"
echo "Successful requests: ${SUCCESS}"
echo "Failed requests: ${FAIL}"
