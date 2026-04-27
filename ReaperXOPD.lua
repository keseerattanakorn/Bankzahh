local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/keseerattanakorn/Bankzahh/refs/heads/main/libold.lua"))()
local win = lib:Win("ReaperX Hub | For Map: One Piece: Divine")

-- Notifile แจ้งเตือนมุมขวาล่าง
lib:Notifile("Alert", "Script Opd!", 3)

local rareFruits = {
    "Ope Fruit", "Venom Fruit", "Candy Fruit",
	"Hollow Fruit", "Chilly Fruit", "Gas Fruit",
	"Flare Fruit", "Light Fruit", "Sand Fruit",
	"Rumble Fruit", "Magma Fruit", "Snow Fruit",
	"Gravity Fruit", "Plasma Fruit", "Blood Fruit",
	"Luck Fruit", "String Fruit"
		}
local ultrarareFruits = {
    "Vampire Fruit",
	"Quake Fruit",
	"Phoenix Fruit",
	"Dark Fruit",
	"Slash Fruit",
	"Alice Fruit"
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

    while task.wait(0.1) do
        if _G.AutoFishing then
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
                task.wait(16)

            end)
        end
    end
end)

tab:Toggle("Old Auto Fishing Wood Rod", false, function(fsd)
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
						
                for i = 1, 10 do
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

local tab1 = lib.tabs:Taps("Autos")
tab1:Label("Function Skill Keyboard [ กำลังทำเพิ่ม ] ")
local VIM = game:GetService("VirtualInputManager")

local function runAuto(stateFunc, keyFunc, timeFunc)
    task.spawn(function()
        while true do
            if stateFunc() and keyFunc() then
                local key = keyFunc()
                local hold = tonumber(timeFunc())

                if hold == nil then
                    -- ไม่ใส่ = 1.5 วิ
                    VIM:SendKeyEvent(true, Enum.KeyCode[key], false, game)
                    task.wait(0.05)
                    VIM:SendKeyEvent(false, Enum.KeyCode[key], false, game)
                    task.wait(1.5)

                elseif hold == 0 then
                    -- 0 = 1 วิ
                    VIM:SendKeyEvent(true, Enum.KeyCode[key], false, game)
                    task.wait(0.05)
                    VIM:SendKeyEvent(false, Enum.KeyCode[key], false, game)
                    task.wait(1)

                else
                    -- กดค้าง
                    VIM:SendKeyEvent(true, Enum.KeyCode[key], false, game)
                    task.wait(hold)
                    VIM:SendKeyEvent(false, Enum.KeyCode[key], false, game)
                    task.wait(0.1)
                end
            else
                task.wait()
            end
        end
    end)
end

local keys = {"Z","X","C","V","B","N","F","G","H","J","K"}

-- Z
local selectedKeyZ, selectedTimeZ, stateZ
tab1:Dropdown("Select Keys :", keys, function(v) selectedKeyZ = v end)
tab1:Textbox("Hold Key :", "ใส่เลข", function(v) selectedTimeZ = v end)
tab1:Toggle("Auto Key", false, function(v) stateZ = v end)
runAuto(function() return stateZ end, function() return selectedKeyZ end, function() return selectedTimeZ end)

-- X
local selectedKeyX, selectedTimeX, stateX
tab1:Dropdown("Select Keys :", keys, function(v) selectedKeyX = v end)
tab1:Textbox("Hold Key :", "ใส่เลข", function(v) selectedTimeX = v end)
tab1:Toggle("Auto Key", false, function(v) stateX = v end)
runAuto(function() return stateX end, function() return selectedKeyX end, function() return selectedTimeX end)

-- C
local selectedKeyC, selectedTimeC, stateC
tab1:Dropdown("Select Keys :", keys, function(v) selectedKeyC = v end)
tab1:Textbox("Hold Key :", "ใส่เลข", function(v) selectedTimeC = v end)
tab1:Toggle("Auto Key", false, function(v) stateC = v end)
runAuto(function() return stateC end, function() return selectedKeyC end, function() return selectedTimeC end)

-- V
local selectedKeyV, selectedTimeV, stateV
tab1:Dropdown("Select Keys :", keys, function(v) selectedKeyV = v end)
tab1:Textbox("Hold Key :", "ใส่เลข", function(v) selectedTimeV = v end)
tab1:Toggle("Auto Key", false, function(v) stateV = v end)
runAuto(function() return stateV end, function() return selectedKeyV end, function() return selectedTimeV end)

-- B
local selectedKeyB, selectedTimeB, stateB
tab1:Dropdown("Select Keys :", keys, function(v) selectedKeyB = v end)
tab1:Textbox("Hold Key :", "ใส่เลข", function(v) selectedTimeB = v end)
tab1:Toggle("Auto Key", false, function(v) stateB = v end)
runAuto(function() return stateB end, function() return selectedKeyB end, function() return selectedTimeB end)

-- N
local selectedKeyN, selectedTimeN, stateN
tab1:Dropdown("Select Keys :", keys, function(v) selectedKeyN = v end)
tab1:Textbox("Hold Key :", "ใส่เลข", function(v) selectedTimeN = v end)
tab1:Toggle("Auto Key", false, function(v) stateN = v end)
runAuto(function() return stateN end, function() return selectedKeyN end, function() return selectedTimeN end)

local tab3 = lib.tabs:Taps("Players")
tab3:Label("Chance Your Compass | On Legendary Mode ")
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

-- =========================
-- 🔹 ตัวแปรหลัก
-- =========================
local selectedPlayer = nil
local playerNames = {}
local itemList = {}

-- =========================
-- 🧠 ฟังก์ชันนับของ
-- =========================
local function getItemList(player)

    local items = {
        ["Common Box"] = 0,
        ["Uncommon Box"] = 0,
        ["Rare Box"] = 0,
        ["Ultra Rare Box"] = 0,
        ["Compass"] = 0,
        ["Silver Compass"] = 0
    }
	
    if not player then
        return {"ไม่พบผู้เล่น"}
    end

    -- Backpack
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, v in ipairs(backpack:GetChildren()) do
            if items[v.Name] then
                items[v.Name] += 1
            end
        end
    end

    -- Character
    local char = player.Character
    if char then
        for _, v in ipairs(char:GetChildren()) do
            if items[v.Name] then
                items[v.Name] += 1
            end
        end
    end

    -- แปลงเป็น list
    local result = {}

    for name, count in pairs(items) do
        if count > 0 then
            if count > 1 then
                table.insert(result, name .. " ( " .. count .. " )")
            else
                table.insert(result, name)
            end
        end
    end

    if #result == 0 then
        table.insert(result, "ไม่พบของ")
    end

    return result
end

-- =========================
-- 🔄 ฟังก์ชันรีเฟรชรายชื่อผู้เล่น
-- =========================
local function refreshPlayers()
    table.clear(playerNames)

    for _, plr in ipairs(Players:GetPlayers()) do
        table.insert(playerNames, plr.Name)
    end
end

-- =========================
-- 🔄 ฟังก์ชันรีเฟรชของ
-- =========================
local function refreshItems()
    if not selectedPlayer then return end

    local player = Players:FindFirstChild(selectedPlayer)
    local newItems = getItemList(player)

    table.clear(itemList)

    for _, v in ipairs(newItems) do
        table.insert(itemList, v)
    end
end

-- =========================
-- 🔹 สร้าง dropdown
-- =========================
refreshPlayers()

tab3:Dropdown("Select Player :", playerNames, function(name)
    selectedPlayer = name
end)

tab3:Dropdown("Backpack Player :", itemList, function(v)
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

tab3:Button("Refresh Players", function()
    refreshPlayers()
end)

-- =========================
-- 🔘 ปุ่มรีเฟรชเฉพาะของ
-- =========================
tab3:Button("Refresh Items", function()
    refreshItems()
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

tab3:Label("Function Check Rare Fruits")

--[[ tab3:Toggle("Check Rare in Server [ ใช้แล้วกระตุกช่วงๆ เดะแก้ทีหลัง ]", false, function(chkur)
	checkfruits = chkur
end)

task.spawn(function()
    while task.wait(2) do -- เช็คทุก 2 วิ (ปรับได้)

        if not checkfruits then continue end

        for _, player in ipairs(Players:GetPlayers()) do

            -- ข้ามตัวเอง (ถ้าไม่อยากเช็คตัวเอง)
            if player == Players.LocalPlayer then continue end

            local hasFruit = hasRareFruit(player)

            if hasFruit and not notified[player.Name] then
                notified[player.Name] = true

                lib:Notify("", player.Name .. " มีผลแรร์!!!", 3)

                task.wait(1) -- กันแจ้งติดกันเร็วเกิน
            end

            -- ถ้าอยากให้มัน “รีเช็คใหม่ได้” เมื่อเขาไม่มีแล้ว
            if not hasFruit then
                notified[player.Name] = nil
            end

        end
    end
end)]]--

local tab7 = lib.tabs:Taps("Misc")
tab7:Label("Check All Sword Secret [ Soon . . . ]")

tab7:Label("Check Raid [ Soon . . . ]")

tab7:Toggle("ESP Health Players [ Fix ]", false, function(chkhtl)
    checkhealth = chkhtl

    if checkhealth then
        task.spawn(function()
            while checkhealth do
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= Players.LocalPlayer and p.Character then
                        local char = p.Character
                        local head = char:FindFirstChild("Head")
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if not head or not hrp then continue end

                        local trait = char:FindFirstChild("CharacterTrait")
                        if not trait then continue end

                        local hp = trait:FindFirstChild("Health")
                        local max = trait:FindFirstChild("HealthMax")
                        if not hp or not max then continue end

                        local gui = head:FindFirstChild("NameTag")
                        if not gui then
                            gui = Instance.new("BillboardGui", head)
                            gui.Name = "NameTag"
                            gui.AlwaysOnTop = true

                            local txt = Instance.new("TextLabel", gui)
                            txt.Name = "Text"
                            txt.Size = UDim2.new(1,0,1,0)
                            txt.BackgroundTransparency = 1
                            txt.TextScaled = true
                            txt.TextStrokeTransparency = 0
                            txt.TextColor3 = Color3.fromRGB(255,255,255)
                        end

                        local txt = gui.Text

                        -- 📏 คำนวณระยะ
                        local dist = (Camera.CFrame.Position - hrp.Position).Magnitude

                        -- 📉 ปรับขนาดตามระยะ
                        local scale = math.clamp(1 / (dist / 20), 0.5, 1.5)
                        gui.Size = UDim2.new(0, 200 * scale, 0, 40 * scale)

                        -- 🙈 ซ่อนถ้าไกลเกิน
                        gui.Enabled = dist < 300

                        -- 📝 อัปเดตข้อความ
                        txt.Text = "Name: "..p.Name.." | Health: "
                            ..math.floor(hp.Value).."/"..math.floor(max.Value)
                    end
                end
                task.wait(0.1)
            end

            -- ปิดแล้วลบ
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Head") then
                    local tag = p.Character.Head:FindFirstChild("NameTag")
                    if tag then tag:Destroy() end
                end
            end
        end)
    end
end)
