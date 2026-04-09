#!/usr/bin/env bash

set -euo pipefail

cd /workspaces/Week-2

PORT=5173
URL="http://localhost:${PORT}"
PID_FILE="/tmp/week-2-vite.pid"
LOG_FILE="/tmp/week-2-vite.log"

is_running() {
	if [[ -f "${PID_FILE}" ]]; then
		local pid
		pid="$(cat "${PID_FILE}")"
		if [[ -n "${pid}" ]] && kill -0 "${pid}" 2>/dev/null; then
			return 0
		fi
	fi

	return 1
}

if [[ ! -x node_modules/.bin/vite ]]; then
	echo "Installing dependencies for the dev server..."
	npm install
fi

if is_running; then
	echo "Dev server already running at ${URL}"
	echo "VS Code forwarded URL: ${URL}"
	exit 0
fi

echo "Starting dev server on ${URL}"
nohup npm run dev:host >"${LOG_FILE}" 2>&1 &
echo $! >"${PID_FILE}"

for _ in $(seq 1 30); do
	if grep -q "http://.*:${PORT}" "${LOG_FILE}" 2>/dev/null; then
		break
	fi
	sleep 1
done

if is_running; then
	echo "Website ready at ${URL}"
	echo "VS Code forwarded URL: ${URL}"
	echo "Logs: ${LOG_FILE}"
else
	echo "Dev server exited before becoming ready. Check ${LOG_FILE}" >&2
	exit 1
fi
