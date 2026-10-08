# Domain: payments and financial services

Starting acts: acts-registry.md, section F. All verified live, including whether the proposed changes to the payment services framework (PSD3/PSR) have been adopted and when they apply.

## The central question

Does the business hold, even temporarily, other people's money? If so, it may be providing a payment service or issuing e-money, activities that require authorisation (BNR in Romania) or the use of an authorised provider.

## What to establish

### 1. Money flow
- does the buyer pay the seller directly, through the seller's processor?
- does the buyer pay the platform, which then transfers to the seller?
- does the money pass through the platform's own bank account?
- is a "Connect"-type / marketplace payments service used, where the authorised processor holds the funds and handles distribution?

### 2. Exclusions to check
- **commercial agent exclusion** (PSD2): may cover some situations where the platform acts on behalf of only the payer or only the payee; interpretation is restrictive and contested for marketplaces. Check the text, guidance and BNR practice. Do not conclude without a specialist (ORANGE or RED);
- **limited network exclusion** (cards or credit usable only within a limited network): check the conditions and any notification obligations.

### 3. Risky products
- internal wallet, account credit, top-up balance: possible e-money;
- loyalty points convertible into money or transferable;
- escrow (funds held until delivery);
- instalments or BNPL: consumer credit (check the new consumer credit directive, its transposition and application date);
- crypto-assets: MiCA, anti-money laundering.

### 4. Operational obligations
- strong customer authentication (SCA) and its exemptions (usually handled by the processor; check the configuration);
- recurring payments and subscriptions: mandate, information, cancellation (see also domain-consumer.md);
- chargebacks and disputes;
- card scheme rules (contractual, not legislative, but binding through the processor contract);
- anti-money laundering: check whether the business is an obliged entity (usually not if it provides no financial services; check for crypto, gambling, high-value goods paid in cash, etc.).

### 5. Payment data
- do not store card data unless necessary; PCI DSS requirements apply via the processor contract;
- the GDPR role of the payment processor (see domain-gdpr.md).

## Common pitfalls
- a marketplace collecting into its own account and paying sellers, without authorisation or an authorised provider;
- account credit turned, without analysis, into something resembling e-money;
- "interest-free instalments" offered directly, without analysing the credit regime;
- assuming the processor automatically handles all obligations.

## Specific escalation
- any model where the business holds or redistributes money: lawyer specialized in financial services (RED until analysed);
- BNPL, credit, crypto: specialized lawyer;
- notices from BNR, ASF or the processor about breaches: lawyer, immediately.
