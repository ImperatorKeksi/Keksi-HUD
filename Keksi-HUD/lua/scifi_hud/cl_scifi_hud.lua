--[[
=====================================================================
                  KEKSI-HUD HAUPT-CLIENT-SYSTEM
=====================================================================
  Autor: Imperator Keksi
  Zweck: Vollständiges futuristisches HUD-System für Garry's Mod
  
  Diese Datei enthält:
  - Alle Zeichnungs-Funktionen für UI-Elemente
  - Scanner-Effekte und Animationen  
  - HUD-Hook-Management
  - Konsolen-Befehle für Live-Konfiguration
  - Verschiedene Modi (Nacht, Minimal, Combat)
  
  Das HUD ersetzt Standard-GMod UI-Elemente durch ein futuristisches
  Sci-Fi Interface mit animierten Scanner-Balken und Glow-Effekten.
=====================================================================
--]]

-- =====================================================================
-- SICHERHEITSPRÜFUNG & INITIALISIERUNG
-- =====================================================================
-- Stelle sicher, dass dieser Code nur auf dem Client ausgeführt wird
if SERVER then return end

print("[SciFi HUD] HUD wird geladen...")

-- =====================================================================
-- KONFIGURATIONSVALIDIERUNG
-- =====================================================================
-- Prüfe ob die externe Konfigurationsdatei korrekt geladen wurde
if not SCIFI_HUD_CONFIG then
    print("[SciFi HUD] WARNUNG: Config nicht gefunden, verwende Standardwerte!")
    -- Notfall-Fallback könnte hier eingefügt werden, aber normalerweise 
    -- sollte die Config-Datei immer vor dieser Datei geladen werden
end

-- =====================================================================
-- CONSOLE-VARIABLEN (CONVARS) FÜR HUD-EINSTELLUNGEN  
-- =====================================================================
-- Diese Variablen ermöglichen Live-Konfiguration im Spiel über die Konsole
-- Format: CreateClientConVar(name, default_value, save_to_config, user_info, help_text)

local hud_nightmode = CreateClientConVar("scifi_hud_nightmode", "0", true, false, "Nachtmodus aktivieren - Reduziert Helligkeit für bessere Nachtsicht")
local hud_colorblind = CreateClientConVar("scifi_hud_colorblind", "0", true, false, "Farbenblind-Filter aktivieren - Alternativfarben für bessere Erkennbarkeit")
local hud_minimal = CreateClientConVar("scifi_hud_minimal", "0", true, false, "Minimales HUD aktivieren - Versteckt nicht-essentielle Elemente")
local hud_combatmode = CreateClientConVar("scifi_hud_combatmode", "0", true, false, "Combat-Mode aktivieren - Fokus auf kampfkritische Informationen")

-- =====================================================================
-- FARBSCHEMA-REFERENZ LADEN
-- =====================================================================
-- Lade die Farbschemata aus der Config-Datei für einfacheren Zugriff
local colorSchemes = SCIFI_HUD_CONFIG.ColorSchemes

-- =====================================================================
-- GRUNDLEGENDE ZEICHNUNGS-FUNKTIONEN
-- =====================================================================
-- Diese Funktionen erstellen die grundlegenden visuellen Elemente

-- ---------------------------------------------------------------------
-- ECKRAHMEN ZEICHNEN
-- ---------------------------------------------------------------------
-- Zeichnet taktische Eckrahmen um UI-Elemente (Sci-Fi Look)
-- Parameter: x, y (Position), w, h (Größe), col (Farbe), cornerSize (Eckgröße)
local function DrawCornerFrame(x, y, w, h, col, cornerSize)
    cornerSize = cornerSize or 12  -- Standard-Eckgröße falls nicht angegeben
    surface.SetDrawColor(col)
    
    -- Obere Ecken zeichnen
    surface.DrawLine(x, y, x + cornerSize, y)                    -- Oben links horizontal
    surface.DrawLine(x, y, x, y + cornerSize)                    -- Oben links vertikal
    surface.DrawLine(x + w - cornerSize, y, x + w, y)            -- Oben rechts horizontal
    surface.DrawLine(x + w, y, x + w, y + cornerSize)            -- Oben rechts vertikal
    
    -- Untere Ecken zeichnen
    surface.DrawLine(x, y + h - cornerSize, x, y + h)            -- Unten links vertikal
    surface.DrawLine(x, y + h, x + cornerSize, y + h)            -- Unten links horizontal
    surface.DrawLine(x + w, y + h - cornerSize, x + w, y + h)    -- Unten rechts vertikal
    surface.DrawLine(x + w - cornerSize, y + h, x + w, y + h)    -- Unten rechts horizontal
end

-- ---------------------------------------------------------------------
-- ABGEWINKELTE PANELS ZEICHNEN
-- ---------------------------------------------------------------------
-- Zeichnet futuristische Panels mit abgeschnittenen Ecken
-- Parameter: x, y (Position), w, h (Größe), bgCol (Hintergrund), borderCol (Rand), cutSize (Schnittgröße)
local function DrawAngledPanel(x, y, w, h, bgCol, borderCol, cutSize)
    cutSize = cutSize or 8  -- Standard-Schnittgröße
    
    -- Polygon für abgewinkelte Form erstellen (8 Punkte für oktagonale Form)
    local poly = {
        {x = x + cutSize, y = y},                    -- Oben links (nach Schnitt)
        {x = x + w - cutSize, y = y},                -- Oben rechts (vor Schnitt)
        {x = x + w, y = y + cutSize},                -- Rechts oben (nach Schnitt)
        {x = x + w, y = y + h - cutSize},            -- Rechts unten (vor Schnitt)
        {x = x + w - cutSize, y = y + h},            -- Unten rechts (vor Schnitt)
        {x = x + cutSize, y = y + h},                -- Unten links (nach Schnitt)
        {x = x, y = y + h - cutSize},                -- Links unten (vor Schnitt)
        {x = x, y = y + cutSize}                     -- Links oben (nach Schnitt)
    }
    
    -- Hintergrund-Polygon zeichnen
    draw.NoTexture()
    surface.SetDrawColor(bgCol)
    surface.DrawPoly(poly)
    
    -- Umrandung des Polygons zeichnen
    surface.SetDrawColor(borderCol)
    for i = 1, #poly do
        local next = i % #poly + 1  -- Nächster Punkt (mit Wrap-around)
        surface.DrawLine(poly[i].x, poly[i].y, poly[next].x, poly[next].y)
    end
