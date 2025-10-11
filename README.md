# 🧬 Keksi HUD

![Status](https://img.shields.io/badge/Status-In%20Development-yellow)
![Garry's Mod](https://img.shields.io/badge/Garry's%20Mod-13%2B-blue)
![Version](https://img.shields.io/badge/Build-Beta-green)

Ein futuristisches **Heads-Up-Display (HUD)** für Garry’s Mod mit markantem **Bacta-Cyan-Farbschema**, dynamischen Animationen und professionellem Sci-Fi-Design.

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

2. Stelle sicher, dass die Ordnerstruktur korrekt ist:

```

garrysmod/addons/scifi_hud/
└── lua/
├── autorun/
│   └── scifi_hud_loader.lua
└── scifi_hud/
├── cl_scifi_hud.lua
└── scifi_hud_config.lua

````

3. **Garry’s Mod starten** – Das HUD lädt automatisch beim Spielstart!  

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

```

---

✅ **Anleitung:**
- Speichere diesen Code als **`README.md`** im Root-Ordner deines Addons oder GitHub-Repos.  
- GitHub rendert automatisch alle Icons, Tabellen, Codeblöcke und Formatierungen sauber.  

Möchtest du, dass ich dir dazu auch gleich eine **passende LICENSE.md** erstelle, die exakt zu dieser “nicht-kommerziellen Gemeinschaftslizenz” passt (rechtlich saubere Formulierung)?
```
