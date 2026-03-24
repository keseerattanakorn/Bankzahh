local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("LoadingScreen") then
    CoreGui:FindFirstChild("LoadingScreen"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "LoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- กล่องหลัก
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.2
mainFrame.Parent = ScreenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)

-- แอนิเมชันขยาย
TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 400, 0, 160)
}):Play()

-- ข้อความ "Loading" (ต่ำลงมา)
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0.39, 0)
title.BackgroundTransparency = 1
title.Text = "Loading"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.new(1, 1, 1)

-- หลอดโหลดพื้นหลัง
local barBg = Instance.new("Frame", mainFrame)
barBg.Size = UDim2.new(0.8, 0, 0, 6)
barBg.Position = UDim2.new(0.1, 0, 0.58, 0)
barBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barBg.BackgroundTransparency = 0.6
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

-- หลอดโหลดจริง (สีขาว)
local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

-- ตัวเลข %
local percentLabel = Instance.new("TextLabel", mainFrame)
percentLabel.Size = UDim2.new(1, 0, 0, 30)
percentLabel.Position = UDim2.new(0, 0, 0.68, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextSize = 22
percentLabel.TextColor3 = Color3.fromRGB(200, 255, 200)

-- โหลดและอนิเมชันจุด . . .
task.spawn(function()
	wait(0.4) -- รอ Tween ขยายก่อน

	local dots = { "", ".", ". .", ". . ." }
	local dotIndex = 1
	local updateLoading = true

	-- วน . . .
	task.spawn(function()
		while updateLoading do
			title.Text = "ReaperX Hub Loading" .. dots[dotIndex]
			dotIndex = dotIndex % #dots + 1
			wait(0.4)
		end
	end)

	for i = 1, 100 do
		bar.Size = UDim2.new(i / 100, 0, 1, 0)
		percentLabel.Text = i .. "%"
		wait(0.02)
	end

	updateLoading = false
	wait(0.5)
	ScreenGui:Destroy()

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/keseerattanakorn/Bankzahh/refs/heads/main/libold.lua"))()
local win = lib:Win("ReaperX Hub | For Map: One Piece: Divine")

-- Notifile แจ้งเตือนมุมขวาล่าง
lib:Notifile("Alert", "ช่วงทดลอง!", 3)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local targetNames = {
    ["sunvyer"] = true,
    ["GODoSLAYER"] = true,
	["DubExit"] = true,
    ["Quixotize"] = true,
	["Hiroki_Ashima"] = true,
    ["utaaxghoul"] = true,
	["CAIOHENRIQUEAL"] = true,
    ["Chizewe"] = true,
	["eonardoe10"] = true,
}

local function checkPlayers()
    for _, plr in pairs(Players:GetPlayers()) do
        if targetNames[plr.Name] and plr ~= LocalPlayer then
            LocalPlayer:Kick("Admin เข้ามาในเซิฟ Protect by ReaperX Hub :) ")
        end
    end
end

-- เช็คตอนเข้า
checkPlayers()

-- เช็คตอนมีคนเข้าใหม่
Players.PlayerAdded:Connect(function()
    checkPlayers()
end)
		
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

local SafeZoneOuterSpace = Instance.new("Part",game.Workspace)
    SafeZoneOuterSpace.Name = "SafeZoneOuterSpacePart"
    SafeZoneOuterSpace.Size = Vector3.new(200,3,200)
    SafeZoneOuterSpace.Position = Vector3.new((math.random(-1000000, 1000000)), (math.random(10000, 50000)), (math.random(-1000000, 1000000)))
    SafeZoneOuterSpace.Anchored = true

local SafeZoneUnderSea = Instance.new("Part",game.Workspace)
    SafeZoneUnderSea.Name = "SafeZoneUnderSeaPart"
    SafeZoneUnderSea.Size = Vector3.new(200,3,200)
    SafeZoneUnderSea.Position = Vector3.new((math.random(-5000, 5000)), -491, (math.random(-5000, 5000)))
    SafeZoneUnderSea.Anchored = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

spawn(function() -- autofarm velocity
    while wait(0) do
        pcall(function()
            if AutoFish or AutoPack or _G.behindFarm or _G.bombsteal or _G.killbomb then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
            elseif  AutoFish == false or AutoPack == false or _G.behindFarm == false or _G.bombsteal == false or _G.killbomb == false then
                --if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                wait(1)
                --end
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
            end
        end)
    end
end)

spawn(function()
    while wait(0) do
        pcall(function()
            if _G.behindfarm or _G.lightfarm or quakefarm then
                if not game.Players.LocalPlayer.PlayerGui.HealthBar.Frame.Status:FindFirstChild("BusoHaki") then
                    wait(0.5)
                    game.workspace.UserData["User_" .. game.Players.LocalPlayer.UserId].UpdateHaki:FireServer()
                end
                if game.Players.LocalPlayer.PlayerGui.HealthBar.Frame.Status:FindFirstChild("BusoHaki") then
                    wait(0.5)
                    game.workspace.UserData["User_" .. game.Players.LocalPlayer.UserId].UpdateHaki:FireServer()
                end

            end
        end)
    end
end)

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

-- สร้าง Tab 
local tab0 = lib.tabs:Taps("Update ! ! ! ")
tab0:Label("- NEW!!! Add Auto Claim Challenge And Auto Claim Gem&Beri Gift")
tab0:Label("- NEW!!! Add Function Sam Quest & Function Random Affinities 1.0 To 2.0")
tab0:Label("- Add Auto Fishing Now")
tab0:Label("- Add Tab Players Now You Can Use It!")
tab0:Label("- Dont Worry. Me Add Kick You If Admin Join in Your Server Now :P")	

local tab = lib.tabs:Taps("Autos")
tab:Label("Function Autos")

tab:Toggle("Auto Claim Challenge", false, function(chllge)
_G.autoclaim = chllge
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.autoclaim then
local A_1 = "Claim"
local A_2 = "Daily1"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Daily2"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Daily3"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Daily4"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.autoclaim then
local A_1 = "Claim"
local A_2 = "Weekly1"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Weekly2"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Weekly3"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.autoclaim then
local A_1 = "Claim"
local A_2 = "Challenge1"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge2"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge3"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge4"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge5"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge6"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge7"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge8"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge9"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge10"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge11"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge12"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge13"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Challenge14"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
            end
        end)
    end
end)

tab:Toggle("Auto Claim Beri Gift", false, function(bri)
_G.berigift = bri
end)

spawn(function()
    while wait(0) do
        pcall(function()
            if _G.berigift then
local A_1 = "RewardMark"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ClaimRewardHourly
    Event:FireServer(A_1)
            end
        end)
    end
end)

tab:Toggle("Auto Claim Gem Gift", false, function(gxm)
_G.gemsgift = gxm
end)

spawn(function()
    while wait(0) do
        pcall(function()
            if _G.gemsgift then
local A_1 = "RewardMark"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ClaimRewardDaily
    Event:FireServer(A_1)
            end
        end)
    end
end)

tab:Toggle("Auto Fishing", false, function(fshg)
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

local tab1 = lib.tabs:Taps("Farm")
tab1:Label("Wait Update Coming Soon . . .")

local tab2 = lib.tabs:Taps("Teleport")
tab2:Label("Function Teleport Island")
tab2:Dropdown("Select Island :", {"Grassy", "Kaizu Island", "Snowy Mountains", "Pursuer Island", "Bar", "Cliffs", "Windmill", "Cave", "Krizma", "Pirate", "Green", "Trees", "Pyramid", "Package", "Snowy", "Mountain", "Marine Ford", "Sand Castle", "Forest", "Evil", "Crescent", "Islands", "Town", "Rocky", "Plam", "Sand", "Sand 2", "Small", "Tiny", "Super Tiny", "Grass", "Atlar"}, function(t)
    getgenv().tpisland = t
end)

tab2:Button("Teleport To" , function()
    if getgenv().tpisland == "Grassy" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(737, 241, 1209)
      elseif getgenv().tpisland == "Kaizu Island" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1526.0230712891, 364.99990844727, 10510.020507812)
      elseif getgenv().tpisland == "Snowy Mountains"  then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(6501, 408, -1261)
      elseif getgenv().tpisland == "Pursuer Island" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(4847, 570, -7143)
      elseif getgenv().tpisland == "Bar" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(1522, 260, 2188)
      elseif getgenv().tpisland == "Cliffs" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(4598, 217, 4964)
      elseif getgenv().tpisland == "Windmill" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-7, 224, -91)
      elseif getgenv().tpisland == "Cave" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-280, 217, -831)
      elseif getgenv().tpisland == "Krizma" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1109, 341, 1645)
      elseif getgenv().tpisland == "Pirate" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1283, 218, -1348)
      elseif getgenv().tpisland == "Green" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-2727, 253, 1041)
      elseif getgenv().tpisland == "Trees" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(1068, 217, 3351)
      elseif getgenv().tpisland == "Pyramid" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(118, 216, 4773)
      elseif getgenv().tpisland == "Package" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1668, 217, -300)
      elseif getgenv().tpisland == "Snowy" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1896, 222, 3385)
      elseif getgenv().tpisland == "Mountain" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(2052, 488, -701)
      elseif getgenv().tpisland == "Marine Ford" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-3164, 296, -3780)
      elseif getgenv().tpisland == "Sand Castle" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(1020, 224, -3277)
      elseif getgenv().tpisland == "Forest" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-5781, 216, 114)
      elseif getgenv().tpisland == "Evil" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-5169, 523, -7803)
      elseif getgenv().tpisland == "Crescent" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(3193, 357, 1670)
      elseif getgenv().tpisland == "Islands" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-4319, 245, 5252)
      elseif getgenv().tpisland == "Town" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(1818, 218, 755)
      elseif getgenv().tpisland == "Rocky" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-37, 229, 2149)
      elseif getgenv().tpisland == "Palm" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(766, 216, -1374)
      elseif getgenv().tpisland == "Sand" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-2747, 216, -942)
      elseif getgenv().tpisland == "Sand 2" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(162, 216, -2265)
      elseif getgenv().tpisland == "Small" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(1237, 240, -244)
      elseif getgenv().tpisland == "Tiny" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1235, 223, 623)
      elseif getgenv().tpisland == "Super Tiny" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(-4007, 216, -2190)
      elseif getgenv().tpisland == "Grass" then
       plr.Character.HumanoidRootPart.CFrame = CFrame.new(2096, 217, -1884)
      elseif getgenv().tpisland == "Atlar" then
        plr.Character.HumanoidRootPart.CFrame = game.workspace.Altar.RecepticalEffect.CFrame * CFrame.new(0, 5, 0)
                end