end

-- =====================================================================
-- SCANNER-BALKEN SYSTEM
-- =====================================================================
-- Erweiterte Statusbalken mit segmentierter Darstellung und Pulse-Effekten

-- Globale Variablen für Scanner-Animationen
local scanProgress = 0      -- Fortschritt des aktuellen Scans
local lastScanTime = 0      -- Zeitpunkt des letzten Scans

-- ---------------------------------------------------------------------
-- ANIMIERTE SCANNER-BALKEN ZEICHNEN
-- ---------------------------------------------------------------------
-- Zeichnet segmentierte Statusbalken mit Glow- und Pulse-Effekten
-- Parameter: x, y (Position), w, h (Größe), percent (Füllstand 0-1), 
--           bgCol (Hintergrund), fillCol (Füllfarbe), segments (Anzahl Segmente)
local function DrawScannerBar(x, y, w, h, percent, bgCol, fillCol, segments)
    -- Anzahl Segmente aus Config laden oder Standard verwenden
    segments = segments or SCIFI_HUD_CONFIG.Scanner.barScanner.segmentCount
    
    -- Segmentbreite berechnen (mit Abständen und Padding)
    -- -8 Pixel für seitlichen Abstand, -(segments-1)*2 für Zwischenräume
    local segmentWidth = (w - 8 - (segments - 1) * 2) / segments
    
    -- Hintergrund-Panel mit abgewinkelter Form zeichnen
    DrawAngledPanel(x, y, w, h, bgCol, Color(fillCol.r, fillCol.g, fillCol.b, 80), 4)
    
    -- Berechnung der gefüllten Segmente
    local animatedPercent = percent  -- Könnte später für sanfte Animationen erweitert werden
    local fillSegments = math.floor(segments * animatedPercent)  -- Vollständig gefüllte Segmente
    
    -- Vollständig gefüllte Segmente zeichnen
    for i = 0, fillSegments - 1 do
        local segX = x + 4 + i * (segmentWidth + 2)  -- Position des Segments (mit 4px Padding)
        
        -- Pulse-Animation für lebendigen Effekt
        -- Jedes Segment pulsiert mit leichtem Zeitversatz (i * 0.5)
        local pulse = math.sin(CurTime() * SCIFI_HUD_CONFIG.Scanner.barScanner.pulseSpeed + i * 0.5) * 0.3 + 0.7
        
        -- Segmentfarbe mit Pulse-Effekt
        local segmentCol = Color(
            fillCol.r * pulse, 
            fillCol.g * pulse, 
            fillCol.b * pulse, 
            fillCol.a
        )
        
        -- Hauptsegment zeichnen (innerhalb der Panel-Grenzen)
        draw.RoundedBox(0, segX, y + 3, segmentWidth, h - 6, segmentCol)
        
        -- Subtiler Glow-Effekt um das Segment
        local glowCol = Color(fillCol.r, fillCol.g, fillCol.b, 30 * pulse)
        draw.RoundedBox(0, segX - 1, y + 2, segmentWidth + 2, h - 4, glowCol)
    end
    
    -- Partiell gefülltes Segment (für sanfte Übergänge)
    local partialPercent = (segments * animatedPercent) - fillSegments
    -- Partielles Segment zeichnen (wenn vorhanden)
    if partialPercent > 0 and fillSegments < segments then
        local segX = x + 4 + fillSegments * (segmentWidth + 2)  -- Position des partiellen Segments
        local partialWidth = segmentWidth * partialPercent       -- Breite basierend auf Prozentsatz
        
        -- Füll-Animation für das sich füllende Segment
        local fillAnim = math.sin(CurTime() * SCIFI_HUD_CONFIG.Scanner.barScanner.partialAnimSpeed) * 0.2 + 0.8
        
        -- Partielles Segment zeichnen
        draw.RoundedBox(0, segX, y + 3, partialWidth, h - 6, fillCol)
        
        -- Intensiver Glow-Effekt für das aktive (sich füllende) Segment
        local pulseGlow = Color(fillCol.r, fillCol.g, fillCol.b, 80 * fillAnim)
        draw.RoundedBox(0, segX - 1, y + 2, partialWidth + 2, h - 4, pulseGlow)
    end
    
    -- Rückgabe des animierten Prozentsatzes (für weitere Verwendung)
    return animatedPercent
end

-- =====================================================================
-- BOX-SCAN EFFEKT SYSTEM
-- =====================================================================
-- Periodische Scanner-Linien die über UI-Boxen laufen (wie in Sci-Fi Filmen)

-- Globale Tabelle für Scan-Daten jeder Box (jede Box hat eigenen Scan-Zustand)
local boxScanData = {}

