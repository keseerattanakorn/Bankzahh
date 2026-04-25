local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/keseerattanakorn/Bankzahh/refs/heads/main/libold.lua"))()
local win = lib:Win("ReaperX Hub | For Map: One Piece: Divine")

-- Notifile แจ้งเตือนมุมขวาล่าง
lib:Notifile("Alert", "Script Opd!", 3)
		
local Cache = { DevConfig = {} };

Cache.DevConfig["ListOfBox1"] = {"Common Box"};
Cache.DevConfig["ListOfBox2"] = {"Uncommon Box"};
Cache.DevConfig["ListOfDrink"] = {"Cider+", "Lemonade+", "Juice+", "Smoothie+"};
Cache.DevConfig["ListOfDropCompass"] = {"Compass"};
Cache.DevConfig["ListOfBox3"] = {"Rare Box", "Ultra Rare Box"};

local rareFruits = {
    "Vampire Fruit", "Quake Fruit", "Phoenix Fruit", "Dark Fruit",
    "Ope Fruit", "Venom Fruit", "Candy Fruit", "Hollow Fruit",
    "Chilly Fruit", "Gas Fruit", "Flare Fruit", "Light Fruit",
    "Slash Fruit", "Sand Fruit", "Rumble Fruit", "Magma Fruit",
    "Snow Fruit", "Gravity Fruit", "Plasma Fruit", "Blood Fruit"
		}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ดึงชื่อผู้เล่นทุกคน (ยกเว้นตัวเอง)
local function getPlayerNames()
	local names = {}
	for _, player in ipairs(Players:GetPlayers()) do
			table.insert(names, player.Name)
	end
	return names
end

local Wapon = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(Wapon ,v.Name)
    end
end

local tab = lib.tabs:Taps("Fishings")
tab:Label("Function Auto Fishings [ Waitting Fix ] ")

tab:Toggle("Auto Fishing Super Rod", false, function(fshg)
        _G.AutoFishing = fshg
end)

spawn(function()
    local player = game.Players.LocalPlayer
    local fishing = game:GetService("ReplicatedStorage"):WaitForChild("Fishing")
    local vu = game:GetService("VirtualUser")

    -- หา UI
    local function getUI()
        local gui = player.PlayerGui:FindFirstChild("Fishing")
        if not gui then return end

        local frame = gui:FindFirstChild("Frame")
        if not frame then return end

        local fishingFrame = frame:FindFirstChild("Fishing")
        if not fishingFrame then return end

        return fishingFrame
    end

    -- รอ Active = true
    local function waitForActive()
    while true do
        local ui = getUI()

        if ui and ui:FindFirstChild("Active") then
            if ui.Active.Value == true then
                return ui -- ออกจากลูปเมื่อเจอ
            end
        end

        task.wait(0.1)
    end
end

    -- อ่าน Difficulty
    local function getDifficulty(ui)
        if ui and ui:FindFirstChild("Difficulty") then
            return ui.Difficulty.Text
        end
        return nil
    end

    -- logic จำนวนกด
    local function getPressCount(diffText)
        if not diffText then return 8 end

        if string.find(diffText, "Easy") then
            return 10

        elseif string.find(diffText, "Medium") then
            return math.random(8,10)

        elseif string.find(diffText, "Hard") then
            return math.random(7,9)

        elseif string.find(diffText, "Impossible") then
            local r = math.random(1,100)
            if r <= 70 then
                return math.random(8,9)
            else
                return 10
            end
        end

        return 8
    end

    while task.wait(0.1) do
        if _G.AutoFishing then
            pcall(function()
                local char = player.Character
                local hum = char and char:FindFirstChild("Humanoid")
                if not char or not hum then return end

                -- ใส่ Rod
                for _, tool in pairs(player.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name, "Rod") then
                        hum:EquipTool(tool)
                        break
                    end
                end

                task.wait(0.5)

                -- คลิก
                vu:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(0.1)
                vu:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)

                task.wait(1)

                -- Start
                fishing:FireServer("Start", "Medium")

                -- 🔥 รอ Active = true ก่อน
                local ui = waitForActive()
                if not ui then return end

                -- 🔥 ตอน Running เริ่ม -> อ่าน Difficulty
                local diffText = getDifficulty(ui)
                local pressCount = getPressCount(diffText)

                -- Running
                for i = 1, pressCount do
                    fishing:FireServer("Running", "Default")
                    task.wait(0.2)
                end

                fishing:FireServer("Finish", pressCount)
                task.wait(0.5)

                fishing:FireServer("Stop", "Default")

                task.wait(16)
            end)
        end
    end
