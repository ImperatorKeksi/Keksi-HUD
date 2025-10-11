-- ===== SCI-FI HUD KONFIGURATION =====
-- Hier können alle Einstellungen des HUDs angepasst werden

SCIFI_HUD_CONFIG = {}

-- ===== FARBSCHEMA EINSTELLUNGEN =====
SCIFI_HUD_CONFIG.ColorSchemes = {
    -- Lila-Blau Farbschema
    default = {
        -- Primärfarben
        primary = Color(120, 80, 255, 255),       -- Lila-Blau primär
        secondary = Color(80, 60, 180, 255),      -- Dunkleres Lila-Blau
        dark = Color(40, 30, 80, 255),            -- Dunkler Kontrast (Inputfelder)
        background = Color(0, 0, 0, 255),         -- Komplett schwarzer Hintergrund

        -- Glow und Effekte
        glow = Color(120, 80, 255, 100),          -- Lila-Blau Glow
        warning = Color(255, 102, 102, 255),      -- Warnung (bleibt rot) #ff6666
        danger = Color(255, 102, 102, 255),       -- Fehlertext / HP kritisch (bleibt rot) #ff6666
        success = Color(100, 200, 255, 255),      -- Heilung aktiv (helles Blau)

        -- Textfarben
        health_text = Color(60, 40, 120, 255),    -- Dunkles Lila für Text
        armor_text = Color(80, 60, 180, 255),     -- Sekundärtext Lila-Blau
        enemy = Color(255, 102, 102, 255),        -- Fehlertext (bleibt rot für Gegner)
        ally = Color(100, 150, 255, 255),         -- Verbündete (helles Blau)

        -- Status-Indikatoren
        stabilized = Color(120, 80, 255, 255),    -- Stabilisiert (Lila-Blau)
        bleeding = Color(255, 153, 153, 255),     -- Blutung erkannt (bleibt rot)
        neutral = Color(85, 85, 85, 255)          -- Neutraler Text #555555
    },
    
    -- Assault Variante (etwas intensiver)
    assault = {
        primary = Color(140, 100, 255, 255),      -- Intensiveres Lila-Blau
        secondary = Color(100, 80, 200, 255),
        dark = Color(50, 40, 100, 255),
        background = Color(0, 0, 0, 255),         -- Komplett schwarz
        glow = Color(140, 100, 255, 100),
        warning = Color(255, 102, 102, 255),      -- Warnung (bleibt rot)
        danger = Color(255, 102, 102, 255),       -- Fehlertext (bleibt rot)
        success = Color(120, 220, 255, 255),
        health_text = Color(70, 50, 140, 255),
        armor_text = Color(100, 80, 200, 255),
        enemy = Color(255, 102, 102, 255),        -- Gegner (bleibt rot)
        ally = Color(120, 170, 255, 255),
        stabilized = Color(140, 100, 255, 255),
        bleeding = Color(255, 153, 153, 255),     -- Blutung (bleibt rot)
        neutral = Color(85, 85, 85, 255)
    },
    
    -- Support Schema (etwas helleres Cyan)
    support = {
        -- Support Variante (etwas sanfter)
        primary = Color(100, 60, 220, 255),       -- Sanfteres Lila-Blau
        secondary = Color(70, 50, 160, 255),
        dark = Color(35, 25, 70, 255),
        background = Color(0, 0, 0, 255),         -- Komplett schwarz
        glow = Color(100, 60, 220, 100),
        warning = Color(255, 102, 102, 255),      -- Warnung (bleibt rot)
        danger = Color(255, 102, 102, 255),       -- Fehlertext (bleibt rot)
        success = Color(80, 180, 255, 255),
        health_text = Color(50, 30, 100, 255),
        armor_text = Color(70, 50, 160, 255),
        enemy = Color(255, 102, 102, 255),        -- Gegner (bleibt rot)
        ally = Color(80, 130, 255, 255),
        stabilized = Color(100, 60, 220, 255),
        bleeding = Color(255, 153, 153, 255),     -- Blutung (bleibt rot)
        neutral = Color(85, 85, 85, 255)
    }
}

-- ===== SCANNER EINSTELLUNGEN =====
SCIFI_HUD_CONFIG.Scanner = {
    -- Box Scan Effekt Einstellungen
    boxScan = {
        minInterval = 4,           -- Minimale Zeit zwischen Scans (Sekunden)
        maxInterval = 7,           -- Maximale Zeit zwischen Scans (Sekunden)
        minSpeed = 0.3,            -- Minimale Scan-Geschwindigkeit
        maxSpeed = 0.6,            -- Maximale Scan-Geschwindigkeit
        direction = 3,             -- Scan-Richtung (3 = oben nach unten)
        scanWidth = 4,             -- Breite des Scan-Strahls
        glowLayers = 3             -- Anzahl der Glow-Ebenen
    },
    
    -- Scanner Balken Einstellungen
    barScanner = {
        segmentCount = 10,         -- Anzahl der Segmente in Balken
        pulseSpeed = 3,            -- Geschwindigkeit der Puls-Animation
        partialAnimSpeed = 4       -- Geschwindigkeit der Teil-Füll-Animation
    }
}

