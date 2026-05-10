local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/keseerattanakorn/Bankzahh/refs/heads/main/libold.lua"))()
local win = lib:Win("ReaperX Hub | For Map: One Piece: Divine")

-- Notifile แจ้งเตือนมุมขวาล่าง
lib:Notifile("Alert", "ยินดีต้อนรับสู่แมพแอดมินหมาๆนี่!", 3)

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

local function formatNumber(num)
    return tostring(num):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

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

local tab = lib.tabs:Taps("ตกปลา")
tab:Label("ฝั่งชั่น ออโต้ตกปลา [ รอการแก้ไข ] ")

tab:Toggle("ออโต้ ตกปลาด้วยซุปเปอร์เบ็ด", false, function(fshg)
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

tab:Toggle("ออโต้ ตกปลาด้วยเบ็ดไม้", false, function(fsd)
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

local tab1 = lib.tabs:Taps("ออโต้")
tab1:Label("ฝั่งชั่น ออโต้คีบอร์ด [ ใส่เลข 0 เพื่อหยุดกดคีย์ค้าง ] ")
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

local keys = {"| ↘️สกิลดาบ↙️ |","Y","| ↘️สกิลผลช่อง 1↙️ |","Z","X","C","V","B","N","| ↘️สกิลผลช่ิงที่ 2↙️ |","F","G","H","J","K","| ↘️ฮาคิ↙️ |","R","Q"}

-- Z
local selectedKeyZ, selectedTimeZ, stateZ
tab1:Dropdown("เลือก คีย์ :", keys, function(v) selectedKeyZ = v end)
tab1:Textbox("คีย์กดค้าง :", "ใส่เลข", function(v) selectedTimeZ = v end)
tab1:Toggle("ออโต้ คีย์", false, function(v) stateZ = v end)
runAuto(function() return stateZ end, function() return selectedKeyZ end, function() return selectedTimeZ end)

-- X
local selectedKeyX, selectedTimeX, stateX
tab1:Dropdown("เลือก คีย์ :", keys, function(v) selectedKeyX = v end)
tab1:Textbox("คีย์กดค้าง :", "ใส่เลข", function(v) selectedTimeX = v end)
tab1:Toggle("ออโต้ คีย์", false, function(v) stateX = v end)
runAuto(function() return stateX end, function() return selectedKeyX end, function() return selectedTimeX end)

-- C
local selectedKeyC, selectedTimeC, stateC
tab1:Dropdown("เลือก คีย์ :", keys, function(v) selectedKeyC = v end)
tab1:Textbox("คีย์กดค้าง :", "ใส่เลข", function(v) selectedTimeC = v end)
tab1:Toggle("ออโต้ คีย์", false, function(v) stateC = v end)
runAuto(function() return stateC end, function() return selectedKeyC end, function() return selectedTimeC end)

-- V
local selectedKeyV, selectedTimeV, stateV
tab1:Dropdown("เลือก คีย์ :", keys, function(v) selectedKeyV = v end)
tab1:Textbox("คีย์กดค้าง :", "ใส่เลข", function(v) selectedTimeV = v end)
tab1:Toggle("ออโต้ คีย์", false, function(v) stateV = v end)
runAuto(function() return stateV end, function() return selectedKeyV end, function() return selectedTimeV end)

-- B
local selectedKeyB, selectedTimeB, stateB
tab1:Dropdown("เลือก คีย์ :", keys, function(v) selectedKeyB = v end)
tab1:Textbox("คีย์กดค้าง :", "ใส่เลข", function(v) selectedTimeB = v end)
tab1:Toggle("ออโต้ คีย์", false, function(v) stateB = v end)
runAuto(function() return stateB end, function() return selectedKeyB end, function() return selectedTimeB end)

-- N
local selectedKeyN, selectedTimeN, stateN
tab1:Dropdown("เลือก คีย์ :", keys, function(v) selectedKeyN = v end)
tab1:Textbox("คีย์กดค้าง :", "ใส่เลข", function(v) selectedTimeN = v end)
tab1:Toggle("ออโต้ คีย์", false, function(v) stateN = v end)
runAuto(function() return stateN end, function() return selectedKeyN end, function() return selectedTimeN end)

local tab3 = lib.tabs:Taps("ผู้เล่น")
tab3:Label("คำนวณเรทเข็มทิศ | ของ โหมดจุติ ")
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

tab3:Dropdown("เรทเข็มทิศที่คำนวณ % (Lv."..lvl..")", list, function(v)
    print(v)
end)

tab3:Label("ผู้เล่น")
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
        table.insert(result, "Not Found Item")
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

tab3:Dropdown("เลือก ผู้เล่น :", playerNames, function(name)
    selectedPlayer = name
end)

tab3:Dropdown("กระเป๋า ผู้เล่น :", itemList, function(v)
end)

tab3:Toggle("ดูมุมมอง ผู้เล่น", false, function(state)
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

tab3:Button("รีเฟรช ชื่อผู้เล่น", function()
    refreshPlayers()
end)

-- =========================
-- 🔘 ปุ่มรีเฟรชเฉพาะของ
-- =========================
tab3:Button("รีเฟรชไอเทม", function()
    refreshItems()
end)

tab3:Button("เช็คข้อมูลผู้เล่นทั้งหมด", function()
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

local bosses = data:FindFirstChild("Bosses")

local ace = bosses:FindFirstChild("FireBossKills")
local endless = bosses:FindFirstChild("MarineRaidsCompleted")
local marine = bosses:FindFirstChild("EndlessRaidsCompleted")

local beris = data:FindFirstChild("Beri")
local gems = data:FindFirstChild("Gems")
local kills = data:FindFirstChild("Kills")

local fruit1 = data:FindFirstChild("DevilFruit")  
local fruit2 = data:FindFirstChild("DevilFruit2")  
local aurafruit1 = data:FindFirstChild("DevilFruit_Color")  
local aurafruit2 = data:FindFirstChild("DevilFruit2_Color")  
		
local defense = data:FindFirstChild("DefenseLvl")  
local melee = data:FindFirstChild("MeleeLvl")  
local sniper = data:FindFirstChild("SniperLvl")  
local sword = data:FindFirstChild("SwordLvl")
local haki = data:FindFirstChild("HakiLvl")

local dft1defense = affinities:FindFirstChild("DFT1Defense")  
local dft1melee = affinities:FindFirstChild("DFT1Melee")  
local dft1sniper = affinities:FindFirstChild("DFT1Sniper")  
local dft1sword = affinities:FindFirstChild("DFT1Sword")  

local dft2defense = affinities:FindFirstChild("DFT2Defense")  
local dft2melee = affinities:FindFirstChild("DFT2Melee")  
local dft2sniper = affinities:FindFirstChild("DFT2Sniper")  
local dft2sword = affinities:FindFirstChild("DFT2Sword") 
local storages = data:FindFirstChild("Storages") 
local bounds = data:FindFirstChild("Bounds")

print("-- ========== [การลงดัน ของผู้เล่นคนนี้] ========== --")
print(" ฆ่าบอสเอส ไปทั้งหมด: " .. (ace and ace.Value))  
print(" เคลียร์ดันมารีน ไปทั้งหมด: " .. (marine and marine.Value))
print(" เคลียร์ดันEndless ไปทั้งหมด: " .. (endless and endless.Value))
print("-- ========== [ผู้เล่น] ========== --")
print("เช็ค ผู้เล่น: " .. selectedName .. " ข้อมูลทั้งหมด")  
local fruit1Aura = (aurafruit1 and aurafruit1.Value ~= "None") and " [ ออร่า ]" or ""
local fruit2Aura = (aurafruit2 and aurafruit2.Value ~= "None") and " [ ออร่า ]" or ""

print(" ผลช่อง 1: " .. (fruit1 and fruit1.Value or "None") .. fruit1Aura)  
print(" ผลช่อง 2: " .. (fruit2 and fruit2.Value or "None") .. fruit2Aura)
print("-- ========== [Status] ========== --")  
print(" ค่าป้องกัน เวล: " .. (defense and defense.Value or "N/A"))  
print(" ค่าเมรี เวล: " .. (melee and melee.Value or "N/A"))  
print(" ค่าปืน เวล: " .. (sniper and sniper.Value or "N/A"))  
print(" ค่าดาบ เวล: " .. (sword and sword.Value or "N/A"))
print(" ค่าฮาคิ เวล: " .. (haki and haki.Value or "N/A"))
print("-- ========== [Status of Spending And Kills Amounts] ========== --")
print(" มีเพชร จำนวน : " .. (gems and formatNumber(gems.Value) or "N/A"))
print(" มีเบรี จำนวน : " .. (beris and formatNumber(beris.Value) or "N/A"))
print(" มีฆ่า จำนวน: " .. (kills and formatNumber(kills.Value) or "N/A"))
print("-- ========== [พีรามิด ผลช่อง 1] ========== --")  
print(" พีรามิดผลช่อง 1 ค่าป้องกัน: " .. (dft1defense and dft1defense.Value or "N/A"))  
print(" พีรามิดผลช่อง 1 ค่าเมรี: " .. (dft1melee and dft1melee.Value or "N/A"))  
print(" พีรามิดผลช่อง 1 ค่าปืน: " .. (dft1sniper and dft1sniper.Value or "N/A"))  
print(" พีรามิดผลช่อง 1 ค่าดาบ: " .. (dft1sword and dft1sword.Value or "N/A"))  
print("-- ========== [พีรามิด ผลช่อง 2] ========== --")  
print(" พีรามิดผลช่อง 2 ค่าป้องกัน: " .. (dft2defense and dft2defense.Value or "N/A"))  
print(" พีรามิดผลช่อง 2 ค่าเมรี: " .. (dft2melee and dft2melee.Value or "N/A"))  
print(" พีรามิดผลช่อง 2 ค่าปืน: " .. (dft2sniper and dft2sniper.Value or "N/A"))  
print(" พีรามิดผลช่อง 2 ค่าดาบ: " .. (dft2sword and dft2sword.Value or "N/A"))  
local storageValues = {}

for i = 1, 12 do
local found = storages:FindFirstChild("Storage" .. i)
table.insert(storageValues, found)
		end
print("-- ========== [ที่เก็บผลไม้ปีศาจ ของผู้เล่นคนนี้] ========== --")

for i, storage in ipairs(storageValues) do
    local value = storage and storage.Value or "N/A"
    
    if typeof(value) == "string" and value:find("Fruit") then
        local parts = string.split(value, ",")
        local fruitName = parts[1]
        local aura = parts[6] == "1" and " [ ออร่า ]" or ""

        print(" ที่เก็บช่อง " .. i .. ": " .. fruitName .. aura)
    else
        print(" ที่เก็บช่อง " .. i .. ": ไม่มี")
    end
end

local boundValues = {}

for i = 1, 3 do
    local foundb = bounds:FindFirstChild("BoundFruit" .. i)
    table.insert(boundValues, foundb)
end

print("-- ========== [เป๋าม่วงผลไม้ปีศาจ ของผู้เล่นคนนี้] ========== --")

for i, bound in ipairs(boundValues) do

    local value = bound and bound.Value or "N/A"

    if typeof(value) == "string" and value ~= "None" then

        local parts = string.split(value, ",")

        local fruitName = parts[1] or "Unknow"

        local melee = parts[2] or "0"
        local sniper = parts[3] or "0"
        local defense = parts[4] or "0"
        local sword = parts[5] or "0"

        print(" ผลไม้เป๋าม่วงช่อง " .. i .. ": " .. fruitName)
        print("  พีรามิด ค่าเมรี: " .. melee)
        print("  พีรามิด ค่าปืน: " .. sniper)
        print("  พีรามิด ค่าดีเฟ้น: " .. defense)
        print("  พีรามิด ค่าดาบ: " .. sword)

    else
        print(" ผลไม้เป๋าม่วงช่อง " .. i .. ": ไม่มี")
    end
end
		
print("-- =================================== --")

   lib:Notifile("", "พิมในช่องแชท /console หรือ F9 ในคอม!!! ", 6)
end)

tab3:Label("ฝั่งชั่น แจ้งเตือนผลไม้แรร์ในตัวผู้เล่นคนอื่น [แก้ไขอยู่]")

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

local tab7 = lib.tabs:Taps("อื่นๆ")
tab7:Label("Check All Sword Secret [ รอก่อน . . . ]")

tab7:Toggle("เช็คเลือดและฮาคิ ผู้เล่น [ แก้ไขอยุ่ ]", false, function(state)
checkhealth = state

if checkhealth then
task.spawn(function()
while checkhealth do
for _, plr in pairs(Players:GetPlayers()) do
if plr ~= Players.LocalPlayer and plr.Character then
local chr = plr.Character
local head = chr:FindFirstChild("Head")
local root = chr:FindFirstChild("HumanoidRootPart")
if not head or not root then continue end

local trait = chr:FindFirstChild("CharacterTrait")
if not trait then continue end

local hpVal = trait:FindFirstChild("Health")      
            local maxVal = trait:FindFirstChild("HealthMax")      
            if not hpVal or not maxVal then continue end      

            local gui = head:FindFirstChild("NameTag")      
            if not gui then      
                gui = Instance.new("BillboardGui", head)      
                gui.Name = "NameTag"      
                gui.AlwaysOnTop = true      
                gui.StudsOffset = Vector3.new(0, 3, 0) -- 👈 ลอยเหนือหัว      

                local txt = Instance.new("TextLabel", gui)      
                txt.Name = "Text"      
                txt.Size = UDim2.new(1,0,1,0)      
                txt.BackgroundTransparency = 1      
                txt.TextScaled = true      
                txt.TextStrokeTransparency = 0      
                txt.TextColor3 = Color3.fromRGB(255,255,255)      
            end      

            local txt = gui.Text      

            -- ระยะ      
            local dist = (Camera.CFrame.Position - root.Position).Magnitude      

            -- ไกล = เล็ก      
            local scale = math.clamp(1 / (dist / 25), 0.3, 1.5)      
            gui.Size = UDim2.new(0, 200 * scale, 0, 40 * scale)      

            -- ข้อความ      
            -- ข้อความ
local hakiText = ""

local userFolder = workspace:FindFirstChild("UserData")
    and workspace.UserData:FindFirstChild("User_" .. tostring(plr.UserId))

if userFolder then

    local hakiBar =
        userFolder:FindFirstChild("HakiBar")
        or (
            userFolder:FindFirstChild("Data")
            and userFolder.Data:FindFirstChild("HakiBar")
        )

    if hakiBar and tonumber(hakiBar.Value) then
        hakiText = " | Haki: " .. math.floor(hakiBar.Value)
    end
end

txt.Text = ""..plr.Name.." | Health: "
    ..math.floor(hpVal.Value).."/"..math.floor(maxVal.Value)
    ..hakiText      
        end      
    end      
    task.wait(0.1)      
end      

-- ปิดแล้วลบ      
for _, plr in pairs(Players:GetPlayers()) do      
    if plr.Character and plr.Character:FindFirstChild("Head") then      
        local tag = plr.Character.Head:FindFirstChild("NameTag")      
        if tag then tag:Destroy() end      
    end      
end

end)

end

end)

--// 🔹 ฟังก์ชันสแกน Tool (รองรับ Character + Backpack)
local function scan(container, compassCount, boxCount, fruitList)
    for _, v in pairs(container:GetChildren()) do
        if v:IsA("Tool") then
            local name = v.Name

            -- Compass
            if name == "Compass" or name == "Silver Compass" or name == "Golden Compass" then
                compassCount[name] = (compassCount[name] or 0) + 1
            end

            -- Box
            if name == "Common Box" or name == "Uncommon Box" or name == "Rare Box" or name == "Ultra Rare Box" then
                boxCount[name] = (boxCount[name] or 0) + 1
            end

            -- Fruit
            if string.find(name, "Fruit") then
                table.insert(fruitList, name)
            end
        end
    end
end

--// 🔥 ฟังก์ชันหลัก (รวมข้อความ)
local function getPriorityItem(plr)
    if not plr then return nil end

    local compassCount = {}
    local boxCount = {}
    local fruitList = {}

    -- Character
    if plr.Character then
        scan(plr.Character, compassCount, boxCount, fruitList)
    end

    -- Backpack
    if plr:FindFirstChild("Backpack") then
        scan(plr.Backpack, compassCount, boxCount, fruitList)
    end

    local result = {}

    -- 🥇 Compass
    local compassText = {}
    for _, name in ipairs({"Compass","Silver Compass","Golden Compass"}) do
        if compassCount[name] then
            local c = compassCount[name]
            table.insert(compassText, c > 1 and (name.." ("..c..")") or name)
        end
    end
    if #compassText > 0 then
        table.insert(result, table.concat(compassText, " | "))
    end

    -- 🥈 Box
    local boxText = {}
    for _, name in ipairs({"Common Box","Uncommon Box","Rare Box","Ultra Rare Box"}) do
        if boxCount[name] then
            local c = boxCount[name]
            table.insert(boxText, c > 1 and (name.." ("..c..")") or name)
        end
    end
    if #boxText > 0 then
        table.insert(result, table.concat(boxText, " | "))
    end

    -- 🥉 Fruit
    if #fruitList > 0 then
        table.insert(result, table.concat(fruitList, " | "))
    end

    if #result == 0 then return nil end
    return table.concat(result, "\n")
end

--// 🔘 Toggle (เปิด = โชว์ / ปิด = ลบ)
local Checkfruitfind = false

tab7:Toggle("โชว์ไอเทมบนหัวผู้เล่น | เข็มทิศ, กล่อง, ผลไม้", false, function(chkfrt)
    Checkfruitfind = chkfrt

    if Checkfruitfind then
        task.spawn(function()
            while Checkfruitfind do
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= Players.LocalPlayer and plr.Character then
                        local head = plr.Character:FindFirstChild("Head")
                        local root = plr.Character:FindFirstChild("HumanoidRootPart")
                        if not head or not root then continue end

                        local itemText = getPriorityItem(plr)
                        local gui = head:FindFirstChild("ItemTag")

                        -- ❌ ไม่มีของ → ลบ
                        if not itemText then
                            if gui then gui:Destroy() end
                            continue
                        end

                        -- ✅ สร้าง GUI
                        if not gui then
                            gui = Instance.new("BillboardGui")
                            gui.Name = "ItemTag"
                            gui.Parent = head
                            gui.AlwaysOnTop = true
                            gui.StudsOffset = Vector3.new(0, 3, 0)

                            local txt = Instance.new("TextLabel")
                            txt.Name = "Text"
                            txt.Parent = gui
                            txt.Size = UDim2.new(1,0,1,0)
                            txt.BackgroundTransparency = 1
                            txt.TextScaled = true
                            txt.TextStrokeTransparency = 0
                            txt.TextColor3 = Color3.fromRGB(255,255,255)
                        end

                        -- 🔹 ปรับขนาดตามระยะ (ลื่น ไม่ใหญ่เกิน)
                        local dist = (Camera.CFrame.Position - root.Position).Magnitude
                        local scale = math.clamp(1 / (dist / 25), 0.3, 1.5)
                        gui.Size = UDim2.new(0, 200 * scale, 0, 50 * scale)

                        gui.Text.Text = itemText
                    end
                end
                task.wait(0.2)
            end

            -- 🔥 ปิดแล้วลบทั้งหมด
            for _, plr in pairs(Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("Head") then
                    local tag = plr.Character.Head:FindFirstChild("ItemTag")
                    if tag then tag:Destroy() end
                end
            end
        end)
    end
end)

tab7:Label("เช็คจุดเกิดผลไม้ใต้ต้นไม้ | [ Beta ] One Piece: Ascended")

local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

local foundItems = {}
local selectedItemName = nil
local dropdownItems

-- 🔹 สแกนเฉพาะลูกตรง ๆ ของ Workspace (ลื่นสุด)
local function refreshItems()
    table.clear(foundItems)

    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Tool") and string.find(obj.Name, "Fruit") then
            table.insert(foundItems, obj.Name)
        end
    end
end

-- 🔹 หา object (ไม่ไล่ลึก)
local function getItemByName(name)
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Tool") and obj.Name == name then
            return obj
        end
    end
end

-- 🔹 Dropdown
dropdownItems = tab7:Dropdown("เลือก ผลไม้ :", foundItems, function(v)
    selectedItemName = v
end)

-- 🔹 รีเฟรช
tab7:Button("รีเฟรชไอเทม", function()
    refreshItems()

    if dropdownItems and dropdownItems.Refresh then
        dropdownItems:Refresh(foundItems)
    end

    lib:Notifile("Alert", "รีเฟรชแล้ว", 3)
end)

-- 🔹 View
tab7:Toggle("ดูมุมมอง ผลไม้ปีศาจ", false, function(state)
    if not selectedItemName then return end

    local item = getItemByName(selectedItemName)
    if not item then return end

    local handle = item:FindFirstChild("Handle")

    if state and handle then
        Camera.CameraSubject = handle
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            Camera.CameraSubject = LocalPlayer.Character.Humanoid
        end
    end
end)

local tab8 = lib.tabs:Taps("ตั้งค่า")
tab8:Label("เปลี่ยนเมนูภาษา [ ปิดทุกฝั่งชั่นก่อนเปลี่ยนภาษา ]")
tab8:Button("ภาษาไทย", function()
lib:Notifile("Alert", "กำลังเปลี่ยนเป็น ภาษาไทย", 2)
wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/keseerattanakorn/Bankzahh/refs/heads/main/ReaperXOPD_th.lua"))() 
end)

tab8:Button("ภาษาอังกฤษ", function()
lib:Notifile("Alert", "Changing to English Language", 2)
wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/keseerattanakorn/Bankzahh/refs/heads/main/ReaperXOPD.lua"))()
end)