end)

tab:Toggle("Auto Fishing Wood Rod", false, function(fsd)
        _G.AutoWoodRod = fsd
end)
		
spawn(function()
    local player = game.Players.LocalPlayer
    local fishing = game:GetService("ReplicatedStorage"):WaitForChild("Fishing")
    local vu = game:GetService("VirtualUser")

    while task.wait(0.1) do
        if _G.AutoWoodRod then
            pcall(function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChild("Humanoid")

                if not char or not hrp or not hum then return end

                -- หา Rod แล้วใส่
                for _, tool in pairs(player.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name, "Rod") then
                        hum:EquipTool(tool)
                        break
                    end
                end

                task.wait(0.5)

                -- 🔥 คลิกเมาส์ก่อน Start
                vu:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(0.1)
                vu:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)

                task.wait(1)

                -- เริ่ม Fishing
                fishing:FireServer("Start", "Medium")
                task.wait(1)

                -- จำลองกดวง
                for i = 1,10 do
                    fishing:FireServer("Running", "Default")
                    task.wait(0.2)
                end

                -- เสร็จ
                fishing:FireServer("Finish", 10)
                task.wait(0.5)

                fishing:FireServer("Stop", "Default")

                -- ⏳ รอ 16 วิ แล้ววนใหม่
                task.wait(50)

            end)
        end
    end
end)

tab:Label("Function Auto Skip Anim Fishings")
tab:Toggle("Auto Skip 7/10 Fishing (เล่นมินิเกมเอาเอง)", false, function(skp)
        skipfish = skp
end)

local tab3 = lib.tabs:Taps("Players")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local function getExpertiseMultiplier()
    local data = workspace.UserData:FindFirstChild("User_" .. lp.UserId)
    if not data then return 1,0 end

    data = data:FindFirstChild("Data")
    if not data then return 1,0 end

    local lvl = data:FindFirstChild("ExpertiseLvl")
    lvl = lvl and lvl.Value or 0

    local multi = 1 + (lvl * 0.01)
    if multi > 2 then multi = 2 end

    return multi, lvl
end

-- คำนวณครั้งเดียวตอนสร้าง UI
local multi, lvl = getExpertiseMultiplier()

local base = {
    uncommon = 20,
    rare = 2.975,
    ultra = 0.125
}

local uncommon = base.uncommon * multi
local rare = base.rare * multi
local ultra = base.ultra * multi

local common = 100 - (uncommon + rare + ultra)

local list = {
    "Common Box : "..string.format("%.3f", common).."%",
    "Uncommon Box : "..string.format("%.3f", uncommon).."%",
    "Rare Box : "..string.format("%.3f", rare).."%",
    "Ultra Rare Box : "..string.format("%.3f", ultra).."%"
}

tab3:Dropdown("Calculate Chance % (Lv."..lvl..")", list, function(v)
    print(v)
end)

tab3:Label("Function Players")
local playerNames = {}

for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(playerNames, player.Name)
end

tab3:Dropdown("Select Player :", playerNames, function(name)
    selectedPlayer = name
end)

