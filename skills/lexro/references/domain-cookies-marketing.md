# Domain: cookies, tracking, electronic marketing

Starting acts: acts-registry.md, section D (ePrivacy, Legea 506/2004, GDPR). Verify live, including any EU-level changes to the cookie regime proposed or adopted after compilation.

## Core principle

Two regimes apply in parallel and must be analysed separately:
1. **ePrivacy (in Romania, Legea 506/2004)**: storing information on, or accessing information already stored on, the user's device (cookies, local storage, pixels, fingerprinting, SDKs) requires consent, except where strictly necessary for the service explicitly requested by the user or for transmitting the communication. Verify the exact wording of the exceptions.
2. **GDPR**: processing of personal data obtained through these technologies needs a legal basis, transparency, retention limits, a transfer mechanism, etc.

Do not conclude "it's lawful because we have GDPR consent" or "it's not personal data, so it doesn't matter": ePrivacy applies whether or not the information is personal data.

## What to check on the site or app

### Inventory
- all cookies and similar technologies: name, provider, purpose, duration, first or third party;
- SDKs in mobile apps and what they transmit on first launch;
- ad pixels, analytics scripts, session recording, chat widgets, maps, embedded videos, fonts loaded from third parties (may transmit the IP).

### Consent mechanism
- nothing non-essential loads before the user's choice (check technically, not just declaratively);
- rejecting is as accessible as accepting (check EDPB and ANSPDCP guidance on banners);
- no pre-ticked boxes, no "continued browsing = consent";
- granular consent per purpose;
- withdrawing consent as easy as giving it;
- proof of consent (log);
- periodic renewal (check the authority's recommendations).

### Specific tools
- Google Analytics, Meta Pixel, TikTok Pixel, Google Ads, LinkedIn Insight, etc.: consent before loading, analysis of transfers outside the EEA, possible joint controllership (check CJEU case law on plugins and pixels);
- "cookieless" or "consent mode" setups: check what data is still sent before consent;
- "consent-free" analytics: check whether the authority accepts an exemption for audience measurement and under what conditions; do not assume.

## Electronic marketing

### Email
- unsolicited commercial emails generally require prior consent;
- the existing customer exception (soft opt-in): verify the exact conditions in Legea 506/2004 (similar products or services, opportunity to object at collection and in every message, etc.);
- B2B: check whether the regime differs for legal entities' addresses in Romania and for employees' named addresses;
- easy unsubscribe in every message;
- identification of the sender and of the commercial nature;
- proof of consent (when, how, what text the user accepted).

### SMS, WhatsApp, push notifications, calls
- check the regime for each channel (consent, automated calls, opt-out lists);
- push notifications: operating-system consent does not automatically cover legal marketing requirements.

### Profiling and remarketing
- custom audiences (uploading email lists to ad platforms): legal basis, information, transfer, roles of the parties;
- remarketing based on site behaviour: consent for tracking + GDPR basis;
- advertising to minors: additional restrictions (DSA, GDPR).

## Common pitfalls
- a banner that only informs ("we use cookies") without actual blocking;
- a big "Accept" button and hidden "Settings", with no "Reject" on the first layer;
- a tag manager that loads scripts anyway;
- the cookie list in the policy differing from what actually runs;
- purchased email lists;
- "soft opt-in" applied to people who never bought anything;
- embedded fonts, maps or videos transmitting data before consent.

## Specific escalation
- ANSPDCP complaint or inspection on cookies or marketing: lawyer/DPO;
- large-scale campaigns with profiling or sensitive data: DPO.
