-- SciFi HUD Loader
if SERVER then
    AddCSLuaFile("scifi_hud/scifi_hud_config.lua")
    AddCSLuaFile("scifi_hud/cl_scifi_hud.lua")
    return
end

print("[SciFi HUD] Lade Konfiguration...")
include("scifi_hud/scifi_hud_config.lua")

print("[SciFi HUD] Lade Haupt-HUD...")
include("scifi_hud/cl_scifi_hud.lua")

print("[SciFi HUD] Addon erfolgreich geladen!")