# ViperPay - Bills

Professionelle Rechnungssoftware für deutsche Unternehmen. GoBD-konform, DSGVO-konform.

## 🚀 Quick Start (One Command)

```bash
./start.sh
```

Das war's! Die App ist dann unter **http://localhost** erreichbar.

## 📋 Voraussetzungen

- [Docker](https://docs.docker.com/get-docker/) (Version 20.10+)
- [Docker Compose](https://docs.docker.com/compose/install/) (Version 2.0+ oder docker-compose 1.29+)

## 🔑 Demo-Zugänge

| Account | E-Mail | Passwort |
|---------|--------|----------|
| Demo | demo@viperpay.de | demo2024 |
| Admin | admin@example.com | admin123 |

Der Demo-Account enthält bereits Beispieldaten (Kunden, Produkte, Rechnungen).

## 📦 Was wird installiert?

Das Docker-Setup startet automatisch:

- **MongoDB 7.0** - Datenbank
- **FastAPI Backend** - Python API Server
- **React Frontend** - Web-Oberfläche mit Nginx

## 🛠️ Befehle

```bash
# Starten
./start.sh up

# Stoppen
./start.sh stop

# Neustarten
./start.sh restart

# Logs anzeigen
./start.sh logs

# Status prüfen
./start.sh status

# Alles löschen (Container + Daten)
./start.sh clean
```

## ⚙️ Manuelle Installation (ohne start.sh)

```bash
# Mit docker compose (neu)
docker compose up -d --build

# Oder mit docker-compose (alt)
docker-compose up -d --build
```

## 🔧 Konfiguration

Umgebungsvariablen können in der `docker-compose.yml` angepasst werden:

| Variable | Beschreibung | Standard |
|----------|--------------|----------|
| `JWT_SECRET` | Geheimer Schlüssel für JWT Tokens | Auto-generiert |
| `ADMIN_EMAIL` | Admin E-Mail | admin@example.com |
| `ADMIN_PASSWORD` | Admin Passwort | admin123 |
| `SMTP_HOST` | SMTP Server für E-Mail-Versand | - |
| `SMTP_PORT` | SMTP Port | 587 |
| `SMTP_USER` | SMTP Benutzername | - |
| `SMTP_PASSWORD` | SMTP Passwort | - |
| `SMTP_FROM_EMAIL` | Absender E-Mail | - |

## 📁 Projektstruktur

```
viperpay/
├── backend/
│   ├── Dockerfile
│   ├── server.py
│   └── requirements.txt
├── frontend/
│   ├── Dockerfile
│   ├── nginx.conf
│   └── src/
├── docker-compose.yml
├── start.sh
└── README.md
```

## 🔒 Sicherheit

- Alle Passwörter werden mit bcrypt gehasht
- JWT Tokens mit httpOnly Cookies
- CORS-Schutz aktiviert
- SSL-ready (Nginx konfigurierbar)

## 📝 Features

- ✅ Rechnungen erstellen & versenden
- ✅ Kundenverwaltung
- ✅ Produktverwaltung
- ✅ Labels/Kategorien
- ✅ Wiederkehrende Aufträge
- ✅ Öffentliche Rechnungslinks für Kunden
- ✅ SMTP E-Mail-Versand
- ✅ GoBD & DSGVO konform
- ✅ Impressum, AGB, Datenschutz

## 🇩🇪 Rechtliche Konformität

- GoBD-konforme Rechnungsnummern
- Alle § 14 UStG Pflichtangaben
- DSGVO-konforme Datenverarbeitung
- Deutsche Server (bei Self-Hosting)

## 📞 Support

Bei Fragen oder Problemen:
- Issue auf GitHub erstellen
- E-Mail an support@viperpay.de

---

Made with ❤️ in Germany