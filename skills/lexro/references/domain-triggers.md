# Domain triggers

Purpose: from a few facts about the business, identify every domain that must be analysed, including those the user did not mention.

The lists below are **examples, not closed lists**. If an activity suggests a domain not listed here, analyse it and look up the applicable acts on official sources.

## 1. Domains

| Code | Domain | File |
|---|---|---|
| D-CONS | Consumer rights, distance contracts, prices, commercial practices | domain-consumer.md |
| D-PLAT | Platforms, intermediaries, DSA, P2B | domain-platforms.md |
| D-PROD | Product safety, sectoral legislation, CE, EPR | domain-products-import.md |
| D-CUST | Imports, customs, EU responsible operator | domain-products-import.md |
| D-GDPR | Personal data protection | domain-gdpr.md |
| D-COOK | Cookies, tracking, electronic marketing | domain-cookies-marketing.md |
| D-TAX | VAT, invoicing, e-Factura, OSS/IOSS, DAC7 | domain-tax.md |
| D-PAY | Payment services, collecting for third parties, credit, crypto | domain-payments.md |
| D-SEC | Cybersecurity, NIS2, CRA | domain-security.md |
| D-AI | AI Act | domain-ai-data.md |
| D-DATA | Data Act, connected products | domain-ai-data.md |
| D-IP | Intellectual property, licences | domain-ip-competition-advertising.md |
| D-COMP | Competition | domain-ip-competition-advertising.md |
| D-ADV | Advertising, influencers, product claims | domain-ip-competition-advertising.md |
| D-ACC | Accessibility | domain-consumer.md (Accessibility section) |
| D-MIN | Minors | cross-cutting: GDPR, DSA, consumer, advertising, products |

## 2. Activity → domains

| Activity | Domains to check |
|---|---|
| B2C online shop, products from the EU | D-CONS, D-GDPR, D-COOK, D-TAX, D-PROD, D-ACC, D-ADV |
| Exclusively B2B online shop | D-GDPR, D-COOK, D-TAX, D-PROD, B2B contracts (Civil Code); verify that consumers are really excluded and how |
| Dropshipping | D-CONS, D-PROD, D-CUST, D-TAX (import VAT, IOSS), D-GDPR, D-COOK, D-ADV |
| B2C marketplace | D-PLAT, D-CONS, D-PROD, D-TAX (incl. DAC7 and deemed supplier), D-GDPR, D-COOK, D-PAY, D-COMP, D-ACC |
| B2B marketplace | D-PLAT (P2B), D-COMP, D-GDPR, D-TAX, contracts |
| Marketplace with non-EU sellers | everything for marketplaces + D-CUST, seller verification, dangerous products |
| Service platform (bookings, providers) | D-PLAT, D-CONS, D-GDPR, D-COOK, D-TAX, D-PAY; check whether the services are sector-regulated |
| B2B SaaS | D-GDPR (often processor), D-SEC, D-AI, D-DATA (cloud switching), D-TAX, D-IP, B2B contracts |
| B2C SaaS / app | D-CONS (digital content and services), D-GDPR, D-COOK, D-SEC, D-AI, D-ACC, D-MIN, D-TAX |
| Subscriptions | D-CONS (renewal, cancellation, withdrawal), D-PAY (recurring payments), D-GDPR, D-TAX |
| Digital content (courses, ebooks) | D-CONS (withdrawal exception and its conditions), D-IP, D-TAX, D-GDPR |
| SaaS or product with AI | D-AI, D-GDPR (automated decisions, transfers), D-IP, D-CONS, D-SEC, D-DATA |
| Hardware / IoT | D-PROD (CE, radio equipment, EMC), D-SEC (CRA), D-DATA, D-GDPR, D-CUST if imported |
| Software sold as a product | D-SEC (CRA), D-IP (licences), D-CONS |
| Children's products | D-PROD (toys, safety), D-MIN, D-ADV, D-GDPR |
| Food and supplements | D-PROD (food law, labelling, notifications), D-ADV (nutrition and health claims), D-CONS, D-TAX |
| Cosmetics | D-PROD (cosmetics regulation, responsible person, CPNP notification), D-ADV (claims), D-CUST if imported |
| Fashion and textiles | D-PROD (textile labelling, safety), D-IP (trademarks, counterfeiting), D-CONS, EPR |
| Electronics | D-PROD (CE, low voltage, EMC, radio equipment, RoHS), WEEE, batteries, D-CUST |
| Agency / software house | D-IP, D-GDPR (processor), D-SEC, B2B contracts, D-TAX |
| Affiliate / influencer | D-ADV, D-CONS (commercial practices), D-TAX |
| Crypto / digital assets | D-PAY (MiCA, AML), D-CONS, D-TAX |

