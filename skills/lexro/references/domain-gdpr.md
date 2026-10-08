# Domain: data protection (GDPR)

Starting acts: acts-registry.md, section D. References to GDPR articles are indicative: confirm the text in the official version. Always also check EDPB guidelines, ANSPDCP practice, CJEU case law and any legislative amendments proposed or adopted after compilation.

When answering in Romanian, use the GDPR's Romanian terminology: operator (controller), persoană împuternicită (processor), persoană vizată (data subject), operatori asociați (joint controllers), evaluarea impactului (DPIA), responsabil cu protecția datelor (DPO).

## Step 1: roles

For each processing activity, determine:
- **controller** (decides purpose and means);
- **joint controllers** (decide together; Art. 26 requires an arrangement on responsibilities); CJEU case law has broadened the notion, for example for some situations involving social plugins and social media pages; verify current case law;
- **processor** (processes on behalf of the controller; Art. 28 requires a contract with minimum clauses);
- **sub-processors**.

Typical situations to analyse, not assume:
- B2B SaaS storing its customers' customer data: usually processor for that data and controller for its own customers' data;
- marketplace and sellers: may be separate controllers, joint controllers or a combination, depending on who decides what;
- agency managing a client's website: usually processor;
- payment processor: often an independent controller for part of the data; check its documentation.

## Step 2: data map

For each activity: what data, from whom, for what purpose, on what basis, for how long, who has access, where it is stored, to whom it is disclosed, whether it leaves the EEA.

Watch for data collected without the user realising: logs, IPs, device identifiers, session recordings, data sent by SDKs, data from abandoned forms, data sent to AI providers.

## Step 3: legal basis (Art. 6)

Per purpose, not per website:
- performance of a contract (the order, delivery, the account needed for the service);
- legal obligation (invoicing, tax records; check retention periods in tax and accounting law);
- legitimate interest (with a documented balancing test; not for everything);
- consent (freely given, specific, informed, unambiguous, as easy to withdraw; Art. 7);
- special categories of data (Art. 9): health, biometrics, political opinions, etc.; bases are limited and risk increases.

Consent for cookies (ePrivacy) is a separate matter from the GDPR legal basis for subsequent processing. See domain-cookies-marketing.md.

## Step 4: transparency and rights

- informing data subjects (Arts. 13–14): complete, clear, accessible; the privacy policy must describe actual processing, not a template;
- data subject rights (Arts. 15–22): access, rectification, erasure, restriction, portability, objection, rights relating to automated decisions; internal procedures and response deadlines (verify the deadlines);
- automated decisions with legal or similarly significant effects (Art. 22): e.g. automatically rejecting an order based on a fraud score; check the required safeguards.

## Step 5: accountability and documentation

- record of processing activities (Art. 30); check the exemption for small organisations and its conditions (usually inapplicable if processing is not occasional);
- data protection by design and by default (Art. 25);
- data protection impact assessment (DPIA, Art. 35): check ANSPDCP's list of operations requiring a DPIA and EDPB guidance; large-scale profiling, sensitive data and systematic monitoring are signals;
- data protection officer (DPO, Art. 37): check the criteria (regular and systematic monitoring on a large scale, special categories on a large scale, public authorities);
- processor contracts (Art. 28) and sub-processor lists;
- retention and deletion policies, including for backups.

## Step 6: security and breaches

- technical and organisational measures appropriate to the risk (Art. 32); see domain-security.md;
- notifying breaches to the authority (Art. 33) within 72 hours of the controller becoming aware, where the breach poses a risk; the processor notifies the controller without undue delay;
- informing data subjects (Art. 34) where the risk is high;
- internal breach register, including for non-notified breaches.

## Step 7: transfers outside the EEA (Arts. 44–49)

- identify all non-EEA providers (including those with access from outside the EEA, e.g. via technical support);
- the mechanism: adequacy decision (check the current status of the US decision and whether the provider is certified under it), standard contractual clauses + transfer impact assessment, other safeguards;
- informing data subjects about transfers.

## Step 8: Romania-specific aspects

Check Legea 190/2018 for: processing of the national identification number (CNP) and other national identifiers, processing of health and genetic data, employee monitoring (including video), the age of digital consent for minors, the sanctions regime. Do not quote these rules from memory; open the text.

## Minors

Check: the age of consent for information society services in Romania, requirements for verifying parental consent, prohibitions on profiling and profiling-based advertising for minors (GDPR, DSA, EDPB guidance).

## Common pitfalls
- copied privacy policy that does not describe actual processing;
- consent used as the basis for everything, including where not needed (and then impossible to honour on withdrawal);
- missing DPAs with providers;
- transfers to the US or other states without a verified mechanism;
- real data in test environments, logs with personal data kept indefinitely;
- data sent to AI providers without analysis (basis, transfer, use for training);
- assuming "we're small, nobody checks": ANSPDCP also sanctions small companies (check published decisions).

## Specific escalation
- data breach with risk: DPO or specialized lawyer, immediately (the 72-hour deadline is running);
- special categories, large-scale profiling, systematic monitoring: DPO/lawyer (DPIA);
- ANSPDCP complaint or inspection: lawyer;
- complex international transfers: DPO/lawyer.
