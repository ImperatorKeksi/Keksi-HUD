--[[
=====================================================================
              KEKSI-HUD ZENTRALE KONFIGURATIONSDATEI
=====================================================================
  Autor: Imperator Keksi
  Zweck: Zentrale Einstellungen für alle HUD-Komponenten
  
  Diese Datei enthält alle konfigurierbaren Aspekte des HUDs:
  - Farbschemata (3 Varianten: Default, Assault, Support)
  - Scanner-Effekt Einstellungen (Box-Scan und Balken-Scanner)
  - UI-Positionen und Größen aller HUD-Elemente
  - Animationsgeschwindigkeiten und -effekte
  - Modi-spezifische Einstellungen (Nacht, Combat, etc.)
  - Lokalisierung (Deutsche Texte)
  - Debug-Optionen für Entwicklung
=====================================================================
--]]

-- Globale Konfigurationstabelle initialisieren
SCIFI_HUD_CONFIG = {}

-- =====================================================================
-- FARBSCHEMA-DEFINITIONEN
-- =====================================================================
-- Drei verschiedene Farbschemata für unterschiedliche Einsatzzwecke
-- Alle Farben verwenden das Color(r, g, b, a) Format
SCIFI_HUD_CONFIG.ColorSchemes = {
    
    -- -------------------------------------------------------------
    -- DEFAULT SCHEMA - Standard Lila-Blau Design
    -- -------------------------------------------------------------
    -- Hauptsächlich für normale RP-Situationen und Erkundung
    default = {
        -- === HAUPTFARBEN ===
        primary = Color(120, 80, 255, 255),       -- Hauptfarbe: Lila-Blau für Rahmen und wichtige UI
        secondary = Color(80, 60, 180, 255),      -- Sekundärfarbe: Dunkleres Lila-Blau für Akzente
        dark = Color(40, 30, 80, 255),            -- Dunkle Kontrastfarbe für Eingabefelder
        background = Color(0, 0, 0, 255),         -- Vollständig schwarzer Hintergrund für maximalen Kontrast

        -- === EFFEKT-FARBEN ===
        glow = Color(120, 80, 255, 100),          -- Glow-Effekt: Halbtransparentes Lila-Blau
        warning = Color(255, 102, 102, 255),      -- Warnfarbe: Bleibt rot für universelle Erkennbarkeit
        danger = Color(255, 102, 102, 255),       -- Gefahrenfarbe: Rot für kritische Gesundheit
        success = Color(100, 200, 255, 255),      -- Erfolgsfarbe: Helles Blau für Heilung/positive Werte

        -- === TEXT-FARBEN ===
        health_text = Color(60, 40, 120, 255),    -- Gesundheitstext: Dunkles Lila für gute Lesbarkeit
        armor_text = Color(80, 60, 180, 255),     -- Rüstungstext: Sekundär-Lila-Blau
        enemy = Color(255, 102, 102, 255),        -- Feindmarkierung: Rot (bleibt rot für klare Erkennung)
        ally = Color(100, 150, 255, 255),         -- Verbündeten-Markierung: Helles Blau

        -- === STATUS-INDIKATOREN ===
        stabilized = Color(120, 80, 255, 255),    -- Status "Stabilisiert": Hauptfarbe
        bleeding = Color(255, 153, 153, 255),     -- Status "Blutung": Hellrot (bleibt rot)
        neutral = Color(85, 85, 85, 255)          -- Neutraler Text: Mittelgrau
    },
    
    -- -------------------------------------------------------------
    -- ASSAULT SCHEMA - Intensivere Kampf-Variante
    -- -------------------------------------------------------------
    -- Für aggressive Situationen und intensive Kampfszenarien
    assault = {
        -- === HAUPTFARBEN (Intensiver) ===
        primary = Color(140, 100, 255, 255),      -- Intensiveres Lila-Blau für bessere Kampf-Sichtbarkeit
        secondary = Color(100, 80, 200, 255),     -- Verstärkte Sekundärfarbe
        dark = Color(50, 40, 100, 255),           -- Hellerer Kontrast für schnellere Erkennbarkeit
        background = Color(0, 0, 0, 255),         -- Unveränderter schwarzer Hintergrund
        
        -- === EFFEKT-FARBEN (Intensiver) ===
        glow = Color(140, 100, 255, 100),         -- Verstärkter Glow-Effekt
        warning = Color(255, 102, 102, 255),      -- Warnung bleibt rot (universell)
        danger = Color(255, 102, 102, 255),       -- Gefahr bleibt rot (kritische Situationen)
        success = Color(120, 220, 255, 255),      -- Hellerer Erfolgs-Indikator
        
        -- === TEXT-FARBEN (Verbesserte Lesbarkeit im Kampf) ===
        health_text = Color(70, 50, 140, 255),    -- Verstärkte Gesundheitstext-Sichtbarkeit
        armor_text = Color(100, 80, 200, 255),    -- Intensiverer Rüstungstext
        enemy = Color(255, 102, 102, 255),        -- Feind-Markierung bleibt rot
        ally = Color(120, 170, 255, 255),         -- Hellere Verbündeten-Markierung
        
        -- === STATUS-INDIKATOREN (Assault-optimiert) ===
        stabilized = Color(140, 100, 255, 255),   -- Intensivere Stabilisierungs-Farbe
        bleeding = Color(255, 153, 153, 255),     -- Blutungs-Indikator bleibt rot
        neutral = Color(85, 85, 85, 255)          -- Unveränderter neutraler Text
    },
    
    -- -------------------------------------------------------------
    -- SUPPORT SCHEMA - Sanftere Support-Variante  
    -- -------------------------------------------------------------
    -- Für Unterstützungsrollen und weniger intensive Situationen
    support = {
        -- === HAUPTFARBEN (Sanfter) ===
        primary = Color(100, 60, 220, 255),       -- Sanfteres Lila-Blau für ruhigere Situationen
        secondary = Color(70, 50, 160, 255),      -- Gedämpfte Sekundärfarbe
        dark = Color(35, 25, 70, 255),            -- Dunklerer Kontrast für subtile Optik
        background = Color(0, 0, 0, 255),         -- Unveränderter schwarzer Hintergrund
        
        -- === EFFEKT-FARBEN (Sanfter) ===
        glow = Color(100, 60, 220, 100),          -- Subtilerer Glow-Effekt
        warning = Color(255, 102, 102, 255),      -- Warnung bleibt rot (universell)
        danger = Color(255, 102, 102, 255),       -- Gefahr bleibt rot (Sicherheit geht vor)
        success = Color(80, 180, 255, 255),       -- Sanftere Erfolgsfarbe
        
        -- === TEXT-FARBEN (Support-optimiert) ===
        health_text = Color(50, 30, 100, 255),    -- Dunklerer, ruhigerer Gesundheitstext
        armor_text = Color(70, 50, 160, 255),     -- Gedämpfter Rüstungstext
        enemy = Color(255, 102, 102, 255),        -- Feind-Markierung bleibt rot (wichtig für Support)
        ally = Color(80, 130, 255, 255),          -- Gedämpfte Verbündeten-Markierung
        
        -- === STATUS-INDIKATOREN (Support-optimiert) ===
        stabilized = Color(100, 60, 220, 255),    -- Sanftere Stabilisierungs-Farbe
        bleeding = Color(255, 153, 153, 255),     -- Blutungs-Indikator bleibt rot (medizinisch wichtig)
        neutral = Color(85, 85, 85, 255)          -- Unveränderter neutraler Text
    }
}

