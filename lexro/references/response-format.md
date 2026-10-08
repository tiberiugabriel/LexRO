# Response formats

Write the answer in the user's language, including all headings and labels (see the label table in SKILL.md for Romanian). The templates below are in English for the model.

Adapt length to the request. A simple question gets the short format. Analyses and audits get the full format.

## 1. Short format (specific question)

```
[Direct answer in 1–3 sentences, conditional on missing facts where relevant.]
Level: GREEN / YELLOW / ORANGE / RED

Based on: [act and article, with verification status and official link]
Depends on: [facts that would change the answer, as questions]
[If relevant: what could not be verified / when a specialist is worthwhile]
```

## 2. Full format (analysis)

```
Reference date: [current date]
Live verification: [yes / partial / no: reason]

1. FRAMING
Role(s): [...] (confirmed / inferred, to be confirmed)
Model: [...]  Customers: [...]  Territory: [...]

2. FACTS
Established: [...]
Missing (critical): MISSING: [...]

3. CONCLUSIONS
For each conclusion:
- [conclusion] — Level: [...]
  Type: law / official interpretation / case law / authority practice / own interpretation / assumption
  Basis: [act, article]

4. ACTS AND VERIFICATION STATUS
| Act | Provision | Status | Official source | Version/date |

5. OBLIGATIONS AND STEPS (prioritized)
1. [most urgent / riskiest]
2. ...

6. RISKS
[what can happen if no action is taken; no fine amounts from memory]

7. WHAT COULD NOT BE VERIFIED
[explicit list]

8. SPECIALIST
[if relevant: type of specialist, why, what to bring]
```

## 3. Audit format

```
Audit: [what was audited: site / checkout / policies / platform]
Date: [...]  Basis: [materials received: screenshots, links, texts]
Limits: [what could not be seen or tested]

| # | Requirement | Source of requirement | Status | Note | Priority |
|---|---|---|---|---|---|
Status: COMPLIANT / NON-COMPLIANT / PARTIAL / NOT VERIFIABLE / NOT APPLICABLE
Priority: CRITICAL / HIGH / MEDIUM / LOW

Summary: [count per status; top 3 actions]
```

Do not mark as COMPLIANT anything you could not actually see (e.g. the technical behaviour of a cookie banner from a mere description). Use NOT VERIFIABLE.

## 4. Specialist file format

```
FILE FOR: [lawyer / tax advisor / DPO / ...]
Date: [...]

Situation (briefly): [...]
Precise question: [...]
Established facts: [...]
Missing facts: [...]
Identified acts (with verification status and links): [...]
Options and identified risks: [...]
Attached documents or documents to bring: [...]
Deadlines: [...]
```

## 5. Wording rules

- Visibly separate the legal text from interpretation. Examples: "The text provides..." / "ANSPDCP interprets..." / "My interpretation is..." / "I assume, until you confirm, that...".
- Quote at most short fragments of official texts; usually paraphrase and cite the article.
- Do not quote unverified fine amounts, thresholds or deadlines. If relevant and unverified, say they exist and where to verify them.
- The general notice (guidance, not advice) appears once per conversation or when the stakes change; not in every message.
- End with a concrete next step.
