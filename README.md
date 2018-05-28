# UKÁZKOVÁ APLIKACE PRO PŘIHLÁŠENÍ POMOCÍ OAUTH2.0

Ukázková aplikace pro komunikaci autorizčním servrem

Je potřeba přidat systémové proměnné:

* APP_OAUTH_CALLBACK=/auth/eurosignal/callback
  Adresa přesměrování, kterou jsme zadali při vytváření OAuth aplikace

* APP_OAUTH_REQUEST_PATH=/auth/:provider
  Není potřeba měnit. Jde o cestu, kde autorizujeme aplikaci. (Výchozí jako `/auth/eurosignal`)

* APP_URL=http://localhost:3001
  URL pro aplikaci

* PROVIDER_APP_URL=http://localhost:3000/
  URL pro aplikace sloužící jako OAuth server

* PROVIDER_APP_ID=e859592df475233ab7b2f126da03bf5f4a0470534b087c946151de6b3662db68
  ID aplikace, které dostaneme po vytvoření OAuth aplikace

* PROVIDER_NAME=eurosignal
  Není potřeba měnit. Jméno poskytovatele. (Výchozí jako `eurosignal`)

* PROVIDER_SECRET=2a750ac5802ca42523c5d7232ee97a2290b1103cff5611a4d9c50b45fcacf033
  SECRET ID, které dostaneme po vytvoření OAuth aplikace