-- =====================================================================
-- SCANNER-EFFEKT KONFIGURATION
-- =====================================================================
-- Alle Einstellungen für die animierten Scanner-Effekte des HUDs
SCIFI_HUD_CONFIG.Scanner = {
    
    -- -------------------------------------------------------------
    -- BOX-SCAN EFFEKT EINSTELLUNGEN
    -- -------------------------------------------------------------
    -- Kontroliert die periodischen Scan-Linien über alle UI-Boxen
    boxScan = {
        minInterval = 4,           -- Minimale Zeit zwischen Scans (Sekunden) - Wie oft der Scan startet (Minimum)
        maxInterval = 7,           -- Maximale Zeit zwischen Scans (Sekunden) - Wie oft der Scan startet (Maximum)
        minSpeed = 0.3,            -- Minimale Scan-Geschwindigkeit - Wie schnell die Scan-Linie sich bewegt (Minimum)
        maxSpeed = 0.6,            -- Maximale Scan-Geschwindigkeit - Wie schnell die Scan-Linie sich bewegt (Maximum)
        direction = 3,             -- Scan-Richtung: 3 = oben nach unten (andere Richtungen momentan deaktiviert)
        scanWidth = 4,             -- Breite des Scan-Strahls in Pixeln - Wie dick die Scan-Linie ist
        glowLayers = 3             -- Anzahl der Glow-Ebenen um den Scan-Strahl - Mehr = intensiverer Glow-Effekt
    },
    
    -- -------------------------------------------------------------
    -- SCANNER-BALKEN EINSTELLUNGEN
    -- -------------------------------------------------------------
    -- Kontroliert die segmentierten Statusbalken (Health, Armor, etc.)
    barScanner = {
        segmentCount = 10,         -- Anzahl der Segmente pro Balken - Mehr = feiner aufgeteilte Balken
        pulseSpeed = 3,            -- Geschwindigkeit der Puls-Animation - Wie schnell Segmente pulsieren
        partialAnimSpeed = 4       -- Geschwindigkeit der Teil-Füll-Animation - Wie schnell sich füllende Segmente animieren
    }
}