end)

tab2:Label("SafeZone")
tab2:Dropdown("Select SafeZone", {"Safe Zone (Sky)", "Safe Zone (UnderSea)"}, function(s)
    getgenv().tpsafezone = s
end)

tab2:Button("Teleport To" , function()
        if getgenv().tpsafezone == "Safe Zone (UnderSea)" then
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
        wait(0.15)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["SafeZoneUnderSeaPart"].CFrame * CFrame.new(0, 5, 0)
    elseif getgenv().tpsafezone == "Safe Zone (Sky)" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["SafeZoneOuterSpacePart"].CFrame * CFrame.new(0, 5, 0)
        end
    end)

local tab3 = lib.tabs:Taps("Players")
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
		
tab3:Button("Teleport To Player", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.CFrame
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

   lib:Notifile("", "Send /console in chat!!! ", 6)
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

tab3:Toggle("Select Bring Player [ Not Working Now ]", false, function(plyer)
	_G.BringPlayer = plyer
end)

tab3:Toggle("Bring Payers All [ Not Working Now ]", false, function(plal)
	_G.BringAllPlayer = plal
end)

spawn(function() -- bring Plr
    while wait() do
        if _G.BringAllPlayer then
            pcall(function()
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-15 or getgenv().disbring)
                        if v.Character.Humanoid.Health == 0 then
                        	v.Character.HumanoidRootPart.Size = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end)
        end
    end
end)

