--[[
===================================================================
             KEKSI-HUD AUTOMATISCHER ADDON-LOADER
===================================================================
  Autor: Imperator Keksi
  Zweck: Automatisches Laden aller HUD-Komponenten beim Spielstart
  
  Diese Datei wird automatisch von Garry's Mod beim Server- und
  Client-Start ausgeführt und sorgt dafür, dass alle benötigten
  HUD-Dateien korrekt geladen werden.
===================================================================
--]]

-- =============================================================
-- SERVER-SEITIGE KONFIGURATION
-- =============================================================
-- Wenn wir auf dem Server sind, müssen wir die Client-Dateien
-- für alle verbundenen Spieler verfügbar machen
if SERVER then
    -- Konfigurationsdatei für Clients verfügbar machen
    AddCSLuaFile("scifi_hud/scifi_hud_config.lua")
    
    -- Haupt-HUD-Datei für Clients verfügbar machen
    AddCSLuaFile("scifi_hud/cl_scifi_hud.lua")
    
    -- Server führt keine weiteren HUD-Aktionen aus
    return
end

-- =============================================================
-- CLIENT-SEITIGE INITIALISIERUNG
-- =============================================================
-- Ab hier läuft nur Client-Code

-- Schritt 1: Konfigurationsdatei laden
-- Diese muss vor dem Haupt-HUD geladen werden, da sie alle
-- Einstellungen für Farben, Positionen und Animationen enthält
print("[SciFi HUD] Lade Konfiguration...")
include("scifi_hud/scifi_hud_config.lua")

-- Schritt 2: Haupt-HUD-System laden
-- Hier werden alle Zeichnungs- und Animationsfunktionen geladen
print("[SciFi HUD] Lade Haupt-HUD...")
include("scifi_hud/cl_scifi_hud.lua")

-- Erfolgsmeldung ausgeben
print("[SciFi HUD] Addon erfolgreich geladen!")