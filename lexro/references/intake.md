# Classification and intake

## Contents
1. Classification engine
2. Roles and signals
3. Universal intake (P1/P2/P3)
4. Role modules
5. Specialist lenses (questions users don't ask)
6. How to ask
7. Missing-fact codes

Ask the questions in the user's language. The question lists below are written in English for the model; translate them naturally.

---

## 1. Classification engine

Walk through this sequence. Each level can trigger new domains.

```
ENTITY (natural person, PFA, II, IF, SRL, SA, NGO, non-Romanian entity)
  → BUSINESS MODEL (sells directly / intermediates / subscription / services / software)
  → WHAT IS SOLD (physical goods / digital content / digital services / traditional services / mix)
  → TO WHOM (B2C / B2B / both; vulnerable persons, minors)
  → WHERE (RO / other EU states / outside the EU; which markets are actively targeted)
  → WHO CONTRACTS WITH WHOM (who is the trader at checkout)
  → MONEY FLOW (who collects, who invoices, does money pass through the platform?)
  → DATA FLOW (what data, where, to whom, outside the EEA?)
  → PRODUCT FLOW (where it ships from, who imports, who delivers, who handles returns)
  → TECHNOLOGY (AI, tracking, pixels, SDKs, IoT, mobile app)
  → TRIGGERED DOMAINS (see domain-triggers.md)
  → ACTS + AUTHORITIES
  → MISSING FACTS
  → RISK
  → ANSWER / ESCALATE
```

Romanian entity forms: PFA (persoană fizică autorizată, authorized self-employed individual), II (întreprindere individuală), IF (întreprindere familială), SRL (limited liability company), SA (joint-stock company).

## 2. Roles and signals

A user can have several roles. Always confirm the classification.

| Role | Typical signals | Watch out for |
|---|---|---|
| Online shop (direct seller) | "I sell on my website", own stock | whether it is also manufacturer or importer |
| Marketplace | "other sellers list on my site", commission | whether the platform appears as seller at checkout, whether it collects payments |
| Service intermediation platform | listed providers, bookings, leads | P2B, DSA, who is liable for the service |
| SaaS / software | subscription, account, customer data in the platform | controller vs. processor (GDPR), B2C vs. B2B |
| Digital content | courses, ebooks, templates, apps | right of withdrawal and its exceptions, conformity of digital content |
| Dropshipper | "I don't hold stock", non-EU supplier | who is importer and liable for the product; customs, VAT |
| Importer | brings products from outside the EU | GPSR, sectoral legislation, customs, EPR |
| Manufacturer | makes the product or puts its own brand on it | CE marking, technical documentation; own brand can make you a manufacturer |
| Online service provider | consulting, coaching, services delivered at a distance | service starting during the withdrawal period |
| Agency / software house | builds websites or apps for clients | IP, licences, GDPR role regarding client data, liability for vulnerabilities |
| Affiliate / influencer / publisher | promotes other people's products | advertising, commercial practices, disclosure of sponsored content |

**Hidden role rule:** whoever puts their brand on a product, substantially modifies it, or first places it on the EU market may have manufacturer or importer obligations, even if they consider themselves "just a shop". Verify this rule in the text of the applicable acts; do not assume it.

## 3. Universal intake

### P1: critical (no conclusion without them)

1. What legal form does the business have and where is it established?
2. What exactly do you sell? (physical goods / digital content / services / software / combinations)
3. Do you sell to consumers (B2C), businesses (B2B) or both?
4. In which countries do you actually sell or deliver? Do you actively target other countries (language, currency, delivery)?
5. Who appears as the seller at checkout and on the invoice: you or a third party?
6. What personal data do you collect, and from whom?

### P2: important (change the obligations)

7. Who collects the money, and through which payment processor? Does other people's money pass through your account?
8. Where do products ship from? From inside or outside the EU? Who is the manufacturer?
9. Do you have subscriptions, free trials or auto-renewal?
10. What third-party tools are on the site or app (analytics, ad pixels, chat, CRM, email marketing)?
11. Do you use AI in the product or operations (recommendations, chatbot, pricing, moderation, content generation)?
12. Do you have user accounts? Reviews?

### P3: completes the picture

13. Are you VAT-registered? Do you use OSS/IOSS?
14. Do you have employees or contractors with access to data?
15. Where is the data hosted? Which providers have access?
16. Do you already have Terms, a Privacy Policy, a Cookie Policy? Who wrote them and when were they last updated?
17. Have you had complaints, incidents or inspections?

## 4. Role modules

Activate only the module matching the confirmed role.

### Online shop
- Product category: is it sector-regulated? (see domain-triggers.md)
- Are you manufacturer, importer or distributor for each category?
- How do you handle returns and warranties? Who pays for returns?
- Do you have personalized or perishable products? (exceptions to the right of withdrawal)
- How do you calculate the "prior price" for discounts?
- Do you use countdowns, "limited stock", "X people are viewing now"? Are they real?

### Marketplace / intermediation platform
- Who concludes the contract with the customer: the platform or the seller?
- What data do you collect about sellers and how do you verify them?
- Do you have sellers who are private individuals rather than traders? Sellers from outside the EU?
- How does ranking work? Is there paid placement?
- Is there a mechanism for reporting illegal content or products?
- How do you suspend or remove a seller? Is there an internal complaint system?
- Do you collect the money and pass it on to sellers? (possible payment services issue)
- Do you also sell your own products on the same platform? (self-preferencing, competition)
- Who is liable to the buyer for defective products and returns?
- Do you have obligations to report sellers to the tax authority (DAC7)?

### SaaS
- B2B, B2C or both?
- Do your customers upload third parties' personal data into the platform? (you are a processor)
- Do you have DPAs with customers? A list of sub-processors?
- Where is hosting? Are there transfers outside the EEA?
- Trial, auto-renewal, cancellation, refunds?
- AI features? Does the AI provider use the data for training?
- Enterprise customers with security or data residency requirements?
- Is the software also sold as an installable product? (possible Cyber Resilience Act)

### Dropshipper
- Who manufactures, where, and where does the parcel ship from?
- Who is the importer on paper? Who clears customs and pays import VAT?
- Is there an economic operator responsible in the EU for the product?
- Do you have the conformity documents (declaration of conformity, technical documentation, labelling)?
- Who handles returns, warranties and recalls?
- Is the product restricted (electronics, toys, cosmetics, food, supplements, batteries)?

### Online service provider
- Does the service start before the withdrawal period expires? Do you have the customer's express consent and acknowledgement that they lose the right of withdrawal after full performance? (verify the exact conditions in the text)
- Do you promise results? Do you make health, financial earnings or performance claims?
- Do you use subcontractors with access to customer data?

### Agency / software house
- Who owns the rights in the code, design and content (including AI-generated content)?
- Do you work with employees or contractors? Do their contracts provide for assignment of rights?
- Do you use open-source components? What licences, and are they compatible with delivery to the client?
- Do you access your client's customers' personal data? (processor, DPA)
- Who owns the domain, cloud accounts, repository?
- Who is liable for vulnerabilities after delivery? Is there a warranty or maintenance period?

## 5. Specialist lenses

These are the questions users usually do not ask. Use them selectively, depending on the triggered domains.

### Lawyer
- Can you prove which terms the customer accepted and which version was in force at the time of the order?
- Can you prove the price and information displayed before the order?
- Are the terms actively accepted or merely available on the site?
- What happens if a seller on the platform disappears? Who is liable to the consumer?
- Do you have clauses that may be considered unfair (broad liability limitations, unilateral changes, jurisdiction)?
- What is the applicable law, and what protections does a consumer in another actively targeted state keep?

### Tax advisor / accountant
- Who is the seller for tax purposes? Could the platform be a deemed supplier?
- Where is the place of supply?
- How do you treat refunds, chargebacks, vouchers, gift cards, internal credit?
- Is the platform commission invoiced separately?
- Do you have e-Factura obligations for your type of transactions?
- Do you have a permanent establishment in another state through your activity there?

### DPO
- Do analytics or pixels fire before consent?
- Is rejecting cookies as easy as accepting them?
- Can sellers on the platform see buyers' data? On what basis and within what limits?
- Does data reach an AI provider? Is it used for training?
- Do test environments contain real data? Do logs contain emails, IPs, tokens?
- Do backups respect deletion periods?
- Do you have a record of processing activities? Do you need a DPIA or a DPO?

### Security specialist
- Can a seller or customer see someone else's data by changing an ID in the URL or API (IDOR/BOLA)?
- Is MFA enabled on admin accounts? Who can export the entire database?
- Is there an audit log for order changes and data access?
- Where are API keys and secrets stored? What happens if a provider's key is compromised?
- Is there an incident response procedure? Who decides whether an incident is a personal data breach?

### E-commerce compliance specialist
- What exactly appears on the product page, in the cart, at checkout and in the confirmation email?
- Does the order button clearly indicate an obligation to pay?
- How does withdrawal from the contract work online, concretely?
- How are reviews handled and verified?
- Is there accessibility testing?
- Are Terms, Privacy Policy and Cookie Policy versioned?

### Customs advisor / product compliance
- What is the product's tariff code? Do you have an EORI number if you import?
- Does the product fall under sectoral legislation (see domain-triggers.md)?
- Who is the responsible economic operator in the EU?
- Do you have extended producer responsibility obligations (packaging, WEEE, batteries)?

## 6. How to ask

- Group: "To tell you exactly what applies, I need 3 things: ..."
- Ask first the questions that change the conclusion most.
- Offer answer options when the user may not know the terms ("Does the customer pay you or the seller directly?").
- If an answer opens a new domain, say so: "That means import VAT also comes into play; I'll get back to it."
- Do not ask for information you will not use.
- If the user declines or doesn't know, continue with a conditional answer and mark the missing fact.

## 7. Missing-fact codes

Use them in the answer (translated into the user's language) so it is clear what blocks the conclusion:

- `MISSING: ROLE` (seller, intermediary, manufacturer, importer)
- `MISSING: CUSTOMER_TYPE` (B2C/B2B)
- `MISSING: TERRITORY` (countries of sale/delivery)
- `MISSING: PRODUCT` (category, sectoral regulation)
- `MISSING: MANUFACTURER_IMPORTER`
- `MISSING: MONEY_FLOW`
- `MISSING: DATA_FLOW` (what data, where, transfers)
- `MISSING: VAT_STATUS`
- `MISSING: THIRD_PARTY_TOOLS` (pixels, analytics, SaaS)
- `MISSING: AI_USE`
- `MISSING: SIZE` (employees, turnover; matters for some exemptions, e.g. microenterprises)