-- ---------------------------------------------------------------------
-- BOX-SCAN EFFEKT ZEICHNEN
-- ---------------------------------------------------------------------
-- Erzeugt periodische Scan-Linien die über UI-Elemente laufen
-- Parameter: x, y (Position), w, h (Größe), scanCol (Scan-Farbe), scanType (reserviert für zukünftige Typen)
local function DrawBoxScanEffect(x, y, w, h, scanCol, scanType)
    -- Eindeutiger Schlüssel für diese Box basierend auf Position
    local boxKey = x .. "_" .. y
    
    -- Initialisiere Scan-Daten für neue Boxen
    if not boxScanData[boxKey] then
        boxScanData[boxKey] = {
            progress = 0,     -- Aktueller Scan-Fortschritt (0 = oben, 1 = unten)
            lastScan = 0,     -- Zeitpunkt des letzten Scan-Starts
            direction = SCIFI_HUD_CONFIG.Scanner.boxScan.direction,  -- Scan-Richtung aus Config
            speed = math.Rand(SCIFI_HUD_CONFIG.Scanner.boxScan.minSpeed, SCIFI_HUD_CONFIG.Scanner.boxScan.maxSpeed)  -- Zufällige Geschwindigkeit
        }
    end
    
    local data = boxScanData[boxKey]
    local currentTime = CurTime()
    
    -- Neuen Scan starten wenn genügend Zeit vergangen ist
    -- Intervall wird zufällig zwischen min und max aus der Config gewählt
    if currentTime - data.lastScan > math.Rand(SCIFI_HUD_CONFIG.Scanner.boxScan.minInterval, SCIFI_HUD_CONFIG.Scanner.boxScan.maxInterval) then
        data.progress = 0        -- Scan-Fortschritt zurücksetzen
        data.lastScan = currentTime  -- Neuen Startzeitpunkt merken
        data.direction = SCIFI_HUD_CONFIG.Scanner.boxScan.direction  -- Richtung aus Config neu laden
        -- Neue zufällige Geschwindigkeit für Variation
        data.speed = math.Rand(SCIFI_HUD_CONFIG.Scanner.boxScan.minSpeed, SCIFI_HUD_CONFIG.Scanner.boxScan.maxSpeed)
    end
    
    -- Scan-Fortschritt sanft animieren mit konfigurierbarer Geschwindigkeit
    data.progress = Lerp(FrameTime() * data.speed, data.progress, 1.2)
    
    -- Scan-Linie nur zeichnen wenn sie aktiv ist (zwischen Start und Ende)
    if data.progress > 0 and data.progress < 1.1 then
        -- Alpha-Wert für Fade-In/Fade-Out Effekt (stärker in der Mitte)
        local scanAlpha = 80 * (1 - math.abs(data.progress - 0.5) * 2)
        
        -- Scan-Position berechnen (aktuell nur oben nach unten)
        local scanY = y + h * data.progress
        
        -- Haupt-Scan-Linie zeichnen
        surface.SetDrawColor(scanCol.r, scanCol.g, scanCol.b, scanAlpha)
        surface.DrawRect(x, scanY - 2, w, SCIFI_HUD_CONFIG.Scanner.boxScan.scanWidth)
        
        -- Mehrstufiger Glow-Effekt um die Scan-Linie
        for i = 1, SCIFI_HUD_CONFIG.Scanner.boxScan.glowLayers do
            local glowAlpha = scanAlpha * (0.6 - i * 0.2)  -- Jede Schicht wird schwächer
            surface.SetDrawColor(scanCol.r, scanCol.g, scanCol.b, glowAlpha)
            -- Glow-Schichten werden progressiv breiter und höher
            surface.DrawRect(x, scanY - 2 - i, w, SCIFI_HUD_CONFIG.Scanner.boxScan.scanWidth + i * 2)
        end
    end
end

-- |> RADAR UND KOMPASS (bleibt gleich)
local function DrawCircularRadar(x, y, radius, col, ply)
    surface.SetDrawColor(col)
    for i = 0, 360, 5 do
        local rad1 = math.rad(i)
        local rad2 = math.rad(i + 5)
        local x1 = x + math.cos(rad1) * radius
        local y1 = y + math.sin(rad1) * radius
        local x2 = x + math.cos(rad2) * radius
        local y2 = y + math.sin(rad2) * radius
        surface.DrawLine(x1, y1, x2, y2)
    end
    
    for r = radius * 0.33, radius, radius * 0.33 do
        for i = 0, 360, 10 do
            local rad1 = math.rad(i)
            local rad2 = math.rad(i + 10)
            local x1 = x + math.cos(rad1) * r
            local y1 = y + math.sin(rad1) * r
            local x2 = x + math.cos(rad2) * r
            local y2 = y + math.sin(rad2) * r
            surface.DrawLine(x1, y1, x2, y2)
        end
    end
    
    surface.DrawLine(x - 5, y, x + 5, y)
    surface.DrawLine(x, y - 5, x, y + 5)
    
    local maxDistance = 1000
    
    for _, ent in ipairs(ents.FindInSphere(ply:GetPos(), maxDistance)) do
        if ent != ply and (ent:IsPlayer() or ent:IsNPC()) then
            local relativePos = ent:GetPos() - ply:GetPos()
            local distance = relativePos:Length()
            
            if distance <= maxDistance then
                local forward = ply:EyeAngles():Forward()
                local right = ply:EyeAngles():Right()
                
                local dotForward = relativePos:Dot(forward)
                local dotRight = relativePos:Dot(right)
                
                local radarX = x + (dotRight / maxDistance) * radius * 0.8
                local radarY = y - (dotForward / maxDistance) * radius * 0.8
                
                local distFromCenter = math.sqrt((radarX - x)^2 + (radarY - y)^2)
                if distFromCenter <= radius then
                    local dotColor
                    if ent:IsPlayer() then
                        if ent:Team() == ply:Team() and ply:Team() != 0 then
                            dotColor = colorSchemes.default.ally
                        else
                            dotColor = colorSchemes.default.enemy
                        end
                    else
                        dotColor = colorSchemes.default.enemy
                    end
                    
                    draw.RoundedBox(2, radarX - 3, radarY - 3, 6, 6, dotColor)
                    
                    if distance < 300 then
                        local pulse = math.abs(math.sin(CurTime() * 3)) * 100
                        draw.RoundedBox(2, radarX - 4, radarY - 4, 8, 8, Color(dotColor.r, dotColor.g, dotColor.b, pulse))
                    end
                end
            end
        end
    end
    
    local scanAngle = CurTime() * 100
    local rad = math.rad(scanAngle)
    for i = 0, radius, 2 do
        local alpha = 150 * (1 - i / radius)
        surface.SetDrawColor(col.r, col.g, col.b, alpha)
        local px = x + math.cos(rad) * i
        local py = y + math.sin(rad) * i
        surface.DrawRect(px, py, 2, 2)
    end
