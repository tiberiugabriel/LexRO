# Official sources and verification protocol

## Contents
1. Core principle
2. Source hierarchy
3. Official sources: Romania
4. Official sources: EU
5. Verification protocol (step by step)
6. EUR-Lex specifics
7. Portalul Legislativ and Monitorul Oficial specifics
8. Verification statuses
9. Conflicts between sources
10. When tools do not work

---

## 1. Core principle

Any conclusion with legal, tax or compliance effect rests on the official text **verified in the current conversation**. The content of this skill's files is static knowledge compiled at a given date. The "current" version from memory or from these files is not evidence.

The source lists below are **not exhaustive**. If an issue belongs to an authority or register not listed here (a sectoral authority, a ministry, a national or European register), find it and use it, applying the same hierarchy.

## 2. Source hierarchy

**Level 1: official normative text**
- Monitorul Oficial al României (Romania's Official Gazette; official publication)
- Portalul Legislativ (consolidated versions of Romanian acts, run by the Ministry of Justice)
- Official Journal of the EU and EUR-Lex

**Level 2: official case law**
- CJEU (interpretation of EU law, binding on national courts on the interpreted questions)
- Constitutional Court of Romania
- High Court of Cassation and Justice (ÎCCJ), especially appeals in the interest of the law (RIL) and preliminary rulings, which are binding
- other courts (persuasive only)

**Level 3: competent authorities (decisions, guidance, practice)**
- Romanian authorities: ANPC, ANSPDCP, ANAF, ANCOM, DNSC, Competition Council, BNR, ASF, Romanian Customs Authority and sectoral authorities
- EU institutions: European Commission, EDPB, ENISA, AI Office, CPC network

**Level 4: secondary sources**
- legal articles, law-firm or consultancy guides, blogs, forums

Rules:
- Level 4 alone cannot contradict level 1. Use it only as a lead to the primary source.
- Authority guidance is not law, but shows how the authority applies the law. Present it as "official interpretation".
- Consolidated versions (EUR-Lex, Portalul Legislativ) are documentation tools. For sensitive matters, also check the officially published amending acts.

## 3. Official sources: Romania

URLs are the sites' base addresses. Do not build specific page addresses from memory; find the exact page by searching or navigating from the site.

| Source | Base URL | Content |
|---|---|---|
| Portalul Legislativ (Ministry of Justice) | https://legislatie.just.ro | consolidated versions, amendment history, acts in force |
| Monitorul Oficial | https://www.monitoruloficial.ro | official publication, very recent acts |
| Courts portal | https://portal.just.ro | court files and decisions |
| ÎCCJ (High Court of Cassation and Justice) | https://www.scj.ro | RIL, preliminary rulings, case law |
| Constitutional Court | https://www.ccr.ro | constitutionality decisions |
| ANPC (consumer protection) | https://anpc.ro | consumer protection, commercial practices, ADR |
| ANSPDCP (data protection authority) | https://www.dataprotection.ro | GDPR, decisions, sanctions, guidance |
| ANAF (tax administration) | https://www.anaf.ro | VAT, e-Factura, OSS/IOSS, DAC7, forms |
| ANCOM (communications regulator) | https://www.ancom.ro | electronic communications; verify its role in DSA enforcement |
| DNSC (national cybersecurity directorate) | https://dnsc.ro | cybersecurity, NIS2, incidents |
| Competition Council | https://www.consiliulconcurentei.ro | competition, decisions |
| BNR (National Bank of Romania) | https://www.bnr.ro | payment and e-money institutions, registers |
| ASF (financial supervisory authority) | https://asfromania.ro | non-bank financial services |
| ONRC (trade register) | https://www.onrc.ro | company register |
| Romanian Customs Authority | https://www.customs.ro | customs, EORI, imports |
| OSIM (state office for inventions and trademarks) | https://osim.ro | trademarks, designs, patents |
| ORDA (copyright office) | https://www.orda.ro | copyright |
| AFM (Environment Fund Administration) | https://www.afm.ro | environmental contributions and obligations, packaging |
| ANSVSA (food safety authority) | https://www.ansvsa.ro | food safety |
| ANMDMR (medicines and medical devices agency) | https://www.anm.ro | medicines and medical devices |

## 4. Official sources: EU

| Source | Base URL | Content |
|---|---|---|
| EUR-Lex | https://eur-lex.europa.eu | EU legislation, consolidated versions, national transpositions, Official Journal |
| CJEU | https://curia.europa.eu | judgments, opinions, pending cases |
| EDPB | https://www.edpb.europa.eu | GDPR guidelines and decisions |
| European Commission | https://commission.europa.eu | application guidance, Q&As, topical pages (DSA, GPSR, AI Act, e-commerce VAT) |
| ENISA | https://www.enisa.europa.eu | cybersecurity |
| EUIPO | https://www.euipo.europa.eu | EU trademarks and designs |

For the Commission's topical pages (DSA, AI Act, GPSR, Safety Gate, OSS/IOSS), find them through web search; their addresses change.

## 5. Verification protocol

For **each** act a conclusion relies on:

1. **Identify the exact act**: type, number, year, issuer. For EU acts: the CELEX number where possible.
2. **Open the official source** (level 1). If the fetch tool will not accept a URL directly, search for it first and open the official result.
3. **Confirm the status**: in force / repealed / amended / adopted but not yet applicable / phased application.
4. **Note the date of the consolidated version** and check whether there are amending acts newer than the consolidation.
5. **Read the relevant article** in the current version. Do not cite article numbers from memory without having seen them.
6. **Check application dates**, not only entry-into-force dates (often different, especially for recent regulations).
7. **For directives**: check the national transposing act and its differences from the directive. Direct obligations come from national law.
8. **For regulations**: also check national implementing acts (competent authority, sanctions, procedures).
9. **Check interpretation**: guidance from the competent authority, the EDPB or the Commission; relevant case law, if any.
10. **Negative verification**: confirm the obligation has not been repealed, postponed or replaced (see pitfalls.md).
11. **Record** the result in the verification table in the answer (see response-format.md).

Whatever you did not complete is marked accordingly (section 8). No need to verify acts that do not affect the conclusion.

Romanian-language answers: when quoting or paraphrasing EU acts, use the Romanian language version on EUR-Lex so the terminology matches the official text.

## 6. EUR-Lex specifics

- CELEX number for legislation: `3` + year + type (`R` regulation, `L` directive, `D` decision) + 4-digit number. Example: GDPR = `32016R0679`; Directive 2011/83/EU = `32011L0083`.
- Address format for the text (replace `EN` with `RO` for Romanian): `https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:<CELEX number>`. If it does not work, search for the act.
- The act's page shows its status (in force or not), available consolidated versions, amending acts and, for directives, the national transposition measures notified by Member States.
- Consolidated versions are for documentation purposes; the authentic text is the one published in the Official Journal.
- The EUR-Lex list of national transpositions may be incomplete or delayed. Confirm on Portalul Legislativ.

## 7. Portalul Legislativ and Monitorul Oficial specifics

- Search by act type, number and year (e.g. "Legea 190 2018"). Beware of confusion between acts with the same number and different years.
- Check the consolidated version and the list of amending acts. The consolidated version may lag behind very recent amendments.
- For very recent acts or amendments from the last few weeks, also check Monitorul Oficial.
- Check whether the act has implementing rules (government decisions, authority orders) relevant to the question.
- Emergency ordinances (OUG) and ordinances (OG) may be approved with amendments by a law. Check the resulting form.

## 8. Verification statuses

Use these codes in the verification table (translate them into the user's language; see SKILL.md for Romanian):

| Status | Meaning |
|---|---|
| `VERIFIED_IN_FORCE` | text opened on the official source; in force and applicable |
| `VERIFIED_NOT_YET_APPLICABLE` | adopted, applies from a later date |
| `VERIFIED_REPEALED` | repealed or replaced |
| `VERIFIED_RECENTLY_AMENDED` | in force, with recent or imminent amendments to flag |
| `TRANSPOSITION_UNVERIFIED` | directive verified, national act not |
| `AUTHORITY_PRACTICE_UNVERIFIED` | text verified, authority practice or guidance not |
| `CONFLICTING_SOURCES` | official or official-secondary sources disagree |
| `UNVERIFIED` | the official source could not be opened in this conversation |

Never use statuses like "probably in force".

## 9. Conflicts between sources

- Official text vs. secondary source: the official text prevails; flag the conflict.
- National law vs. EU regulation: the regulation applies directly and takes precedence; flag possible non-compliance of national law without firm conclusions (ORANGE).
- Untransposed or incorrectly transposed directive: do not apply the directive directly between private parties; flag the situation and escalate (RED if stakes exist).
- Authority guidance vs. text: present both; say the authority will most likely apply its own guidance, but a court may decide otherwise.
- Two different consolidated versions: check the amending act in Monitorul Oficial or the Official Journal.

## 10. When tools do not work

- No web access or search: say so explicitly at the start of the answer; all legal statements get `UNVERIFIED`; recommend verification on the sources above.
- An official site does not load: try searching; if it still fails, say what you could not open.
- Only secondary sources found: use them only as leads and mark the statement `UNVERIFIED` until confirmed on the primary source.
