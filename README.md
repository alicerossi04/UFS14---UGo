# UFS14 - UGo
Progetto per l'unità formativa UFS14 progettazione e sviluppo iOS. L'obiettivo dell'app è permettere agli utenti di scoprire e visualizzare itinerari di viaggio.

## Stato del progetto
Il progetto è funzionante, tuttavia alcune delle funzionalità previste non sono state completate

## Funzionalità
### Funzionalità attuali
- **Visualizzazione itinerari:** possibilità di visualizzare itinerari disponibili con dettagli come difficoltà, regione, durata e descrizione
- **Ricerca e filtri:** ricerca di itinerari basata su ricerca testuale per regione o nome itinerario oppure tramite tag
- **Mappa:** visualizzazione della posizione degli itinerari su una mappa (punto di inizio e punto di arrivo)

### Funzionalità non complete
- **Salvataggio itinerari**: sull'app sono state implementate due liste ("preferiti" e "da visitare"), tuttavia non è possibile salvare gli itinerari in queste categorie
- **Login social**: le funzioni di login o registrazione tramite Google, Apple e GitHub non sono attive
- **Condivisione**: la funzionalità per condividere un itinerario su altri social non è disponibile

## Architettura progetto
- **Linguaggio e framework:** Swift e SwiftUI
- **Architettura:** MVVM (Model-View-ViewModel)
- **Backend e database:** Firebase e Firestore
- **Autenticazione:** Firebase Authentication