## 3. Hidden signals in what the user says

The user may say these in any language; the examples are in English.

| User says | What it triggers |
|---|---|
| "we use Meta Pixel / Google Ads / TikTok Pixel" | D-COOK (consent before loading), D-GDPR (transfers, joint controllership) |
| "we have a newsletter" | D-COOK (electronic marketing), D-GDPR (basis, proof of consent, unsubscribe) |
| "we send SMS or WhatsApp messages" | D-COOK (electronic commercial communications), D-GDPR |
| "monthly subscription", "free trial" | D-CONS (auto-renewal, information, cancellation), D-PAY |
| "products come from China / Turkey / USA" | D-CUST, D-PROD (EU responsible operator), D-TAX (import VAT, IOSS) |
| "own brand", "white label", "private label" | possible manufacturer role: D-PROD |
| "we collect payments and pay the sellers" | D-PAY (possible regulated payment service), D-TAX |
| "account credit", "wallet", "convertible loyalty points" | D-PAY (e-money?), D-TAX (vouchers), D-CONS |
| "pay in instalments", "buy now pay later" | D-PAY (consumer credit), D-CONS |
| "chatbot", "AI assistant", "personalized recommendations" | D-AI (transparency), D-GDPR (profiling), D-CONS |
| "dynamic pricing", "personalized prices" | D-CONS (information on personalized pricing), D-AI, D-GDPR |
| "we generate descriptions / images with AI" | D-AI (transparency for generated content), D-IP, D-ADV |
| "reviews", "ratings" | D-CONS (review verification), D-ADV, D-PLAT |
| "discounts", "Black Friday", "crossed-out price" | D-CONS (prior price for discounts), D-ADV |
| "eco", "sustainable", "green" | D-ADV (environmental claims), D-CONS |
| "children", "students", "teenagers" | D-MIN across all domains |
| "medical data", "health", "biometrics" | D-GDPR (special categories), possible DPIA, RED for escalation |
| "mobile app" | D-COOK (SDKs), D-GDPR, D-ACC, D-SEC |
| "connected device", "sensors", "IoT" | D-DATA, D-SEC (CRA), D-PROD |
| "we deliver across the EU", "multilingual site" | D-CONS (law of the actively targeted consumer's state), D-TAX (OSS), geo-blocking |
| "we have over X employees / high turnover" | check microenterprise exemptions and obligations for larger entities (DSA, NIS2, accessibility) |
| "we received a notice / an inspection / a complaint" | ESCALATION: Urgent situations |
| "our account was hacked / data leaked" | ESCALATION: Urgent situations (breach), D-SEC, D-GDPR |

## 4. Triggering rules

- **Ambiguity expands, it does not narrow.** If it is unclear whether a domain applies, mention it as "to be checked" along with the question that would settle it.
- **"Pure" B2B must be verified.** Many businesses call themselves B2B but accept orders from private individuals. Ask how they prevent that.
- **Being online does not automatically mean actively targeting other states.** Analyse language, currency, delivery, targeted advertising. The conclusion is interpretive: ORANGE if unclear.
- **Sectoral legislation has verification priority.** For goods, the general safety framework is not enough; identify sectoral rules first.