-- =====================================================================
-- UI-POSITIONEN UND GRÖßEN KONFIGURATION
-- =====================================================================
-- Alle Positionsdaten für HUD-Elemente - Koordinaten sind in Pixeln
-- Negative Werte = Abstand vom rechten/unteren Bildschirmrand
-- Positive Werte = Abstand vom linken/oberen Bildschirmrand
SCIFI_HUD_CONFIG.Positions = {
    
    -- -------------------------------------------------------------
    -- VITALZEICHEN-BOX (Links unten)
    -- -------------------------------------------------------------
    -- Zeigt Health, Armor und Stamina mit Scanner-Balken an
    vitalBox = {
        x = 40,                    -- 40 Pixel vom linken Bildschirmrand
        y = -240,                  -- 240 Pixel vom unteren Bildschirmrand (negativ = von unten)
        width = 360,               -- Breite der Box in Pixeln
        height = 140,              -- Höhe der Box in Pixeln
        cornerSize = 15,           -- Größe der Eckrahmen-Linien
        padding = 15               -- Innenabstand für Text und Balken
    },
    
    -- -------------------------------------------------------------
    -- MUNITIONS-ANZEIGE (Rechts unten)
    -- -------------------------------------------------------------
    -- Zeigt Waffen-Info, Munition und Reserve-Munition
    ammoBox = {
        x = -360,                  -- 360 Pixel vom rechten Bildschirmrand (negativ = von rechts)
        y = -200,                  -- 200 Pixel vom unteren Bildschirmrand
        width = 320,               -- Breite der Munitions-Box
        height = 100,              -- Höhe der Munitions-Box
        cornerSize = 15            -- Eckrahmen-Größe
    },
    
    -- -------------------------------------------------------------
    -- AUSDAUER-ANZEIGE (Unter Vitalzeichen-Box)
    -- -------------------------------------------------------------
    -- Zeigt Stamina/Ausdauer mit Scanner-Balken
    staminaBox = {
        width = 200,               -- Breite der Ausdauer-Box
        height = 40,               -- Höhe der Ausdauer-Box
        cornerSize = 12            -- Kleinere Eckrahmen für kompakte Box
    },
    
    -- -------------------------------------------------------------
    -- XP-SYSTEM (Oben links)
    -- -------------------------------------------------------------
    -- Zeigt Level, XP-Fortschritt und Rang-Information
    xpBox = {
        x = 40,                    -- 40 Pixel vom linken Bildschirmrand
        y = 70,                    -- 70 Pixel vom oberen Bildschirmrand
        width = 400,               -- Breite der XP-Box
        height = 45,               -- Höhe der XP-Box
        cornerSize = 12            -- Eckrahmen-Größe
    },
    
    -- -------------------------------------------------------------
    -- MISSIONSZIELE (Unter XP-System)
    -- -------------------------------------------------------------
    -- Zeigt aktuelle Mission und Fortschritt
    missionBox = {
        x = 40,                    -- 40 Pixel vom linken Bildschirmrand
        y = 130,                   -- 130 Pixel vom oberen Bildschirmrand (unter XP-Box)
        width = 400,               -- Breite der Missions-Box
        height = 90,               -- Höhe der Missions-Box
        cornerSize = 12            -- Eckrahmen-Größe
    },
    
    -- -------------------------------------------------------------
    -- FUNKKANAL-STATUS (Oben rechts)
    -- -------------------------------------------------------------
    -- Zeigt Voice-Chat TX/RX Status und Kanal-Info
    radioBox = {
        x = -280,                  -- 280 Pixel vom rechten Bildschirmrand
        y = 70,                    -- 70 Pixel vom oberen Bildschirmrand
        width = 240,               -- Breite der Funk-Box
        height = 50,               -- Höhe der Funk-Box
        cornerSize = 12            -- Eckrahmen-Größe
    },
    
    -- -------------------------------------------------------------
    -- RADAR-SYSTEM (Rechts Mitte-Unten)
    -- -------------------------------------------------------------
    -- 360° Radar mit Spieler/NPC-Erkennung
    radar = {
        x = -190,                  -- 190 Pixel vom rechten Bildschirmrand
        y = -330,                  -- 330 Pixel vom unteren Bildschirmrand
        radius = 70,               -- Radius des Radar-Kreises
        size = 170,                -- Gesamtgröße der Radar-Box (für Rahmen)
        cornerSize = 12            -- Eckrahmen-Größe
    },
    
    -- -------------------------------------------------------------
    -- KOMPASS-SYSTEM (Oben Mitte)
    -- -------------------------------------------------------------
    -- Richtungsanzeige mit Grad-Anzeige und Orientierungsmarkierungen
    compass = {
        width = 800,               -- Breite des Kompasses (zentriert automatisch)
        height = 35,               -- Höhe des Kompasses
        y = 20,                    -- 20 Pixel vom oberen Bildschirmrand
        cornerSize = 8             -- Kleinere Eckrahmen für flache Box
    }
}

