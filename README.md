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

##  Dateistruktur

`
Keksi-HUD/
 lua/
    autorun/
       scifi_hud_loader.lua          # Automatischer Addon-Loader
    scifi_hud/
        scifi_hud_config.lua         # Zentrale Konfigurationsdatei
        cl_scifi_hud.lua             # Haupt-HUD Client-Code
└ README.md                            # Diese Datei
`

###  Dateien-Beschreibung

| Datei | Zweck | Beschreibung |
|-------|-------|--------------|
| scifi_hud_loader.lua | **Addon-Loader** | Lädt automatisch alle HUD-Komponenten beim Spielstart |
| scifi_hud_config.lua | **Konfiguration** | Zentrale Einstellungen für Farben, Positionen, Animationen und Modi |
| cl_scifi_hud.lua | **HUD-Engine** | Haupt-Client-Script mit allen Zeichnungs- und Animationsfunktionen |

##  Installation

1. **Download**: Lade das Repository als ZIP herunter oder clone es
2. **Entpacken**: Entpacke den Keksi-HUD Ordner nach: garrysmod/addons/keksi-hud/
3. **Server-Neustart**: Starte deinen Garry's Mod Server neu
4. **Client-Verbindung**: Spieler laden das HUD automatisch beim Verbinden

##  Konfiguration

Alle Einstellungen sind in lua/scifi_hud/scifi_hud_config.lua zentral gespeichert.

##  Verwendung & Konsolenbefehle

### In-Game Steuerung
- scifi_hud_toggle night     # Nachtmodus an/aus
- scifi_hud_toggle minimal   # Minimal-Modus an/aus  
- scifi_hud_toggle combat    # Combat-Modus an/aus

### HUD-Layout
| Position | Element | Beschreibung |
|----------|---------|--------------|
| **Links unten** | Vitalzeichen | Health, Armor, Stamina mit Scanner-Balken |
| **Rechts unten** | Munition | Waffen-Info mit Warnsystem und Reserve-Anzeige |
| **Oben Mitte** | Kompass | 360° Navigation mit Grad-Anzeige |
| **Oben links** | XP & Missionen | Level-Fortschritt und Objektiv-Tracking |
| **Oben rechts** | Funkkanal | TX/RX Status für Voice-Chat |
| **Rechts Mitte** | Radar | 360° Spieler/NPC-Erkennung mit Team-Farben |

##  Entwicklung & Anpassung

Das HUD ist vollständig modular aufgebaut. Für eigene Anpassungen:

1. **Farben ändern**: Bearbeite SCIFI_HUD_CONFIG.ColorSchemes
2. **Positionen anpassen**: Modifiziere SCIFI_HUD_CONFIG.Positions
3. **Neue Modi hinzufügen**: Erweitere die ConVar-Logik in cl_scifi_hud.lua
4. **Animation-Timing**: Passe SCIFI_HUD_CONFIG.Animations an

### Kompatibilität
- **Garry's Mod**: Version 13+
- **DarkRP**: Vollständig kompatibel
- **Custom Gamemodes**: Funktioniert mit allen Standard-GMod APIs
- **Andere HUDs**: Deaktiviert automatisch Standard-HUD-Elemente

##  Lizenz & Nutzungsrechte

###  **Erlaubt:**
- Kostenlose Nutzung auf privaten und öffentlichen Servern
- Modifikation und Anpassung für eigene Zwecke
- Weiterentwicklung und Verbesserung des Codes
- Verwendung als Basis für eigene HUD-Projekte

###  **Nicht erlaubt:**
- **Kommerzieller Verkauf** oder kostenpflichtige Lizenzierung
- **Urheberschaftsansprüche** ohne Nennung des ursprünglichen Autors
- **Weiterverkauf** von modifizierten Versionen

###  **Rechtlicher Hinweis**
Dieses Projekt steht unter einer **nicht-kommerziellen Gemeinschaftslizenz**. Der Code und das Design sind geistiges Eigentum von **Imperator Keksi**. Bei Verwendung in öffentlichen Projekten wird eine Quellennennung geschätzt, ist aber nicht zwingend erforderlich.

##  Entwickler

**Imperator Keksi**  
Vollzeit-Entwickler für Garry's Mod Addons mit Fokus auf immersive User Interfaces

###  **Social Media & Kontakt**
[![Website](https://img.shields.io/badge/_Website-guns.lol%2Fimperatorkeksi-red?style=flat-square)](https://guns.lol/imperatorkeksi)

###  **Spezialisierungen**
- **HUD/UI Design**: Futuristische und taktische Benutzeroberflächen
- **Lua-Programmierung**: Performance-optimierte Garry's Mod Skripte
- **Game-Design**: Immersive Spielerlebnisse für RP-Server

##  Support & Community

###  **Bug Reports & Feature Requests**
Erstelle ein **Issue** auf GitHub mit:
- Detaillierter Beschreibung des Problems
- Schritte zur Reproduktion
- Screenshots (falls visueller Bug)
- Console-Output (falls Lua-Fehler)

###  **Feature-Wünsche**
Ich bin immer offen für neue Ideen! Beschreibe deine Vorschläge so detailliert wie möglich.

###  **Updates & News**
Folge mir auf [guns.lol/imperatorkeksi](https://guns.lol/imperatorkeksi) für:
- Neue Feature-Ankündigungen
- Beta-Versionen
- Andere Garry's Mod Projekte

---

**Made with 💜 by Imperator Keksi**  
*"Bringing the future of gaming interfaces to Garry's Mod - today!"*
