# Contributing to LexRO

**[English](#english) · [Română](#română)**

---

## English

Thank you for helping improve LexRO. Romanian and EU law in this area changes often, and the reference files were compiled by an AI model, so corrections from people who read the official texts are the most valuable contribution. You can write issues and pull requests in English or Romanian.

### Ways to contribute

- **Report a legal inaccuracy**: open an issue with the [Legal inaccuracy](https://github.com/tiberiugabriel/LexRO/issues/new?template=legal-inaccuracy.yml) template.
- **Ask for more coverage**: a topic, sector, business model or act LexRO should handle, with the [Coverage request](https://github.com/tiberiugabriel/LexRO/issues/new?template=coverage-request.yml) template.
- **Report a bug**: installation, packaging or skill behaviour, with the [Bug report](https://github.com/tiberiugabriel/LexRO/issues/new?template=bug-report.yml) template.
- **Send a pull request** with a fix. For larger changes (a new domain file, a change to the workflow or the response format), open an issue first so we can agree on the approach.

Never include personal data or confidential details about a real business in issues, pull requests or examples.

### Sources

A legal correction must rest on an **official source**. Accepted sources:

| Source | Use it for |
|---|---|
| [Portalul Legislativ](https://legislatie.just.ro) | consolidated Romanian legislation, amendment history |
| [Monitorul Oficial](https://www.monitoruloficial.ro) | official publication, very recent acts |
| [EUR-Lex](https://eur-lex.europa.eu) | EU legislation, consolidated versions, national transposition measures |
| [CJEU (curia.europa.eu)](https://curia.europa.eu), [ÎCCJ](https://www.scj.ro), [CCR](https://www.ccr.ro) | case law |
| Authorities: [ANPC](https://anpc.ro), [ANSPDCP](https://www.dataprotection.ro), [ANAF](https://www.anaf.ro), [ANCOM](https://www.ancom.ro), [DNSC](https://dnsc.ro), [BNR](https://www.bnr.ro) and others | official guidance, decisions, practice |

The full list the skill itself uses is in [`sources-and-verification.md`](skills/lexro/references/sources-and-verification.md). Law firm articles and blogs can point you in the right direction, but they are not enough on their own.

For a directive, also check the Romanian transposition act. For a consolidated text, give the date of the consolidated version.

### Writing rules for skill files

The files in `skills/lexro/` are instructions for Claude, so precision matters more than style.

- **Write in English.** The skill answers in the user's language on its own. Romanian legal terms can stay in Romanian where they have no exact equivalent.
- **The references are a map, not a source.** Say where to look and what to check. Do not write conclusions that only hold on a certain date.
- **No figures from memory.** Thresholds, rates, deadlines and fines go in only with a source and a version date, and the skill must still re-verify them live.
- **Keep Romanian and EU levels clear.** Say whether a rule comes from a directly applicable EU regulation, a directive and its transposition, or purely national law.
- **Acts registry entries** keep their confidence level: **H** (identifier very likely correct), **M** (verify identifier or details first), **ID?** (identifier still to be found). Raise a level only after checking the official text.
- **A new reference file** must be listed in the table in `SKILL.md`, otherwise the skill never reads it. `scripts/ci.sh` checks this.
- Keep the description in the `SKILL.md` frontmatter under 1024 characters and without `<` or `>`.

### Development

Requirements: `bash`, `python3`, `zip`, `unzip`, `curl`. Optional: `shellcheck`, `pwsh` and `ruby`, used by the CI script when installed.

1. Fork and clone the repository, then create a branch.
2. Edit files in `skills/lexro/`.
3. Rebuild the package:

   ```bash
   ./scripts/package.sh
   ```

4. Run the local CI:

   ```bash
   ./scripts/ci.sh
   ```

   It checks the `SKILL.md` frontmatter, that both license copies match, that `CHANGELOG.md` and the README badges show the current version, that every reference file exists and is used, that relative links in the docs work, that `dist/lexro.skill` matches the sources, the shell and PowerShell scripts, the issue forms, and an install and uninstall with `install.sh` from your local copy (no network needed). CI runs only on your machine; there is no GitHub Actions workflow.

5. Test the skill in practice: link your copy into Claude Code (see [Manual installation](README.md#b2-manual)) and ask a few questions that touch your change.
6. Add a line under `[Unreleased]` in `CHANGELOG.md` and open a pull request.

### Versioning

LexRO uses [Semantic Versioning](https://semver.org/), applied to a skill:

- **MAJOR**: changes to the workflow, the response format or the labels that users or other tools may rely on.
- **MINOR**: new domains, new business models, new acts or substantial new guidance.
- **PATCH**: corrections to acts, articles, dates or wording, and fixes to scripts and docs.

### Releases (maintainers)

1. Move the `[Unreleased]` entries in `CHANGELOG.md` to a new `## [X.Y.Z] - YYYY-MM-DD` section and update the links at the bottom.
2. Set `version` and `updated` under `metadata` in `skills/lexro/SKILL.md` to the same values.
3. Update the version and updated badges at the top of `README.md`.
4. Run `./scripts/package.sh`, then `./scripts/ci.sh`.
5. Commit, then tag and push:

   ```bash
   git tag -a vX.Y.Z -m "LexRO X.Y.Z"
   ```

   ```bash
   git push origin main --follow-tags
   ```

6. Create the GitHub release from the tag, with the changelog section as notes and `dist/lexro.skill` attached:

   ```bash
   gh release create vX.Y.Z dist/lexro.skill --title "LexRO X.Y.Z" --notes-file <(awk '/^## \[X.Y.Z\]/{f=1;next} /^## \[|^\[/{f=0} f' CHANGELOG.md)
   ```

### License of contributions

LexRO is licensed under the Apache License 2.0 with the Commons Clause condition (see [LICENSE](LICENSE)). Under section 5 of the Apache License, anything you submit for inclusion is provided under the same terms, unless you state otherwise in writing.

---

## Română

Mulțumim că ajuți la îmbunătățirea LexRO. Legislația românească și europeană din acest domeniu se schimbă des, iar fișierele de referință au fost compilate de un model AI, așa că cele mai valoroase contribuții sunt corecturile venite de la cei care citesc textele oficiale. Poți scrie issue-uri și pull request-uri în română sau în engleză.

### Cum poți contribui

- **Raportează o eroare juridică**: deschide un issue cu șablonul [Eroare juridică](https://github.com/tiberiugabriel/LexRO/issues/new?template=legal-inaccuracy.yml).
- **Propune o acoperire nouă**: un subiect, sector, model de afacere sau act pe care LexRO ar trebui să-l trateze, cu șablonul [Propunere de acoperire](https://github.com/tiberiugabriel/LexRO/issues/new?template=coverage-request.yml).
- **Raportează o problemă tehnică**: instalare, pachet sau comportamentul skill-ului, cu șablonul [Problemă tehnică](https://github.com/tiberiugabriel/LexRO/issues/new?template=bug-report.yml).
- **Trimite un pull request** cu o corectură. Pentru schimbări mai mari (un fișier de domeniu nou, o schimbare a fluxului de lucru sau a formatului de răspuns), deschide întâi un issue, ca să stabilim abordarea.

Nu include niciodată date personale sau detalii confidențiale despre o afacere reală în issue-uri, pull request-uri sau exemple.

### Surse

O corectură juridică trebuie să se bazeze pe o **sursă oficială**. Surse acceptate:

| Sursă | Pentru ce |
|---|---|
| [Portalul Legislativ](https://legislatie.just.ro) | legislația românească în formă consolidată, istoricul modificărilor |
| [Monitorul Oficial](https://www.monitoruloficial.ro) | publicarea oficială, acte foarte recente |
| [EUR-Lex](https://eur-lex.europa.eu) | legislația UE, versiuni consolidate, măsuri naționale de transpunere |
| [CJUE (curia.europa.eu)](https://curia.europa.eu), [ÎCCJ](https://www.scj.ro), [CCR](https://www.ccr.ro) | jurisprudență |
| Autorități: [ANPC](https://anpc.ro), [ANSPDCP](https://www.dataprotection.ro), [ANAF](https://www.anaf.ro), [ANCOM](https://www.ancom.ro), [DNSC](https://dnsc.ro), [BNR](https://www.bnr.ro) și altele | ghiduri oficiale, decizii, practică |

Lista completă folosită de skill este în [`sources-and-verification.md`](skills/lexro/references/sources-and-verification.md). Articolele caselor de avocatură și blogurile te pot orienta, dar nu sunt suficiente singure.

Pentru o directivă, verifică și actul românesc de transpunere. Pentru un text consolidat, indică data formei consolidate.

### Reguli de scriere pentru fișierele skill-ului

Fișierele din `skills/lexro/` sunt instrucțiuni pentru Claude, deci precizia contează mai mult decât stilul.

- **Scrie în engleză.** Skill-ul răspunde singur în limba utilizatorului. Termenii juridici românești pot rămâne în română acolo unde nu au un echivalent exact.
- **Referințele sunt o hartă, nu o sursă.** Spun unde să cauți și ce să verifici. Nu scrie concluzii valabile doar la o anumită dată.
- **Fără cifre din memorie.** Pragurile, cotele, termenele și amenzile se trec doar cu sursă și dată a versiunii, iar skill-ul trebuie oricum să le reverifice live.
- **Păstrează clare nivelurile român și european.** Spune dacă o regulă vine dintr-un regulament UE direct aplicabil, dintr-o directivă și transpunerea ei, sau din dreptul pur național.
- **Intrările din registrul de acte** își păstrează nivelul de încredere: **H** (identificator foarte probabil corect), **M** (verifică întâi identificatorul sau detaliile), **ID?** (identificatorul trebuie găsit). Crește nivelul doar după verificarea textului oficial.
- **Un fișier de referință nou** trebuie trecut în tabelul din `SKILL.md`, altfel skill-ul nu îl citește niciodată. `scripts/ci.sh` verifică asta.
- Descrierea din antetul `SKILL.md` trebuie să rămână sub 1024 de caractere și fără `<` sau `>`.

### Dezvoltare

Cerințe: `bash`, `python3`, `zip`, `unzip`, `curl`. Opțional: `shellcheck`, `pwsh` și `ruby`, folosite de scriptul de CI când sunt instalate.

1. Fă fork și clonează repository-ul, apoi creează un branch.
2. Modifică fișierele din `skills/lexro/`.
3. Reconstruiește pachetul:

   ```bash
   ./scripts/package.sh
   ```

4. Rulează CI-ul local:

   ```bash
   ./scripts/ci.sh
   ```

   Verifică antetul `SKILL.md`, că cele două copii ale licenței sunt identice, că `CHANGELOG.md` și badge-urile din README arată versiunea curentă, că fiecare fișier de referință există și e folosit, că linkurile relative din documentație funcționează, că `dist/lexro.skill` corespunde surselor, scripturile shell și PowerShell, formularele de issue și o instalare și dezinstalare cu `install.sh` din copia ta locală (fără rețea). CI-ul rulează doar pe calculatorul tău; nu există workflow GitHub Actions.

5. Testează skill-ul în practică: leagă copia ta în Claude Code (vezi [Instalare manuală](README.md#b2-manual-1)) și pune câteva întrebări care ating modificarea ta.
6. Adaugă un rând la `[Unreleased]` în `CHANGELOG.md` și deschide un pull request.

### Versionare

LexRO folosește [Semantic Versioning](https://semver.org/), aplicat unui skill:

- **MAJOR**: schimbări ale fluxului de lucru, ale formatului de răspuns sau ale etichetelor pe care se pot baza utilizatorii sau alte unelte.
- **MINOR**: domenii noi, modele de afacere noi, acte noi sau îndrumări noi substanțiale.
- **PATCH**: corecturi de acte, articole, date sau formulări și reparații la scripturi și documentație.

### Publicarea unei versiuni (pentru mentenanți)

1. Mută intrările de la `[Unreleased]` din `CHANGELOG.md` într-o secțiune nouă `## [X.Y.Z] - YYYY-MM-DD` și actualizează linkurile de la final.
2. Setează `version` și `updated` de sub `metadata` din `skills/lexro/SKILL.md` la aceleași valori.
3. Actualizează badge-urile de versiune și dată din capul `README.md`.
4. Rulează `./scripts/package.sh`, apoi `./scripts/ci.sh`.
5. Fă commit, apoi tag și push:

   ```bash
   git tag -a vX.Y.Z -m "LexRO X.Y.Z"
   ```

   ```bash
   git push origin main --follow-tags
   ```

6. Creează release-ul pe GitHub din tag, cu secțiunea din changelog ca note și cu `dist/lexro.skill` atașat:

   ```bash
   gh release create vX.Y.Z dist/lexro.skill --title "LexRO X.Y.Z" --notes-file <(awk '/^## \[X.Y.Z\]/{f=1;next} /^## \[|^\[/{f=0} f' CHANGELOG.md)
   ```

### Licența contribuțiilor

LexRO este licențiat sub Apache License 2.0 cu condiția Commons Clause (vezi [LICENSE](LICENSE)). Conform secțiunii 5 din Apache License, orice trimiți spre includere este oferit în aceleași condiții, dacă nu declari altfel în scris.