local tab4 = lib.tabs:Taps("Sam")
tab4:Label("Function Quest Sam")
tab4:Label("ฝั่งชั่น เควสแซม")
tab4:Toggle("Auto Find Compass [ Not Working Now ]", false, function(comp)
    AutoComp = comp
end)

spawn(function()
    while wait() do
        pcall(function()
            if not AutoComp then return end;
            local Compass = game.Players.LocalPlayer.Backpack:FindFirstChild("Compass");
            local Compass2 = game.Players.LocalPlayer.Character:FindFirstChild("Compass");
	    local Compass3 = game.Players.LocalPlayer.Character:FindFirstChild("Compass");
            if Compass or Compass2 or Compass3 then
                local OldPostiton = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools();
                Compass.Parent = game.Players.LocalPlayer.Character;
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Compass.Poser.Value);
                Compass:Activate();
                wait(0.2);
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(OldPostiton);
            end
        end)
    end
end)

tab4:Toggle("Auto Claim Comapss 1 Token", false, function(clmp)
    AutoClaimComp1 = clmp
end)

spawn(function()
    while wait() do
        pcall(function()
            if not AutoClaimComp1 then return end;
            game.Workspace.Merchants.QuestMerchant.Clickable.Retum:FireServer("Claim1");
            game.Workspace.Merchants.QuestMerchant.Clickable.Retum:FireServer("Claim1");
        end)
    end
end)

