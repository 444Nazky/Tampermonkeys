
local BackToLobbyRunning = false

local function CheckResOk(data)
    if data == true then return true end
    if type(data) == "table" and data.Success == true then return true end
    local success, IsModel = pcall(function() return data and data:IsA("Model") end)
    if success and IsModel then return true end
    if type(data) == "userdata" then return true end
    return false
end

local function RejoinMatch()
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction")
    local success = false
    local res
    repeat
        local StateFolder = game:GetService("ReplicatedStorage"):FindFirstChild("State")
        local CurrentMode = StateFolder and StateFolder.Difficulty.Value
        if CurrentMode then
            local ok, result = pcall(function()
                local payload
                if CurrentMode == "PizzaParty" then payload = { mode = "halloween", count = 1 }
                elseif CurrentMode == "Hardcore" then payload = { mode = "hardcore", count = 1 }
                elseif CurrentMode == "PollutedWasteland" then payload = { mode = "polluted", count = 1 }
                elseif CurrentMode == "Badlands" then payload = { mode = "badlands", count = 1 }
                else payload = { difficulty = CurrentMode, mode = "survival", count = 1 } end
                return remote:InvokeServer("Multiplayer", "v2:start", payload)
            end)
            if ok and CheckResOk(result) then success = true res = result else task.wait(0.5) end
        else
            task.wait(1)
        end
    until success
    return res
end

local function HandlePostMatch()
    local UiRoot
    repeat
        task.wait(1)
        local root = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ReactGameNewRewards")
        local frame = root and root:FindFirstChild("Frame")
        local gameOver = frame and frame:FindFirstChild("gameOver")
        local RewardsScreen = gameOver and gameOver:FindFirstChild("RewardsScreen")
        UiRoot = RewardsScreen and RewardsScreen:FindFirstChild("RewardsSection")
    until UiRoot

   
    RejoinMatch()
end

local function StartBackToLobby()
    if BackToLobbyRunning then return end
    BackToLobbyRunning = true
    task.spawn(function()
        while true do
            pcall(function() HandlePostMatch() end)
            task.wait(5)
        end
    end)
end


StartBackToLobby()







PrivateCode = "" -- Private server link code; works only on PC
ClaimRewards = true -- Claims lobby rewards after matches
AutoPickups = true -- Collects event pickups/tokens in match
AutoSkip = false -- Automatically votes to skip waves
AutoDJ = true -- Automatically manages DJ Booth support
AutoMercenary = true -- Automatically uses Mercenary Base ability
AntiLag = false -- Reduces effects/animations to lower lag
AutoRestart = false -- Enables post-match handling; false leaves the result screen untouched
RejoinLoss = false -- On loss: true returns to lobby, false restarts and replays the saved strategy
AutoGatling = false -- Automatically uses Gatling Gun ability if equipped
TimeScale = true -- Enables the time scale settings below

-- [[ WEBHOOK SETTINGS ]]
SendWebhook = false -- Sends match result notifications to webhook
Webhook = "YOUR-WEBHOOK-URL-HERE" -- Discord webhook URL

-- [[ INITIALIZE LIBRARY ]]
local TDS = loadstring(game:HttpGet("https://f.spacehub.wtf/Scripts/TDS/Recorders/Library.lua"))()

-- [[ START STRATEGY ]]
TDS:Loadout("Trapper", "DJ Booth", "Gatling Gun", "Hacker", "Mercenary Base")
TDS:Mode("Fallen")
TDS:GameInfo("Lay By", {"HiddenEnemies","Quarantine","ExplodingEnemies","Limitation","Committed","Fog","Glass"})

loadstring(game:HttpGet("https://gist.githubusercontent.com/getost2/9217e38c8c8ecc263dc5f955c04d8044/raw/dd10c3457fbc468afe64ef47d638c036a6836ff5/guttlin.lua"))()

-- [[ TIME SCALE SETTINGS ]]
if TimeScale then
    TDS:UnlockTimeScale()
    TDS:TimeScale(2)
end

TDS:Ready()
TDS:Place("Trapper", -2.87, 243.00, 225.49) -- 1

-- [ Wave 1 ] --

local targetPosition = Vector3.new(0.32, 246.31, 228.4) 

local player = game:GetService("Players").LocalPlayer


local function teleportOnce()
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart", 10)
    
    if rootPart then
        
        task.wait(2) 
        rootPart.CFrame = CFrame.new(targetPosition)
        print("mfds")
    end
end


teleportOnce()


TDS:Upgrade(1)


-- [ Wave 5 ] --
TDS:Upgrade(1)
TDS:Place("Trapper", -2.68, 243.12, 222.45) -- 2
TDS:Upgrade(2)

