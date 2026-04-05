#!/usr/bin/env bash
set -euo pipefail

python3 - <<'PY'
from pathlib import Path

path = Path("lib/features/counters/presentation/screen/counter_details_screen.dart")
text = path.read_text(encoding="utf-8")

old = "value: formatDateTime(localizedCounter.startAt),"
new = "value: formatDateTime(localizedCounter.startAt, l10n),"

if old not in text:
    raise SystemExit("Target snippet not found. File may already be fixed or changed.")

path.write_text(text.replace(old, new, 1), encoding="utf-8")
print("Fixed counter_details_screen.dart")
PY