end

-- |> MITTELGROSSER KOMPASS - POSITIONEN AUS CONFIG
local function DrawCompass(x, y, w, h, col, ply)
    -- KOMPASS GRÖSSE AUS CONFIG
    local compassW, compassH = SCIFI_HUD_CONFIG.Positions.compass.width, SCIFI_HUD_CONFIG.Positions.compass.height
    local compassX = w / 2 - compassW / 2
    local compassY = SCIFI_HUD_CONFIG.Positions.compass.y
    
    DrawAngledPanel(compassX, compassY, compassW, compassH, colorSchemes.default.background, col, 6)
    DrawCornerFrame(compassX, compassY, compassW, compassH, col, SCIFI_HUD_CONFIG.Positions.compass.cornerSize)
    
    local ang = ply:EyeAngles().y
    ang = (ang + 360) % 360
    
    local directions = {
        {angle = 0, text = "N"},
        {angle = 45, text = "NE"},
        {angle = 90, text = "E"},
        {angle = 135, text = "SE"},
        {angle = 180, text = "S"},
        {angle = 225, text = "SW"},
        {angle = 270, text = "W"},
        {angle = 315, text = "NW"}
    }
    
    local centerX = compassX + compassW / 2
    local centerY = compassY + compassH / 2
    
    for _, dir in ipairs(directions) do
        local diff = dir.angle - ang
        if diff > 180 then diff = diff - 360 end
        if diff < -180 then diff = diff + 360 end
        
        if math.abs(diff) < 90 then
            -- GESPIEGELTE POSITION (RECHTS->LINKS)
            local posX = centerX - (diff / 90) * (compassW / 2 - 15)
            local alpha = 255 - math.abs(diff) * 2
            
            if dir.angle % 90 == 0 then
                draw.SimpleText(dir.text, "DermaDefaultBold", posX, centerY - 5, Color(col.r, col.g, col.b, alpha), TEXT_ALIGN_CENTER)
                surface.SetDrawColor(col.r, col.g, col.b, alpha)
                surface.DrawLine(posX, centerY + 8, posX, centerY + 15)
            else
                draw.SimpleText(dir.text, "DermaDefault", posX, centerY - 3, Color(col.r, col.g, col.b, alpha * 0.7), TEXT_ALIGN_CENTER)
                surface.SetDrawColor(col.r, col.g, col.b, alpha * 0.5)
                surface.DrawLine(posX, centerY + 10, posX, centerY + 13)
            end
        end
    end
    
    surface.SetDrawColor(255, 180, 50, 255)
    local triSize = 6
    local poly = {
        {x = centerX, y = centerY + 18},
        {x = centerX - triSize, y = centerY + 25},
        {x = centerX + triSize, y = centerY + 25}
    }
    draw.NoTexture()
    surface.DrawPoly(poly)
    
    draw.SimpleText(math.floor(ang) .. "°", "DermaDefault", centerX, compassY + 5, col, TEXT_ALIGN_CENTER)
end

-- =====================================================================
-- SYSTEM-FUNKTIONEN & DATEN-MANAGEMENT
-- =====================================================================
-- Verwaltung von Spielerdaten und sanften Animationen

-- ---------------------------------------------------------------------
-- LETZTE BEKANNTE SPIELER-WERTE (für Veränderungserkennung)
-- ---------------------------------------------------------------------
local lastHealth = 100     -- Letzter Gesundheitswert
local lastArmor = 0        -- Letzter Rüstungswert  
local lastStamina = SCIFI_HUD_CONFIG.Stamina and SCIFI_HUD_CONFIG.Stamina.max or 100  -- Letzter Ausdauerwert

-- ---------------------------------------------------------------------
-- AUSDAUER-SYSTEM ZUSTANDSVERWALTUNG
-- ---------------------------------------------------------------------
-- Status-Tracking für Ausdauer-Feedback
local staminaEmptyState = false    -- Ist Ausdauer derzeit leer?
local staminaPulseTimer = 0        -- Timer für Pulse-Effekte bei leerer Ausdauer

-- ---------------------------------------------------------------------
-- SOUND-SYSTEM FÜR FEEDBACK
-- ---------------------------------------------------------------------
-- Verwende Garry's Mod Standard-Sounds für Audio-Feedback
local soundEmpty = "buttons/button10.wav"   -- Sound für "Ausdauer leer"
local soundRefill = "buttons/button15.wav"  -- Sound für "Ausdauer wieder verfügbar"

