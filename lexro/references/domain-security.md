# Domain: cybersecurity (NIS2, Cyber Resilience Act, technical measures)

Starting acts: acts-registry.md, section G. All verified live.

Security is not just a GDPR appendix. It has three different layers:
1. **general security obligations** (GDPR Art. 32, contracts, payment processor requirements);
2. **NIS2**: obligations for certain entities, depending on sector and size;
3. **Cyber Resilience Act**: obligations for products with digital elements (hardware and software) placed on the market.

## 1. NIS2: does it apply?

Not every online shop falls under NIS2. Check:
- the sector: the annexes of the directive and of the Romanian transposing act (e.g. online marketplace providers, search engines and social networking platforms appear as "digital providers"; cloud services, data centres and managed service providers appear under digital infrastructure or ICT service management; verify the exact classification);
- size: the general rule excludes micro and small enterprises, with exceptions for certain entity types regardless of size; check the thresholds and exceptions in the Romanian act;
- designation by the authority;
- being a supplier to an NIS2 entity: even if not directly in scope, NIS2 customers may impose contractual requirements (supply chain security).

If it applies, check: registration with DNSC, risk-management measures, management body accountability, reporting of significant incidents (staged deadlines; verify exact deadlines), audits, sanctions.

## 2. Cyber Resilience Act: does it apply?

Relevant for manufacturers, importers and distributors of products with digital elements (connected devices, commercially distributed software). Check:
- whether the product is in scope and the exclusions (e.g. some pure SaaS services are treated differently; non-commercial open source; products covered by other acts);
- the product class (default, important, critical);
- essential requirements, vulnerability handling, support period, documentation, CE marking;
- **phased application**: obligations to report actively exploited vulnerabilities and incidents apply before the rest of the regulation; verify the exact dates.

## 3. Baseline technical checklist (for any online business)

Use it in audits. It is not a literal legal requirement but the practical translation of "appropriate measures":
- MFA for all admin accounts and infrastructure access;
- role-based access control, least privilege, periodic access reviews;
- data isolation between sellers or customers (test IDOR/BOLA: can a user access someone else's data by changing an ID?);
- encryption in transit and at rest; key and secret management (not in code, not in the repository);
- dependency updates, vulnerability scanning;
- tested backups, recovery plan;
- audit logs for admin actions and data access, without unnecessary personal data in logs;
- abuse protection: rate limiting, account takeover protection;
- environment separation (no real data in test or staging);
- assessment of providers and third-party integrations;
- incident response procedure: roles, who decides whether it is a personal data breach, deadlines, communication.

## 4. Incidents

A security incident may simultaneously trigger:
- personal data breach notification (GDPR, 72-hour deadline where there is risk);
- NIS2 incident reporting (if the entity is in NIS2 scope; separate deadlines);
- CRA reporting (for manufacturers, regarding products);
- contractual obligations towards customers and payment processors;
- informing users.

These have different deadlines and recipients. See escalation.md (Urgent situations).

## Common pitfalls
- assuming NIS2 automatically applies to every online business or, conversely, never applies;
- ignoring NIS2 requirements imposed contractually by customers;
- software sold as a product without CRA analysis;
- an incident handled purely technically, without assessing notification obligations.

## Specific escalation
- ongoing incident: incident response specialist + DPO/lawyer, immediately;
- uncertain NIS2 classification: specialized lawyer or consultant;
- products with digital elements: product compliance + security specialist.
