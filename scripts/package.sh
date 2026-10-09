#!/usr/bin/env bash
# Rebuilds dist/lexro.skill (a ZIP containing the lexro/ folder) from skills/lexro/.
# Reconstruiește dist/lexro.skill (un ZIP care conține folderul lexro/) din skills/lexro/.
#
# Usage / Utilizare:  ./scripts/package.sh

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_DIR="$ROOT/skills"
SKILL_DIR="$SKILLS_DIR/lexro"
OUT="$ROOT/dist/lexro.skill"

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  echo "Error: $SKILL_DIR/SKILL.md not found / nu a fost găsit." >&2
  exit 1
fi

# The folder name must match the skill name in the SKILL.md frontmatter.
# Numele folderului trebuie să coincidă cu numele skill-ului din antetul SKILL.md.
NAME="$(sed -n 's/^name:[[:space:]]*//p' "$SKILL_DIR/SKILL.md" | head -n 1 | tr -d '[:space:]')"
if [ "$NAME" != "lexro" ]; then
  echo "Error: skill name in SKILL.md is '$NAME', expected 'lexro'." >&2
  echo "Eroare: numele din SKILL.md este '$NAME', se aștepta 'lexro'." >&2
  exit 1
fi

# The skill ships its own copy of the license; it must match the repo LICENSE.
# Skill-ul include propria copie a licenței; trebuie să fie identică cu LICENSE din repo.
if ! cmp -s "$ROOT/LICENSE" "$SKILL_DIR/LICENSE.txt"; then
  echo "Error: skills/lexro/LICENSE.txt differs from LICENSE. Run: cp LICENSE skills/lexro/LICENSE.txt" >&2
  echo "Eroare: skills/lexro/LICENSE.txt diferă de LICENSE. Rulează: cp LICENSE skills/lexro/LICENSE.txt" >&2
  exit 1
fi

if ! command -v zip >/dev/null 2>&1; then
  echo "Error: 'zip' is not installed / nu este instalat." >&2
  exit 1
fi

mkdir -p "$ROOT/dist"
rm -f "$OUT"

# Zip from skills/ so the archive root is lexro/ (required by the Claude app upload).
# Arhivăm din skills/ ca rădăcina arhivei să fie lexro/ (cerință pentru upload în aplicația Claude).
cd "$SKILLS_DIR"
zip -r -q "$OUT" lexro -x '*.DS_Store' -x '__MACOSX/*'

echo "Built / Construit: $OUT"
unzip -l "$OUT" | tail -n 1