-- ---------------------------------------------------------------------
-- NETZWERK-EMPFÄNGER FÜR AUSDAUER-UPDATES
-- ---------------------------------------------------------------------
-- Empfängt Ausdauer-Updates vom Server (falls Server-seitige Ausdauer implementiert ist)
net.Receive("SciFiHUD_StaminaUpdate", function()
    local val = net.ReadFloat()  -- Ausdauerwert vom Server empfangen
    if val then
        print("[SciFiHUD] Stamina net recv: ", val)  -- Debug-Ausgabe (für Entwicklung)
        
        -- Übergang zu "leer" erkennen und entsprechend reagieren
        if val <= 0 and not staminaEmptyState then
            staminaEmptyState = true               -- Status auf "leer" setzen
            staminaPulseTimer = CurTime() + 2.0   -- Pulse-Effekt für 2 Sekunden aktivieren
            surface.PlaySound(soundEmpty)         -- "Leer"-Sound abspielen
        -- Übergang zu "verfügbar" erkennen und entsprechend reagieren  
        elseif val > 10 and staminaEmptyState then
            staminaEmptyState = false             -- Status auf "verfügbar" setzen
            surface.PlaySound(soundRefill)        -- "Wiederaufgefüllt"-Sound abspielen
        end
        lastStamina = val  -- Neuen Wert speichern
    end
end)

-- ---------------------------------------------------------------------
-- ANIMIERTE WERT-ÜBERGÄNGE
-- ---------------------------------------------------------------------
-- Aktuelle visuell angezeigte Werte (werden sanft zu den echten Werten animiert)
local smoothHealth = 100        -- Animierter Gesundheitswert
local smoothArmor = 0          -- Animierter Rüstungswert
local smoothAmmo = 0           -- Animierte Munitionsanzeige
local smoothAmmoReserve = 0    -- Animierte Reserve-Munitionsanzeige

-- ---------------------------------------------------------------------
-- SANFTE WERT-ANIMATIONS-FUNKTION
-- ---------------------------------------------------------------------
-- Interpoliert sanft zwischen aktuellen und Zielwerten
-- Parameter: current (aktueller visueller Wert), target (Zielwert), speed (Animationsgeschwindigkeit)
-- Rückgabe: Neuer interpolierter Wert
local function SmoothValue(current, target, speed)
    return Lerp(FrameTime() * speed, current, target)
end

-- =====================================================================
-- STANDARD-HUD DEAKTIVIERUNG
-- =====================================================================
-- Versteckt die Standard Garry's Mod HUD-Elemente damit unser Custom-HUD sie ersetzen kann

hook.Add("HUDShouldDraw", "SciFiHUD_HideDefault", function(name)
    -- Liste der zu versteckenden Standard-HUD-Elemente
    local hide = {
        ["CHudHealth"] = true,        -- Standard-Gesundheitsanzeige
        ["CHudBattery"] = true,       -- Standard-Anzug-Energie/Rüstung  
        ["CHudAmmo"] = true,          -- Standard-Munitionsanzeige
        ["CHudSecondaryAmmo"] = true, -- Standard-Sekundär-Munitionsanzeige
        ["CHudDeathNotice"] = true    -- Standard-Kill-Feed (optional, kann auch angezeigt werden)
    }
    
    -- Rückgabe: false = Element verstecken, true = Element anzeigen
    return not hide[name]
end)

-- ===== HAUPT HUD ZEICHNEN =====