-- [ Wave 7 ] --
TDS:Upgrade(2)
TDS:SetOption(2, "Trap", "Landmine")
TDS:Place("Trapper", -2.76, 243.11, 219.28) -- 3

-- [ Wave 8 ] --
TDS:Upgrade(3)

-- [ Wave 10 ] --
TDS:Place("Gatling Gun", -5.76, 245.87, 172.16) -- 4

local targetPosition = Vector3.new(0.04, 246.31, 277.87) 

local player = game:GetService("Players").LocalPlayer


local function teleportOnce()
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart", 10)
    
    if rootPart then
       
        task.wait(2) 
        rootPart.CFrame = CFrame.new(targetPosition)
        print("gffd")
    end
end


teleportOnce()
-- [ Wave 11 ] --
TDS:Upgrade(4)

-- [ Wave 14 ] --
TDS:Upgrade(4)
TDS:Place("DJ Booth", -3.23, 243.00, 175.26) -- 5
TDS:Upgrade(5)
TDS:Upgrade(5)
TDS:SetOption(5, "Track", "Green")
TDS:Upgrade(5)

-- [ Wave 16 ] --
TDS:Ability(5, "Drop The Beat")

-- [ Wave 18 ] --
TDS:Upgrade(4)

-- [ Wave 20 ] --
TDS:Upgrade(4)

-- [ Wave 21 ] --
TDS:Ability(5, "Drop The Beat")
TDS:Upgrade(5)

-- [ Wave 23 ] --
TDS:Upgrade(5)
TDS:Ability(5, "Drop The Beat")

-- [ Wave 25 ] --
TDS:Upgrade(4)
TDS:Ability(5, "Drop The Beat")

-- [ Wave 27 ] --
TDS:Ability(5, "Drop The Beat")

-- [ Wave 29 ] --
TDS:Ability(5, "Drop The Beat")
TDS:Upgrade(4)

-- [ Wave 30 ] --
TDS:Place("Mercenary Base", -3.13, 243.00, 170.14) -- 6
TDS:Upgrade(6)
TDS:Upgrade(6)
TDS:Upgrade(6)
TDS:Upgrade(6)
TDS:Upgrade(6)
TDS:SetOption(6, "Unit 1", "Riot Guard")
TDS:SetOption(6, "Unit 2", "Riot Guard")
TDS:SetOption(6, "Unit 3", "Riot Guard")
TDS:Upgrade(6)

-- [ Wave 31 ] --
TDS:Ability(5, "Drop The Beat")
TDS:Place("Hacker", 2.65, 243.00, 206.13) -- 7
TDS:Upgrade(7)
TDS:Upgrade(7)
TDS:Upgrade(7)
TDS:Upgrade(7)

-- [ Wave 32 ] --
TDS:Upgrade(7, 2)
TDS:Ability(5, "Drop The Beat")

-- [ Wave 33 ] --
TDS:Upgrade(1)
TDS:Upgrade(1)
TDS:SetOption(1, "Trap", "Bear Traps")
TDS:Upgrade(2)
TDS:Upgrade(2)
TDS:SetOption(2, "Trap", "Bear Traps")
TDS:Upgrade(3)
TDS:Upgrade(3)
TDS:Upgrade(3)
TDS:SetOption(3, "Trap", "Bear Traps")
TDS:Place("Trapper", -2.76, 243.00, 228.59) -- 8
TDS:Upgrade(8)
TDS:Upgrade(8)
TDS:Upgrade(8)
TDS:Upgrade(8)
TDS:SetOption(8, "Trap", "Bear Traps")

-- [ Wave 34 ] --
TDS:Place("Trapper", -2.74, 243.00, 216.24) -- 9
TDS:Upgrade(9)
TDS:Upgrade(9)
TDS:Upgrade(9)
TDS:Upgrade(9)
TDS:SetOption(9, "Trap", "Bear Traps")
TDS:Place("Trapper", -2.75, 243.00, 213.05) -- 10
TDS:Upgrade(10)
TDS:Upgrade(10)
TDS:Upgrade(10)
TDS:Upgrade(10)
TDS:SetOption(10, "Trap", "Bear Traps")
TDS:Ability(5, "Drop The Beat")
TDS:Ability(7, "Hologram Tower")

-- [ Wave 35 ] --
TDS:Place("Hacker", 2.81, 243.00, 235.91) -- 11
TDS:Upgrade(11)
TDS:Upgrade(11)
TDS:Upgrade(11)
TDS:Ability(11, "Hologram Tower")