tab4:Toggle("Auto Claim Comapss 10 Token", false, function(clmpp)
    AutoClaimComp2 = clmpp
end)

spawn(function()
    while wait() do
        pcall(function()
            if not AutoClaimComp2 then return end;
            game.Workspace.Merchants.QuestMerchant.Clickable.Retum:FireServer("Claim10");
            game.Workspace.Merchants.QuestMerchant.Clickable.Retum:FireServer("Claim10");
        end)
    end
end)
		
tab4:Label("Function Affinities [  1.0 To 2.0 ]")

-- Prepare dropdownDF
local player = game.Players.LocalPlayer


local dropdownDF = {}
local dfMap = {}

if data then
    local df1 = data:FindFirstChild("DevilFruit")
    local df2 = data:FindFirstChild("DevilFruit2")

    if df1 and df1:IsA("StringValue") and df1.Value ~= "" then
        table.insert(dropdownDF, df1.Value)
        dfMap[df1.Value] = "DFT1" -- เน€เธเนเธ mapping
    end

    if df2 and df2:IsA("StringValue") and df2.Value ~= "" then
        table.insert(dropdownDF, df2.Value)
        dfMap[df2.Value] = "DFT2"
    end
end

local selectedDF = nil
local lockvalue = nil

tab4:Dropdown("เลือกผลที่จะสุ่ม :", dropdownDF, function(dfs)
    selectedDF = dfs
end)

tab4:Dropdown("Select Value :", {"1.1", "1.2", "1.3", "1.4", "1.5", "1.6", "1.7", "1.8", "1.9", "2"}, function(lkvs)
    lockvalue = tonumber(lkvs)
end)

tab4:Dropdown("Select Amount :", {"Beri", "Gems"}, function(srll)
    selectedrol = srll
end)

local isRunning1 = false
local task1Thread