-- =====================================================================
-- ANIMATIONS-KONFIGURATION
-- =====================================================================
-- Einstellungen für alle animierten Elemente des HUDs
SCIFI_HUD_CONFIG.Animations = {
    
    -- -------------------------------------------------------------
    -- SANFTE WERT-ÜBERGÄNGE (Smooth Transitions)
    -- -------------------------------------------------------------
    -- Kontroliert wie schnell sich Werte-Änderungen visuell anpassen
    -- Höhere Werte = schnellere Animationen, niedrigere = sanftere Übergänge
    smoothSpeed = {
        health = 6,                -- Geschwindigkeit der Gesundheits-Animation (HP-Balken)
        armor = 6,                 -- Geschwindigkeit der Rüstungs-Animation (Armor-Balken)
        ammo = 8,                  -- Geschwindigkeit der Munitions-Animation (schneller für besseres Feedback)
        stamina = 4                -- Geschwindigkeit der Ausdauer-Animation (sanfter für Stamina)
    },
    
    -- -------------------------------------------------------------
    -- VISUELLE EFFEKTE EIN/AUS
    -- -------------------------------------------------------------
    -- Aktiviert oder deaktiviert verschiedene visuelle Effekte
    effects = {
        enableScanlines = true,    -- Scanline-Effekt über gesamten Bildschirm aktivieren
        enableGlitch = true,       -- Zufällige Glitch-Effekte für Sci-Fi-Atmosphäre
        enablePulse = true         -- Pulsierende Effekte für Scanner-Balken aktivieren
    }
}