-- [ Wave 36 ] --
TDS:Ability(5, "Drop The Beat")
TDS:Ability(11, "Hologram Tower", {towerPosition = Vector3.new(-6.667132377624512, 245.99295043945312, 167.3599395751953), towerToClone = 4})
TDS:SetOption(5, "Track", "Red")
TDS:Upgrade(11)

-- [ Wave 37 ] --
TDS:Upgrade(11)
TDS:Place("Trapper", -2.76, 243.00, 209.82) -- 12
TDS:Upgrade(12)
TDS:Upgrade(12)
TDS:Upgrade(12)
TDS:Upgrade(12)
TDS:SetOption(12, "Trap", "Bear Traps")

-- [ Wave 38 ] --
TDS:Ability(7, "Hologram Tower")
TDS:Ability(7, "Hologram Tower", {towerPosition = Vector3.new(-6.721586227416992, 245.99295043945312, 167.02462768554688), towerToClone = 4})
TDS:Place("Mercenary Base", 2.66, 243.00, 173.22) -- 13
TDS:Upgrade(13)
TDS:Upgrade(13)
TDS:Upgrade(13)
TDS:Upgrade(13)
TDS:Upgrade(13)
TDS:Upgrade(13)
TDS:SetOption(13, "Unit 1", "Riot Guard")
TDS:SetOption(13, "Unit 2", "Riot Guard")
TDS:SetOption(13, "Unit 3", "Riot Guard")
TDS:Place("Mercenary Base", 3.07, 243.00, 168.52) -- 14
TDS:Upgrade(14)
TDS:Upgrade(14)
TDS:Upgrade(14)
TDS:Upgrade(14)
TDS:Upgrade(14)
TDS:SetOption(14, "Unit 1", "Riot Guard")
TDS:SetOption(14, "Unit 2", "Riot Guard")
TDS:SetOption(14, "Unit 3", "Field Medic")

-- [ Wave 39 ] --
TDS:Ability(5, "Drop The Beat")
TDS:Ability(13, "Air-Drop", {directionCFrame = CFrame.new(0, 243.12501525878906, 205.24717712402344, 0.9893710613250732, 0, -0.14541320502758026, -0, 1.0000001192092896, -0, 0.14541320502758026, 0, 0.9893710613250732), dist = 88.5, pathName = 1})
TDS:Ability(6, "Air-Drop", {directionCFrame = CFrame.new(0, 243.125, 210.2300262451172, 0.9997758269309998, 0, -0.021174412220716476, -0, 1.0000001192092896, -0, 0.021174412220716476, 0, 0.9997758269309998), dist = 81.552001953125, pathName = 1})
TDS:Ability(14, "Air-Drop", {directionCFrame = CFrame.new(0, 243.125, 210.89450073242188, 0.9997946619987488, 0, -0.020264945924282074, -0, 1, -0, 0.020264945924282074, 0, 0.9997946619987488), dist = 81.552001953125, pathName = 1})
TDS:Ability(11, "Hologram Tower", {towerPosition = Vector3.new(2.9099228382110596, 243, 163.53627014160156), towerToClone = 13})
TDS:Ability(7, "Hologram Tower")

-- [ Wave 40 ] --
TDS:Ability(5, "Drop The Beat")
TDS:Ability(13, "Air-Drop", {directionCFrame = CFrame.new(0, 243.125, 212.52536010742188, 0.9155306220054626, 0, -0.40224847197532654, -0, 1.0000001192092896, -0, 0.4022485315799713, 0, 0.9155305027961731), dist = 81.552001953125, pathName = 1})
TDS:Ability(6, "Air-Drop", {directionCFrame = CFrame.new(0, 243.125, 211.51095581054688, 0.975528359413147, 0, 0.21987386047840118, 0, 1.0000001192092896, -0, -0.21987386047840118, 0, 0.975528359413147), dist = 81.552001953125, pathName = 1})
TDS:Ability(14, "Air-Drop", {directionCFrame = CFrame.new(0, 243.125, 210.51881408691406, 0.9719761610031128, 0, 0.23507945239543915, 0, 1, -0, -0.23507945239543915, 0, 0.9719761610031128), dist = 81.552001953125, pathName = 1})
TDS:Ability(5, "Drop The Beat")
TDS:Ability(7, "Hologram Tower", {towerPosition = Vector3.new(-7.257579803466797, 245.99295043945312, 167.15869140625), towerToClone = 4})
TDS:Ability(13, "Air-Drop", {directionCFrame = CFrame.new(0, 243.12501525878906, 206.79396057128906, 0.9980348348617554, 0, 0.06266190856695175, 0, 1, -0, -0.06266190856695175, 0, 0.9980348348617554), dist = 85.40399169921875, pathName = 1})

-- [[ END OF STRATEGY ]]