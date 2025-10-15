# 🧬 Keksi HUD

![Status](https://img.shields.io/badge/Status-In%20Development-yellow)
![Garry's Mod](https://img.shields.io/badge/Garry's%20Mod-13%2B-blue)
![Version](https://img.shields.io/badge/Build-Beta-green)

# 🛡️ Keksi-HUD

![Status](https://img.shields.io/badge/Status-Beta-yellow?style=flat-square)
![Garry's Mod](https://img.shields.io/badge/Garry's%20Mod-13%2B-blue?style=flat-square)
![Lua](https://img.shields.io/badge/Lua-5.1%2B-blue?style=flat-square)
![License](https://img.shields.io/badge/License-Non--Commercial-red?style=flat-square)

Ein **futuristisches Heads-Up-Display (HUD)** für Garry's Mod mit professionellem Sci-Fi-Design, dynamischen Animationen und einem konfigurierbaren Lila-Blau Farbschema.

---

## 📖 Was ist Keksi-HUD?

**Keksi-HUD** ist ein vollständig anpassbares, modernes HUD-System für Garry's Mod Server. Es ersetzt die Standard-Spieler-Oberfläche durch eine immersive, taktische Sci-Fi-Benutzeroberfläche mit:

- **Professionellem Design**: Abgewinkelte Panels, Scanner-Effekte und Glow-Animationen
- **Vollständige Konfigurierbarkeit**: Alle Farben, Positionen und Animationen über Konfigurationsdateien anpassbar
- **Performance-Optimiert**: Effiziente Lua-Implementierung für flüssige Darstellung
- **Roleplay-Fokus**: Perfekt für Sci-Fi, Military und Tactical RP Server

## 🎯 Hauptfeatures

### 🎨 **Visuelles Design**
- **Lila-Blau Farbschema**: Futuristisches Color-Grading mit drei Varianten (Default, Assault, Support)
- **Animierte Scanner-Balken**: Segmentierte Statusanzeigen mit Pulse-Effekten
- **Box-Scan-Effekte**: Periodische Scan-Linien über alle UI-Elemente
- **Abgewinkelte Panels**: Geometrische, taktische Optik mit Eckrahmen
- **Glow-Effekte**: Mehrschichtige Leuchteffekte für bessere Sichtbarkeit

### 📊 **HUD-Komponenten**
- **Vitalzeichen-Panel**: Health, Armor und Stamina mit Scanner-Balken
- **Munitions-Display**: Waffen-spezifische Anzeige mit Warnsystem bei niedrigem Ammo
- **Radar-System**: 360° Radar mit Spieler/NPC-Erkennung und Team-Farbcodierung
- **Kompass**: Richtungsanzeige mit Grad-Anzeige und Orientierungsmarkierungen
- **XP-Progression**: Level-System mit animierten Fortschrittsbalken
- **Missionsziele**: Konfigurierbares Objektiv-Tracking-System
- **Funkkanal-Status**: TX/RX Anzeige für Voice-Chat Integration

### 🎮 **Modi & Features**
- **Nachtmodus**: Gedämpfte Farbpalette für bessere Sicht bei Dunkelheit
- **Minimal-Modus**: Reduzierte UI für kompetitives Gaming
- **Combat-Modus**: Fokus auf kampfbezogene Elemente (versteckt XP/Missionen)
- **Farbenblind-Filter**: Unterstützung für Farbenblinde Spieler
- **Konsolen-Befehle**: Live-Umschaltung aller Modi im Spiel

## 📂 Dateistruktur

```
Keksi-HUD/
├── lua/
│   ├── autorun/
│   │   └── scifi_hud_loader.lua          # Automatischer Addon-Loader
│   └── scifi_hud/
│       ├── scifi_hud_config.lua         # Zentrale Konfigurationsdatei
│       └── cl_scifi_hud.lua             # Haupt-HUD Client-Code
└── README.md                            # Diese Datei
```

### 📋 Dateien-Beschreibung

| Datei | Zweck | Beschreibung |
|-------|-------|--------------|
| `scifi_hud_loader.lua` | **Addon-Loader** | Lädt automatisch alle HUD-Komponenten beim Spielstart |
| `scifi_hud_config.lua` | **Konfiguration** | Zentrale Einstellungen für Farben, Positionen, Animationen und Modi |
| `cl_scifi_hud.lua` | **HUD-Engine** | Haupt-Client-Script mit allen Zeichnungs- und Animationsfunktionen |

## 🚀 Installation

1. **Download**: Lade das Repository als ZIP herunter oder clone es
2. **Entpacken**: Entpacke den `Keksi-HUD` Ordner nach:
   ```
   garrysmod/addons/keksi-hud/
   ```
3. **Server-Neustart**: Starte deinen Garry's Mod Server neu
4. **Client-Verbindung**: Spieler laden das HUD automatisch beim Verbinden

## ⚙️ Konfiguration

Alle Einstellungen sind in `lua/scifi_hud/scifi_hud_config.lua` zentral gespeichert:

### Farbschemata anpassen
```lua
SCIFI_HUD_CONFIG.ColorSchemes = {
    default = {
        primary = Color(120, 80, 255, 255),    -- Haupt-Lila-Blau
        secondary = Color(80, 60, 180, 255),   -- Sekundärfarbe
        success = Color(100, 200, 255, 255),   -- Erfolg/Heilung
        warning = Color(255, 102, 102, 255),   -- Warnungen
        -- ... weitere Farben
    }
}
```

### Positionen & Größen
```lua
SCIFI_HUD_CONFIG.Positions = {
    vitalBox = {
        x = 40, y = -240,          -- Position vom Bildschirmrand
        width = 360, height = 140,  -- Größe der Box
        cornerSize = 15, padding = 15
    },
    -- ... weitere UI-Elemente
}
```

### Animationsgeschwindigkeiten
```lua
SCIFI_HUD_CONFIG.Animations = {
    smoothSpeed = {
        health = 6,    -- HP-Balken Animationsgeschwindigkeit
        armor = 6,     -- Rüstungs-Balken Geschwindigkeit
        ammo = 8,      -- Munitions-Animation
        stamina = 4    -- Ausdauer-Animation
    }
}
```

## 🎮 Verwendung & Konsolenbefehle

### In-Game Steuerung
```bash
scifi_hud_toggle night     # Nachtmodus an/aus
scifi_hud_toggle minimal   # Minimal-Modus an/aus  
scifi_hud_toggle combat    # Combat-Modus an/aus
```

### HUD-Layout
| Position | Element | Beschreibung |
|----------|---------|--------------|
| **Links unten** | Vitalzeichen | Health, Armor, Stamina mit Scanner-Balken |
| **Rechts unten** | Munition | Waffen-Info mit Warnsystem und Reserve-Anzeige |
| **Oben Mitte** | Kompass | 360° Navigation mit Grad-Anzeige |
| **Oben links** | XP & Missionen | Level-Fortschritt und Objektiv-Tracking |
| **Oben rechts** | Funkkanal | TX/RX Status für Voice-Chat |
| **Rechts Mitte** | Radar | 360° Spieler/NPC-Erkennung mit Team-Farben |

## 🔧 Entwicklung & Anpassung

Das HUD ist vollständig modular aufgebaut. Für eigene Anpassungen:

1. **Farben ändern**: Bearbeite `SCIFI_HUD_CONFIG.ColorSchemes`
2. **Positionen anpassen**: Modifiziere `SCIFI_HUD_CONFIG.Positions`
3. **Neue Modi hinzufügen**: Erweitere die ConVar-Logik in `cl_scifi_hud.lua`
4. **Animation-Timing**: Passe `SCIFI_HUD_CONFIG.Animations` an

### Kompatibilität
- **Garry's Mod**: Version 13+
- **DarkRP**: Vollständig kompatibel
- **Custom Gamemodes**: Funktioniert mit allen Standard-GMod APIs
- **Andere HUDs**: Deaktiviert automatisch Standard-HUD-Elemente

## 🤝 Lizenz & Nutzungsrechte

### ✅ **Erlaubt:**
- Kostenlose Nutzung auf privaten und öffentlichen Servern
- Modifikation und Anpassung für eigene Zwecke
- Weiterentwicklung und Verbesserung des Codes
- Verwendung als Basis für eigene HUD-Projekte

### ❌ **Nicht erlaubt:**
- **Kommerzieller Verkauf** oder kostenpflichtige Lizenzierung
- **Urheberschaftsansprüche** ohne Nennung des ursprünglichen Autors
- **Weiterverkauf** von modifizierten Versionen

### 📜 **Rechtlicher Hinweis**
Dieses Projekt steht unter einer **nicht-kommerziellen Gemeinschaftslizenz**. Der Code und das Design sind geistiges Eigentum von **Imperator Keksi**. Bei Verwendung in öffentlichen Projekten wird eine Quellennennung geschätzt, ist aber nicht zwingend erforderlich.

## 👨‍💻 Entwickler

**Imperator Keksi**  
Vollzeit-Entwickler für Garry's Mod Addons mit Fokus auf immersive User Interfaces

### 🌐 **Social Media & Kontakt**
[![Website](https://img.shields.io/badge/🌐_Website-guns.lol%2Fimperatorkeksi-red?style=flat-square)](https://guns.lol/imperatorkeksi)

### 🎯 **Spezialisierungen**
- **HUD/UI Design**: Futuristische und taktische Benutzeroberflächen
- **Lua-Programmierung**: Performance-optimierte Garry's Mod Skripte
- **Game-Design**: Immersive Spielerlebnisse für RP-Server

## 💬 Support & Community

### 🐛 **Bug Reports & Feature Requests**
Erstelle ein **Issue** auf GitHub mit:
- Detaillierter Beschreibung des Problems
- Schritte zur Reproduktion
- Screenshots (falls visueller Bug)
- Console-Output (falls Lua-Fehler)

### 💡 **Feature-Wünsche**
Ich bin immer offen für neue Ideen! Beschreibe deine Vorschläge so detailliert wie möglich.

### 🚀 **Updates & News**
Folge mir auf [guns.lol/imperatorkeksi](https://guns.lol/imperatorkeksi) für:
- Neue Feature-Ankündigungen
- Beta-Versionen
- Andere Garry's Mod Projekte

---

**Made with 💜 by Imperator Keksi**  
*"Bringing the future of gaming interfaces to Garry's Mod - today!"*

---

## 📖 Inhaltsverzeichnis

- [Über das Projekt](#-über-das-projekt)
- [Hauptfeatures](#-hauptfeatures)
- [Installation](#-installation)
- [Dateistruktur](#-dateistruktur)
- [Konfiguration](#-konfiguration)
- [Verwendung](#-verwendung)
- [Entwicklung](#-entwicklung)
- [Mitwirken](#-mitwirken)
- [Entwickler](#-entwickler)
- [Lizenz](#-lizenz)
- [Feedback & Support](#-feedback--support)

---

## 📖 Über das Projekt

**Keksi HUD** bringt ein futuristisches, immersives Interface für Garry’s Mod.  
Das Ziel: Ein modernes, animiertes HUD mit klarer Struktur, adaptivem Farbschema und taktischem Fokus für RP- und Sci-Fi-Server.

---

## ✨ Hauptfeatures

- 🧭 **Futuristisches Design**  
  Saubere Linien, abgewinkelte Panels und dynamische Scan-Effekte  

- 🌊 **Bacta-Cyan Farbschema**  
  Ein klares, pulsierendes Cyan/Türkis-Thema mit leuchtenden Akzenten  

- ⚙️ **Modularer Aufbau**  
  Alle UI-Elemente sind über eine Konfigurationsdatei anpassbar  

- 🌓 **Verschiedene Modi**  
  - Nachtmodus 🌙 (gedämpfte Farben)  
  - Minimal-Modus 🧩 (reduzierte Anzeigen)  
  - Combat-Mode 🔫 (fokussiert auf Kampfelemente)  

- 🎞️ **Animierte Elemente**  
  Sanfte Übergänge, Puls- und Energieeffekte  

- 🧠 **Umfassende Anzeigen**  
  - Gesundheit & Rüstung mit Scanner-Balken  
  - Munitionsstatus mit Warnsystem  
  - Ausdauer-Anzeige  
  - Radar mit Entitätserkennung  
  - Kompass mit Richtungsanzeige  
  - XP-System & Fortschritt  
  - Missionsziele  
  - Funkkanal-Status  

---

## 🚀 Installation

1. Lade die Dateien herunter und entpacke sie in:  
   `garrysmod/addons/`

2. **Garry’s Mod starten** – Das HUD lädt automatisch beim Spielstart!  

---

## ⚙️ Konfiguration

Alle Einstellungen befinden sich in der Datei:  
`lua/scifi_hud/scifi_hud_config.lua`

### Beispieleinstellungen:

```lua
-- Farbschemata
SciFiHUD.Colors = {
    default = Color(0, 255, 255, 255),  -- Bacta-Cyan
    assault = Color(255, 80, 80, 255),
    support = Color(80, 255, 120, 255)
}

-- Animationen
SciFiHUD.Animations = {
    fadeSpeed = 0.3,
    pulseIntensity = 1.2,
}

-- Scanner-Einstellungen
SciFiHUD.Scanner = {
    enabled = true,
    radius = 300,
    refreshRate = 0.5
}

-- Text
SciFiHUD.Labels = {
    health = "VITALS",
    armor  = "SHIELD",
    ammo   = "AMMO",
}
````

### Konsolenbefehle

```bash
scifi_hud_toggle night     # Nachtmodus an/aus
scifi_hud_toggle minimal   # Minimal-Modus an/aus
scifi_hud_toggle combat    # Combat-Mode an/aus
```

---

## 🎮 Verwendung

Das SciFi HUD ersetzt automatisch die Standard-HUD-Elemente und zeigt:

| Position         | Anzeige                               |
| ---------------- | ------------------------------------- |
| **Links unten**  | Vitalzeichen (Health, Armor, Stamina) |
| **Rechts unten** | Munition mit Warnsystem               |
| **Oben Mitte**   | Kompass mit Richtungsanzeige          |
| **Oben links**   | XP-Fortschritt & Missionsziele        |
| **Oben rechts**  | Funkkanal-Status                      |
| **Rechts**       | Radar mit Spieler/NPC-Erkennung       |

---

## 🛠️ Entwicklung

**Status:** 🟡 *Beta* — In aktiver Entwicklung
Das HUD wird fortlaufend erweitert und optimiert. Ziel ist eine stabile, performante Version mit erweiterten Sci-Fi-Features.

---

## 🤝 Mitwirken

**Du darfst:**

* ✅ Den Code für eigene Projekte verwenden
* ✅ Verbesserungen vorschlagen
* ✅ Den Code weiterentwickeln
* ✅ Das HUD an eigene Bedürfnisse anpassen

**Du darfst nicht:**

* ❌ Den Code kommerziell verkaufen
* ❌ Die Urheberschaft beanspruchen
* ❌ Modifikationen ohne Hinweis vertreiben

---

## 👨‍💻 Entwickler

**Imperator Keksi**
[![Guns.lol](https://img.shields.io/badge/Follow%20me-guns.lol%2Fimperatorkeksi-red)](https://guns.lol/imperatorkeksi)

**Kontakt & Community:**
[![Discord](https://img.shields.io/badge/Join-Discord-5865F2?logo=discord\&logoColor=white)](https://discord.gg/BTtC6b3XAY)

---

## 📄 Lizenz

Dieses Projekt steht unter einer **nicht-kommerziellen Gemeinschaftslizenz**:

* 🆓 Freie Nutzung und Modifikation erlaubt
* 🚫 Kommerzielle Nutzung und Weiterverkauf untersagt
* 💬 Quellennennung wird geschätzt, ist aber nicht zwingend

**Rechtlicher Hinweis:**
Der Code und das Design sind geistiges Eigentum von *Imperator Keksi*.
Bei Fragen zur kommerziellen Nutzung bitte direkt Kontakt aufnehmen.

---

## 💬 Feedback & Support

Feedback, Ideen oder Bugs?
👉 Erstelle ein **Issue auf GitHub** oder tritt dem **Discord-Server** bei.

**Support:**

* 💬 Discord: [https://discord.gg/BTtC6b3XAY](https://discord.gg/BTtC6b3XAY)
* 🌐 Updates & News: [https://guns.lol/imperatorkeksi](https://guns.lol/imperatorkeksi)

---

**Made with 💙 by Imperator Keksi**
*"Die Zukunft des Gameplay – Heute schon erleben!"* 🚀
