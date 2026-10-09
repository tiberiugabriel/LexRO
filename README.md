# LexRO

[![Version](https://img.shields.io/badge/version-1.0.0-2563eb)](CHANGELOG.md)
[![Updated](https://img.shields.io/badge/updated-2026--10--09-2563eb)](CHANGELOG.md)
[![License: Apache 2.0 + Commons Clause](https://img.shields.io/badge/license-Apache%202.0%20%2B%20Commons%20Clause-blue)](LICENSE)
[![Claude skill](https://img.shields.io/badge/Claude-skill-D97757?logo=claude&logoColor=white)](https://support.claude.com/en/articles/12512180-use-skills-in-claude)
[![Jurisdiction: Romania and EU](https://img.shields.io/badge/jurisdiction-RO%20%2B%20EU-002B7F)](#what-it-covers)

**[English](#english) · [Română](#română)**

---

## English

LexRO is a Claude skill for **e-commerce, online platform and GDPR compliance in Romania and the EU**. It works like a team of specialists (lawyer, tax advisor, DPO, security, e-commerce compliance, customs and product compliance): it figures out your role, asks the questions you didn't think to ask, and **verifies on official sources that the law it relies on is still in force** before answering.

> ⚠️ **LexRO provides informational guidance, not legal, tax or accounting advice.** It does not replace a lawyer, tax advisor, chartered accountant or DPO. Always confirm important decisions with a qualified professional.

### What it covers

- Consumer law: distance contracts, right of withdrawal, returns, warranties, prices and discounts, reviews, subscriptions, terms and conditions
- Platforms and marketplaces: DSA, P2B, seller traceability, liability
- Products and imports: GPSR, sectoral rules (CE, cosmetics, toys, food, electronics), customs, EPR
- Data protection: GDPR, Romanian Law 190/2018, cookies and ePrivacy, email/SMS marketing
- Tax: VAT, OSS/IOSS, e-Factura, DAC7
- Payments: payment services, wallets, BNPL, crypto
- Security, AI and data: NIS2, Cyber Resilience Act, AI Act, Data Act
- Intellectual property, competition, advertising and influencers

### How it works

1. **Classifies** your business and role (online shop, marketplace, SaaS, dropshipper, service provider, agency…) and asks you to confirm.
2. **Prioritized intake**: a few questions at a time, critical ones first.
3. **Detects hidden domains** (e.g. "I sell cosmetics" also triggers the cosmetics regulation, CPNP, claims and EPR).
4. **Live verification** on official Romanian and EU sources (Portalul Legislativ, Monitorul Oficial, EUR-Lex, CJEU, ANPC, ANSPDCP, ANAF and others). Anything it could not verify is marked **UNVERIFIED**.
5. **Answers** with confidence levels (GREEN / YELLOW / ORANGE / RED), separating law, official interpretation, case law and its own interpretation.
6. **Escalates** to the right type of specialist when needed, and can prepare a file for them.

It always **answers in the language you write in** (English, Romanian or other languages).

### Example

> I run an online shop in Romania (SRL) selling engraved jewellery. A customer wants to send back a necklace engraved with her daughter's name, 10 days after delivery. There is nothing wrong with it. Do I have to accept the return?

```
Probably not. The 14-day right of withdrawal does not apply to goods made to
the consumer's specifications or clearly personalised, and a name engraved at
the customer's request usually falls in that category. This only covers a
change of mind: if the necklace is not in conformity (faulty or different from
the description), the customer keeps her rights under the legal guarantee of
conformity.

Level: YELLOW

Based on:
- OUG 34/2014 on consumer rights, art. 16 para. (1) lit. c).
  VERIFIED_IN_FORCE, consolidated version of 27.03.2026
  https://legislatie.just.ro/Public/DetaliiDocument/158913
- OUG 140/2021 on contracts for the sale of goods (Directive 2019/771):
  legal guarantee of conformity and remedies. VERIFIED_IN_FORCE
  https://legislatie.just.ro/Public/DetaliiDocument/250044

Depends on:
- Did the customer choose the engraving, or is it a standard design you sell
  to everyone? A standard design is not "personalised" and the 14 days apply.
- Did you tell the customer before the order that this item cannot be
  returned? That information is part of your pre-contract duties.
- Do your terms or website promise a more generous returns policy? If so,
  that promise binds you.
```

*Abridged and illustrative. In a real session LexRO first confirms your role, opens each act on the official source during the conversation and shows the version it relied on. Answers depend on the date and the facts you give.*

### Requirements

- A Claude account with **skills** support (claude.ai web/desktop app, or Claude Code).
- **Web search / web fetch enabled**. Without web access the skill still works, but every legal statement is marked UNVERIFIED.
- In the Claude app, **Code execution and file creation** must be enabled (skills need it).

### Installation

**Quick install for Claude Code:** `npx skills add tiberiugabriel/LexRO -g -a claude-code` or `curl -fsSL https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.sh | bash`. Details below.

The ready-to-upload package is **`dist/lexro.skill`** (a ZIP archive containing the `lexro/` folder). Each version is also attached to its [GitHub release](https://github.com/tiberiugabriel/LexRO/releases/latest), with the changes listed in [`CHANGELOG.md`](CHANGELOG.md).

#### Option A: Claude app (claude.ai web or desktop)

**Free, Pro, Max:**
1. Download [`dist/lexro.skill`](https://github.com/tiberiugabriel/LexRO/raw/main/dist/lexro.skill). If your browser or the upload dialog requires a `.zip` file, rename it to `lexro.zip`.
2. Go to **Settings → Capabilities** and turn on **Code execution and file creation**.
3. Go to **Customize → Skills**, click **+**, then **+ Create skill → Upload a skill**.
4. Upload the file.
5. Make sure **lexro** is toggled on in your skills list.

**Team, Enterprise:** an owner must first enable **Code execution and file creation** and **Skills** in **Organization settings → Plugins & skills → Policy**. Then follow steps 3–5 above.

Menu names can change between app versions; see Anthropic's article [Use skills in Claude](https://support.claude.com/en/articles/12512180-use-skills-in-claude) for the current steps.

#### Option B: Claude Code

Skills installed in the Claude app are **not** synced to Claude Code; install them separately. Claude Code reads personal skills from `~/.claude/skills/<skill-name>/SKILL.md` (all projects) and project skills from `.claude/skills/<skill-name>/SKILL.md` (that project only). See the [Claude Code skills docs](https://code.claude.com/docs/en/skills).

##### B1. One command (recommended)

**With the skills CLI** (needs [Node.js](https://nodejs.org)):

```bash
npx skills add tiberiugabriel/LexRO -g -a claude-code
```

- `-g` installs for your user (all projects). Without it, the skill goes into the current project's `.claude/skills/`.
- `-a claude-code` targets Claude Code. Add `-y` to skip the confirmation prompts.
- The [skills CLI](https://github.com/vercel-labs/skills) is a third-party tool by Vercel Labs and also supports other coding agents.

**With the install script** (no Node.js needed):

macOS / Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.sh | bash
```

Windows (PowerShell):

```powershell
irm https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.ps1 | iex
```

The script downloads the repository from GitHub, copies `skills/lexro` to `~/.claude/skills/lexro` and replaces an older LexRO install if there is one. Options:

| Option | macOS / Linux | Windows |
|---|---|---|
| Current project only | `curl -fsSL …/install.sh \| bash -s -- --project` | `& ([scriptblock]::Create((irm …/install.ps1))) -Project` |
| Custom folder | `… \| bash -s -- --dir <path>` | `… -Dir <path>` |
| Uninstall | `… \| bash -s -- --uninstall` | `… -Uninstall` |
| Specific version | `… \| LEXRO_REF=<tag or branch> bash` | `$env:LEXRO_REF="<tag or branch>"` before running |

(`…` stands for `https://raw.githubusercontent.com/tiberiugabriel/LexRO/main`.)

Piping a script from the internet into your shell runs it with your permissions. If you prefer, open [`install.sh`](install.sh) or [`install.ps1`](install.ps1) first and read it, or use the manual method below.

##### B2. Manual

**macOS / Linux (personal, all projects):**

```bash
mkdir -p ~/.claude/skills
unzip -o ~/Downloads/lexro.skill -d ~/.claude/skills/
ls ~/.claude/skills/lexro    # should list SKILL.md and references/
```

**Windows (PowerShell, personal):**

```powershell
New-Item -ItemType Directory -Force "$env:USERPROFILE\.claude\skills" | Out-Null
Copy-Item "$env:USERPROFILE\Downloads\lexro.skill" "$env:TEMP\lexro.zip"
Expand-Archive "$env:TEMP\lexro.zip" -DestinationPath "$env:USERPROFILE\.claude\skills" -Force
Get-ChildItem "$env:USERPROFILE\.claude\skills\lexro"
```

**From a clone of this repository:**

```bash
git clone https://github.com/tiberiugabriel/LexRO.git
cp -R LexRO/skills/lexro ~/.claude/skills/lexro
```

To make `git pull` update the installed skill automatically, use a symbolic link instead of a copy:

```bash
ln -s "$(pwd)/LexRO/skills/lexro" ~/.claude/skills/lexro
```

**Project-only:** copy the `skills/lexro/` folder to `.claude/skills/lexro/` inside your project.

Claude Code watches the skills folders, so changes usually apply without a restart. If `~/.claude/skills` did not exist when the session started, restart Claude Code.

#### Option C: Claude API

The skill follows the Agent Skills format and can be used with the Claude API. See the [Agent Skills documentation](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview).

### Usage

- **Explicit trigger:** start your message with **`/lexro`**.
  - `/lexro I run a marketplace with sellers from outside the EU. What are my obligations?`
  - `/lexro` alone: it asks what you need (question, audit, document, file for a specialist, urgent incident).
- **In Claude Code**, `/lexro` is also a native slash command (the skill name becomes the command).
- **Automatic trigger:** it also activates when you ask about these topics without the command. Very short questions may not trigger it; use `/lexro` to be sure.

Example requests:
- "Do I need a reject button on my cookie banner?"
- "Audit my checkout for consumer law compliance."
- "Write the terms and conditions for my online shop."
- "We had a data breach this morning. What do I do?"

### Updating and uninstalling

- **Claude app:** delete the old skill in **Customize → Skills**, then upload the new `lexro.skill`.
- **Claude Code:** run the same install command again (`npx skills add …` or the install script). If you installed manually, replace the folder, or `git pull` if you used a symbolic link.
- **Uninstall from Claude Code:** `curl -fsSL https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.sh | bash -s -- --uninstall` (or `-Uninstall` with `install.ps1`), or simply delete `~/.claude/skills/lexro`.
- **Uninstall from the Claude app:** delete the skill in **Customize → Skills**.

### Repository structure

```
LexRO/
├── README.md                 # this file (EN + RO)
├── CHANGELOG.md              # changes per version
├── CONTRIBUTING.md           # how to report errors and contribute (EN + RO)
├── LICENSE                   # Apache 2.0 with Commons Clause
├── .github/                  # issue and pull request templates
├── install.sh                # one-command installer for Claude Code (macOS / Linux)
├── install.ps1               # one-command installer for Claude Code (Windows)
├── skills/
│   └── lexro/                # the skill
│       ├── SKILL.md          # workflow, core rules, /lexro trigger
│       ├── LICENSE.txt       # copy of LICENSE, shipped with the skill
│       └── references/       # intake, domain files, sources, escalation, formats
├── dist/
│   └── lexro.skill           # ready-to-upload package for the Claude app (ZIP)
└── scripts/
    ├── package.sh            # rebuilds dist/lexro.skill
    └── ci.sh                 # local CI: runs every repository check
```

### Contributing

Found an act that is wrong, repealed or not yet applicable? Please [report a legal inaccuracy](https://github.com/tiberiugabriel/LexRO/issues/new?template=legal-inaccuracy.yml) with a link to the official source. To suggest new coverage or report a bug, see [`CONTRIBUTING.md`](CONTRIBUTING.md).

After editing files in `skills/lexro/`, rebuild the package and run the local CI:

```bash
./scripts/package.sh
```

```bash
./scripts/ci.sh
```

### Limitations

- `skills/lexro/references/acts-registry.md` is a **starting map compiled by an AI model, not verified act by act**. Each entry has a confidence level (H / M / ID?). The skill re-verifies acts live, but correcting the registry improves results.
- The URLs of official sources are base addresses written from memory; verify them once.
- The skill can be wrong. Legislation changes often, especially tax rules.

### License

LexRO is licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) with the [Commons Clause](https://commonsclause.com/) condition. See [`LICENSE`](LICENSE).

In plain terms:

- **You can** use LexRO for free, including inside your own business (for example, to check your own shop's compliance), modify it and share it.
- **You cannot** sell it: you may not charge for LexRO itself, a modified version of it, or a product or service (including hosting, consulting or support) whose value comes entirely or substantially from LexRO.
- When you share it, keep the `LICENSE` file and the copyright notice.

This summary is for convenience only; the `LICENSE` file is the binding text. For uses not covered, contact the author.

---

## Română

LexRO este un skill Claude pentru **conformitatea în comerțul electronic, platformele online și GDPR, în România și UE**. Funcționează ca o echipă de specialiști (jurist, consultant fiscal, DPO, securitate, conformitate e-commerce, vamă și conformitatea produselor): îți stabilește rolul, îți pune întrebările la care nu te-ai gândit și **verifică pe surse oficiale că legea pe care se bazează e încă în vigoare** înainte să răspundă.

> ⚠️ **LexRO oferă orientare informativă, nu consultanță juridică, fiscală sau contabilă.** Nu înlocuiește un avocat, un consultant fiscal, un expert contabil sau un DPO. Confirmă întotdeauna deciziile importante cu un specialist calificat.

### Ce acoperă

- Dreptul consumatorului: contracte la distanță, dreptul de retragere, retururi, garanții, prețuri și reduceri, recenzii, abonamente, termeni și condiții
- Platforme și marketplace-uri: DSA, P2B, trasabilitatea vânzătorilor, răspundere
- Produse și import: GPSR, reguli sectoriale (CE, cosmetice, jucării, alimente, electronice), vamă, EPR
- Protecția datelor: GDPR, Legea 190/2018, cookies și ePrivacy, marketing prin email/SMS
- Fiscal: TVA, OSS/IOSS, e-Factura, DAC7
- Plăți: servicii de plată, portofele, BNPL, cripto
- Securitate, AI și date: NIS2, Cyber Resilience Act, AI Act, Data Act
- Proprietate intelectuală, concurență, publicitate și influenceri

### Cum funcționează

1. **Clasifică** afacerea și rolul tău (magazin online, marketplace, SaaS, dropshipper, prestator de servicii, agenție…) și îți cere confirmarea.
2. **Intake prioritizat**: câteva întrebări pe rând, întâi cele critice.
3. **Detectează domeniile ascunse** (de exemplu, „vând cosmetice" declanșează și regulamentul cosmeticelor, CPNP, afirmațiile despre produs și EPR).
4. **Verificare live** pe surse oficiale din România și UE (Portalul Legislativ, Monitorul Oficial, EUR-Lex, CJUE, ANPC, ANSPDCP, ANAF și altele). Ce nu a putut verifica marchează **NEVERIFICAT**.
5. **Răspunde** cu niveluri de încredere (VERDE / GALBEN / PORTOCALIU / ROȘU), separând legea, interpretarea oficială, jurisprudența și propria interpretare.
6. **Escaladează** la tipul potrivit de specialist când e nevoie și poate pregăti un dosar pentru acesta.

**Răspunde mereu în limba în care îi scrii** (română, engleză sau alte limbi).

### Exemplu

> Am un magazin online (SRL) și vând bijuterii gravate. O clientă vrea să returneze un colier gravat cu numele fiicei ei, la 10 zile de la livrare. Produsul nu are nicio problemă. Sunt obligat să accept returul?

```
Probabil nu. Dreptul de retragere de 14 zile nu se aplică bunurilor
confecționate după specificațiile consumatorului sau personalizate în mod
clar, iar un nume gravat la cererea clientei intră de regulă în această
categorie. Excepția privește doar răzgândirea: dacă produsul nu este conform
(defect sau diferit de descriere), clienta păstrează drepturile din garanția
legală de conformitate.

Nivel: GALBEN

Temei:
- OUG 34/2014 privind drepturile consumatorilor, art. 16 alin. (1) lit. c).
  VERIFICAT – ÎN VIGOARE, forma consolidată din 27.03.2026
  https://legislatie.just.ro/Public/DetaliiDocument/158913
- OUG 140/2021 privind contractele de vânzare de bunuri (Directiva
  2019/771): garanția legală de conformitate și remediile.
  VERIFICAT – ÎN VIGOARE
  https://legislatie.just.ro/Public/DetaliiDocument/250044

Depinde de:
- Clienta a ales gravura sau e un model standard pe care îl vinzi tuturor?
  Un model standard nu e „personalizat”, iar cele 14 zile se aplică.
- I-ai spus clientei înainte de comandă că produsul nu poate fi returnat?
  Informarea face parte din obligațiile tale precontractuale.
- Termenii sau site-ul tău promit o politică de retur mai generoasă? Dacă da,
  promisiunea te obligă.
```

*Exemplu prescurtat și ilustrativ. Într-o sesiune reală, LexRO îți confirmă întâi rolul, deschide fiecare act pe sursa oficială în timpul conversației și arată versiunea pe care s-a bazat. Răspunsurile depind de dată și de faptele pe care le dai.*

### Cerințe

- Un cont Claude cu suport pentru **skill-uri** (aplicația claude.ai web/desktop sau Claude Code).
- **Căutare web / acces web activat**. Fără acces web skill-ul funcționează, dar marchează toate afirmațiile juridice NEVERIFICAT.
- În aplicația Claude trebuie activată opțiunea **Code execution and file creation** (skill-urile au nevoie de ea).

### Instalare

**Instalare rapidă pentru Claude Code:** `npx skills add tiberiugabriel/LexRO -g -a claude-code` sau `curl -fsSL https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.sh | bash`. Detalii mai jos.

Pachetul gata de încărcat este **`dist/lexro.skill`** (o arhivă ZIP care conține folderul `lexro/`). Fiecare versiune e atașată și la [release-ul de pe GitHub](https://github.com/tiberiugabriel/LexRO/releases/latest), iar modificările sunt în [`CHANGELOG.md`](CHANGELOG.md).

#### Varianta A: aplicația Claude (claude.ai web sau desktop)

**Free, Pro, Max:**
1. Descarcă [`dist/lexro.skill`](https://github.com/tiberiugabriel/LexRO/raw/main/dist/lexro.skill). Dacă browserul sau fereastra de upload cere un fișier `.zip`, redenumește-l în `lexro.zip`.
2. Mergi la **Settings → Capabilities** și activează **Code execution and file creation**.
3. Mergi la **Customize → Skills**, apasă **+**, apoi **+ Create skill → Upload a skill**.
4. Încarcă fișierul.
5. Verifică dacă **lexro** e activat în lista de skill-uri.

**Team, Enterprise:** un owner trebuie să activeze întâi **Code execution and file creation** și **Skills** în **Organization settings → Plugins & skills → Policy**. Apoi urmezi pașii 3–5 de mai sus.

Denumirile meniurilor se pot schimba de la o versiune la alta; pașii actuali sunt în articolul Anthropic [Use skills in Claude](https://support.claude.com/en/articles/12512180-use-skills-in-claude).

#### Varianta B: Claude Code

Skill-urile instalate în aplicația Claude **nu** se sincronizează cu Claude Code; trebuie instalate separat. Claude Code citește skill-urile personale din `~/.claude/skills/<nume-skill>/SKILL.md` (toate proiectele) și pe cele de proiect din `.claude/skills/<nume-skill>/SKILL.md` (doar acel proiect). Vezi [documentația Claude Code despre skill-uri](https://code.claude.com/docs/en/skills).

##### B1. O singură comandă (recomandat)

**Cu CLI-ul skills** (necesită [Node.js](https://nodejs.org)):

```bash
npx skills add tiberiugabriel/LexRO -g -a claude-code
```

- `-g` instalează pentru utilizatorul tău (toate proiectele). Fără el, skill-ul ajunge în `.claude/skills/` din proiectul curent.
- `-a claude-code` alege Claude Code. Adaugă `-y` ca să sari peste confirmări.
- [CLI-ul skills](https://github.com/vercel-labs/skills) este un instrument terț, de la Vercel Labs, și funcționează și cu alți agenți de programare.

**Cu scriptul de instalare** (nu necesită Node.js):

macOS / Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.sh | bash
```

Windows (PowerShell):

```powershell
irm https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.ps1 | iex
```

Scriptul descarcă repository-ul de pe GitHub, copiază `skills/lexro` în `~/.claude/skills/lexro` și înlocuiește o instalare LexRO mai veche, dacă există. Opțiuni:

| Opțiune | macOS / Linux | Windows |
|---|---|---|
| Doar proiectul curent | `curl -fsSL …/install.sh \| bash -s -- --project` | `& ([scriptblock]::Create((irm …/install.ps1))) -Project` |
| Folder ales | `… \| bash -s -- --dir <cale>` | `… -Dir <cale>` |
| Dezinstalare | `… \| bash -s -- --uninstall` | `… -Uninstall` |
| O anumită versiune | `… \| LEXRO_REF=<tag sau branch> bash` | `$env:LEXRO_REF="<tag sau branch>"` înainte de rulare |

(`…` înseamnă `https://raw.githubusercontent.com/tiberiugabriel/LexRO/main`.)

Un script descărcat de pe internet și trimis direct în terminal rulează cu permisiunile tale. Dacă preferi, deschide și citește întâi [`install.sh`](install.sh) sau [`install.ps1`](install.ps1), ori folosește metoda manuală de mai jos.

##### B2. Manual

**macOS / Linux (personal, toate proiectele):**

```bash
mkdir -p ~/.claude/skills
unzip -o ~/Downloads/lexro.skill -d ~/.claude/skills/
ls ~/.claude/skills/lexro    # trebuie să apară SKILL.md și references/
```

**Windows (PowerShell, personal):**

```powershell
New-Item -ItemType Directory -Force "$env:USERPROFILE\.claude\skills" | Out-Null
Copy-Item "$env:USERPROFILE\Downloads\lexro.skill" "$env:TEMP\lexro.zip"
Expand-Archive "$env:TEMP\lexro.zip" -DestinationPath "$env:USERPROFILE\.claude\skills" -Force
Get-ChildItem "$env:USERPROFILE\.claude\skills\lexro"
```

**Dintr-o clonă a acestui repository:**

```bash
git clone https://github.com/tiberiugabriel/LexRO.git
cp -R LexRO/skills/lexro ~/.claude/skills/lexro
```

Ca `git pull` să actualizeze automat skill-ul instalat, folosește un link simbolic în loc de copie:

```bash
ln -s "$(pwd)/LexRO/skills/lexro" ~/.claude/skills/lexro
```

**Doar pentru un proiect:** copiază folderul `skills/lexro/` în `.claude/skills/lexro/` din proiectul tău.

Claude Code urmărește folderele de skill-uri, așa că modificările se aplică de obicei fără restart. Dacă `~/.claude/skills` nu exista când a pornit sesiunea, repornește Claude Code.

În Finder, folderul `.claude` e ascuns. Îl deschizi cu `open ~/.claude/skills` în Terminal sau cu **Cmd + Shift + G** în Finder.

#### Varianta C: Claude API

Skill-ul respectă formatul Agent Skills și poate fi folosit prin Claude API. Vezi [documentația Agent Skills](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview).

### Utilizare

- **Trigger explicit:** începe mesajul cu **`/lexro`**.
  - `/lexro Am un marketplace cu vânzători din afara UE. Ce obligații am?`
  - `/lexro` singur: te întreabă ce ai nevoie (întrebare, audit, document, dosar pentru specialist, incident urgent).
- **În Claude Code**, `/lexro` e și comandă slash nativă (numele skill-ului devine comanda).
- **Trigger automat:** se activează și când întrebi despre aceste subiecte fără comandă. Întrebările foarte scurte pot să nu-l declanșeze; folosește `/lexro` ca să fii sigur.

Exemple de cereri:
- „Trebuie să am buton de refuz pe bannerul de cookies?"
- „Fă-mi un audit al checkout-ului pe dreptul consumatorului."
- „Scrie-mi termenii și condițiile pentru magazinul online."
- „Am avut o breșă de date azi-dimineață. Ce fac?"

### Actualizare și dezinstalare

- **Aplicația Claude:** șterge skill-ul vechi din **Customize → Skills**, apoi încarcă noul `lexro.skill`.
- **Claude Code:** rulează din nou aceeași comandă de instalare (`npx skills add …` sau scriptul de instalare). Dacă ai instalat manual, înlocuiește folderul sau dă `git pull` dacă ai folosit link simbolic.
- **Dezinstalare din Claude Code:** `curl -fsSL https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.sh | bash -s -- --uninstall` (sau `-Uninstall` cu `install.ps1`) ori, simplu, șterge folderul `~/.claude/skills/lexro`.
- **Dezinstalare din aplicația Claude:** șterge skill-ul din **Customize → Skills**.

### Structura repository-ului

```
LexRO/
├── README.md                 # acest fișier (EN + RO)
├── CHANGELOG.md              # modificările pe versiuni
├── CONTRIBUTING.md           # cum raportezi erori și cum contribui (EN + RO)
├── LICENSE                   # Apache 2.0 cu Commons Clause
├── .github/                  # șabloane pentru issue-uri și pull request-uri
├── install.sh                # instalator cu o comandă pentru Claude Code (macOS / Linux)
├── install.ps1               # instalator cu o comandă pentru Claude Code (Windows)
├── skills/
│   └── lexro/                # skill-ul
│       ├── SKILL.md          # fluxul de lucru, regulile de bază, triggerul /lexro
│       ├── LICENSE.txt       # copie a LICENSE, inclusă în skill
│       └── references/       # intake, fișiere pe domenii, surse, escaladare, formate
├── dist/
│   └── lexro.skill           # pachetul gata de încărcat în aplicația Claude (ZIP)
└── scripts/
    ├── package.sh            # reconstruiește dist/lexro.skill
    └── ci.sh                 # CI local: rulează toate verificările repository-ului
```

### Contribuții

Ai găsit un act greșit, abrogat sau încă neaplicabil? [Raportează o eroare juridică](https://github.com/tiberiugabriel/LexRO/issues/new?template=legal-inaccuracy.yml), cu link către sursa oficială. Pentru propuneri de acoperire nouă sau probleme tehnice, vezi [`CONTRIBUTING.md`](CONTRIBUTING.md#română).

După ce modifici fișiere în `skills/lexro/`, reconstruiește pachetul și rulează CI-ul local:

```bash
./scripts/package.sh
```

```bash
./scripts/ci.sh
```

### Limite

- `skills/lexro/references/acts-registry.md` este o **hartă de pornire compilată de un model AI, neverificată act cu act**. Fiecare intrare are un nivel de încredere (H / M / ID?). Skill-ul reverifică actele live, dar corectarea registrului îmbunătățește rezultatele.
- Adresele surselor oficiale sunt adrese de bază scrise din memorie; verifică-le o dată.
- Skill-ul poate greși. Legislația se schimbă des, mai ales cea fiscală.

### Licență

LexRO este licențiat sub [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) cu condiția [Commons Clause](https://commonsclause.com/). Vezi [`LICENSE`](LICENSE).

Pe scurt:

- **Poți** folosi LexRO gratuit, inclusiv în propria afacere (de exemplu, pentru a verifica conformitatea propriului magazin), îl poți modifica și distribui.
- **Nu poți** să-l vinzi: nu ai voie să ceri bani pentru LexRO, pentru o versiune modificată a lui sau pentru un produs ori serviciu (inclusiv hosting, consultanță sau suport) a cărui valoare provine în totalitate sau în mare parte din LexRO.
- Când îl distribui, păstrează fișierul `LICENSE` și mențiunea de copyright.

Acest rezumat are doar rol informativ; textul obligatoriu este fișierul `LICENSE`. Pentru utilizări neacoperite, contactează autorul.