tab3:Button("Reflash Name Player", function()
    table.clear(playerNames)
    for _, player in ipairs(game.Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
				end
			end)

tab3:Button("check Data Player & Storage 1-12", function()
local selectedName = selectedPlayer
local player = game.Players:FindFirstChild(selectedName)
if not player then return end

local userId = tostring(player.UserId)  
local userData = workspace:FindFirstChild("UserData")  
if not userData then return end  

local userFolder = userData:FindFirstChild("User_" .. userId)  
if not userFolder then return end  

local data = userFolder:FindFirstChild("Data") 
local affinities = data:FindFirstChild("Affinities")
if not data then return end  

local fruit1 = data:FindFirstChild("DevilFruit")  
local fruit2 = data:FindFirstChild("DevilFruit2")  

local defense = data:FindFirstChild("DefenseLvl")  
local melee = data:FindFirstChild("MeleeLvl")  
local sniper = data:FindFirstChild("SniperLvl")  
local sword = data:FindFirstChild("SwordLvl")  

local dft1defense = affinities:FindFirstChild("DFT1Defense")  
local dft1melee = affinities:FindFirstChild("DFT1Melee")  
local dft1sniper = affinities:FindFirstChild("DFT1Sniper")  
local dft1sword = affinities:FindFirstChild("DFT1Sword")  

local dft2defense = affinities:FindFirstChild("DFT2Defense")  
local dft2melee = affinities:FindFirstChild("DFT2Melee")  
local dft2sniper = affinities:FindFirstChild("DFT2Sniper")  
local dft2sword = affinities:FindFirstChild("DFT2Sword") 
local storages = data:FindFirstChild("Storages") 

print("-- ========== [User] ========== --")  
print("Check User: " .. selectedName .. " Data All")  
print(" Devil Fruit 1: " .. (fruit1 and fruit1.Value))  
print(" Devil Fruit 2: " .. (fruit2 and fruit2.Value))  
print("-- ========== [Status] ========== --")  
print(" Defence Lvl: " .. (defense and defense.Value or "N/A"))  
print(" Melee Lvl: " .. (melee and melee.Value or "N/A"))  
print(" Sniper Lvl: " .. (sniper and sniper.Value or "N/A"))  
print(" Sword Lvl: " .. (sword and sword.Value or "N/A"))  
print("-- ========== [Affinities Fruit 1] ========== --")  
print(" Affinities 1 Defence: " .. (dft1defense and dft1defense.Value or "N/A"))  
print(" Affinities 1 Melee: " .. (dft1melee and dft1melee.Value or "N/A"))  
print(" Affinities 1 Sniper: " .. (dft1sniper and dft1sniper.Value or "N/A"))  
print(" Affinities 1 Sword: " .. (dft1sword and dft1sword.Value or "N/A"))  
print("-- ========== [Affinities Fruit 2] ========== --")  
print(" Affinities 2 DEfence: " .. (dft2defense and dft2defense.Value or "N/A"))  
print(" Affinities 2 Melee: " .. (dft2melee and dft2melee.Value or "N/A"))  
print(" Affinities 2 Sniper: " .. (dft2sniper and dft2sniper.Value or "N/A"))  
print(" Affinities 2 Sword: " .. (dft2sword and dft2sword.Value or "N/A"))  
local storageValues = {}

for i = 1, 12 do
local found = storages:FindFirstChild("Storage" .. i)
table.insert(storageValues, found)
end
print("-- ========== [Devil Fruit Storage Player] ========== --")

for i, storage in ipairs(storageValues) do
    local value = storage and storage.Value or "N/A"
    
    if typeof(value) == "string" and value:find("Fruit") then
        local parts = string.split(value, ",")
        local fruitName = parts[1]
        local aura = parts[6] == "1" and " [ Aura ]" or ""

        print(" Storage " .. i .. ": " .. fruitName .. aura)
    else
        print(" Storage " .. i .. ": None")
    end
end

print("-- =================================== --")

   lib:Notifile("", "Send /console or F9 in chat!!! ", 6)
end)


tab3:Toggle("View Player", false, function(state)
	if selectedPlayer then
		local target = Players:FindFirstChild(selectedPlayer)
		if target and target.Character and target.Character:FindFirstChild("Humanoid") then
			if state then
				Camera.CameraSubject = target.Character.Humanoid
			else
				Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
			end
		end
	end
end)

tab3:Label("Function Check Backpack Players")

local tab7 = lib.tabs:Taps("Misc")

local afkConnection

tab7:Toggle("Anti AFK", false, function(state)

    if state then
	lib:Notifile("", "ปกป้อง โดนเตะ " .. game.Players.LocalPlayer.Name .. " Can AFK Now :)", 3)
        local vu = game:GetService("VirtualUser")
        afkConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    else
        if afkConnection then
            afkConnection:Disconnect()
            afkConnection = nil
        end
    end
end)