hook.Add("HUDPaint", "SciFiHUD_Paint", function()
    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end
    
    local w, h = ScrW(), ScrH()
    local scheme = colorSchemes.default
    local inCombat = hud_combatmode:GetBool()
    local isMinimal = hud_minimal:GetBool()
    -- Derived background variants (preserve existing alpha variations)
    local bgLight = Color(scheme.background.r, scheme.background.g, scheme.background.b, 200)
    local bgLight180 = Color(scheme.background.r, scheme.background.g, scheme.background.b, 180)
    local bgLight230 = Color(scheme.background.r, scheme.background.g, scheme.background.b, 230)
    
    -- NACHTMODUS MIT CONFIG MULTIPLIERN
    if hud_nightmode:GetBool() then
        scheme.primary = Color(
            scheme.primary.r * SCIFI_HUD_CONFIG.Modes.nightMode.primaryMultiplier, 
            scheme.primary.g * SCIFI_HUD_CONFIG.Modes.nightMode.greenMultiplier, 
            scheme.primary.b * SCIFI_HUD_CONFIG.Modes.nightMode.blueMultiplier, 
            255
        )
    end
    
    -- Sanfte Wert-Animationen MIT CONFIG GESCHWINDIGKEITEN
    local hp = ply:Health()
    local maxHP = ply:GetMaxHealth() or 100
    local hpPercent = math.Clamp(hp / maxHP, 0, 1)
    
    local armor = ply:Armor()
    local maxArmor = 100
    local armorPercent = math.Clamp(armor / maxArmor, 0, 1)
    
    smoothHealth = SmoothValue(smoothHealth, hp, SCIFI_HUD_CONFIG.Animations.smoothSpeed.health)
    smoothArmor = SmoothValue(smoothArmor, armor, SCIFI_HUD_CONFIG.Animations.smoothSpeed.armor)
    
    -- |> MITTELGROSSER KOMPASS (OBEN MITTE)
    DrawCompass(0, 0, w, h, scheme.primary, ply)
    
    -- |> VITAL SIGNS BOX (LINKS UNTEN) - POSITIONEN AUS CONFIG
    local vitalPos = SCIFI_HUD_CONFIG.Positions.vitalBox
    local boxX, boxY = vitalPos.x, h + vitalPos.y
    local boxW, boxH = vitalPos.width, vitalPos.height
    
    -- Abstandswerte für konsistente Padding
    local padding = vitalPos.padding
    local labelSpacing = 8
    local barSpacing = 25
    
    DrawAngledPanel(boxX, boxY, boxW, boxH, scheme.background, scheme.primary, 10)
    DrawCornerFrame(boxX, boxY, boxW, boxH, scheme.primary, vitalPos.cornerSize)
    
    -- SCAN EFFEKT ÜBER GANZE BOX
    DrawBoxScanEffect(boxX, boxY, boxW, boxH, scheme.primary)
    
    -- Titel mit gutem Abstand nach oben - TEXT AUS CONFIG
    draw.SimpleText(SCIFI_HUD_CONFIG.Text.labels.vitalSigns, "DermaDefault", boxX + padding, boxY + 12, scheme.primary, TEXT_ALIGN_LEFT)
    
    -- === HP ANZEIGE ===
    local hpLabelY = boxY + 35
    local hpBarY = hpLabelY + labelSpacing + 4
    
    -- HP Label mit gut lesbarem Abstand - TEXT AUS CONFIG
    draw.SimpleText(SCIFI_HUD_CONFIG.Text.labels.health, "DermaDefault", boxX + padding, hpLabelY, scheme.primary, TEXT_ALIGN_LEFT)
    
    -- HP Balken mit Scanner-Effekt - FARBEN AUS CONFIG
    local hpBarWidth = boxW - (padding * 2)
    local hpFillColor
    if hpPercent > 0.6 then
        hpFillColor = scheme.success
    elseif hpPercent > 0.3 then
        hpFillColor = scheme.warning
    else
        hpFillColor = scheme.danger
    end
    
    DrawScannerBar(boxX + padding, hpBarY, hpBarWidth, 22, hpPercent, bgLight, hpFillColor, 15)
    
    -- HP Wert mit sanfter Animation
    local hpCol = hpPercent > 0.3 and scheme.health_text or scheme.danger
    draw.SimpleText(math.floor(smoothHealth), "DermaDefaultBold", boxX + boxW - padding, hpBarY + 6, hpCol, TEXT_ALIGN_RIGHT)
    
    -- === RÜSTUNGS ANZEIGE ===
    local armorLabelY = hpBarY + 22 + barSpacing + 4
    local armorBarY = armorLabelY + labelSpacing + 4
    
    -- Rüstungs Label mit gutem Abstand - TEXT AUS CONFIG
    draw.SimpleText(SCIFI_HUD_CONFIG.Text.labels.armor, "DermaDefault", boxX + padding, armorLabelY, scheme.secondary, TEXT_ALIGN_LEFT)
    
    -- Rüstungs Balken mit Scanner-Effekt
    local armorBarWidth = boxW - (padding * 2)
    DrawScannerBar(boxX + padding, armorBarY, armorBarWidth, 22, armorPercent, bgLight180, scheme.primary, 12)
    
    -- Rüstungs Wert mit sanfter Animation
    draw.SimpleText(math.floor(smoothArmor), "DermaDefaultBold", boxX + boxW - padding, armorBarY + 6, scheme.armor_text, TEXT_ALIGN_RIGHT)
    
    -- |> MUNITIONS ANZEIGE (RECHTS UNTEN) - POSITIONEN AUS CONFIG
    local wep = ply:GetActiveWeapon()
    if IsValid(wep) then
        local clip = wep:Clip1()
        local reserve = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
        local wepName = wep:GetPrintName() or "UNKNOWN"
        
        -- Sanfte Munitions-Animationen MIT CONFIG GESCHWINDIGKEIT
        smoothAmmo = SmoothValue(smoothAmmo, clip, SCIFI_HUD_CONFIG.Animations.smoothSpeed.ammo)
        smoothAmmoReserve = SmoothValue(smoothAmmoReserve, reserve, SCIFI_HUD_CONFIG.Animations.smoothSpeed.ammo)
        
        -- POSITION AUS CONFIG
        local ammoPos = SCIFI_HUD_CONFIG.Positions.ammoBox
        local ammoX, ammoY = w + ammoPos.x, h + ammoPos.y
        local ammoW, ammoH = ammoPos.width, ammoPos.height
        
        -- MUNITIONS-WARNSYSTEM: GANZER BLOCK LEUCHTET ROT AUF
        local warningAlpha = 0
        
        if clip <= wep:GetMaxClip1() * 0.2 and clip > 0 then
            -- Niedrige Munition: Ganzer Block pulsiert rot
            warningAlpha = math.abs(math.sin(CurTime() * 5)) * 80
        elseif clip <= wep:GetMaxClip1() * 0.1 and clip > 0 then
            -- Extreme Warnung: Intensiveres rotes Pulsieren
            warningAlpha = math.abs(math.sin(CurTime() * 8)) * 120
        elseif clip == 0 then
            -- Kritische Warnung: Sehr intensives rotes Pulsieren
            warningAlpha = math.abs(math.sin(CurTime() * 12)) * 150
        end
        
        -- Zeichne roten Hintergrund wenn Warnung aktiv
        if warningAlpha > 0 then
            local warningBg = Color(255, 50, 50, warningAlpha)
            DrawAngledPanel(ammoX, ammoY, ammoW, ammoH, warningBg, Color(255, 100, 100, warningAlpha * 1.5), 10)
        else
            DrawAngledPanel(ammoX, ammoY, ammoW, ammoH, scheme.background, scheme.primary, 10)
        end
        
        DrawCornerFrame(ammoX, ammoY, ammoW, ammoH, scheme.primary, ammoPos.cornerSize)
        
        -- SCAN EFFEKT ÜBER MUNITIONS BOX (bei Warnung rot, sonst normal)
        if warningAlpha > 0 then
            DrawBoxScanEffect(ammoX, ammoY, ammoW, ammoH, Color(255, 100, 100, 150))
        else
            DrawBoxScanEffect(ammoX, ammoY, ammoW, ammoH, scheme.primary)
        end
        
        draw.SimpleText(wepName:upper(), "DermaDefaultBold", ammoX + ammoW - 15, ammoY + 8, scheme.primary, TEXT_ALIGN_RIGHT)
        
        if clip >= 0 then
            local clipCol = clip == 0 and scheme.danger or scheme.primary
            draw.SimpleText(math.floor(smoothAmmo), "DermaLarge", ammoX + ammoW / 2 - 40, ammoY + 35, clipCol, TEXT_ALIGN_RIGHT)
            
            surface.SetDrawColor(scheme.primary)
            surface.DrawLine(ammoX + ammoW / 2 - 5, ammoY + 40, ammoX + ammoW / 2 - 5, ammoY + 70)
            
            draw.SimpleText(math.floor(smoothAmmoReserve), "DermaDefaultBold", ammoX + ammoW / 2 + 10, ammoY + 50, scheme.secondary, TEXT_ALIGN_LEFT)
            
            if wep:GetMaxClip1() > 0 then
                local clipPercent = clip / wep:GetMaxClip1()
                DrawScannerBar(ammoX + 15, ammoY + ammoH - 25, ammoW - 30, 15, clipPercent, 
                           bgLight180, clipCol, 8)
            end
            
            -- Zusätzliche rote Umrandung bei kritischer Munition
            if clip == 0 then
                local criticalPulse = math.abs(math.sin(CurTime() * 15)) * 255
                surface.SetDrawColor(255, 0, 0, criticalPulse)
                surface.DrawOutlinedRect(ammoX + 1, ammoY + 1, ammoW - 2, ammoH - 2)
                surface.DrawOutlinedRect(ammoX + 2, ammoY + 2, ammoW - 4, ammoH - 4)
            end
        else
            draw.SimpleText(SCIFI_HUD_CONFIG.Text.labels.melee, "DermaLarge", ammoX + ammoW / 2, ammoY + 45, scheme.primary, TEXT_ALIGN_CENTER)
        end
    end
    
    -- |> AUSDAUER ANZEIGE - POSITION AUS CONFIG
    if not isMinimal then
        local stamina = ply:IsSprinting() and 65 or 100
        lastStamina = SmoothValue(lastStamina, stamina, SCIFI_HUD_CONFIG.Animations.smoothSpeed.stamina)
        
        -- POSITION AUS CONFIG
        local staminaPos = SCIFI_HUD_CONFIG.Positions.staminaBox
        local staminaX, staminaY = boxX, boxY + boxH + 10
        local staminaW, staminaH = staminaPos.width, staminaPos.height
        
        DrawAngledPanel(staminaX, staminaY, staminaW, staminaH, scheme.background, scheme.primary, 8)
        DrawCornerFrame(staminaX, staminaY, staminaW, staminaH, scheme.primary, staminaPos.cornerSize)
        
        -- SCAN EFFEKT ÜBER AUSDAUER BOX
        DrawBoxScanEffect(staminaX, staminaY, staminaW, staminaH, scheme.success)
        
        draw.SimpleText(SCIFI_HUD_CONFIG.Text.labels.stamina, "DermaDefault", staminaX + 10, staminaY + 8, scheme.success, TEXT_ALIGN_LEFT)
    DrawScannerBar(staminaX + 10, staminaY + 25, staminaW - 20, 12, lastStamina / 100, bgLight180, scheme.success, 10)
    end
    
    -- |> XP SYSTEM
    if not inCombat then
        local xp = 1250
        local maxXP = 2000
        local level = 12
        local xpPercent = math.Clamp(xp / maxXP, 0, 1)
        
        local xpX, xpY = 40, 70
        local xpW, xpH = 400, 45
        
        DrawAngledPanel(xpX, xpY, xpW, xpH, scheme.background, scheme.primary, 8)
        DrawCornerFrame(xpX, xpY, xpW, xpH, scheme.primary, 12)
        
        -- SCAN EFFEKT ÜBER XP BOX
        DrawBoxScanEffect(xpX, xpY, xpW, xpH, scheme.success)
        
    DrawAngledPanel(xpX + 5, xpY + 5, 50, 35, bgLight230, scheme.success, 5)
        draw.SimpleText(level, "DermaLarge", xpX + 30, xpY + 12, scheme.success, TEXT_ALIGN_CENTER)
        
        draw.SimpleText("RANK PROGRESSION", "DermaDefault", xpX + 65, xpY + 8, scheme.primary, TEXT_ALIGN_LEFT)
    DrawScannerBar(xpX + 65, xpY + 24, xpW - 75, 14, xpPercent, bgLight, scheme.success, 20)
        
        draw.SimpleText(xp .. " / " .. maxXP, "DermaDefault", xpX + xpW - 10, xpY + 24, scheme.secondary, TEXT_ALIGN_RIGHT)
    end
    
    -- |> MISSIONSZIELE
    if not inCombat then
        local missionX, missionY = 40, 130
        local missionW, missionH = 400, 90
        
        DrawAngledPanel(missionX, missionY, missionW, missionH, scheme.background, scheme.primary, 8)
        DrawCornerFrame(missionX, missionY, missionW, missionH, scheme.primary, 12)
        
        -- SCAN EFFEKT ÜBER MISSIONS BOX
        DrawBoxScanEffect(missionX, missionY, missionW, missionH, scheme.primary)
        
        surface.SetDrawColor(scheme.primary)
        surface.DrawRect(missionX + 10, missionY + 10, 4, 20)
        draw.SimpleText(">> MISSION OBJECTIVE", "DermaDefaultBold", missionX + 20, missionY + 12, scheme.primary, TEXT_ALIGN_LEFT)
        
        draw.SimpleText("Sichern des Außenpostens", "DermaDefault", missionX + 20, missionY + 35, scheme.health_text, TEXT_ALIGN_LEFT)
        
        local objProgress = 3
        local objTotal = 5
        local objPercent = objProgress / objTotal
        
        draw.SimpleText("STATUS: " .. objProgress .. " / " .. objTotal, "DermaDefault", missionX + 20, missionY + 55, scheme.success, TEXT_ALIGN_LEFT)
    DrawScannerBar(missionX + 20, missionY + 70, missionW - 40, 12, objPercent, bgLight, scheme.success, 5)
    end
    
    -- |> FUNKKANAL
    local radioX, radioY = w - 280, 70
    local radioW, radioH = 240, 50
    
    DrawAngledPanel(radioX, radioY, radioW, radioH, scheme.background, scheme.primary, 8)
    DrawCornerFrame(radioX, radioY, radioW, radioH, scheme.primary, 12)
    
    -- SCAN EFFEKT ÜBER FUNKKANAL BOX
    DrawBoxScanEffect(radioX, radioY, radioW, radioH, scheme.primary)
    
    local isSending = input.IsKeyDown(KEY_X)
    local channelName = "TAKTISCHER KANAL"
    
    surface.SetDrawColor(scheme.primary)
    surface.DrawRect(radioX + 10, radioY + 10, 3, 30)
    draw.SimpleText("COMM", "DermaDefault", radioX + 20, radioY + 12, scheme.primary, TEXT_ALIGN_LEFT)
    
    draw.SimpleText(channelName, "DermaDefaultBold", radioX + 20, radioY + 28, scheme.health_text, TEXT_ALIGN_LEFT)
    
    if isSending then
        local pulse = 100 + math.abs(math.sin(CurTime() * 10)) * 155
        DrawAngledPanel(radioX + radioW - 45, radioY + 15, 35, 20, Color(0, pulse, 0, 200), Color(0, 255, 0), 4)
        draw.SimpleText("TX", "DermaDefaultBold", radioX + radioW - 27, radioY + 18, Color(0, 0, 0), TEXT_ALIGN_CENTER)
    else
        DrawAngledPanel(radioX + radioW - 45, radioY + 15, 35, 20, Color(30, 30, 30, 200), Color(100, 100, 100), 4)
        draw.SimpleText("RX", "DermaDefaultBold", radioX + radioW - 27, radioY + 18, Color(100, 100, 100), TEXT_ALIGN_CENTER)
    end
    
    -- |> RADAR
    if not isMinimal then
        local radarX, radarY = w - 190, h - 330
        local radarRadius = 70
        
        DrawAngledPanel(radarX - 85, radarY - 85, 170, 170, scheme.background, scheme.primary, 8)
        DrawCornerFrame(radarX - 85, radarY - 85, 170, 170, scheme.primary, 12)
        
        DrawCircularRadar(radarX, radarY, radarRadius, scheme.primary, ply)
        
        draw.SimpleText("RADAR", "DermaDefault", radarX, radarY - 95, scheme.primary, TEXT_ALIGN_CENTER)
    end
    
    -- |> SCANLINE EFFEKTE
    if not isMinimal then
        for i = 0, h, 3 do
            surface.SetDrawColor(scheme.primary.r, scheme.primary.g, scheme.primary.b, 3)
            surface.DrawLine(0, i, w, i)
        end
        
        if math.random(100) < 2 then
            local glitchY = math.random(0, h)
            surface.SetDrawColor(scheme.primary.r, scheme.primary.g, scheme.primary.b, 20)
            surface.DrawRect(0, glitchY, w, 2)
        end
    end
end)

