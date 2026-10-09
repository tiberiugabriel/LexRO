#!/usr/bin/env bash
# Local CI: runs every repository check and exits non-zero if any check fails.
# CI local: rulează toate verificările repository-ului și iese cu eroare dacă una eșuează.
#
# Usage / Utilizare:  ./scripts/ci.sh
#
# Optional tools / Unelte opționale (checks are skipped if missing / verificările sunt sărite dacă lipsesc):
#   - shellcheck: lint for install.sh and scripts/*.sh
#   - pwsh: syntax check for install.ps1

set -uo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1

SKILL_DIR="$(find skills -mindepth 2 -maxdepth 2 -name SKILL.md -exec dirname {} \; | head -n 1)"
NAME="$(basename "${SKILL_DIR:-unknown}")"
PACKAGE="dist/${NAME}.skill"

TMP="$(mktemp -d 2>/dev/null || mktemp -d -t "${NAME}-ci")"
trap 'rm -rf "$TMP"' EXIT

FAILED=0
pass() { printf '  PASS  %s\n' "$1"; }
fail() { printf '  FAIL  %s\n' "$1"; shift; [ $# -gt 0 ] && printf '%s\n' "$@" | sed 's/^/        /'; FAILED=1; }
skip() { printf '  SKIP  %s (%s)\n' "$1" "$2"; }

printf 'Local CI for %s\n\n' "$NAME"

# 1. SKILL.md frontmatter: allowed keys, name, description, license, version, date.
#    Antetul SKILL.md: chei permise, nume, descriere, licență, versiune, dată.
if [ -z "${SKILL_DIR:-}" ]; then
  fail "skill folder" "no skills/<name>/SKILL.md found"
else
  if out="$(python3 - "$SKILL_DIR" <<'PY' 2>&1
import os, re, sys
skill_dir = sys.argv[1]
text = open(os.path.join(skill_dir, "SKILL.md"), encoding="utf-8").read()
m = re.match(r"^---\n(.*?)\n---\n", text, re.S)
if not m:
    sys.exit("frontmatter missing or not closed with ---")
top, meta, current = {}, {}, None
for line in m.group(1).split("\n"):
    if not line.strip():
        continue
    if line.startswith((" ", "\t")):
        if current != "metadata":
            sys.exit(f"unexpected indented line: {line!r}")
        k, _, v = line.strip().partition(":")
        meta[k.strip()] = v.strip().strip('"').strip("'")
        continue
    k, _, v = line.partition(":")
    current = k.strip()
    top[current] = v.strip()
errors = []
allowed = {"name", "description", "license", "allowed-tools", "metadata", "compatibility"}
extra = set(top) - allowed
if extra:
    errors.append(f"keys not allowed in frontmatter: {', '.join(sorted(extra))}")
name = top.get("name", "")
if not re.fullmatch(r"[a-z0-9]+(-[a-z0-9]+)*", name) or len(name) > 64:
    errors.append(f"name {name!r} must be kebab-case, max 64 characters")
if name != os.path.basename(skill_dir.rstrip("/")):
    errors.append(f"name {name!r} does not match folder {os.path.basename(skill_dir)!r}")
desc = top.get("description", "")
if not desc:
    errors.append("description is missing")
elif len(desc) > 1024:
    errors.append(f"description is {len(desc)} characters, max 1024")
elif "<" in desc or ">" in desc:
    errors.append("description must not contain < or >")
if "LICENSE.txt" not in top.get("license", ""):
    errors.append("license must point to LICENSE.txt")
if not re.fullmatch(r"\d+\.\d+\.\d+", meta.get("version", "")):
    errors.append("metadata.version must be X.Y.Z")
if not re.fullmatch(r"\d{4}-\d{2}-\d{2}", meta.get("updated", "")):
    errors.append("metadata.updated must be YYYY-MM-DD")
if errors:
    sys.exit("\n".join(errors))
print(f"{meta['version']} {meta['updated']}")
PY
)"; then
    read -r VERSION UPDATED <<<"$out"
    pass "SKILL.md frontmatter (version $VERSION, updated $UPDATED)"
  else
    fail "SKILL.md frontmatter" "$out"
  fi
fi
VERSION="${VERSION:-}"
UPDATED="${UPDATED:-}"

# 2. License: both copies identical and naming this skill.
#    Licența: cele două copii identice și cu numele acestui skill.
if [ ! -f LICENSE ] || [ ! -f "$SKILL_DIR/LICENSE.txt" ]; then
  fail "license files" "LICENSE and $SKILL_DIR/LICENSE.txt must both exist"
elif ! cmp -s LICENSE "$SKILL_DIR/LICENSE.txt"; then
  fail "license files" "$SKILL_DIR/LICENSE.txt differs from LICENSE. Run: cp LICENSE $SKILL_DIR/LICENSE.txt"
elif ! grep -qi "^Software: ${NAME}$" LICENSE; then
  fail "license files" "LICENSE must contain the line 'Software: <skill name>'"
else
  pass "license files identical"
fi

# 3. CHANGELOG: the top released entry is the version in SKILL.md, with the same date.
#    CHANGELOG: prima versiune publicată este cea din SKILL.md, cu aceeași dată.
if [ -n "$VERSION" ]; then
  TOP="$(grep -m 1 -E '^## \[[0-9]+\.[0-9]+\.[0-9]+\]' CHANGELOG.md 2>/dev/null || true)"
  if [ "$TOP" = "## [$VERSION] - $UPDATED" ]; then
    pass "CHANGELOG top entry matches $VERSION ($UPDATED)"
  else
    fail "CHANGELOG" "expected top entry '## [$VERSION] - $UPDATED', found '${TOP:-none}'"
  fi
fi

# 4. README badges show the current version and date.
#    Badge-urile din README arată versiunea și data curente.
if [ -n "$VERSION" ]; then
  BADGE_DATE="${UPDATED//-/--}"
  missing=()
  grep -q "badge/version-${VERSION}-" README.md || missing+=("version badge should read $VERSION")
  grep -q "badge/updated-${BADGE_DATE}-" README.md || missing+=("updated badge should read $UPDATED")
  if [ ${#missing[@]} -eq 0 ]; then pass "README badges up to date"; else fail "README badges" "${missing[@]}"; fi
fi

# 5. Every reference file named in the skill exists, and every reference file is used.
#    Fiecare fișier de referință menționat există și fiecare fișier de referință e folosit.
missing=()
while read -r ref; do
  [ "$ref" = "SKILL.md" ] && continue
  [ -f "$SKILL_DIR/references/$ref" ] || missing+=("$ref is mentioned but $SKILL_DIR/references/$ref does not exist")
done < <(grep -ohE '[a-z0-9-]+\.md' "$SKILL_DIR"/SKILL.md "$SKILL_DIR"/references/*.md | sort -u)
for file in "$SKILL_DIR"/references/*.md; do
  base="$(basename "$file")"
  grep -q "$base" "$SKILL_DIR/SKILL.md" || missing+=("$base is not mentioned in SKILL.md")
done
if [ ${#missing[@]} -eq 0 ]; then pass "reference files consistent"; else fail "reference files" "${missing[@]}"; fi

# 6. Relative links in the Markdown docs point to existing files.
#    Linkurile relative din documentația Markdown duc la fișiere existente.
if out="$(python3 - <<'PY' 2>&1
import glob, os, re, sys
docs = [d for d in ["README.md", "CONTRIBUTING.md", "CHANGELOG.md"] + glob.glob(".github/**/*.md", recursive=True) if os.path.exists(d)]
bad = []
for doc in docs:
    text = re.sub(r"```.*?```", "", open(doc, encoding="utf-8").read(), flags=re.S)
    for target in re.findall(r"\]\(([^)\s]+)\)", text):
        if re.match(r"[a-z]+:", target) or target.startswith("#"):
            continue
        path = os.path.normpath(os.path.join(os.path.dirname(doc), target.split("#")[0]))
        if not os.path.exists(path):
            bad.append(f"{doc}: {target}")
if bad:
    sys.exit("\n".join(bad))
PY
)"; then
  pass "relative links in docs"
else
  fail "relative links in docs" "$out"
fi

# 7. The package in dist/ contains exactly the current skill files.
#    Pachetul din dist/ conține exact fișierele actuale ale skill-ului.
if [ ! -f "$PACKAGE" ]; then
  fail "package" "$PACKAGE is missing. Run: ./scripts/package.sh"
elif ! unzip -q "$PACKAGE" -d "$TMP/package" 2>/dev/null; then
  fail "package" "$PACKAGE is not a valid ZIP archive"
elif ! out="$(diff -r -x .DS_Store "$SKILL_DIR" "$TMP/package/$NAME" 2>&1)"; then
  fail "package" "$PACKAGE is out of date. Run: ./scripts/package.sh" "$(printf '%s' "$out" | head -n 5)"
else
  pass "package up to date"
fi

# 8. Shell scripts: syntax always, shellcheck when available.
#    Scripturi shell: sintaxa mereu, shellcheck când e instalat.
syntax_errors=()
for script in install.sh scripts/*.sh; do
  bash -n "$script" 2>/dev/null || syntax_errors+=("$script")
done
if [ ${#syntax_errors[@]} -eq 0 ]; then pass "shell syntax"; else fail "shell syntax" "${syntax_errors[@]}"; fi
if command -v shellcheck >/dev/null 2>&1; then
  if out="$(shellcheck -S warning install.sh scripts/*.sh 2>&1)"; then pass "shellcheck"; else fail "shellcheck" "$out"; fi
else
  skip "shellcheck" "not installed: brew install shellcheck"
fi

# 9. PowerShell installer syntax, when pwsh is available.
#    Sintaxa instalatorului PowerShell, când pwsh e instalat.
if command -v pwsh >/dev/null 2>&1; then
  if out="$(pwsh -NoProfile -Command "\$e=\$null; [System.Management.Automation.Language.Parser]::ParseFile('$ROOT/install.ps1',[ref]\$null,[ref]\$e) | Out-Null; if (\$e) { \$e | ForEach-Object { \$_.ToString() }; exit 1 }" 2>&1)"; then
    pass "install.ps1 syntax"
  else
    fail "install.ps1 syntax" "$out"
  fi
else
  skip "install.ps1 syntax" "pwsh not installed: brew install powershell"
fi

# 10. GitHub issue forms are valid YAML with the required keys, when ruby is available.
#     Formularele de issue GitHub sunt YAML valid, cu cheile obligatorii, când ruby e instalat.
if command -v ruby >/dev/null 2>&1; then
  if out="$(ruby -ryaml -e '
    errors = []
    ARGV.each do |f|
      begin
        d = YAML.safe_load(File.read(f))
        missing = %w[name description body].reject { |k| d.is_a?(Hash) && d[k] }
        errors << "#{f}: missing #{missing.join(", ")}" unless missing.empty?
        (d["body"] || []).each { |b| errors << "#{f}: field without type" unless b["type"] }
      rescue => e
        errors << "#{f}: #{e.message}"
      end
    end
    abort errors.join("\n") unless errors.empty?
  ' .github/ISSUE_TEMPLATE/*.yml 2>&1)"; then
    pass "issue forms"
  else
    fail "issue forms" "$out"
  fi
else
  skip "issue forms" "ruby not installed"
fi

# 11. Installer smoke test against the local working tree (no network).
#     Test rapid al instalatorului pe copia locală (fără rețea).
mkdir -p "$TMP/archive/${NAME}-local"
cp -R skills "$TMP/archive/${NAME}-local/"
tar -czf "$TMP/local.tar.gz" -C "$TMP/archive" "${NAME}-local"
ENV_PREFIX="$(printf '%s' "$NAME" | tr '[:lower:]' '[:upper:]')"
if ! out="$(env "${ENV_PREFIX}_ARCHIVE_URL=file://$TMP/local.tar.gz" bash install.sh --dir "$TMP/installed" 2>&1)"; then
  fail "installer" "install failed" "$out"
elif ! diff -r -x .DS_Store "$SKILL_DIR" "$TMP/installed/$NAME" >/dev/null 2>&1; then
  fail "installer" "installed files differ from $SKILL_DIR"
elif ! bash install.sh --dir "$TMP/installed" --uninstall >/dev/null 2>&1 || [ -e "$TMP/installed/$NAME" ]; then
  fail "installer" "uninstall did not remove $TMP/installed/$NAME"
else
  pass "installer (install + uninstall)"
fi

printf '\n'
if [ "$FAILED" -ne 0 ]; then
  printf 'CI failed / CI a eșuat.\n'
  exit 1
fi
printf 'All checks passed / Toate verificările au trecut.\n'