-- ===== POSITIONEN UND GRÖSSEN =====
SCIFI_HUD_CONFIG.Positions = {
    -- Vital Signs Box (Links unten)
    vitalBox = {
        x = 40,
        y = -240,                  -- Relativ zum Bildschirmrand unten
        width = 360,
        height = 140,
        cornerSize = 15,
        padding = 15
    },
    
    -- Munitions Anzeige (Rechts unten)
    ammoBox = {
        x = -360,                  -- Relativ zum rechten Bildschirmrand
        y = -200,                  -- Relativ zum unteren Bildschirmrand
        width = 320,
        height = 100,
        cornerSize = 15
    },
    
    -- Ausdauer Anzeige
    staminaBox = {
        width = 200,
        height = 40,
        cornerSize = 12
    },
    
    -- XP System
    xpBox = {
        x = 40,
        y = 70,
        width = 400,
        height = 45,
        cornerSize = 12
    },
    
    -- Missionsziele
    missionBox = {
        x = 40,
        y = 130,
        width = 400,
        height = 90,
        cornerSize = 12
    },
    
    -- Funkkanal
    radioBox = {
        x = -280,                  -- Relativ zum rechten Bildschirmrand
        y = 70,
        width = 240,
        height = 50,
        cornerSize = 12
    },
    
    -- Radar
    radar = {
        x = -190,                  -- Relativ zum rechten Bildschirmrand
        y = -330,                  -- Relativ zum unteren Bildschirmrand
        radius = 70,
        size = 170,
        cornerSize = 12
    },
    
    -- Kompass
    compass = {
        width = 800,               -- Breite des Kompasses
        height = 35,               -- Höhe des Kompasses
        y = 20,                    -- Abstand vom oberen Rand
        cornerSize = 8
    }
}

-- ===== ANIMATIONSEINSTELLUNGEN =====
SCIFI_HUD_CONFIG.Animations = {
    smoothSpeed = {
        health = 6,                -- Geschwindigkeit der HP-Animation
        armor = 6,                 -- Geschwindigkeit der Rüstungs-Animation
        ammo = 8,                  -- Geschwindigkeit der Munitions-Animation
        stamina = 4                -- Geschwindigkeit der Ausdauer-Animation
    },
    
    effects = {
        enableScanlines = true,    -- Scanline-Effekt aktivieren
        enableGlitch = true,       -- Zufällige Glitch-Effekte
        enablePulse = true         -- Pulsierende Effekte aktivieren
    }
}

-- ===== MODUS EINSTELLUNGEN =====
SCIFI_HUD_CONFIG.Modes = {
    nightMode = {
        primaryMultiplier = 0.6,   -- Primärfarbe Multiplikator für Nachtmodus
        greenMultiplier = 0.4,     -- Grün-Anteil Multiplikator
        blueMultiplier = 0.6       -- Blau-Anteil Multiplikator
    },
    
    combatMode = {
        hideXP = true,             -- XP-Anzeige im Combat-Mode ausblenden
        hideMissions = true        -- Missionsziele im Combat-Mode ausblenden
    }
}

-- ===== TEXT EINSTELLUNGEN =====
SCIFI_HUD_CONFIG.Text = {
    -- Font Größen können hier angepasst werden
    -- (Standard: "DermaDefault", "DermaDefaultBold", "DermaLarge")
    
    -- Text-Inhalte (können übersetzt/angepasst werden)
    labels = {
        vitalSigns = "VITAL SIGNS",
        health = "HEALTH",
        armor = "ARMOR", 
        stamina = "STAMINA",
        radar = "RADAR",
        rankProgression = "RANK PROGRESSION",
        missionObjective = ">> MISSION OBJECTIVE",
        status = "STATUS",
        comm = "COMM",
        tacticalChannel = "TAKTISCHER KANAL",
        tx = "TX",
        rx = "RX",
        melee = "MELEE"
    }
}

-- ===== DEBUG EINSTELLUNGEN =====
SCIFI_HUD_CONFIG.Debug = {
    enable = false,                -- Debug-Modus aktivieren
    showBoundingBoxes = false,     -- Begrenzungsrahmen anzeigen
    printLoadMessages = true       -- Lade-Nachrichten anzeigen
}

print("[SciFi HUD] Bacta-Cyan Konfiguration geladen!")