-- =====================================================================
-- KONSOLEN-BEFEHLE FÜR LIVE-KONFIGURATION
-- =====================================================================
-- Ermöglicht es Spielern, HUD-Modi direkt im Spiel umzuschalten

-- ---------------------------------------------------------------------
-- HAUPT-TOGGLE-BEFEHL
-- ---------------------------------------------------------------------
-- Befehl: scifi_hud_toggle [night|minimal|combat]
-- Schaltet verschiedene HUD-Modi um und zeigt Status im Chat an
concommand.Add("scifi_hud_toggle", function(ply, cmd, args)
    local scheme = colorSchemes.default  -- Farbschema für Chat-Nachrichten
    
    -- Prüfe welcher Modus umgeschaltet werden soll
    if args[1] == "night" then
        -- Nachtmodus umschalten (reduzierte Helligkeit)
        RunConsoleCommand("scifi_hud_nightmode", hud_nightmode:GetBool() and "0" or "1")
        chat.AddText(scheme.primary, "[HUD] ", scheme.health_text, "Nachtmodus " .. (hud_nightmode:GetBool() and "aktiviert" or "deaktiviert"))
        
    elseif args[1] == "minimal" then
        -- Minimal-Modus umschalten (weniger UI-Elemente)
        RunConsoleCommand("scifi_hud_minimal", hud_minimal:GetBool() and "0" or "1")
        chat.AddText(scheme.primary, "[HUD] ", scheme.health_text, "Minimal-Modus " .. (hud_minimal:GetBool() and "aktiviert" or "deaktiviert"))
        
    elseif args[1] == "combat" then
        -- Combat-Modus umschalten (nur kampfkritische Elemente)
        RunConsoleCommand("scifi_hud_combatmode", hud_combatmode:GetBool() and "0" or "1")
        chat.AddText(scheme.primary, "[HUD] ", scheme.health_text, "Combat-Mode " .. (hud_combatmode:GetBool() and "aktiviert" or "deaktiviert"))
        
    else
        -- Hilfetext anzeigen wenn kein gültiger Parameter angegeben wurde
        chat.AddText(scheme.danger, "[HUD] ", scheme.health_text, "Verwendung: scifi_hud_toggle [night|minimal|combat]")
    end
end)

-- =====================================================================
-- ERFOLGREICH GELADEN
-- =====================================================================
print("[SciFi HUD] Lila-Blau HUD erfolgreich geladen!")