-- =====================================================================
-- SPEZIAL-MODI KONFIGURATION
-- =====================================================================
-- Einstellungen für verschiedene HUD-Modi (Nacht, Combat, etc.)
SCIFI_HUD_CONFIG.Modes = {
    
    -- -------------------------------------------------------------
    -- NACHTMODUS-EINSTELLUNGEN
    -- -------------------------------------------------------------
    -- Reduziert Helligkeit und Intensität für bessere Nachtsicht
    nightMode = {
        primaryMultiplier = 0.6,   -- Primärfarben-Helligkeit: 60% des Original-Wertes
        greenMultiplier = 0.4,     -- Grün-Anteil: 40% (weniger störend bei Nacht)
        blueMultiplier = 0.6       -- Blau-Anteil: 60% (behält Sci-Fi-Look bei)
    },
    
    -- -------------------------------------------------------------
    -- KAMPF-MODUS EINSTELLUNGEN
    -- -------------------------------------------------------------
    -- Versteckt ablenkende Elemente für besseren Kampf-Fokus
    combatMode = {
        hideXP = true,             -- XP-Anzeige im Combat-Mode ausblenden (nicht kampfkritisch)
        hideMissions = true        -- Missionsziele im Combat-Mode ausblenden (reduziert Ablenkung)
    }
}

-- =====================================================================
-- TEXT & LOKALISIERUNG
-- =====================================================================
-- Alle angezeigten Texte und Schriftart-Einstellungen
SCIFI_HUD_CONFIG.Text = {
    
    -- -------------------------------------------------------------
    -- SCHRIFTARTEN-HINWEIS
    -- -------------------------------------------------------------
    -- Verfügbare Garry's Mod Standard-Schriftarten:
    -- "DermaDefault"     - Standard-Schriftart (klein)
    -- "DermaDefaultBold" - Fett-Schriftart (klein, hervorgehoben)
    -- "DermaLarge"       - Große Schriftart (für wichtige Zahlen)
    -- "Trebuchet18"      - Trebuchet in Größe 18
    -- "Trebuchet24"      - Trebuchet in Größe 24
    
    -- -------------------------------------------------------------
    -- DEUTSCHE LOKALISIERUNG
    -- -------------------------------------------------------------
    -- Alle angezeigten Texte - können hier für andere Sprachen geändert werden
    labels = {
        vitalSigns = "VITAL SIGNS",              -- Titel der Gesundheits-Box
        health = "HEALTH",                       -- Gesundheits-Label
        armor = "ARMOR",                         -- Rüstungs-Label
        stamina = "STAMINA",                     -- Ausdauer-Label
        radar = "RADAR",                         -- Radar-Titel
        rankProgression = "RANK PROGRESSION",    -- XP-System Titel
        missionObjective = ">> MISSION OBJECTIVE", -- Missions-Titel
        status = "STATUS",                       -- Status-Label
        comm = "COMM",                          -- Kommunikations-Label (kurz)
        tacticalChannel = "TAKTISCHER KANAL",    -- Vollständiger Kanal-Name
        tx = "TX",                              -- Senden-Indikator (Transmit)
        rx = "RX",                              -- Empfangen-Indikator (Receive)
        melee = "MELEE"                         -- Nahkampf-Indikator (für Waffen ohne Munition)
    }
}

-- =====================================================================
-- DEBUG & ENTWICKLUNGS-EINSTELLUNGEN
-- =====================================================================
-- Einstellungen für Debugging und Entwicklung - normalerweise ausgeschaltet
SCIFI_HUD_CONFIG.Debug = {
    enable = false,                -- Debug-Modus: Zeigt zusätzliche Informationen in der Konsole
    showBoundingBoxes = false,     -- Begrenzungsrahmen: Zeigt unsichtbare Kollisions-Boxen aller UI-Elemente
    printLoadMessages = true       -- Lade-Nachrichten: Gibt Informationen über den Ladevorgang aus
}

-- =====================================================================
-- KONFIGURATION ERFOLGREICH GELADEN
-- =====================================================================
print("[SciFi HUD] Lila-Blau Konfiguration erfolgreich geladen!")