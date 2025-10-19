# 🛡️ Keksi-HUD - Futuristische Sci-Fi Edition

> **Ein hochmodernes Sci-Fi HUD-System für Garry's Mod mit dynamischen Scanner-Effekten und immersivem Star Wars Theming**

[![Version](https://img.shields.io/badge/Version-1.0-purple)](https://github.com/imperatorkeksi/keksi-hud)
[![Garry's Mod](https://img.shields.io/badge/Garry's%20Mod-Compatible-blue)](https://store.steampowered.com/app/4000/Garrys_Mod/)
[![DarkRP](https://img.shields.io/badge/DarkRP-Integration-orange)](https://github.com/FPtje/DarkRP)
[![License](https://img.shields.io/badge/License-Free-green)](#lizenz)

---

## 📑 Inhaltsverzeichnis

- [Über das Projekt](#-über-das-projekt)
- [Features](#-features)
- [Datenstruktur](#-datenstruktur)
- [Verwendung](#-verwendung)
- [Konfiguration](#-konfiguration)
- [Über den Entwickler](#-über-den-entwickler)
- [Social Media](#-social-media)
- [Lizenz](#-lizenz)
- [Abschlusstext](#-abschlusstext)

---

## 🚀 Über das Projekt

**Keksi-HUD - Futuristische Sci-Fi Edition** ist ein vollständig eigenentwickeltes HUD-System, das die Standard-Benutzeroberfläche von Garry's Mod durch eine immersive, futuristische Alternative ersetzt. Das Add-on wurde speziell für Roleplay-Server entwickelt und bietet eine taktische, sci-fi-inspirierte Optik mit dynamischen Animationen und Scanner-Effekten.

Mit seinem eleganten Lila-Blau Design und Star Wars-Theming ist es perfekt für **Military RP**, **Star Wars RP** und andere futuristische Rollenspiel-Szenarien geeignet. Dabei steht die Benutzerfreundlichkeit und Performance im Vordergrund.

### 🎮 Hauptziele:
- **Immersive Sci-Fi Erfahrung**: Futuristische UI-Elemente mit authentischem Star Wars Feeling
- **Performance-Optimierung**: Effiziente Client-seitige Implementierung ohne Server-Belastung
- **Vollständige Anpassbarkeit**: Modularer Aufbau für individuelle Konfiguration
- **Einfache Integration**: Funktioniert out-of-the-box mit allen Garry's Mod Gamemodes

---

## ✨ Features

### 🔥 Visuelle Highlights
- **🎨 Elegantes Lila-Blau Design** mit drei konfigurierbaren Farbschemata (Default, Assault, Support)
- **📊 Animierte Scanner-Balken** mit segmentierter Darstellung und Echtzeit-Updates
- **🔍 Box-Scan-Effekte** - periodische Scan-Linien über alle UI-Elemente
- **⚡ Abgewinkelte Panels** für taktische Sci-Fi-Optik mit Glow-Effekten
- **🌟 Mehrschichtige Animationen** mit interpolierten Wert-Übergängen

### 🛡️ HUD-Komponenten
- **❤️ Vitalzeichen-Panel** - Health, Armor und Stamina mit animierten Status-Balken
- **🔫 Intelligente Munitionsanzeige** - Waffen-spezifisch mit automatischem Warnsystem
- **📡 360° Radar-System** - Spieler/NPC-Erkennung mit Team-Farbcodierung
- **🧭 Präziser Kompass** - Richtungsanzeige mit Grad-Anzeige und Navigation
- **⭐ XP-Progression System** - Level-Anzeige mit visuellen Fortschrittsbalken
- **🎯 Missionsziele-Tracker** - Konfigurierbares Objektiv-System für Roleplay
- **📻 Funkkanal-Status** - TX/RX Anzeige für Voice-Chat Integration

### 🎮 Modi & Anpassungen
- **🌙 Nachtmodus** - Gedämpfte Farbpalette für bessere Nachtsicht-Kompatibilität
- **⚔️ Combat-Modus** - Fokus auf kampfkritische Informationen und reduzierte Ablenkung
- **🎯 Minimal-Modus** - Kompakte UI für kompetitives Gaming und bessere Sicht
- **🔄 Live-Konfiguration** - Alle Modi über Konsolen-Befehle in Echtzeit umschaltbar
- **⚡ Performance-Tuning** - Adaptive FPS-Optimierung basierend auf Hardware

### 🔧 Technische Innovation
- **🧩 Modularer Code-Aufbau** - Vollständig konfigurierbare Komponenten mit Hot-Reload
- **🎭 Sanfte Animationen** - Interpolierte Wert-Übergänge ohne Frame-Drops
- **🌐 Deutsche Lokalisierung** - Vollständig übersetzte Benutzeroberfläche
- **🔍 Debug-System** - Erweiterte Entwickler-Tools für Anpassungen und Fehlerbehebung

---

## 🗂️ Datenstruktur

### 📁 Projekt-Architektur
```
Keksi-HUD/
├── 📄 README.md                            # Projekt-Dokumentation
└── lua/
    ├── autorun/
    │   └── 📜 scifi_hud_loader.lua        # Automatischer Addon-Loader
    └── scifi_hud/
        ├── 📋 scifi_hud_config.lua        # Zentrale Konfigurationsdatei
        └── 🎮 cl_scifi_hud.lua            # Haupt-HUD Client-Rendering
```

### 🔧 Code-Komponenten

#### **📜 scifi_hud_loader.lua** (Autorun-System):
- **🚀 Automatisches Laden** beim Server-/Client-Start
- **🔄 Server/Client Separation** für optimale Performance
- **📦 Modulares Loading** - sequenzielles Laden der Abhängigkeiten
- **🛡️ Fehlerbehandlung** mit ausführlichem Logging

#### **📋 scifi_hud_config.lua** (Konfigurationszentrale):
- **🎨 Farbschema-Definitionen** (Default/Assault/Support mit RGB+Alpha)
- **📐 UI-Positionen & Größen** für alle HUD-Elemente
- **⚡ Animations-Geschwindigkeiten** und Timing-Parameter
- **🔧 Scanner-Einstellungen** für Box-Scan und Balken-Effekte
- **🎯 Funktions-Toggles** für modulare Feature-Aktivierung

#### **🎮 cl_scifi_hud.lua** (Client-Hauptsystem):
- **🖼️ Rendering-Engine** mit DrawCornerFrame() und DrawAngledPanel()
- **📊 Scanner-Effekte** - DrawScannerBar() und DrawBoxScanEffect()
- **🎮 Game-Integration** - Health/Armor/Ammo-Tracking mit GMod APIs
- **⌨️ Konsolen-Commands** für Live-Konfiguration (scifi_hud_toggle)
- **🔗 HUD-Hook Management** für nahtlose Integration

### 💡 Architektur-Highlights
- **🎯 Client-seitig** - Keine Server-Performance-Belastung
- **🔗 Hook-basiert** - Integriert sich nahtlos in GMod HUD-System
- **📋 Zentral konfigurierbar** - Eine Config-Datei für alle Einstellungen
- **📝 Vollständig dokumentiert** - Deutscher Code mit ausführlichen Kommentaren---

## 🎮 Verwendung

### 📥 Installation

1. **Download** das Repository als ZIP-Datei oder clone es direkt:
   ```bash
   git clone https://github.com/imperatorkeksi/keksi-hud.git
   ```

2. **Entpacke** den Keksi-HUD Ordner nach:
   ```
   steamapps/common/GarrysMod/garrysmod/addons/keksi-hud/
   ```

3. **Server-Neustart** oder `changelevel` ausführen

4. **Automatische Aktivierung** - Das HUD lädt automatisch für alle Spieler

### 🕹️ HUD-Layout im Spiel

| Position | Element | Beschreibung | Features |
|----------|---------|--------------|----------|
| **🔻 Links unten** | **Vitalzeichen** | Health, Armor, Stamina | Animierte Balken mit Farbwechsel |
| **🔻 Rechts unten** | **Munition** | Waffen-Info + Warnsystem | Waffen-spezifische Anzeige |
| **🔺 Oben Mitte** | **Kompass** | 360° Navigation | Grad-Anzeige mit Richtung |
| **🔺 Oben links** | **XP & Level** | Fortschritt-System | Animierte Progression |
| **🔺 Oben rechts** | **Funkkanal** | Voice-Chat Status | TX/RX Aktivitäts-Anzeige |
| **▶️ Rechts Mitte** | **Radar** | Spieler-Erkennung | Team-basierte Farbcodierung |

### ⌨️ Konsolen-Befehle

```bash
# HUD-Modi Live umschalten
scifi_hud_toggle night     # 🌙 Nachtmodus aktivieren/deaktivieren
scifi_hud_toggle minimal   # 🎯 Minimal-Modus für kompetitives Gaming
scifi_hud_toggle combat    # ⚔️ Combat-Modus für Kampf-Focus

# Debug und Entwicklung
scifi_hud_reload           # 🔄 Konfiguration neu laden
scifi_hud_debug            # 🔍 Debug-Informationen anzeigen
```

### 🎯 Gameplay-Integration

#### **Automatische Features:**
- **🔄 Echtzeit-Updates** - Alle Werte werden live aktualisiert
- **🎨 Adaptive Farben** - Health-abhängige Farbwechsel (Grün → Gelb → Rot)
- **⚡ Performance-Scaling** - Automatische FPS-Anpassung bei hoher Server-Last
- **🔊 Audio-Integration** - Scanner-Sounds bei kritischen Werten (optional)

#### **Roleplay-Features:**
- **📡 Squad-Integration** - Team-Mitglieder werden auf Radar hervorgehoben
- **🎖️ Rang-System** - Level und XP-Anzeige für DarkRP/Custom Gamemodes
- **📻 Voice-Status** - Live-Anzeige von Push-to-Talk Aktivität
- **🎯 Mission-Tracker** - Objektive und Ziele für RP-Szenarien

### 🚫 Deinstallation
Entferne einfach den `keksi-hud` Ordner aus dem addons Verzeichnis und starte den Server neu.

---

## ⚙️ Konfiguration

### 🎛️ Zentrale Einstellungen

Alle Anpassungen erfolgen in der `lua/scifi_hud/scifi_hud_config.lua` Datei:

### 🎨 Farbschema-Konfiguration

```lua
-- Verfügbare Farbschemata
SCIFI_HUD_CONFIG.ColorSchemes = {
    default = {
        primary = Color(150, 100, 255, 255),    -- Haupt-Lila
        secondary = Color(100, 200, 255, 255),  -- Sci-Fi Blau
        accent = Color(255, 150, 255, 255),     -- Akzent-Pink
        success = Color(100, 255, 150, 255),    -- Erfolg-Grün
        warning = Color(255, 255, 100, 255),    -- Warnung-Gelb
        danger = Color(255, 100, 100, 255)      -- Gefahr-Rot
    },
    assault = {
        -- Intensivere Kampf-Variante mit höherem Kontrast
    },
    support = {
        -- Sanftere Support-Variante für Medics/Techniker
    }
}
```

### 📐 UI-Layout Anpassungen

```lua
-- Positionen und Größen aller HUD-Elemente
SCIFI_HUD_CONFIG.Layout = {
    health_panel = {
        x = 50,                    -- X-Position vom linken Bildschirmrand
        y = ScrH() - 150,          -- Y-Position (dynamisch vom unteren Rand)
        width = 300,               -- Panel-Breite
        height = 120               -- Panel-Höhe
    },
    ammo_panel = {
        x = ScrW() - 350,          -- Rechts positioniert
        y = ScrH() - 150,
        width = 300,
        height = 120
    }
    -- ... weitere Layout-Definitionen
}
```

### ⚡ Animations-Einstellungen

```lua
-- Geschwindigkeiten und Timing für alle Animationen
SCIFI_HUD_CONFIG.Animations = {
    scanner_speed = 2.0,           -- Scanner-Balken Geschwindigkeit
    fade_speed = 1.5,              -- Ein-/Ausblenden Geschwindigkeit
    health_lerp_speed = 3.0,       -- Health-Bar Animation
    box_scan_interval = 0.8,       -- Box-Scan Intervall in Sekunden
    glow_pulse_speed = 1.2         -- Glow-Effekt Pulsierung
}
```

### 🔧 Feature-Toggles

```lua
-- Funktionen aktivieren/deaktivieren
SCIFI_HUD_CONFIG.Features = {
    EnableHealthPanel = true,       -- Gesundheits-Anzeige
    EnableAmmoDisplay = true,       -- Munitions-Anzeige
    EnableRadarSystem = true,       -- Radar-System
    EnableCompass = true,           -- Kompass-Navigation
    EnableScannerEffects = true,    -- Scanner-Animationen
    EnableBoxScanning = true,       -- Box-Scan Effekte
    EnableGlowEffects = true,       -- Glow-Effekte
    EnableSoundEffects = false      -- Audio-Feedback
}
```

### 🎮 Gamemode-Kompatibilität

```lua
-- Automatische Erkennung und Anpassung für verschiedene Gamemodes
SCIFI_HUD_CONFIG.Compatibility = {
    DarkRP = {
        ShowMoney = true,           -- DarkRP Geld anzeigen
        ShowJob = true,             -- Job-Titel anzeigen
        ShowLevel = true            -- Level-System integrieren
    },
    TTT = {
        ShowRole = true,            -- TTT-Rolle anzeigen
        ShowKarma = true            -- Karma-System
    },
    SandBox = {
        ShowTools = true,           -- Tool-Informationen
        ShowConstraints = true      -- Constraint-Counter
    }
}
```

### 🔄 Hot-Reload Support

```bash
# Konfiguration ohne Server-Neustart neu laden
scifi_hud_reload_config

# Bestimmte Module neu laden
scifi_hud_reload colors     # Nur Farbschema
scifi_hud_reload layout     # Nur Layout
scifi_hud_reload animations # Nur Animationen
```

### 🛡️ Performance-Tuning

```lua
-- Performance-Optimierung für verschiedene Hardware
SCIFI_HUD_CONFIG.Performance = {
    max_fps = 60,                  -- FPS-Begrenzung für HUD
    update_interval = 0.1,         -- Update-Intervall in Sekunden
    reduce_effects_on_lag = true,  # Effekte bei Lag reduzieren
    adaptive_quality = true        # Adaptive Qualitäts-Anpassung
}
```

---

## 👨‍💻 Über den Entwickler

**Imperator Keksi** (auch bekannt als Nico, Milky, Brownie, Cookie oder Keksi) ist ein leidenschaftlicher Gamer und Roleplayer, der sich besonders für **Star Wars RP** und technische Projekte in Garry's Mod begeistert.

### 🌟 Entwickler-Profil:
- **🎮 Passion**: Star Wars Roleplay und Garry's Mod Development
- **📈 Status**: Anfänger mit sichtbaren Fortschritten in der Addon-Entwicklung
- **🤝 Charakter**: Ruhig, hilfsbereit und immer offen für Feedback
- **💡 Motivation**: Stetige Weiterentwicklung und Lernen neuer Techniken

### 🔄 Entwicklungsreise:
Imperator Keksi befindet sich noch am **Anfang seiner Addon-Entwicklungsreise**, macht aber **beeindruckende Fortschritte** und lernt kontinuierlich dazu. Seine Projekte zeigen bereits eine **hohe Qualität** und **Liebe zum Detail** - das Keksi-HUD ist ein perfektes Beispiel für sein wachsendes Können.

### 💬 Feedback willkommen:
Er freut sich über **jede Art von Feedback**, Verbesserungsvorschläge oder neue Ideen. Die Community kann ihn jederzeit kontaktieren - er ist **immer bereit zu helfen** und **neue Konzepte zu diskutieren**.

> *"Gemeinsam können wir die besten Add-ons für die Garry's Mod Community erschaffen!"*

---

## 📱 Social Media

### 🔗 Offizielle Profile von Imperator Keksi:

**🌐 Hauptprofil:**
- **Website**: [guns.lol/imperatorkeksi](https://guns.lol/imperatorkeksi)

### 📞 Kontakt & Support:
Für **Fragen**, **Feedback** oder **Kollaborationen** kannst du Imperator Keksi über seine offiziellen Kanäle erreichen. Er ist immer interessiert an:

- 💡 **Neuen Ideen** für HUD-Features und Verbesserungen
- 🐛 **Bug Reports** und Verbesserungsvorschläge für bessere Performance
- 🤝 **Community Feedback** und Erfahrungen von Server-Ownern
- 🚀 **Kollaborationsmöglichkeiten** mit anderen Addon-Entwicklern

---

## 📄 Lizenz

### ✅ **ERLAUBT:**
- ✅ **Verwendung auf privaten und öffentlichen Servern** ohne Einschränkungen
- ✅ **Kopieren und Weiterverbreitung des Add-ons** für nicht-kommerzielle Zwecke
- ✅ **Modifikation und Anpassung** an eigene Server-Bedürfnisse
- ✅ **Integration in Server-Packs** oder Community-Collections

### ❌ **NICHT ERLAUBT:**
- ❌ **Verkauf oder kommerzielle Nutzung** des Add-ons oder modifizierter Versionen
- ❌ **Weiterverkauf in jeglicher Form** ohne ausdrückliche Genehmigung
- ❌ **Ausgeben als eigene Entwicklung** ohne Nennung des ursprünglichen Autors
- ❌ **Entfernen der Urheberrechtshinweise** aus dem Code

### ℹ️ **WICHTIGE BEDINGUNGEN:**
- **🏷️ Urheberschaft**: **Imperator Keksi** muss in jeder Veröffentlichung als **originaler Entwickler** genannt werden
- **📝 Attribution**: Bei Modifikationen muss die Quelle und der originale Autor erwähnt werden
- **🆓 Kostenlos**: Das Add-on ist und bleibt **komplett kostenlos** für die Community

### 📋 **Lizenz-Zusammenfassung:**
```
Keksi-HUD - Futuristische Sci-Fi Edition v1.0
Copyright (c) 2025 Imperator Keksi

Dieses Add-on ist kostenlose Software für die Garry's Mod Community.
Verwendung, Modifikation und Weitergabe unter Nennung des Originalautors gestattet.
Kommerzielle Nutzung oder Verkauf ist strengstens untersagt.
```

---

## 🎉 Abschlusstext

**Danke fürs Nutzen des Add-ons!** 

Wenn dir das **Keksi-HUD - Futuristische Sci-Fi Edition** gefällt, unterstütze die Arbeit von **Imperator Keksi** durch:

- ⭐ **Einen Stern auf GitHub** (falls verfügbar)
- 💬 **Positives Feedback** in der Community und auf Servern
- 🐛 **Bug Reports** für kontinuierliche Verbesserungen und Updates
- 💡 **Feature-Vorschläge** für zukünftige Versionen und Erweiterungen
- 🤝 **Weiterempfehlungen** an andere Server-Owner und Roleplay-Communities

### 🚀 **Zukunftspläne:**
- 🔄 **Regelmäßige Updates** mit neuen Features basierend auf Community-Feedback
- 🎨 **Zusätzliche Themes** und Design-Varianten für verschiedene RP-Settings  
- 🔧 **Erweiterte Konfigurationsmöglichkeiten** für noch mehr Anpassbarkeit
- 🌐 **Multi-Language Support** für internationale Server-Communities
- 📱 **Responsive Design** für verschiedene Bildschirmauflösungen

---

**Version 1.0** – Erstellt mit **💜 Leidenschaft** für die **Garry's Mod Community**

*Ein Projekt von **Imperator Keksi** - Für die Gemeinschaft, mit der Gemeinschaft*

---

[![Made with Love](https://img.shields.io/badge/Made%20with-❤️-red)](https://guns.lol/imperatorkeksi)
[![Garry's Mod](https://img.shields.io/badge/Built%20for-Garry's%20Mod-blue)](https://store.steampowered.com/app/4000/Garrys_Mod/)
[![Community](https://img.shields.io/badge/Community-Driven-green)](https://github.com/imperatorkeksi)

> *"Möge die Sci-Fi Macht mit deinem HUD sein!"* ✨