tab4:Toggle("ออโต้สุ่ม", false, function(rol)
    isRunning1 = rol

    if isRunning1 then
        task1Thread = task.spawn(function()
            while isRunning1 do
                task.wait(8)

                -- Check selections
                if not selectedDF or not lockvalue then
                    warn("Please select Fruit Reroll and Lock Value first.")
                    continue
                end

                -- Get UserData
                local player = game.Players.LocalPlayer
                local playerId = player.UserId
                local userDataName = game.Workspace.UserData:FindFirstChild("User_" .. playerId)
                if not userDataName then continue end

                -- Determine DFT name from dfMap
                local dftName = dfMap[selectedDF]
                if not dftName then
                    warn("Invalid fruit selection!")
                    continue
                end

                -- Read affinities
                local AffMelee = userDataName.Data[dftName .. "Melee"].Value
                local AffSniper = userDataName.Data[dftName .. "Sniper"].Value
                local AffDefense = userDataName.Data[dftName .. "Defense"].Value
                local AffSword = userDataName.Data[dftName .. "Sword"].Value

                -- Stop if all affinities >= lockvalue
                if AffSniper == lockvalue and AffSword == lockvalue and AffMelee == lockvalue and AffDefense == lockvalue then
                    isRunning1 = false
                    break
                end

                -- Prepare args
                local args1 = {
                    [1] = dftName,
                    [2] = false, -- defense
                    [3] = false, -- melee
                    [4] = false, -- sniper
                    [5] = false, -- sword
                    [6] = (selectedrol == "Beri" and "Cash") or (selectedrol == "Gems" and "Gems") or "Cash"
                }

                if AffDefense >= lockvalue then args1[2] = 0/0 end
                if AffMelee >= lockvalue then args1[3] = 0/0 end
                if AffSniper >= lockvalue then args1[4] = 0/0 end
                if AffSword >= lockvalue then args1[5] = 0/0 end

                -- Fire Retum
                local merchant = workspace:FindFirstChild("Merchants")
                if merchant then
                    local affinityMerchant = merchant:FindFirstChild("AffinityMerchant")
                    if affinityMerchant then
                        local clickable = affinityMerchant:FindFirstChild("Clickable")
                        if clickable then
                            local retum = clickable:FindFirstChild("Retum")
                            if retum then
                                retum:FireServer(unpack(args1))
                            end
                        end
                    end
                end
            end
        end)
    end
end)

tab4:Label("Function Check Rare/Ultra Rare")
tab4:Toggle("Check Rare/Ultra Rare Fruit&Box", false, function(chre)
    _G.checkrare = chre
end)

local Players = game:GetService("Players")

spawn(function()
	while wait(1) do
		if _G.checkrare then
			pcall(function()
				local players = Players:GetPlayers()

				for i = 1, #players do
					local player = players[i]
					if player:FindFirstChild("Backpack") then
						local backpackItems = player.Backpack:GetChildren()
						for j = 1, #backpackItems do
							local item = backpackItems[j]
							for k = 1, #rareFruits do
								if item.Name == rareFruits[k] then
									local msg = " Found Player has :" .. item.Name .. " In Inventory By " .. player.Name
									print(msg)
									lib:Notifile("", msg, 3)
								end
							end
						end
					end

					--
					local character = workspace:FindFirstChild(player.Name)
					if character then
						local characterItems = character:GetChildren()
						for j = 1, #characterItems do
							local item = characterItems[j]
							for k = 1, #rareFruits do
								if item.Name == rareFruits[k] then
									local msg = " Found Player Has : " .. item.Name .. " In Player Name by :" .. player.Name
									print(msg)
									lib:Notifile("", msg, 3)
								end
							end
						end
					end
				end
			end)
		end
	end
end)

local Players = game:GetService("Players")

local targetBoxes = {
	"Rare Box",
	"Ultra Rare Box"
}

spawn(function()
	while wait(1) do
		if _G.checkrare then
			pcall(function()
				local players = Players:GetPlayers()

				for i = 1, #players do
					local player = players[i]
					if player:FindFirstChild("Backpack") then
						local backpackItems = player.Backpack:GetChildren()
						for j = 1, #backpackItems do
							local item = backpackItems[j]
							for k = 1, #targetBoxes do
								if item.Name == targetBoxes[k] then
									local msb = " Found Player Has : " .. item.Name .. " In Player Name By : " .. player.Name
									print(msb)
									lib:Notifile("", msb, 3)
								end
							end
						end
					end

					local character = workspace:FindFirstChild(player.Name)
					if character then
						local characterItems = character:GetChildren()
						for j = 1, #characterItems do
							local item = characterItems[j]
							for k = 1, #targetBoxes do
								if item.Name == targetBoxes[k] then
									local msb = " Found Player Has :" .. item.Name .. " In Player By : " .. player.Name
									print(msg)
									lib:Notifile("", msb, 3)
								end
							end
						end
					end
				end
			end)
		end
	end
end)
		
local tab5 = lib.tabs:Taps("Shop")
tab5:Label("Function Buy")

local tab = lib.tabs:Taps("Misc")
tab:Label("Another Functions")

end)
