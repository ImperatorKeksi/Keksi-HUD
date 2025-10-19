#  Keksi-HUD v1.0

![Status](https://img.shields.io/badge/Status-Release-brightgreen?style=flat-square)
![Version](https://img.shields.io/badge/Version-1.0-blue?style=flat-square)
![Garry's Mod](https://img.shields.io/badge/Garry's%20Mod-13%2B-orange?style=flat-square)
![License](https://img.shields.io/badge/License-Free%20Use-green?style=flat-square)

Ein **futuristisches Sci-Fi HUD** für Garry's Mod mit dynamischen Scanner-Effekten, animierten Statusbalken und einem modernen Lila-Blau Design. Entwickelt für immersive Roleplay-Erfahrungen und taktische Gameplay-Situationen.

---

##  Inhaltsverzeichnis

- [Über das Projekt](#über-das-projekt)
- [Features](#features)
- [Datenstruktur](#datenstruktur)
- [Verwendung](#verwendung)
- [Konfiguration](#konfiguration)
- [Über den Entwickler](#über-den-entwickler)
- [Social Media](#social-media)
- [Lizenz](#lizenz)

---

##  Über das Projekt

**Keksi-HUD** ist ein vollständig eigenentwickeltes HUD-System, das die Standard-Benutzeroberfläche von Garry's Mod durch eine immersive, futuristische Alternative ersetzt. Das Add-on wurde speziell für Roleplay-Server entwickelt und bietet eine taktische, sci-fi-inspirierte Optik mit animierten Elementen.

### Projektziel
Das HUD soll Spielern eine moderne, professionelle Benutzeroberfläche bieten, die besonders für **Star Wars RP**, **Military RP** und andere futuristische Rollenspiel-Szenarien geeignet ist. Dabei steht die Benutzerfreundlichkeit und Performance im Vordergrund.

---

##  Features

###  **Visuelles Design**
- **Lila-Blau Farbschema** mit drei Varianten (Default, Assault, Support)
- **Animierte Scanner-Balken** mit segmentierter Darstellung
- **Box-Scan-Effekte** - periodische Scan-Linien über UI-Elemente
- **Abgewinkelte Panels** für taktische Sci-Fi-Optik
- **Mehrschichtige Glow-Effekte** für bessere Sichtbarkeit

###  **HUD-Komponenten**
- **Vitalzeichen-Panel** - Health, Armor und Stamina mit animierten Balken
- **Intelligente Munitionsanzeige** - Waffen-spezifisch mit Warnsystem
- **360° Radar-System** - Spieler/NPC-Erkennung mit Team-Farbcodierung
- **Präziser Kompass** - Richtungsanzeige mit Grad-Anzeige
- **XP-Progression System** - Level-Anzeige mit Fortschrittsbalken
- **Missionsziele-Tracker** - Konfigurierbares Objektiv-System
- **Funkkanal-Status** - TX/RX Anzeige für Voice-Chat Integration

###  **Modi & Anpassungen**
- **Nachtmodus** - Gedämpfte Farbpalette für bessere Nachtsicht
- **Minimal-Modus** - Reduzierte UI für kompetitives Gaming
- **Combat-Modus** - Fokus auf kampfkritische Informationen
- **Live-Konfiguration** - Alle Modi über Konsolen-Befehle umschaltbar
- **Performance-Optimierung** - Effiziente Lua-Implementierung

###  **Technische Features**
- **Modularer Aufbau** - Vollständig konfigurierbare Komponenten
- **Sanfte Animationen** - Interpolierte Wert-Übergänge
- **Mehrsprachig** - Deutsche Lokalisierung integriert
- **Debug-System** - Entwickler-Tools für Anpassungen

---

##  Datenstruktur

```
Keksi-HUD/
 lua/
    autorun/
       scifi_hud_loader.lua          # Automatischer Addon-Loader
    scifi_hud/
        scifi_hud_config.lua         # Zentrale Konfigurationsdatei
        cl_scifi_hud.lua             # Haupt-HUD Client-Code
 README.md                            # Projekt-Dokumentation
```

###  Datei-Übersicht

| Datei | Typ | Zweck |
|-------|-----|--------|
| scifi_hud_loader.lua | **Autorun** | Automatisches Laden beim Spielstart |
| scifi_hud_config.lua | **Konfiguration** | Farbschemata, Positionen, Animationen |
| cl_scifi_hud.lua | **Client-Script** | HUD-Rendering und Funktionalität |

###  Code-Architektur
- **Client-seitig** - Keine Server-Performance-Belastung
- **Hook-basiert** - Integriert sich nahtlos in Garry's Mod
- **Konfigurierbar** - Zentrale Config-Datei für alle Einstellungen
- **Kommentiert** - Vollständig dokumentierter Code auf Deutsch

---

##  Verwendung

### Installation
1. **Download** das Repository als ZIP-Datei
2. **Entpacke** den Keksi-HUD Ordner nach: garrysmod/addons/keksi-hud/
3. **Starte** den Server neu
4. **Verbinde** - Das HUD lädt automatisch für alle Spieler

### Konsolen-Befehle
```
# HUD-Modi umschalten
scifi_hud_toggle night     # Nachtmodus aktivieren/deaktivieren
scifi_hud_toggle minimal   # Minimal-Modus aktivieren/deaktivieren
scifi_hud_toggle combat    # Combat-Modus aktivieren/deaktivieren
```

### HUD-Layout im Spiel
| Position | Element | Beschreibung |
|----------|---------|--------------|
| **Links unten** | Vitalzeichen | Health, Armor, Stamina |
| **Rechts unten** | Munition | Waffen-Info + Warnsystem |
| **Oben Mitte** | Kompass | 360° Navigation |
| **Oben links** | XP & Missionen | Level-Fortschritt |
| **Oben rechts** | Funkkanal | Voice-Chat Status |
| **Rechts Mitte** | Radar | Spieler-Erkennung |

### Deinstallation
Entferne einfach den keksi-hud Ordner aus dem addons Verzeichnis.

---

##  Konfiguration

### Für Server-Administratoren
Alle Einstellungen befinden sich in der Datei: lua/scifi_hud/scifi_hud_config.lua

### Farbschemata anpassen
Die Konfigurationsdatei enthält drei verschiedene Farbschemata:
- **Default** - Standard Lila-Blau Design
- **Assault** - Intensivere Kampf-Variante
- **Support** - Sanftere Support-Variante

### UI-Positionen ändern
Alle Positionen und Größen der HUD-Elemente können in der Config angepasst werden.

### Animationsgeschwindigkeiten
Die Geschwindigkeit aller Animationen ist konfigurierbar.

### Kompatibilität
-  **Garry's Mod** Version 13+
-  **DarkRP** - Vollständig kompatibel
-  **Custom Gamemodes** - Standard GMod APIs
-  **Andere HUDs** - Automatische Deaktivierung

---

##  Über den Entwickler

**Imperator Keksi** (auch bekannt als Nico, Milky, Brownie, Cookie oder Keksi) ist ein leidenschaftlicher Gamer und Roleplayer, der sich besonders für **Star Wars RP** und technische Projekte in Garry's Mod begeistert.

###  Entwicklungsreise
Imperator Keksi befindet sich noch am **Anfang seiner Addon-Entwicklungsreise**, macht aber sichtbar gute Fortschritte und lernt stetig dazu. Seine Motivation liegt darin, der Garry's Mod Community hochwertige, immersive Erfahrungen zu bieten.

###  Persönlichkeit
Er ist **ruhig und hilfsbereit** und hat immer ein offenes Ohr für Feedback oder Verbesserungsvorschläge. Seine Projekte entwickelt er mit viel Leidenschaft und Aufmerksamkeit für Details.

###  Community-Engagement
Wenn ihr **Tipps oder Anregungen** habt, könnt ihr ihn jederzeit gerne kontaktieren  er freut sich über jede Unterstützung und über neue Ideen. Konstruktive Kritik und Vorschläge helfen ihm, seine Fähigkeiten weiterzuentwickeln.

---

##  Social Media

###  Offizielle Profile von Imperator Keksi

** https://guns.lol/imperatorkeksi**

**Folge Imperator Keksi für:**
-  Neue Addon-Releases
-  Entwicklungs-Updates
-  Behind-the-Scenes Content
-  Gaming-Content & RP-Sessions

---

##  Lizenz

###  **Was ist erlaubt:**
- **Kostenlose Nutzung** auf privaten und öffentlichen Servern
- **Kopieren und Verbreiten** für nicht-kommerzielle Zwecke
- **Modifikation und Anpassung** nach eigenen Bedürfnissen
- **Weiterentwicklung** des Codes mit eigenen Features

###  **Was ist nicht erlaubt:**
- **Verkauf oder Weiterverkauf** des Add-ons oder modifizierter Versionen
- **Ausgabe als eigene Entwicklung** ohne Nennung des ursprünglichen Autors
- **Kommerzielle Nutzung** ohne ausdrückliche Genehmigung

### ℹ **Wichtige Bedingungen:**
Der **originale Entwickler ist Imperator Keksi** und muss in jeder öffentlichen Veröffentlichung, Modifikation oder Weiterverteilung als **Urheber genannt werden**.

###  **Open Source Gedanke:**
Dieses Projekt folgt dem Gedanken der **freien Community-Entwicklung**. Verbesserungen und Erweiterungen sind willkommen und können gerne mit der Community geteilt werden.

---

##  Abschlusstext

**Danke fürs Nutzen des Add-ons!** 

Wenn es dir gefällt, unterstütze die Arbeit von **Imperator Keksi** durch ein  auf GitHub oder ein positives Feedback. Jede Rückmeldung hilft bei der Weiterentwicklung und motiviert zu neuen Projekten.

###  Version 1.0
*Erstellt mit Leidenschaft für die Garry's Mod Community.*

**Made with  by Imperator Keksi**  
*"Bringing immersive experiences to Garry's Mod - one addon at a time."*

---

*Letzte Aktualisierung: Oktober 2025*
