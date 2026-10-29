_G.AutoChain = true
_G.AutoDJ = true
_G.AutoMedic = true
_G.AutoReady = false
_G.AutoSkipCutscenes = true
_G.AutoPickups = true
_G.AutoRestart = true
_G.RejoinLoss = true

shared.SpaceHubDirectMacroStarting = true
local TDS = shared.TDSTable
if not TDS or not TDS.LibraryReady then
    TDS = loadstring(game:HttpGet("https://f.spacehub.wtf/TDS/Loader.lua"))()
end

TDS:Loadout("Trapper", "Electroshocker", "Gatling Gun", "None", "None")
TDS:Mode("Act3")
loadstring(game:HttpGet("https://raw.githubusercontent.com/avtryxz/autogutlin/refs/heads/main/autogutlin.lua"))()
TDS:Ready()
TDS:Place("Electroshocker", 6.266302108764648, 103.19615936279297, 114.51535034179688)
TDS:Upgrade(1)

-- [ Wave 1 ] --
TDS:Place("Electroshocker", -2.4911441802978516, 103.01860809326172, 109.38530731201172)

-- [ Wave 2 ] --
TDS:Upgrade(2)
TDS:Place("Trapper", -9.957616806030273, 102.25682067871094, 90.8094482421875)

-- [ Wave 3 ] --
TDS:Upgrade(3)

-- [ Wave 4 ] --
TDS:Upgrade(2)
TDS:Upgrade(3)

-- [ Wave 5 ] --
TDS:Upgrade(1)

-- [ Wave 7 ] --
TDS:VoteSkip(7)
TDS:Place("Gatling Gun", -20.296098709106445, 109.3306884765625, 112.9366455078125)

-- [ Wave 8 ] --
TDS:Upgrade(4)

-- [ Wave 10 ] --
TDS:Upgrade(4)

-- [ Wave 11 ] --
TDS:Place("Trapper", -5.1782660484313965, 103.01500701904297, 107.50469970703125)
TDS:Upgrade(5)
TDS:Upgrade(5)

-- [ Wave 12 ] --
TDS:Place("Trapper", 0.6218795776367188, 103.01307678222656, 109.23262023925781)
TDS:Upgrade(6)
TDS:Upgrade(6)
TDS:Upgrade(2)
TDS:Upgrade(1)

-- [ Wave 13 ] --
TDS:Upgrade(4)

-- [ Wave 14 ] --
TDS:Upgrade(1)
TDS:Upgrade(2)

-- [ Wave 15 ] --
TDS:Upgrade(6)
TDS:Upgrade(6)
TDS:Upgrade(5)
TDS:SetOption(6, "Trap", "Bear Traps")

-- [ Wave 16 ] --
TDS:Upgrade(5)
TDS:SetOption(5, "Trap", "Bear Traps")

-- [ Wave 17 ] --
TDS:Upgrade(3)
TDS:Upgrade(3)
TDS:SetOption(3, "Trap", "Bear Traps")

-- [ Wave 18 ] --
TDS:Upgrade(4)

-- [ Wave 19 ] --
TDS:Place("Electroshocker", -0.8855667114257812, 103.02986145019531, 106.56546783447266)
TDS:Upgrade(7)
TDS:Upgrade(7)
TDS:Upgrade(7)
TDS:Upgrade(7)
TDS:Place("Electroshocker", -3.4888012409210205, 102.98815155029297, 104.98251342773438)
TDS:Upgrade(8)
TDS:Upgrade(8)
TDS:Upgrade(8)
TDS:Upgrade(8)
TDS:Place("Electroshocker", 2.1428580284118652, 102.9297866821289, 106.47684478759766)
TDS:Upgrade(9)
TDS:Upgrade(9)
TDS:Upgrade(9)
TDS:Upgrade(9)
TDS:Place("Trapper", -12.504602432250977, 103.20408630371094, 103.97769165039062)
TDS:Upgrade(10)
TDS:Upgrade(10)
TDS:Upgrade(10)
TDS:Upgrade(10)
TDS:SetOption(10, "Trap", "Bear Traps")

-- [ Wave 20 ] --
TDS:Upgrade(4)

-- [ Wave 21 ] --
TDS:Upgrade(2)
TDS:Upgrade(8)
TDS:Upgrade(7)
TDS:Upgrade(9)
TDS:Upgrade(1)
TDS:Place("Trapper", -15.240079879760742, 102.5904541015625, 98.49327850341797)
TDS:Upgrade(11)
TDS:Upgrade(11)
TDS:Upgrade(11)
TDS:Upgrade(11)
TDS:SetOption(11, "Trap", "Bear Traps")
TDS:Place("Trapper", -10.2066068649292, 103.16090393066406, 111.88145446777344)
TDS:Upgrade(12)
TDS:Upgrade(12)
TDS:Upgrade(12)

-- [ Wave 22 ] --
TDS:Upgrade(12)
TDS:SetOption(12, "Trap", "Bear Traps")
TDS:Place("Electroshocker", -7.0439133644104, 102.67435455322266, 99.01319122314453)
TDS:Upgrade(13)
TDS:Upgrade(13)
TDS:Upgrade(13)
TDS:Upgrade(13)
TDS:Upgrade(13)
TDS:Place("Electroshocker", 3.102853298187256, 103.16314697265625, 114.09947967529297)
TDS:Upgrade(14)
TDS:Upgrade(14)
TDS:Upgrade(14)
TDS:Upgrade(14)
TDS:Upgrade(14)

-- [ Wave 23 ] --
TDS:Upgrade(4)
TDS:Place("Trapper", -3.3586063385009766, 103.26113891601562, 115.70428466796875)
TDS:Upgrade(15)
TDS:Upgrade(15)
TDS:Upgrade(15)
TDS:Upgrade(15)
TDS:SetOption(15, "Trap", "Bear Traps")
TDS:SetOption(3, "Trap", "Bear Traps")
TDS:SetOption(5, "Trap", "Bear Traps")
TDS:SetOption(6, "Trap", "Bear Traps")
TDS:SetOption(10, "Trap", "Bear Traps")

-- [[ END OF STRATEGY ]]
