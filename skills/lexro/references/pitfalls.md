# Cross-cutting pitfalls and final check

Domain-specific pitfalls are in the domain files. These are the errors that occur across all domains, especially when an AI is answering.

## 1. Outdated information presented as current

The biggest risk for an AI assistant. Examples of situation types (verify them live; they may themselves be outdated):
- **ODR platform**: the obligation to link to the European ODR platform appears in many old templates; according to the compiler, the platform has been closed and the regulation repealed;
- **acts with phased application** (AI Act, Cyber Resilience Act, the packaging regulation, Data Act): adoption date ≠ application date, and the timeline may be changed later;
- **legislative proposals** (e.g. simplifications to GDPR, the cookie regime or the AI Act; the new payment services framework): a proposal is not law; check whether it was adopted, published and from when it applies;
- **tax**: rates, thresholds, regimes (microenterprise, e-Factura) changed frequently;
- **repealed or replaced Romanian acts** following transposition of new directives (e.g. older warranty legislation, the old product safety law after GPSR, NIS1 legislation).

Rule: if you did not verify it in this conversation, it is not "current".

## 2. Frequent confusions

- GDPR consent ≠ cookie consent (ePrivacy);
- platform ≠ seller; liability depends on consumer perception and the actual role;
- legal guarantee ≠ commercial guarantee;
- directive ≠ direct obligation for businesses (national transposition matters);
- regulation ≠ absence of national legislation (implementing acts set authorities and sanctions);
- authority guidance ≠ law (but shows how the authority will apply the law);
- declared B2B ≠ actual B2B;
- "the supplier has CE" ≠ documented conformity;
- the platform's reporting obligation (DAC7) ≠ the seller's tax obligations;
- "I don't know" ≠ "it doesn't apply".

## 3. Reasoning errors

- concluding by analogy with another country (rules in other EU states may differ in transposition);
- generalising one authority decision to all cases;
- concluding from secondary sources without primary confirmation;
- ignoring exemptions (microenterprises, excluded services) or, conversely, applying them without checking the conditions;
- figures from memory (fines, thresholds, deadlines);
- article numbers from memory, without verification.

## 4. Final check before sending the answer

Go through these questions:
1. Is the answer in the user's language, with official legal terminology for that language?
2. Did I confirm the user's role, or mark it as inferred?
3. Did I identify the domains the user did not mention?
4. Did I verify live every act a conclusion relies on? Is everything unverified marked `UNVERIFIED`?
5. Did I do the negative verification (repeals, postponements, later application)?
6. Did I separate law from interpretation and assumption?
7. Is there any unvalidated figure, deadline, threshold or article number in the answer?
8. Did I invent any link? (Only use links actually seen or the base addresses in sources-and-verification.md.)
9. Did I mark the confidence level?
10. Should the situation be escalated? Did I name the type of specialist?
11. Is the answer proportionate to the question?
