local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("LoadingScreen") then
    CoreGui:FindFirstChild("LoadingScreen"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "LoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.2
mainFrame.Parent = ScreenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)

TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 400, 0, 160)
}):Play()

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0.39, 0)
title.BackgroundTransparency = 1
title.Text = "Loading"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.new(1, 1, 1)

-- เธซเธฅเธญเธ”เนเธซเธฅเธ”เธเธทเนเธเธซเธฅเธฑเธ
local barBg = Instance.new("Frame", mainFrame)
barBg.Size = UDim2.new(0.8, 0, 0, 6)
barBg.Position = UDim2.new(0.1, 0, 0.58, 0)
barBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barBg.BackgroundTransparency = 0.6
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

local percentLabel = Instance.new("TextLabel", mainFrame)
percentLabel.Size = UDim2.new(1, 0, 0, 30)
percentLabel.Position = UDim2.new(0, 0, 0.68, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextSize = 22
percentLabel.TextColor3 = Color3.fromRGB(200, 255, 200)

task.spawn(function()
	wait(0.4) -- เธฃเธญ Tween เธเธขเธฒเธขเธเนเธญเธ

	local dots = { "", ".", ". .", ". . ." }
	local dotIndex = 1
	local updateLoading = true

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


local create = loadstring(game:HttpGet("https://raw.githubusercontent.com/Whiteknight-Bank/By-BankZy/refs/heads/main/Ui_Lib/Libinw.lua"))()
local Window = create:Win("ReaperX Hub : For Map [ One Piece: Legendary ]")

create:Notifile("", "Welcome " .. game.Players.LocalPlayer.Name .. " to OPL", 5)
		
local Cache = { DevConfig = {} };

Cache.DevConfig["ListOfBox1"] = {"Common Box"};
Cache.DevConfig["ListOfBox2"] = {"Uncommon Box"};
Cache.DevConfig["ListOfDrink"] = {"Cider+", "Lemonade+", "Juice+", "Smoothie+"};
Cache.DevConfig["ListOfDropCompass"] = {"Compass"};
Cache.DevConfig["ListOfBox3"] = {"Rare Box", "Ultra Rare Box"};
Cache.DevConfig["ListOfSDf"] = {"Bomb", "Chilly", "Quake", "Flare", "Magma", "Candy(ไม่พร้อม)", "Plassma(ไม่พร้อม)", "Vampire(ไม่พร้อม)", "Rumble(ไม่พร้อม)", "Gas(ไม่พร้อม)", "Light(ไม่พร้อม)", "Snow(ไม่พร้อม)", "Sand(ไม่พร้อม)"};

local rareFruits = {
    "Vampire Fruit", "Quake Fruit", "Phoenix Fruit", "Dark Fruit",
    "Ope Fruit", "Venom Fruit", "Candy Fruit", "Hollow Fruit",
    "Chilly Fruit", "Gas Fruit", "Flare Fruit", "Light Fruit",
    "Smoke Fruit", "Sand Fruit", "Rumble Fruit", "Magma Fruit",
    "Snow Fruit", "Gravity Fruit", "Plasma Fruit"
		}

local SafeZoneOuterSpace = Instance.new("Part",game.Workspace)
    SafeZoneOuterSpace.Name = "SafeZoneOuterSpacePart"
    SafeZoneOuterSpace.Size = Vector3.new(200,3,200)
    SafeZoneOuterSpace.Position = Vector3.new((math.random(-1000000, 1000000)), (math.random(10000, 50000)), (math.random(-1000000, 1000000)))
    SafeZoneOuterSpace.Anchored = true

local SafeZoneLightFarm = Instance.new("Part",game.Workspace)
    SafeZoneLightFarm.Name = "SafeZoneLightPart2"
    SafeZoneLightFarm.Size = Vector3.new(30,2,30)
    SafeZoneLightFarm.Position = Vector3.new(3750, 3623, -615)
    SafeZoneLightFarm.Anchored = true

local b1 = Instance.new("Part",game.Workspace)
        b1.Name = "SafeZoneLightPart1"
        b1.Position = Vector3.new(-169, 630, -54)
        b1.Size = Vector3.new(5, 0.1, 5)
        b1.Anchored = true

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

local function getPlayerNames()
	local names = {}
	for _, player in ipairs(Players:GetPlayers()) do
			table.insert(names, player.Name)
	end
	return names
end

--hook
local mta = getrawmetatable(game)
local namecall = mta.__namecall
local setreadonly = setreadonly or make_writable


setreadonly(mta, false)

mta.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local arguments = args
    local a = {}
    for i = 1, #arguments - 1 do
        a[i] = arguments[i]
    end
    local method = getnamecallmethod() 

    if method == 'FireServer' or method == "InvokeServer" then
        if self.Name == 'Drown' and _G.nodmgwater then
            if args[1] then
                return nil
            end
        end
    end
    
    return namecall(self, ...)    
end)

local attackremote = {}    

local a
a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RequestAnimation" and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
            attackremote[self.Name] = args[1]
            return a(self,unpack(args))
        elseif self.Name == "RequestAnimation" and game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
            attackremote[self.Name] = ""
        end
    end
      return a(self,...)
end)

aaxc = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RemoteEvent" and args[3] == "StopCharging" and _G.skillmax then
            args[6] = 100
            return aaxc(self, unpack(args))
        end
    end
    return aaxc(self, ...)
end)

local remotes = {}
    local azc
    azc=hookmetamethod(game,"__namecall",function(self,...)
        local args = {...}
        local method = getnamecallmethod()
        if method == "FireServer" or method == "InvokeServer" then
            if self.Name == "RemoteEvent" and args[3] == "StopCharging" then
                remotes[self.Name] = args[1]
                return azc(self,unpack(args))
            end
        end
          return azc(self,...)
    end)
    
    function serializeTable(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0
 
    local tmp = string.rep("", depth)
 
    if name then tmp = tmp end
 
    if type(val) == "table" then
        tmp = tmp .. (not skipnewlines and "" or "")
 
        for k, v in pairs(val) do
            tmp =  tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. (not skipnewlines and "" or "")
        end
 
        tmp = tmp .. string.rep("", depth) 
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    elseif type(val) == "function" then
        tmp = tmp  .. "func: " .. debug.getinfo(val).name
    else
        tmp = tmp .. tostring(val)
    end
 
    return tmp
end

local Wapon = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(Wapon ,v.Name)
    end
end

local Tab1 = create.tabs:Taps("ออโต้")
		
Tab1:Label(" ฝั่งชั่น การเกิด ")

_G.savedCFrame = nil

function SaveCFrame()
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        _G.savedCFrame = hrp.CFrame
    end
end

Tab1:Button("เซฟจุดเกิด", function()
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        _G.savedCFrame = hrp.CFrame
        create:Notifile("", "เซฟแล้ว!", 3)
    end
end)
		
Tab1:Toggle("ออโต้ เกิดและกดตาย", false, function(aspw)
        _G.respawndie = aspw
end)

spawn(function()--autorespawn
while wait() do
if _G.respawndie then
pcall(function()
if game:GetService("Players").LocalPlayer.PlayerGui.Load.Frame.Visible == true then
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Load.Frame.Load.MouseButton1Click)) do
v.Function()
end
end
end)
end
end
end)

Tab1:Toggle("ออโต้ เกิด & เกิดแบบเซฟจุด", false, function(rspw)
        _G.autorespawn = rspw
end)

function TeleportToSavedCFrame()
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp and _G.savedCFrame then
        hrp.CFrame = _G.savedCFrame + Vector3.new(0, 5, 0)
    end
end

spawn(function()
    while wait() do
        if _G.autorespawn then
            pcall(function()
                local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                if playerGui.Load and playerGui.Load.Frame.Visible == true then
                    for i,v in pairs(getconnections(playerGui.Load.Frame.Load.MouseButton1Click)) do
                        v.Function()
                    end
                    -- เธฃเธญ Character + Health > 0
                    repeat wait() until game.Players.LocalPlayer.Character 
                        and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
                        and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                    
                    local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    
                    repeat
                        wait(0.1)
                        hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    until hrp and hrp.Position.Y < 242
                    
                    TeleportToSavedCFrame()
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.respawndie then
            local player = game.Players.LocalPlayer
            local char = workspace:FindFirstChild(player.Name)
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                local yPos = char.HumanoidRootPart.Position.Y
                if yPos < 242 and char.Humanoid.Health > 0 then
                    wait(3)
                    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                        if char.HumanoidRootPart.Position.Y < 242 then
                            char.Humanoid.Health = 0
                        end
                    end
                end
            end
        end
    end
end)

Tab1:Label(" ฝั่งชั่น ออโต้ต่างๆ ")
Tab1:Toggle("ออโต้ รับภารกิจ", false, function(dmmsv)
        AutoMission = dmmsv
end)

spawn(function()
    while wait() do 
        if AutoMission then 
            pcall(function() 
                workspace.Merchants.ExpertiseMerchant.Clickable.Retum:FireServer()
            end) 
        end 
    end 
end)

Tab1:Toggle("ออโต้ ทำภารกิจ [ ไม่พร้อมใช้งาน ]", false, function(miss)
        _G.automission = miss
end)

-- เธ•เธฃเธงเธเธชเธญเธ Objective เธเธฒเธ Data
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local userId = LocalPlayer.UserId
local dataPath = workspace.UserData["User_" .. userId].Data
local safeCFrame = CFrame.new(-1526, 364, 10510) -- เธเธธเธ”เธเธฅเธญเธ”เธ เธฑเธข

-- เธ•เธฑเนเธเธเนเธฒ _G.automission เธ•เธฒเธกเน€เธเธทเนเธญเธเนเธ
spawn(function()
    while task.wait(1) do
        pcall(function()
            local objective = dataPath:FindFirstChild("Objective")
            local progress = dataPath:FindFirstChild("Progress")
            local requirement = dataPath:FindFirstChild("Requirement")

            if not objective or not progress or not requirement then return end

            local objValue = objective.Value
            local progVal = progress.Value
            local reqVal = requirement.Value

            if (objValue == "Kill" or objValue == "Damage" or objValue == "Money") then
                if progVal > 0 and reqVal > 0 then
                    _G.automission = true
                elseif progVal == 0 and reqVal == 0 then
                    _G.automission = false
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = safeCFrame
                    end
                end
            else
                _G.automission = false
            end
        end)
    end
end)
			
spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.automission then
                local toolname = "Cannon Ball"
                if LocalPlayer.Backpack:FindFirstChild(toolname) and not LocalPlayer.Character:FindFirstChild(toolname) and not LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild(toolname))
		end
            end
        end)
    end
end)

-- เธขเธดเธ Cannon Ball เนเธเธ—เธตเน CFrame เธเธฑเธเธเธธเธเธฑเธ
spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.automission then
                for i = 1, 2 do
                    local args = {[1] = LocalPlayer.Character.HumanoidRootPart.CFrame}
                    local cannon = LocalPlayer.Character:FindFirstChild("Cannon Ball")
                    if cannon and cannon:FindFirstChild("RemoteEvent") then
                        cannon.RemoteEvent:FireServer(unpack(args))
                    
                    task.wait(0)
                end
	end
                local ball = workspace.ResourceHolder["Resources_" .. userId]:FindFirstChild("CannonBall")
                if ball then
                    ball.CanCollide = false
                end
            end
        end)
    end
end)

-- เธขเนเธฒเธข CannonBall เนเธเธซเธเนเธฒเธ•เธฑเธง
spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.automission then
                for _, v in pairs(workspace.ResourceHolder["Resources_" .. userId]:GetChildren()) do
                    if v.Name == "CannonBall" then
                        v.CFrame = LocalPlayer.Character.Head.CFrame * CFrame.new(0, 2, -15)
                        v.CanCollide = false
                        if not v:FindFirstChild("BodyClip") then
                            local Noclip = Instance.new("BodyVelocity")
                            Noclip.Name = "BodyClip"
                            Noclip.MaxForce = Vector3.new(100000,100000,100000)
                            Noclip.Velocity = Vector3.new(0,20,0)
                            Noclip.Parent = v
                        end
                    end
                end
            end
        end)
    end
end)

-- เธฅเธ Cannon Ball เธ–เนเธฒเน€เธเธดเธ
spawn(function()
    while task.wait(15) do
        pcall(function()
            if _G.automission and LocalPlayer.Backpack:FindFirstChild("Cannon Ball") then
                for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Cannon Ball" then
                        v:Destroy()
                    end
                end
            end
        end)
    end
end)

-- เธฅเธเธญเธฒเธงเธธเธเธญเธทเนเธเนเธ Backpack
spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.automission and LocalPlayer.Backpack:FindFirstChild("Cannon Ball") then
                for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v.Name ~= "Cannon" and v.Name ~= "Cannon Ball" then
                        v:Destroy()
                    end
                end
            end
        end)
    end
end)

-- เน€เธเธดเธ” Haki เธญเธฑเธ•เนเธเธกเธฑเธ•เธด
spawn(function()
    while task.wait(0) do
        pcall(function()
           if _G.automission then
                fireclickdetector(workspace.Island11.CentralBuilding.Doors.Button.Button.ClickDetector)
                task.wait(0)
                local status = LocalPlayer.PlayerGui.HealthBar.Frame.Status
                if not status:FindFirstChild("BusoHaki") then
                    workspace.UserData["User_" .. userId].UpdateHaki:FireServer()
                else
                    task.wait(0.5)
                    workspace.UserData["User_" .. userId].UpdateHaki:FireServer()
	
		end
            end
        end)
    end
end)

spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if not _G.automission then return end

            local targetName = dataPath:FindFirstChild("MissionObjectiveTarget") and dataPath.MissionObjectiveTarget.Value or nil
            if not targetName then return end

            -- ๐”น เธเธฃเธ“เธต ObjectiveTarget = "None" เธซเธฃเธทเธญ "NONE" โ’ เธฅเนเธญเธเธ—เธธเธเธกเธญเธ
            if targetName == "None" or targetName == "NONE" then
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("HumanoidRootPart") then
                        enemy.HumanoidRootPart.Anchored = true
                        enemy.HumanoidRootPart.CanCollide = false
                        enemy.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                        enemy.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 4, -15)

                        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health == 0 then
                            enemy:Destroy()
                        end
                    end
                end
            -- ๐”น เธ–เนเธฒเนเธกเนเนเธเน None โ’ เธฅเนเธญเธเน€เธเธเธฒเธฐเน€เธเนเธฒเธซเธกเธฒเธข
            else
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("HumanoidRootPart") and string.find(enemy.Name, targetName) then
                        enemy.HumanoidRootPart.Anchored = true
                        enemy.HumanoidRootPart.CanCollide = false
                        enemy.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                        enemy.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 4, -15)

                        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health == 0 then
                            enemy:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

Tab1:Toggle("ดึงผลไม้ปีศาจ", false, function(bdf)
BringDF = bdf
end)

spawn(function()
    while wait() do
        if BringDF then
            pcall(function()
                for i,v in pairs(game.Workspace.Trees.Tree.Model:GetChildren()) do 
                    if v.ClassName == "Tool" then 
                        fireclickdetector(v.Main.ClickDetector)
                    end
                end
            end)
        end
    end
 end)

Tab1:Toggle("ออโต้ แพ็คเกจ", false, function(apke)
    AutoPack = apke
end)
spawn(function()
    while wait() do
        pcall(function()
         if AutoPack then
            wait(0.6)
                game.workspace:WaitForChild("Merchants"):WaitForChild("QuestFishMerchant"):WaitForChild("Clickable"):WaitForChild("Retum"):FireServer()
            wait(0.001)
             local playernameuser = game.Players.LocalPlayer.Name
            if  game.Players.LocalPlayer.Backpack:FindFirstChild("Package") or game.Players.LocalPlayer.Character:FindFirstChild("Package") or game.workspace.playernameuser:FindFirstChild("Package") then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Package"))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.AffinityMerchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.Boat1Merchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Package"))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.Boat2Merchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.Boat3Merchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Package"))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.Boat4Merchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.DrinkMerchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.BetterDrinkMerchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.ExpertiseMerchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Package"))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.SniperMerchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1549, 264, 2136)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.SwordMerchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.KrizmaMerch.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.FishMerchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Package"))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.FlailMerchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Merchants.EmoteMerchant.HumanoidRootPart.CFrame*CFrame.new(0,0,3.1)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))      
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2610, 254, 1114)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))      
                    wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1982, 218, 567)
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))      
            end
        end
        end)
    end
end)

Tab1:Toggle("ออโต้ ตกปลาและเผาปลา", false, function(fsh)
    AutoFish = fsh
end)

spawn(function() 
    while wait(0) do
        pcall(function()
            if AutoFish then
                wait(0.5)
                local CharacterName = game.Players.LocalPlayer.Character
                local position = CharacterName.HumanoidRootPart.CFrame * CFrame.new(0, 0, -15)
                local char = CharacterName.HumanoidRootPart
                char.CFrame = CFrame.new(-20000, 218, 20000)
        
                local b1 = Instance.new("Part")
                b1.Shape = "Block"
                b1.Material = "Neon"
                b1.BrickColor = BrickColor.new("Hot Pink")
                b1.Anchored = true
                b1.Parent = game.Workspace
                b1.CFrame = CFrame.new(-20000, 213, 20000)
                b1.Size = Vector3.new(5, 0.1, 5)
                wait(0.5)
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Rod") then
                        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if string.find(v.Name, "Rod") then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                            end
                        end
                    end
                end
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if string.find(v.Name, "Rod") then
                        for _, x in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if string.find(x.Name, "Rod") then
                                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                    if v:FindFirstChild("Bobber") then
                                        if v.Bobber.Effect.Enabled == true then
                                            wait(0.6)
                                            local args = {
                                                [1] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                            }
                                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(x.Name).Click:FireServer(unpack(args))
                                        end
                                    elseif v.Name == "Cast" and not v:FindFirstChild("Bobber") then
                                        wait(0.6)
                                        local args = {
                                            [1] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                        }
                                        game:GetService("Players").LocalPlayer.Character:FindFirstChild(x.Name).Click:FireServer(unpack(args))
                                        workspace:WaitForChild("Merchants"):WaitForChild("FishMerchant"):WaitForChild("Clickable"):WaitForChild("Retum"):FireServer()
                                    end
                                end
                            end
                        end
                    end
                end       
            end
        end)
    end
end)

Tab1:Toggle("ออโต้ กดรับรางวัล (รายวัน/รายสัปดาห์/รายเดือน/ชาเลนเจอร์)", false, function(chllge)
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
local A_2 = "Monthly1"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
local A_1 = "Claim"
local A_2 = "Monthly2"
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

Tab1:Toggle("ออโต้ กดรับของขวัญ  [ เบรี ]", false, function(bri)
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

Tab1:Toggle("ออโต้ กดรับของขวัญ  [ เพชร ]", false, function(gxm)
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

local attackremote = {}    

local a
a=hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if self.Name == "RequestAnimation" and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
            attackremote[self.Name] = args[1]
            return a(self,unpack(args))
        elseif self.Name == "RequestAnimation" and game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
            attackremote[self.Name] = ""
        end
    end
      return a(self,...)
end)
    
    function serializeTable(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0
 
    local tmp = string.rep("", depth)
 
    if name then tmp = tmp end
 
    if type(val) == "table" then
        tmp = tmp .. (not skipnewlines and "" or "")
 
        for k, v in pairs(val) do
            tmp =  tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. (not skipnewlines and "" or "")
        end
 
        tmp = tmp .. string.rep("", depth) 
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    elseif type(val) == "function" then
        tmp = tmp  .. "func: " .. debug.getinfo(val).name
    else
        tmp = tmp .. tostring(val)
    end
 
    return tmp
end

Tab1:Label("แสปมโยรุ")
Tab1:Textbox("การตี โยรุ:", "ใส่เลข", function(hty)
    _G.yoruhit = hty
end)

Tab1:Toggle("ใช้งาน", false, function(yru)
_G.yorufast = yru
end)

spawn(function() -- yoru 
while wait(0) do 
pcall(function() 
if _G.yorufast then 
if game.Players.LocalPlayer.Character:FindFirstChild("Yoru") and tonumber(serializeTable(attackremote)) ~= nil and tonumber(serializeTable(attackremote)) ~= "" then 
repeat wait(0.3) 
for i = 1, _G.yoruhit do 
local args = { 
		[1] = tonumber(serializeTable(attackremote)) 
} 
											
game:GetService("Players").LocalPlayer.Character.Yoru.RequestAnimation:FireServer(unpack(args)) 
end 
until _G.yorufast == false or game.Players.LocalPlayer.Character.Humanoid.Health == 0 
end 
end 
end) 
end 
end)
		
local Tab2 = create.tabs:Taps("ฟาร์ม")
		
Tab2:Label("ฝั่งชั่น มอนตาย")
Tab2:Toggle("ออโต้ มอนตายทุกตัว [ 100% ]", false, function(dthh)
    _G.autodie = dthh
end)

spawn(function()
   while wait(2) do
        if _G.autodie then 
	pcall(function()
            for _,v in pairs(workspace.Enemies:GetDescendants()) do
                if v:IsA("Model") and 
		v:FindFirstChild("Humanoid") then
                    v.Humanoid.Health = 0
                end
            end
        end) 
    end
    end
end)

Tab2:Toggle("ออโต้ บอสหมัดตาย [ 100% ]", false, function(zki)
    _G.autokaizu = zki
end)

spawn(function()
    while wait() do
        if _G.autokaizu then 
	pcall(function()
            for _,v in pairs(workspace.IslandKai:GetDescendants()) do
                if v:IsA("Model") and 
		v:FindFirstChild("Humanoid") then
                    v.Humanoid.Health = 0
                end
            end
        end) 
    end
    end
end)

Tab2:Label("ฝั่งชั่น ฟาร์มผลไม้")
Tab2:Toggle("ออโต้ ฟาร์มและปั่นผลไม้", false, function(stts)
    _G.automixer = stts
end)

spawn(function() -- auto mixer
while wait() do
pcall(function()
if _G.automixer then
wait(1)
for i, v in pairs(game:GetService("Workspace").Island8.Kitchen:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
end
end)
end
end)

spawn(function() -- auto drink mixer
    while wait() do
        pcall(function()
            if _G.automixer then
                wait(1)
                local args = {
                    [1] = "Claim",
                    [2] = "Challenge13"
                }
                game.workspace.UserData["User_" .. game.Players.LocalPlayer.UserId].ChallengesRemote:FireServer(unpack(args))

                wait(1)
                for a, h in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if h:IsA("Tool") and string.find(h.Name, "Juice") or string.find(h.Name, "Milk") or
                    string.find(h.Name, "Cider") or string.find(h.Name, "Lemonade") or
                    string.find(h.Name, "Smoothie") or string.find(h.Name, "Golden") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(h)
                        game:GetService 'VirtualUser':CaptureController()
                        game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    end
                end
            end
        end)
    end
end)
		
spawn(function()--autofruit
while wait() do
pcall(function()
if _G.automixer then
wait(1)
for i,v in pairs(game:GetService("Workspace").Barrels.Crates:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
for i,v in pairs(game:GetService("Workspace").Barrels.Barrels:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
end
end)
end
end)

spawn(function()
pcall(function()
while wait() do
if _G.automixer then
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local barrelsContainer = workspace:FindFirstChild("Barrels")  
            if not barrelsContainer then return end  

            local barrelFolder = barrelsContainer:FindFirstChild("Barrels")  
            local crateFolder = barrelsContainer:FindFirstChild("Crates")  
            if not barrelFolder or not crateFolder then return end  

            local function teleportAndClick(partList)  
                for _, part in ipairs(partList) do  
                    character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()  
                    local hrp = character:FindFirstChild("HumanoidRootPart")  
                    if hrp and part and part:IsA("BasePart") then  
                        hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)  
                        local clickDetector = part:FindFirstChildWhichIsA("ClickDetector", true)  
                        if clickDetector then  
                            fireclickdetector(clickDetector)  
                        end  
                        task.wait(0.1)  
                    end  
                end  
            end  

            local function getParts(folder, partName)  
                local list = {}  
                for _, part in ipairs(folder:GetDescendants()) do  
                    if part:IsA("BasePart") and part.Name == partName then  
                        table.insert(list, part)  
                    end  
                end  
                return list  
            end  

            local barrels = getParts(barrelFolder, "Barrel")  
            local crates = getParts(crateFolder, "Crate")  

            teleportAndClick(barrels)  
            teleportAndClick(crates)  

            for _, v in pairs(workspace:GetChildren()) do   
                if v:IsA("Tool") and v.Name ~= "Compass" then  
                    local handle = v:FindFirstChild("Handle")  
                    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
                    if handle and hrp then  
                        handle.CFrame = hrp.CFrame  
                    end  
                end  
            end  
            wait(0)  
            if workspace:FindFirstChild("SafeZoneOuterSpacePart") then  
                LocalPlayer.Character:SetPrimaryPartCFrame(workspace.SafeZoneOuterSpacePart.CFrame + Vector3.new(0, 5, 0))  
            else  
                warn("เนเธกเนเธเธ SafeZoneOuterSpacePart โ€” เธเนเธฒเธกเธเธฒเธฃเธงเธฒเธฃเนเธ")  
            end  

            wait(5)  
        end  
    end  
end)
end)

Tab2:Label("ฝั่งชั่น ฟาร์มอื่นๆ")
Tab2:Dropdown("เลือกอาวุธ :", Wapon, function(wapn)
    selectedWapon = wapn
end)

Tab2:Button("รีเฟรช ชื่ออาวุธ", function()
    table.clear(Wapon)
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Wapon, v.Name)
        end
				end
			end)
		
Tab2:Toggle("ออโต้ วาปฟาร์ม", false, function(befrm)
    _G.behindFarm = befrm
end)

local MobList = { "Boar", "Crab", "Angry", "Freddy" }

local function IsMobAllowed(mobName)
    for _, allowedMob in ipairs(MobList) do
        if string.find(mobName, allowedMob) then
            return true
        end
    end
    return false
end

spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.behindFarm then
                local character = game.Players.LocalPlayer.Character
                local tool = character and character:FindFirstChildOfClass("Tool")

                -- เน€เธเนเธเธงเนเธฒเธญเธฒเธงเธธเธเธเธทเนเธญ Melee เน€เธ—เนเธฒเธเธฑเนเธเธ–เธถเธเธเธฐเน€เธฃเธดเนเธกเธ—เธณเธเธฒเธ
                if not tool or tool.Name ~= "Melee" then
                    return -- เธเนเธฒเธกเธฃเธญเธเธเธตเน เธ–เนเธฒเธขเธฑเธเนเธกเนเนเธ”เนเธ–เธทเธญเธญเธฒเธงเธธเธเธเธทเนเธญ Melee
                end

                for _, mob in pairs(game.Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("HumanoidRootPart") and 
                       mob:FindFirstChild("Humanoid") and 
                       mob.Humanoid.Health > 0 and 
                       IsMobAllowed(mob.Name) then
                        local mobRoot = mob.HumanoidRootPart
                        local playerRoot = character.HumanoidRootPart
                        playerRoot.CFrame = mobRoot.CFrame * CFrame.new(0, 15, 5)
                        mob.Humanoid.Health = 0
                        repeat task.wait() until mob.Humanoid.Health <= 0
                        task.wait(2)
                        playerRoot.CFrame = mobRoot.CFrame
                        tool:Activate()
                        break
                    end
                end
            end
        end)
    end
end)
		
Tab2:Toggle("ออโต้คลิก", false, function(state)
    _G.autoclick = state
end)

spawn(function() 
game:GetService("RunService").RenderStepped:Connect(function() 
pcall(function() 
if _G.autoclick then 
game:GetService'VirtualUser':CaptureController() 
game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672)) 
end 
end) 
end) 
end)

Tab2:Toggle("ออโต้ถือ", false, function(state)
    _G.autoequip = state
end)

spawn(function() -- auto equip
    while wait(0) do
        pcall(function()
            if _G.autoequip then
                repeat
                    wait(0.05)
                    game:GetService 'Players'.LocalPlayer.Backpack[selectedWapon].Parent = game:GetService 'Players'.LocalPlayer.Character
                until game.Players.LocalPlayer.Character.Humanoid.Health == 0 or _G.autoequip == false
                if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                    game:GetService 'Players'.LocalPlayer.Character:FindFirstChildOfClass 'Humanoid':UnequipTools()
                end
            end
        end)
    end
end)

Tab2:Label(" ฝั่งชั่น ฟาร์มด้วยลูกปืน ")
Tab2:Toggle("ออโต้ ฟาร์มด้วยลูกปืน", false, function(bll)
    _G.autocannonslow = bll
end)

spawn(function() -- autofarm teleport cannon
    while wait(0) do
        pcall(function()
            if _G.autocannonplr then
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        v.Character.HumanoidRootPart.Transparency = 0.9
                    	v.Character.HumanoidRootPart.Color = Color3.fromRGB(255, 255, 255)
                        v.Character.HumanoidRootPart.CanCollide = false
                        v.Character.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                        v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,5,-15)
                        if v.Character.Humanoid.Health == 0 then
                            v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                            v.Character.HumanoidRootPart.Transparency = 1
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.autocannon or _G.autocannonplr then
                local toolname = "Cannon Ball"
                local Plr = game:GetService("Players").LocalPlayer
                wait(0.75)
                if Plr.Backpack:FindFirstChild(toolname) and not Plr.Character:FindFirstChild(toolname) and not Plr.Character:FindFirstChildOfClass("Tool") then
                    local tool = Plr.Backpack:FindFirstChild(toolname)
                    Plr.Character.Humanoid:EquipTool(tool)
                    wait(0.75)
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                end
            end
        end)
    end
end)


spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.autocannonslow then
                local toolname = "Cannon Ball"
                local Plr = game:GetService("Players").LocalPlayer
                wait(0.5)
                if Plr.Backpack:FindFirstChild(toolname) and not Plr.Character:FindFirstChild(toolname) and not Plr.Character:FindFirstChildOfClass("Tool") then
                    local tool = Plr.Backpack:FindFirstChild(toolname)
                    Plr.Character.Humanoid:EquipTool(tool)
                end
            end
        end)
    end
end)


spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.autocannon or _G.autocannonplr or _G.autocannonslow then
                local args = {
                    [1] = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
                }
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Cannon Ball").RemoteEvent:FireServer(unpack(args))
                wait(0)
                local args = {
                    [1] = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
                }
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Cannon Ball").RemoteEvent:FireServer(unpack(args))
                wait(0)
                if game.workspace.ResourceHolder["Resources_" .. game.Players.LocalPlayer.UserId]:FindFirstChild("CannonBall") then
                    game.workspace.ResourceHolder["Resources_" .. game.Players.LocalPlayer.UserId]:FindFirstChild("CannonBall").CanCollide = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.autocannon or _G.autocannonplr or _G.autocannonslow then
                repeat task.wait(0)
                    for i, v in pairs(game.workspace.ResourceHolder["Resources_" .. game.Players.LocalPlayer.UserId]:GetChildren()) do
                        if v.Name == "CannonBall" then
                            v.CFrame = game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0, 2, -15)
                            v.CanCollide = false
                            if not v:FindFirstChild("BodyClip") then
                                local Noclip = Instance.new("BodyVelocity")
                                Noclip.Name = "BodyClip"
                                Noclip.Parent = v
                                Noclip.MaxForce = Vector3.new(100000,100000,100000)
                                Noclip.Velocity = Vector3.new(0,20,0)
                            end
                        end
                    end
                until _G.autocannon == false or _G.autocannonplr == false or game.Players.LocalPlayer.Character.Humanoid.Health == 0
            end
        end)
    end
end)

spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.autocannon and game.Players.LocalPlayer.Backpack:FindFirstChild("Cannon Ball") 
            or _G.autocannonplr and game.Players.LocalPlayer.Backpack:FindFirstChild("Cannon Ball") then
                task.wait(1)
                for i=1,2 do
                    game:GetService("Players").LocalPlayer.Character.Weapons:FireServer()
                end
            end
        end)
    end
end)


spawn(function()
    while task.wait(15) do
        pcall(function()
            if _G.autocannon or _G.autocannonplr then
                task.wait(0.1)
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Cannon Ball") then
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == "Cannon Ball" then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(0) do
        pcall(function()
            if _G.autocannon  or _G.autocannonplr or _G.autocannonslow then
                task.wait(0.1)
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Cannon Ball") then
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name ~= "Cannon" and v.Name ~= "Cannon Ball" then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(0) do
        pcall(function()
            if _G.autocannon or  _G.autocannonplr  or _G.autocannonslow then
                fireclickdetector(workspace.Island11.CentralBuilding.Doors.Button.Button.ClickDetector)
                task.wait(0)
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
spawn(function() -- autofarm cannon
    while wait(0) do
        pcall(function()
            if _G.autocannon or _G.autocannonslow then
                for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if string.find(v.Name, " Boar")
                    and v:FindFirstChild("HumanoidRootPart") then
                        v.HumanoidRootPart.CanCollide = false
                    	v.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                        v:FindFirstChild("HumanoidRootPart").Anchored = true
                        v:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,4,-15)
                        if v.Humanoid.Health == 0 then
                            v.HumanoidRootPart.Size = Vector3.new(0, 0, 0)
                            v:Destroy()
                        end
                     end
                end
                for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if string.find(v.Name, "Crab")
                    and v:FindFirstChild("HumanoidRootPart") then
                        v.HumanoidRootPart.CanCollide = false
                    	v.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                        --v.HumanoidRootPart.Color = Color3.fromRGB(255, 255, 255)
                        v.HumanoidRootPart.Transparency = 0.9
                        v:FindFirstChild("HumanoidRootPart").Anchored = true
                        v:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,4,-15)
                        if v.Humanoid.Health == 0 then
                            v.HumanoidRootPart.Size = Vector3.new(0, 0, 0)
                            v:Destroy()
                        end
                     end
                end
                for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if string.find(v.Name, "Angry ") 
                    or string.find(v.Name, "Bandit") 
                    or string.find(v.Name, "Thief")
                    or string.find(v.Name, "Crab") 
                    or string.find(v.Name, "Gunner") 
                    or string.find(v.Name, "Bruno") 
                    or string.find(v.Name, "Freddy")  
                    or string.find(v.Name, "Buster") 
                    or string.find(v.Name, "Thug") 
                    or string.find(v.Name, "Gunslinger")
                    or string.find(v.Name, "Cave") 
                    or string.find(v.Name, "Vokun") 
                    and v:FindFirstChild("HumanoidRootPart") then
                        v.HumanoidRootPart.CanCollide = false
                    	v.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                        v:FindFirstChild("HumanoidRootPart").Anchored = true
                        v:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,4,-15)
                        if v.Humanoid.Health == 0 then
                            v.HumanoidRootPart.Size = Vector3.new(0, 0, 0)
                            v:Destroy()
                        end
                        if v.Humanoid.Health == 0 then
                            v.HumanoidRootPart.Size = Vector3.new(0, 0, 0)
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

Tab2:Label("ฝั่งชั่น ฟาร์มด้วยผลปีศาจ")
Tab2:Toggle("ออโต้ฟาร์ม กุระ [ แลคมาก ]", false, function(qke)
    _G.quakefarm = qke
end)

spawn(function() -- Quake farm npcs
    while wait(0) do
        pcall(function()
            if _G.quakefarm then
                script = game:GetService("Players").LocalPlayer.Character.Powers.Quake;
                VTQ = script.RemoteEvent.RemoteFunction:InvokeServer();
                local pla = game.Players.LocalPlayer;
                local Mouse = pla:GetMouse();

                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health ~= 0 then
                        if v.Humanoid.Health > 0 and
                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 10000000000000000000000 then
                            if v.Name ~= "SetInstances" then
                                -- v.Humanoid:ChangeState(11)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                if v.Humanoid.Health == 0 then
                                    v:Destroy()
                                end

                                wait(0.05)

            local args = {
                [1] = VTQ,
                [2] = "QuakePower4",
                [3] = "StopCharging",
                [4] = Mouse.Target,
                [5] = v.Head.CFrame * CFrame.new(0, 0, 0),
                [6] = 100,
                [7] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position)
            }
            
            game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))

                            end
                        end
                    end
                end
            end
        end)
    end
end)

Tab2:Toggle("ออโต้หาร์ม แสง", false, function(lth)
    _G.lightfarm = lth
end)

spawn(function() -- Light farm npcs
    while wait(0) do
        pcall(function()
            if _G.lightfarm then
                script = game:GetService("Players").LocalPlayer.Character.Powers.Light;
                VTC = script.RemoteEvent.RemoteFunction:InvokeServer();
                local pla = game.Players.LocalPlayer;
                local Mouse = pla:GetMouse();

                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health ~= 0 then
                        if v.Humanoid.Health > 0 and
                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 10000000000000000000000 then
                            if v.Name ~= "SetInstances" then
                                -- v.Humanoid:ChangeState(11)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                if v.Humanoid.Health == 0 then
                                    v:Destroy()
                                end

                                wait(0.05)

                                local args = {
                                    [1] = VTC,
                                    [2] = "LightPower2",
                                    [3] = "StopCharging",
                                    [4] = v.Head.CFrame * CFrame.new(0, 0, 0),
                                    [5] = Mouse.Target,
                                    [6] = 100
                                }

                                game:GetService("Players").LocalPlayer.Character.Powers.Light.RemoteEvent:FireServer(unpack(args))

                            end
                        end
                    end
                end
            end
        end)
    end
end)

Tab2:Label("ฝั่งชั่น ฮาคิ")
Tab2:Toggle("ออโต้ฟาร์ม ฮาคิแบบเร็ว [ ปิงมาก ]", false, function(hki)
    AutoHaki = hki
end)

game:GetService('RunService').RenderStepped:connect(function()
    if AutoHaki then
        for i = 1, 5 do
            local args = {
                [1] = "On",
                [2] = 1
            }
            task.wait(0.1)
            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "On",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "On",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "On",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "On",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
            task.wait(0.1)
            local args = {
                [1] = "Off",
                [2] = 1
            }

            workspace:WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("III"):FireServer(unpack(args))
        end
    end
end)

Tab2:Toggle("ออโต้ กดรับท่าพนมมือ [ ต้องเลเวล 1,000 ]", false, function(gthi)
    getgenv().haki = gthi
while getgenv().haki do
            wait()
            pcall(function()
                workspace:WaitForChild("Merchants")
                    :WaitForChild("QuestHakiMerchant")
                    :WaitForChild("Clickable")
                    :WaitForChild("Retum")
                    :FireServer()
                wait(2)
            end)
	end
end)

Tab2:Label("คำเตือน: ใช้นานอาจเด้งหรือโดนเตะ เพราะ ปิงมาก")
		
local Tab3 = create.tabs:Taps("สกิล")
		
Tab3:Label("แสปมสกิล")

local selectedSpamFruit = ""
local selectedSpamSkill = ""

Tab3:Dropdown("เลือกผล :", Cache.DevConfig["ListOfSDf"], function(spdf)
    selectedSpamFruit = spdf
end)

local spamtimeSet = false
		
Tab3:Textbox("วินาที ต่อ:", "Enter Number", function(xtx)
    getgenv().spamtime = tonumber(xtx)
    spamtimeSet = true
end)

Tab3:Dropdown("เลือกปุ่มสกิล :", {"Skill Z", "Skill X", "Skill C", "Skill V", "Skill B", "Skill N"}, function(sps)
    selectedSpamSkill = sps
end)

Tab3:Toggle("ใช้งาน แสปม [ 100% ]", false, function(spam)
    _G.skillspam = spam
end)

local pla = game.Players.LocalPlayer
local Mouse = pla:GetMouse()

task.defer(function()
    wait(1)
    if not spamtimeSet then
        getgenv().spamtime = 0.1
    end
end)
		
-- Quake
spawn(function()
    while wait(getgenv().spamtime) do
        pcall(function()
            if _G.skillspam and selectedSpamFruit == "Quake" then
                if selectedSpamSkill == "Skill Z" then
		    local X = humanoid.Position.X
                    local Y = humanoid.Position.Y
                    local Z = humanoid.Position.Z
									
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower1",
                        [3] = "StopCharging",
                        [4] = Mouse.Target,
                        [5] = Mouse.Hit,
                        [6] = 100,
                        [7] = Vector3.new(X, Y, Z)
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                elseif selectedSpamSkill == "Skill C" then
		    local humanoid = pla.Character.HumanoidRootPart
                    local Xx = humanoid.Position.X
                    local Yy = humanoid.Position.Y
                    local Zz = humanoid.Position.Z
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower3",
                        [3] = "StopCharging",
                        [4] = Mouse.Target,
                        [5] = Mouse.Hit,
                        [6] = 100,
                        [7] = Vector3.new(Xx, Yy, Zz)
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                    local args2 = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower3",
                        [3] = "StartCharging",
                        [5] = "Right"
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args2))
                elseif selectedSpamSkill == "Skill V" then
                    local pla = game.Players.LocalPlayer
                    local Mouse = pla:GetMouse()

                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower4",
                        [3] = "StartCharging",
                        [5] = "Right"
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args))
                    local args2 = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "QuakePower4",
                        [3] = "StopCharging",
                        [4] = Mouse.Target,
                        [5] = Mouse.Hit,
                        [6] = 100,
                        [7] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position)
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Quake.RemoteEvent:FireServer(unpack(args2))
                end
            end
        end)
    end
end)

-- Bomb
spawn(function()
    while wait(getgenv().spamtime) do
        pcall(function()
            if _G.skillspam and selectedSpamFruit == "Bomb" then
                if selectedSpamSkill == "Skill Z" then
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "BombPower1",
                        [3] = "StopCharging",
                        [4] = Mouse.Hit,
                        [5] = Mouse.Target,
                        [6] = 100
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args))
                elseif selectedSpamSkill == "Skill B" then
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "BombPower5",
                        [3] = "StopCharging",
                        [4] = Mouse.Hit,
                        [5] = Mouse.Target,
                        [6] = 100
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args))
                    local args2 = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "BombPower5",
                        [3] = "StartCharging",
                        [4] = CFrame.new(Vector3.new(-3.3828134536743164, 213, -366.8262939453125), Vector3.new(0.05879887938499451, -0.29103368520736694, -0.9549042582511902)),
                        [5] = workspace.IslandWindmill.Dock.Boards.Board,
                        [6] = "Right"
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args2))
                elseif selectedSpamSkill == "Skill C" then
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "BombPower3",
                        [3] = "StopCharging",
                        [4] = Mouse.Hit,
                        [5] = Mouse.Target,
                        [6] = 100
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args))
                elseif selectedSpamSkill == "Skill V" then
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "BombPower4",
                        [3] = "StopCharging",
                        [4] = Mouse.Hit,
                        [5] = Mouse.Target,
                        [6] = 100
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args))
                end
            end
        end)
    end
end)

-- Flare
spawn(function()
    while wait(getgenv().spamtime) do
        pcall(function()
            if _G.skillspam and selectedSpamFruit == "Flare" then
            if selectedSpamSkillmSkill == "Skill X" then
                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "FlarePower2",
                        [3] = "StopCharging",
                        [4] = CFrame.new(Vector3.new(Mouse.Hit.X, Mouse.Hit.Y, Mouse.Hit.Z)),
                        [5] = workspace:WaitForChild("IslandWindmill"):WaitForChild("OutterDune"):WaitForChild("Beach"),
                        [6] = 100
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))

                    local args2 = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "FlarePower2",
                        [3] = "StartCharging",
                        [4] = CFrame.new(-550.802795, 244, 26.3580341, -0.63954407, 0.15401715, -0.753168106, -0, 0.979725122, 0.200346366, 0.768754423, 0.128130332, -0.626577377),
                        [5] = workspace:WaitForChild("IslandWindmill"):WaitForChild("OutterDune"):WaitForChild("Beach"),
                        [7] = "Left"
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args2))
                elseif selectedSpamSkill == "Skill B" then
                    local pla = game.Players.LocalPlayer
                    local Mouse = pla:GetMouse()

                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "FlarePower5",
                        [3] = "StopCharging",
                        [4] = CFrame.new(Vector3.new(Mouse.Hit.X, Mouse.Hit.Y, Mouse.Hit.Z)),
                        [5] = workspace:WaitForChild("IslandTown"):WaitForChild("Grass"):WaitForChild("Grass"),
                        [6] = 100
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args))

                    local args2 = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "FlarePower5",
                        [3] = "StartCharging",
                        [4] = CFrame.new(-87.2900391, 213.999969, -985.91748, -0.656417644, 0.341256171, -0.757590711, 1.49011612e-08, 0.911768198, 0.410705268, 0.830902815, 0.228523642, -0.607323861),
                        [5] = workspace:WaitForChild("IslandTown"):WaitForChild("Grass"):WaitForChild("Grass"),
                        [7] = "Right"
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Flare.RemoteEvent:FireServer(unpack(args2))
                end
            end
        end)
    end
end)

-- Chilly Skill B
spawn(function()
    while wait(getgenv().spamtime) do
        pcall(function()
            if _G.skillspam and selectedSpamFruit == "Chilly" and selectedSpamSkill == "Skill B" then
                local args = {
                    [1] = tonumber(serializeTable(remotes)),
                    [2] = "ChillyPower11",
                    [3] = "StopCharging",
                    [4] = Mouse.Hit,
                    [5] = workspace.IslandWindmill.Dock.Boards.Board,
                    [6] = 100
                }

                game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args))

                local args2 = {
                    [1] = tonumber(serializeTable(remotes)),
                    [2] = "ChillyPower11",
                    [3] = "StartCharging",
                    [4] = CFrame.new(Vector3.new(-3.3828134536743164, 213, -366.8262939453125), Vector3.new(0.05879887938499451, -0.29103368520736694, -0.9549042582511902)),
                    [5] = workspace.IslandWindmill.Dock.Boards.Board,
                    [6] = "Right"
                }

                game:GetService("Players").LocalPlayer.Character.Powers.Chilly.RemoteEvent:FireServer(unpack(args2))
            end
        end)
    end
end)

-- Magma
spawn(function()
    while wait(getgenv().spamtime) do
        pcall(function()
            if _G.skillspam and selectedSpamFruit == "Magma" then
                if selectedSpamSkill == "Skill Z" then
            local args = {
    [1] = tonumber(serializeTable(remotes)),
    [2] = "MagmaPower7",
    [3] = "StopCharging",
    [4] = CFrame.new(Vector3.new(Mouse.Hit.X, Mouse.Hit.Y, Mouse.Hit.Z)),
    [5] = workspace:WaitForChild("IslandWindmill"):WaitForChild("OutterDune"):WaitForChild("Beach"),
    [6] = 100
}

game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
            local args = {
    [1] = tonumber(serializeTable(remotes)),
    [2] = "MagmaPower7",
    [3] = "StartCharging",
    [4] = CFrame.new(2157.088623046875, 1193.5758056640625, -9786.4072265625, 0.9772287607192993, -0.020494922995567322, -0.21119679510593414, 1.862645149230957e-09, 0.9953245520591736, -0.09658809006214142, 0.21218889951705933, 0.09438865631818771, 0.9726595878601074),
    [5] = workspace:WaitForChild("IslandWindmill"):WaitForChild("OutterDune"):WaitForChild("Beach"),
    [7] = "Right"
}

game:GetService("Players").LocalPlayer.Character.Powers.Magma.RemoteEvent:FireServer(unpack(args))
                end
            end
        end)
    end
end)

Tab3:Label("ฝั่งชั่น สกิลชาร์จเต็ม")
Tab3:Toggle("สกิลชาร์จเต็ม [ 100% ]", false, function(smx)
	_G.skillmax = smx
end)

local Tab4 = create.tabs:Taps("ผู้เล่น")

Tab4:Label("ตัวผู้เล่น")
Tab4:Toggle("อมตะ [ 36% ]", false, function(gxd)
	_G.godmode = gxd
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.godmode then
            local success, err = pcall(function()
                local ResourceHolder = game.Workspace:FindFirstChild("ResourceHolder")

                if ResourceHolder then
                    for _, player in pairs(game.Players:GetPlayers()) do
                        local resourceFolderName = "Resources_" .. tostring(player.UserId)
                        local playerResourceFolder = ResourceHolder:FindFirstChild(resourceFolderName)

                        if playerResourceFolder then
                            local magmaPool = playerResourceFolder:FindFirstChild("StringCageBarrier")

                            if magmaPool then
                                for _, item in pairs(magmaPool:GetDescendants()) do
                                    if item:IsA("Instance") and item.Name == "TouchInterest" then
                                        item:Destroy()
                                    end
				end
				end
                        end
		end
                end
            end)
        end
    end
end)

task.spawn(function()
	while task.wait(0.01) do
		if _G.godmode then
			for _, model in ipairs(workspace:GetChildren()) do
				if model:IsA("Model") and model:FindFirstChild("Humanoid") then
					local powers = model.Powers
					local smelt = powers:FindFirstChild("String")
					if smelt then
						local resources = smelt:FindFirstChild("Cones")
						if resources then
							local smeltSpew = resources:FindFirstChild("StringCone")
							if smeltSpew then
								for _, child in ipairs(smeltSpew:GetChildren()) do
									if child.Name == "TouchInterest" then
										child:Destroy()
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.godmode then
            local resourceHolder = workspace:FindFirstChild("UserData")
            if resourceHolder then
                for _, player in ipairs(game.Players:GetPlayers()) do
                    local folderName = "User_" .. tostring(player.UserId)
                    local userFolder = resourceHolder:FindFirstChild(folderName)

                    if userFolder then
                        local success, err = pcall(function()
                            local specials = userFolder:FindFirstChild("Specials")
                            if specials then
                                local venom = specials:FindFirstChild("Attack")
                                if venom then
                                    local venomPool = venom:FindFirstChild("DPart")
                                    if venomPool then
                                        local touchInterest = venomPool:FindFirstChild("TouchInterest")
                                        if touchInterest then
                                            touchInterest:Destroy()
                                        end
                                    end
                                end
                            end
                        end)
                    end
		end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.godmode then
            local resourceHolder = workspace:FindFirstChild("UserData")
            if resourceHolder then
                for _, player in ipairs(game.Players:GetPlayers()) do
                    local folderName = "User_" .. tostring(player.UserId)
                    local userFolder = resourceHolder:FindFirstChild(folderName)

                    if userFolder then
                        local success, err = pcall(function()
                            local projects = userFolder:FindFirstChild("Projectiles")
                            if projects then
                                local water = projects:FindFirstChild("Water")
                                if water then
                                        local touchInterest = water:FindFirstChild("TouchInterest")
                                        if touchInterest then
                                            touchInterest:Destroy()
                                    end
                                end
                            end
                        end)
                    end
		end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.godmode then
            pcall(function()
                for _, playerChar in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(playerChar.Name) then
                        local powers = playerChar:FindFirstChild("Powers")
                        if powers then
                            local hollow = powers:FindFirstChild("Hollow")
                            if hollow then

                                -- HollowsMini โ’ HollowMini โ’ HRP โ’ TouchInterest
                                local hollowsMini = hollow:FindFirstChild("HollowsMini")
                                if hollowsMini then
                                    for _, modelMini in pairs(hollowsMini:GetChildren()) do
                                        if modelMini:IsA("Model") and modelMini.Name == "HollowMini" then
                                            print("[AntiHollowMini] Found HollowMini model in:", playerChar.Name)

                                            local hrpMini = modelMini:FindFirstChild("HumanoidRootPart")
                                            if hrpMini then
                                                local tiMini = hrpMini:FindFirstChildOfClass("TouchTransmitter") or hrpMini:FindFirstChild("TouchInterest")
                                                if tiMini then
                                                    print("[AntiHollowMini] Destroying TouchInterest in HollowMini โ’", playerChar.Name)
                                                    tiMini:Destroy()
                                                end
                                            end
                                        end
                                    end
                                end

                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.godmode then
            pcall(function()
                for _, enemie in pairs(workspace.Enemies:GetChildren()) do
                    if enemie:IsA("Model") then
                      for _, child in pairs(enemie.Torso:GetChildren()) do
                                    if child.Name == "TouchInterest" then
                                        child:Destroy()
                                    end
                                end  
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
	while task.wait(0.01) do
		if _G.godmode then
			for _, model in ipairs(workspace:GetChildren()) do
				if model:IsA("Model") and model:FindFirstChild("Powers") then
					local powers = model.Powers
					local smelt = powers:FindFirstChild("Smelt")
					if smelt then
						local resources = smelt:FindFirstChild("Resources")
						if resources then
							local smeltSpew = resources:FindFirstChild("SmeltSpew")
							if smeltSpew then
								for _, child in ipairs(smeltSpew:GetChildren()) do
									if child.Name == "TouchInterest" then
										child:Destroy()
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

task.spawn(function()
    while task.wait(0.1) do
        if _G.godmode then
            pcall(function()
                for _, obj in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(obj.Name) then
                        local rightArm = obj:FindFirstChild("Right Arm")
                        if rightArm then
                            local sword = rightArm:FindFirstChild("Sword")
                            if sword then
                                -- เธซเธฒ BasePart เธ—เธฑเนเธเธซเธกเธ”เนเธ Sword Model เนเธฅเนเธงเธเธดเธ” CanTouch
                                for _, part in pairs(sword:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        part.CanTouch = false
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
		
task.spawn(function()
    while task.wait(0.01) do
        if _G.godmode then
            pcall(function()
                for _, obj in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(obj.Name) then
                        local rightArm = obj:FindFirstChild("Right Arm")
                        if rightArm then
                            local rumbleStaff = rightArm:FindFirstChild("RumbleStaff")
                            if rumbleStaff then
                                local damagePart = rumbleStaff:FindFirstChild("DamagePart")
                                if damagePart then
                                    damagePart:Destroy()
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.godmode then
            pcall(function()
                for _, obj in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(obj.Name) then
                        local leftArm = obj:FindFirstChild("Left Arm")
                            if leftArm then
                                local lefttouch = leftArm:FindFirstChildOfClass("TouchInterest")
                                if lefttoch then
                                    lefttoch:Destroy()
                                end
                            end
                        end
                    end

				for _, obj in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(obj.Name) then
                        local rightArm = obj:FindFirstChild("Right Arm")
                            if rightArm then
                                local righttouch = rightArm:FindFirstChildOfClass("TouchInterest")
                                if righttoch then
                                    righttoch:Destroy()
                                end
                            end
                        end
				end
            end)
        end
    end
end)
		
Tab4:Label("ผู้เล่น")
local playerNames = {}

for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(playerNames, player.Name)
end

Tab4:Dropdown("เลือกผู้เล่น :", playerNames, function(name)
    selectedPlayer = name
end)

Tab4:Button("รีเฟรช ชื่อผู้เล่น", function()
    table.clear(playerNames)
    for _, player in ipairs(game.Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
				end
			end)
		
Tab4:Button("วาปไปที่", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.CFrame
end)

Tab4:Button("เช็คดาต้าข้อมูลผู้เล่น & เช็คที่เก็บผล 1-12", function()
local selectedName = selectedPlayer
local player = game.Players:FindFirstChild(selectedName)
if not player then return end

local userId = tostring(player.UserId)  
local userData = workspace:FindFirstChild("UserData")  
if not userData then return end  

local userFolder = userData:FindFirstChild("User_" .. userId)  
if not userFolder then return end  

local data = userFolder:FindFirstChild("Data")  
if not data then return end  

local fruit1 = data:FindFirstChild("DevilFruit")  
local fruit2 = data:FindFirstChild("DevilFruit2")  

local defense = data:FindFirstChild("DefenseLevel")  
local melee = data:FindFirstChild("MeleeLevel")  
local sniper = data:FindFirstChild("SniperLevel")  
local sword = data:FindFirstChild("SwordLevel")  

local dft1defense = data:FindFirstChild("DFT1Defense")  
local dft1melee = data:FindFirstChild("DFT1Melee")  
local dft1sniper = data:FindFirstChild("DFT1Sniper")  
local dft1sword = data:FindFirstChild("DFT1Sword")  

local dft2defense = data:FindFirstChild("DFT2Defense")  
local dft2melee = data:FindFirstChild("DFT2Melee")  
local dft2sniper = data:FindFirstChild("DFT2Sniper")  
local dft2sword = data:FindFirstChild("DFT2Sword")  

print("-- ========== [ผู้ใช้งานที่เช็ค] ========== --")  
print("เช็ค ผู้เล่น: " .. selectedName .. " ข้อมูลของเขาทั้งหมด")  
print(" ผลที่ใช้ช่อง 1: " .. (fruit1 and fruit1.Value))  
print(" ผลที่ใช้ช่อง 2: " .. (fruit2 and fruit2.Value))  
print("-- ========== [แสตท] ========== --")  
print(" ค่าป้องกัน Lvl: " .. (defense and defense.Value or "N/A"))  
print(" ค่าเมรี Lvl: " .. (melee and melee.Value or "N/A"))  
print(" ค่าปืน Lvl: " .. (sniper and sniper.Value or "N/A"))  
print(" ค่าดาบ Lvl: " .. (sword and sword.Value or "N/A"))  
print("-- ========== [ค่าขีดพีรามิด ผลช่อง 1] ========== --")  
print(" ค่าขีดผลช่อง 1 ป้องกัน: " .. (dft1defense and dft1defense.Value or "N/A"))  
print(" ค่าขีดผลช่อง 1 เมรี: " .. (dft1melee and dft1melee.Value or "N/A"))  
print(" ค่าขีดผลช่อง 1 ปืน: " .. (dft1sniper and dft1sniper.Value or "N/A"))  
print(" ค่าขีดผลช่อง 1 ดาบ: " .. (dft1sword and dft1sword.Value or "N/A"))  
print("-- ========== [ค่าขีดพีรามิด ผลช่อง 2] ========== --")  
print(" ค่าขีดผลช่อง 2 ป้องกัน: " .. (dft2defense and dft2defense.Value or "N/A"))  
print(" ค่าขีดผลช่อง 2 เมรี: " .. (dft2melee and dft2melee.Value or "N/A"))  
print(" ค่าขีดผลช่อง 2 ปืน: " .. (dft2sniper and dft2sniper.Value or "N/A"))  
print(" ค่าขีดผลช่อง 2 ดาบ: " .. (dft2sword and dft2sword.Value or "N/A"))  
local storageValues = {}

for i = 1, 12 do
local found = data:FindFirstChild("StoredDF" .. i)
table.insert(storageValues, found)
end
print("-- ========== [ผลปีศาจในที่เก็บ] ========== --")

for i, storage in ipairs(storageValues) do
    local value = storage and storage.Value or "N/A"
    
    if typeof(value) == "string" and value:find("Fruit") then
        local parts = string.split(value, ",")
        local fruitName = parts[1]
        local aura = parts[6] == "1" and " [ Aura ]" or ""

        print(" ที่เก็บช่อง " .. i .. ": " .. fruitName .. aura)
    else
        print(" ที่เก็บช่อง " .. i .. ": None")
    end
end

print("-- =================================== --")

   create:Notifile("", "พิม /console ในช่องแชทเพื่อเช็ค!!! ", 6)
end)


Tab4:Toggle("ส่องผู้เล่น", false, function(state)
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

Tab4:Toggle("ดึงผู้เล่นที่เลือก [ ไม่พร้อมใช้ ]", false, function(plyer)
	_G.BringPlayer = plyer
end)

Tab4:Toggle("ดึงผู้เล่นทั้งหมด", false, function(plal)
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
		
Tab4:Toggle("ล็อคเป้า [ เลือกผู้เล่นก่อน ]", false, function(value)
    aimsilent = value
end)

spawn(function()--aim silent
pcall(function()
while true do wait()
pcall(function()
local plr1 = game.Players.LocalPlayer.Character
local plr2 = game.Players:FindFirstChild(selectedPlayer)
if aimsilent then
cacacac = plr2.Character.HumanoidRootPart.CFrame
end
end)
end
end)
end)

local index = mta.__index
cf = CFrame.new(1, 2, 3)
setreadonly(mta, false)
mta.__index = newcclosure(function(a, b, c)
if tostring(b):lower() == 'hit' and aimsilent then
return cacacac
end
return index(a, b, c)
end)


Tab4:Label("ฝั่งชั่น ฆ่าผู้เล่น")
Tab4:Toggle("ออโต้ฆ่า ฆ่าผู้เล่นด้วยลูกปืน", false, function(bplr)
    _G.autocannonplr = bplr
end)

Tab4:Toggle("ออโต้ฆ่า ผู้เล่นด้วยกุระ", false, function(qkkl)
	_G.Quakekill = qkkl
end)

Tab4:Toggle("ออโต้ฆ่า ผู้เล่นด้วยระเบิด", false, function(kbmb)
    _G.killbomb = kbmb
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.killbomb then
                local pla = game.Players.LocalPlayer
                local char = pla.Character or pla.CharacterAdded:Wait()

                for i, targetPlayer in pairs(game.Players:GetPlayers()) do
                    if targetPlayer ~= pla and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetPlayer.Character.HumanoidRootPart

                        -- เธงเธฒเธฃเนเธเธชเธนเธ 20 เธซเธเนเธงเธข
                        char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(targetHRP.Position + Vector3.new(0, 20, 0))

                    game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args2))

			local args = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "BombPower5",
                            [3] = "StopCharging",
                            [4] = CFrame.new(targetHRP.Position),
                            [5] = targetHRP,
                            [6] = 100
                        }

                        game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args))

                    local args = {
                        [1] = tonumber(serializeTable(remotes)),
                        [2] = "BombPower5",
                        [3] = "StartCharging",
                        [4] = CFrame.new(Vector3.new(-3.3828134536743164, 213, -366.8262939453125), Vector3.new(0.05879887938499451, -0.29103368520736694, -0.9549042582511902)),
                        [5] = workspace.IslandWindmill.Dock.Boards.Board,
                        [6] = "Right"
                    }

                    game:GetService("Players").LocalPlayer.Character.Powers.Bomb.RemoteEvent:FireServer(unpack(args))
                        wait(0.5) -- เน€เธงเนเธเธเนเธญเธเธขเธดเธ player เธ–เธฑเธ”เนเธ
                    end
                end
            end
        end)
    end
end)
		
plr = game.Players.LocalPlayer

local Tab5 = create.tabs:Taps("เกาะ")

Tab5:Label("เกาะทั้งหมด")
Tab5:Dropdown("เลือกเกาะ :", {"Grassy", "Kaizu Island", "Snowy Mountains", "Pursuer Island", "Bar", "Cliffs", "Windmill", "Cave", "Krizma", "Pirate", "Green", "Trees", "Pyramid", "Package", "Snowy", "Mountain", "Marine Ford", "Sand Castle", "Forest", "Evil", "Crescent", "Islands", "Town", "Rocky", "Plam", "Sand", "Sand 2", "Small", "Tiny", "Super Tiny", "Grass", "Atlar"}, function(t)
    getgenv().tpisland = t
end)

Tab5:Button("วาปไปที่" , function()
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

Tab5:Label("เซฟโซน")
Tab5:Dropdown("เลือกเซฟโซน", {"Safe Zone (Sky)", "Safe Zone (UnderSea)", "Safe Zone Light Affinities 1.0", "Safe Zone Light Affinities 2.0"}, function(s)
    getgenv().tpsafezone = s
end)

Tab5:Button("วาปไปที่" , function()
        if getgenv().tpsafezone == "Safe Zone (UnderSea)" then
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
        wait(0.15)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["SafeZoneUnderSeaPart"].CFrame * CFrame.new(0, 5, 0)
    elseif getgenv().tpsafezone == "Safe Zone (Sky)" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["SafeZoneOuterSpacePart"].CFrame * CFrame.new(0, 5, 0)
    elseif getgenv().tpsafezone == "Safe Zone Light Affinities 1.0" then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["SafeZoneLightPart1"].CFrame * CFrame.new(0, 5, 0)
	elseif getgenv().tpsafezone == "Safe Zone Light Affinities 2.0" then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["SafeZoneLightPart2"].CFrame * CFrame.new(0, 5, 0)
        end
    end)

Tab5:Label("เอ็นพีซี")
Tab5:Dropdown("เลือก เอ็นพีซี :", {"Rayleigh", "Better Drink", "Drink", "Flail", "QuestFish", "Krizma", "Heavy Weapon", "Sword", "Sniper", "Emote", "Affinity","Fish", "Expertise", "Friend"}, function(n)
    getgenv().tpmerchant = n
end)

Tab5:Button("วาปไปที่" , function()
        if getgenv().tpmerchant == "Rayleigh" then
            local emoi = game:GetService("Workspace").Merchants.QuestHakiMerchant.Clickable.Available.Value
            if emoi == true then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Merchants.QuestHakiMerchant.HumanoidRootPart.CFrame
            else
                create:Notifile("OP:L", "เรลี่ยังไม่เกิด!", 5)
            end
        elseif getgenv().tpmerchant == "Better Drink" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(1493, 260, 2171)
        elseif getgenv().tpmerchant == "Drink" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1282, 218, -1368)
        elseif getgenv().tpmerchant == "Flail" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(1110, 217, 3369)
        elseif getgenv().tpmerchant == "QuestFish" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1702, 216, -325)
        elseif getgenv().tpmerchant == "Krizma" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1072, 361, 1669)
	elseif getgenv().tpmerchant == "Heavy Weapon" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-2610, 258, 1110)
        elseif getgenv().tpmerchant == "Sword" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(1005, 224, -3339)
        elseif getgenv().tpmerchant == "Sniper" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1843, 222, 3416)
        elseif getgenv().tpmerchant == "Emote" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(1522, 265, 2165)
        elseif getgenv().tpmerchant == "Affinity" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(113, 278, 4952)
        elseif getgenv().tpmerchant == "Fish" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(1983, 218, 566)
	elseif getgenv().tpmerchant == "Friend" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(1242, 229, -3243)
        elseif getgenv().tpmerchant == "Expertise" then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(903, 270, 1219)
        end
    end)

local Tab6 = create.tabs:Taps("เอ็นพีซี")

Tab6:Label("ฝั่งชั่น น้ำ-ดื่ม")
Tab6:Dropdown("เลือกน้ำ :", Cache.DevConfig["ListOfDrink"], function(knrd)
    selectedDrinks = knrd
end)

Tab6:Toggle("ออโต้ซื้อน้ำ", false, function(bdy)
	_G.buydrink = bdy
end)

spawn(function()
    while wait(0) do
        pcall(function()
            if _G.buydrink then
local args = {
    [1] = selectedDrinks
}

workspace:WaitForChild("Merchants"):WaitForChild("BetterDrinkMerchant"):WaitForChild("Clickable"):WaitForChild("Retum"):FireServer(unpack(args))

            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.buydrink then
local A_1 = "Claim"
local A_2 = "Challenge11"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
            end
        end)
    end
end)


Tab6:Toggle("ออโต้ดื่มน้ำทั้งหมด", false, function(drks)
	AutoDrinks = drks
end)

spawn(function()
    while wait() do
        pcall(function()
            if not AutoDrinks then return end;
            for _, Value in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if table.find(Cache.DevConfig["ListOfDrink"], Value.Name) then
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools();
                    Value.Parent = game.Players.LocalPlayer.Character;
                    Value:Activate();
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if AutoDrinks then
local A_1 = "Claim"
local A_2 = "Challenge13"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].ChallengesRemote
    Event:FireServer(A_1,A_2)
wait(.8)
            end
        end)
    end
end)

Tab6:Label("ฝั่งชั่น ออโต้ ค่าพีรามิด [ 2.0 หรือ 10 ขีด ]")

-- Prepare dropdownDF
local player = game.Players.LocalPlayer
local char = workspace:FindFirstChild(player.Name)

local dropdownDF = {}
local dfMap = {} -- Map เธชเธณเธซเธฃเธฑเธเน€เธเนเธเธงเนเธฒเน€เธฅเธทเธญเธเธเธฅเนเธซเธเน€เธเนเธ DFT1 เธซเธฃเธทเธญ DFT2

if char then
    local df1 = char:FindFirstChild("DevilFruit")
    local df2 = char:FindFirstChild("DevilFruit2")

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

Tab6:Dropdown("เลือกผลที่จะสุ่ม :", dropdownDF, function(dfs)
    selectedDF = dfs
end)

Tab6:Dropdown("เลือกล็อคค่า :", {"1.1", "1.2", "1.3", "1.4", "1.5", "1.6", "1.7", "1.8", "1.9", "2"}, function(lkvs)
    lockvalue = tonumber(lkvs)
end)

Tab6:Dropdown("เลือกแบบสุ่ม :", {"Beri", "Gems"}, function(srll)
    selectedrol = srll
end)

local isRunning1 = false
local task1Thread

Tab6:Toggle("ออโต้สุ่ม", false, function(rol)
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
  
local Tab7 = create.tabs:Taps("เควสแซม")

Tab7:Label("ฝั่งชั่น ที่เก็บผล")
local Cache = {
    Player = { Inputfruitlist = {}, Inputfruitname = "" },
    Boolean = { StorageUsingGroup = {}, StorageKeepShiny = false }
}

local function CheckStorage(Number)
    local storageFrame = game.Players.LocalPlayer.PlayerGui.Storage.Frame["StoredDF" .. Number]
    return storageFrame and storageFrame.Button.Text == "Store" and storageFrame.Visible
end

local function StoreFruit(Index, Fruit)
    local storagePath = game:GetService("Workspace").UserData["User_" .. game.Players.LocalPlayer.UserId].StoredDFRequest
    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    Fruit.Parent = game.Players.LocalPlayer.Character
    storagePath:FireServer("StoredDF" .. Index)
end

Tab7:Toggle("ออโต้เก็บผล", false, function(value)
    Cache.Boolean.StorageAll = value
end)

Tab7:Toggle("ออโต้เก็บผลออร่า [ ไม่พร้อมใช้งาน ]", false, function(shy)
    Cache.Boolean.StorageKeepShiny = shy
end)

local function HandleFruits()
    if Cache.Boolean.StorageAll then
        for Index = 1, 12 do
            if CheckStorage(Index) then
                for _, Fruit in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if Fruit:IsA("Tool") then
                        local isRare = false
                        for _, FruitName in pairs(rareFruits) do
                            if string.lower(Fruit.Name) == string.lower(FruitName) then
                                isRare = true
                                break
                            end
                        end

                        local hasAura = false
                        if Cache.Boolean.StorageKeepShiny and Fruit:FindFirstChild("Main") and Fruit.Main:FindFirstChild("AuraAttachment") then
                            hasAura = true
                        end

                        if isRare or hasAura then
                            StoreFruit(Index, Fruit)
                            break
                        end
                    end
                end
            end
        end
    end
end

spawn(function()
    while wait(1) do
        pcall(HandleFruits)
    end
end)

Tab7:Label("ฝั่งชั่น เควสแซม")
Tab7:Toggle("ออโต้หาเข็ม", false, function(comp)
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

Tab7:Toggle("ออโต้กดรับ 1 เข็ม", false, function(clmp)
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

Tab7:Toggle("ออโต้กดรับ 10 เข็ม", false, function(clmpp)
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

Tab7:Label("ฝั่งชั่น เช็คผลแรร์/กล่องแรร์/กล่องอัลตร้า")
Tab7:Toggle("เช็คผลแรร์", false, function(chre)
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
									local msg = " มีคนได้ :" .. item.Name .. " ในกระเป๋าของ " .. player.Name
									print(msg)
									create:Notifile("", msg, 3)
								end
							end
						end
					end

					-- เน€เธเนเธเนเธ workspace.Character
					local character = workspace:FindFirstChild(player.Name)
					if character then
						local characterItems = character:GetChildren()
						for j = 1, #characterItems do
							local item = characterItems[j]
							for k = 1, #rareFruits do
								if item.Name == rareFruits[k] then
									local msg = " มีคนได้ : " .. item.Name .. " อยู่ที่ผู้เล่น :" .. player.Name
									print(msg)
									create:Notifile("", msg, 3)
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
									local msb = " มีคนได้ : " .. item.Name .. " อยู่ที่ผู้เล่น : " .. player.Name
									print(msb)
									create:Notifile("", msb, 3)
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
									local msb = " มีคนได้ :" .. item.Name .. " อยู่ที่ผู้เล่น : " .. player.Name
									print(msg)
									create:Notifile("", msb, 3)
								end
							end
						end
					end
				end
			end)
		end
	end
end)

Tab7:Label("ฝั่งชั่น โขมยผลแรร์")
Tab7:Toggle("ออโต้กุระ โขมยผล", false, function(qkst)
    _G.quakesteal = qkst
end)

local cacacac = nil
local selectedPlayer = nil

spawn(function()--aim silent
pcall(function()
while true do wait()
pcall(function()
if _G.quakesteal then
    local plr2 = game.Players:FindFirstChild(selectedPlayer)
    if plr2 and plr2.Character and plr2.Character:FindFirstChild("HumanoidRootPart") then
        cacacac = plr2.Character.HumanoidRootPart.CFrame
    end
end
end)
end
end)
end)

local index = mta.__index
cf = CFrame.new(1, 2, 3)
setreadonly(mta, false)
mta.__index = newcclosure(function(a, b, c)
if tostring(b):lower() == 'hit' and _G.quakesteal then
return cacacac
end
return index(a, b, c)
end)

spawn(function()
    while wait(0.2) do
        if _G.quakesteal then
            pcall(function()
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer and player.Character then
                        local backpack = player:FindFirstChild("Backpack")
                        local character = player.Character
                        local found = false

                        -- เน€เธเนเธ Backpack
                        if backpack then
                            for _, item in pairs(backpack:GetChildren()) do
                                if table.find(rareFruits, item.Name) then
                                    found = true
                                    break
                                end
                            end
                        end

                        -- เน€เธเนเธ Tool เธ—เธตเนเธ–เธทเธญเธญเธขเธนเน
                        for _, tool in pairs(character:GetChildren()) do
                            if tool:IsA("Tool") and table.find(rareFruits, tool.Name) then
                                found = true
                                break
                            end
                        end

                        if found then
                            selectedPlayer = player.Name
                            break
                        end
                    end
                end
            end)
        else
            selectedPlayer = nil
            cacacac = nil
        end
    end
end)

Tab7:Toggle("ออโต้ ระเบิดโขมยผล", false, function(qkst)
    _G.bombsteal = qkst
end)

local cacacac = nil
local selectedPlayer = nil

spawn(function()--aim silent
pcall(function()
while true do wait()
pcall(function()
if _G.bombsteal then
    local plr2 = game.Players:FindFirstChild(selectedPlayer)
    if plr2 and plr2.Character and plr2.Character:FindFirstChild("HumanoidRootPart") then
        cacacac = plr2.Character.HumanoidRootPart.CFrame
    end
end
end)
end
end)
end)

local index = mta.__index
cf = CFrame.new(1, 2, 3)
setreadonly(mta, false)
mta.__index = newcclosure(function(a, b, c)
if tostring(b):lower() == 'hit' and _G.bombsteal then
return cacacac
end
return index(a, b, c)
end)
		
spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.bombsteal and selectedPlayer then
                local plr = game.Players.LocalPlayer
                local char = plr.Character
                local target = game.Players:FindFirstChild(selectedPlayer)
                if target and target.Character then
                    local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
                    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
                    if humanoid and humanoid.Health > 0 and hrp then
                        -- เธงเธฒเธเธ—เธธเธเธฅเธนเธเน€เธฅเธข
                        char.HumanoidRootPart.CFrame = hrp.CFrame + Vector3.new(0, 20, 0)

                        local vim = game:GetService("VirtualInputManager")
                        vim:SendKeyEvent(true, Enum.KeyCode.X, false, game)
                        task.wait(0.05)
                        vim:SendKeyEvent(false, Enum.KeyCode.X, false, game)

                        local Mouse = plr:GetMouse()

                        local args1 = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "BombPower5",
                            [3] = "StopCharging",
                            [4] = Mouse.Hit,
                            [5] = Mouse.Target,
                            [6] = 100
                        }
                        char.Powers.Bomb.RemoteEvent:FireServer(unpack(args1))

                        local args2 = {
                            [1] = tonumber(serializeTable(remotes)),
                            [2] = "BombPower5",
                            [3] = "StartCharging",
                            [4] = char.HumanoidRootPart.CFrame,
                            [5] = workspace.CurrentCamera,
                            [6] = "Right"
                        }
                        char.Powers.Bomb.RemoteEvent:FireServer(unpack(args2))
                    else
                        -- เธซเธขเธธเธ”เธฅเธนเธเน€เธกเธทเนเธญเน€เธฅเธทเธญเธ” = 0
                        selectedPlayer = nil
		        cacacac = nil
                    end
                else
                    selectedPlayer = nil
		    cacacac = nil
                end
            end
        end)
    end
end)

local Tab8 = create.tabs:Taps("อื่นๆ")

Tab8:Label("ฝั่งชั่น เซิฟเวอร์")
Tab8:Button("รีจอยเซิฟ", function()
create:Notifile("", "รอ 3 วิ เพื่อรีจอย " .. game.Players.LocalPlayer.Name .. " Pls Wait", 3)
wait(3)
		   game.Players.LocalPlayer:Kick()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

Tab8:Button("ย้ายเซฟ", function()
create:Notifile("", "รอ 3 วิ เพื่อย้ายเซิฟ " .. game.Players.LocalPlayer.Name .. " Pls Wait", 3)
wait(3)

local PlaceID = game.PlaceId
          local AllIDs = {}
          local foundAnything = ""
          local actualHour = os.date("!*t").hour
          local Deleted = false
          --[[
          local File = pcall(function()
              AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
          end)
          if not File then
              table.insert(AllIDs, actualHour)
              writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
          end
          ]]
          function TPReturner()
              local Site;
              if foundAnything == "" then
                  Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
              else
                  Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
              end
              local ID = ""
              if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                  foundAnything = Site.nextPageCursor
              end
              local num = 0;
              for i,v in pairs(Site.data) do
                  local Possible = true
                  ID = tostring(v.id)
                  if tonumber(v.maxPlayers) > tonumber(v.playing) then
                      for _,Existing in pairs(AllIDs) do
                          if num ~= 0 then
                              if ID == tostring(Existing) then
                                  Possible = false
                              end
                          else
                              if tonumber(actualHour) ~= tonumber(Existing) then
                                  local delFile = pcall(function()
                                      -- delfile("NotSameServers.json")
                                      AllIDs = {}
                                      table.insert(AllIDs, actualHour)
                                  end)
                              end
                          end
                          num = num + 1
                      end
                      if Possible == true then
                          table.insert(AllIDs, ID)
                          wait()
                          pcall(function()
                              -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                              wait()
                              game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                          end)
                          wait(4)
                      end
                  end
              end
          end

          function Teleport()
              while wait() do
                  pcall(function()
                      TPReturner()
                      if foundAnything ~= "" then
                          TPReturner()
                      end
                  end)
              end
          end

          Teleport()

end)

Tab8:Label("ฝั่งชั่น คุ้มกัน")
Tab8:Button("กันแลค", function()
create:Notifile("", "โปรดรอ 2 วิ เพื่อเปิดใช้งานกันแลค & โชว์ FPS", 3)
wait(2)

local ToDisable = {
 Textures = true,
 VisualEffects = true,
 Parts = true,
 Particles = true,
 Sky = true
}
 
local ToEnable = {
 FullBright = false
}
 
local Stuff = {}
 
for _, v in next, game:GetDescendants() do
 if ToDisable.Parts then
  if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
   v.Material = Enum.Material.SmoothPlastic
   table.insert(Stuff, 1, v)
  end
 end
 
 if ToDisable.Particles then
  if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
   v.Enabled = false
   table.insert(Stuff, 1, v)
  end
 end
 
 if ToDisable.VisualEffects then
  if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
   v.Enabled = false
   table.insert(Stuff, 1, v)
  end
 end
 
 if ToDisable.Textures then
  if v:IsA("Decal") or v:IsA("Texture") then
   v.Texture = ""
   table.insert(Stuff, 1, v)
  end
 end
 
 if ToDisable.Sky then
  if v:IsA("Sky") then
   v.Parent = nil
   table.insert(Stuff, 1, v)
  end
 end
end
 
game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled "..#Stuff.." assets / effects. Settings :")
 
for i, v in next, ToDisable do
 print(tostring(i)..": "..tostring(v))
end
 
if ToEnable.FullBright then
    local Lighting = game:GetService("Lighting")
 
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    Lighting.FogEnd = math.huge
    Lighting.FogStart = math.huge
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 5
    Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    Lighting.Outlines = true
				end
-- FPS Counter Script (LocalScript)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- เธชเธฃเนเธฒเธ GUI
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPSCounter"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- เธชเธฃเนเธฒเธ TextLabel เนเธชเธ”เธ FPS
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0, 120, 0, 35)                      -- เธเธเธฒเธ”เนเธซเธเนเธเธถเนเธเธเธดเธ”เธซเธเนเธญเธข
fpsLabel.Position = UDim2.new(1, -130, 0, 10)                 -- เธกเธธเธกเธเธงเธฒเธเธ
fpsLabel.AnchorPoint = Vector2.new(0, 0)
fpsLabel.BackgroundTransparency = 1                           -- เนเธกเนเธกเธตเธเธทเนเธเธซเธฅเธฑเธ
fpsLabel.BorderSizePixel = 0
fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)               -- เธชเธตเน€เธเธตเธขเธง
fpsLabel.TextStrokeTransparency = 0.5                         -- เธเธญเธเธ•เธฑเธงเธญเธฑเธเธฉเธฃ
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextSize = 22                                        -- เธ•เธฑเธงเธญเธฑเธเธฉเธฃเนเธซเธเนเธเธถเนเธ
fpsLabel.Text = "FPS: 0"
fpsLabel.TextXAlignment = Enum.TextXAlignment.Right          -- เธเธดเธ”เธเธงเธฒ
fpsLabel.Parent = screenGui

-- เธญเธฑเธเน€เธ”เธ• FPS เธ—เธธเธเธงเธดเธเธฒเธ—เธต
local lastUpdate = tick()
local frameCount = 0

RunService.RenderStepped:Connect(function()
	frameCount += 1
	local currentTime = tick()
	if currentTime - lastUpdate >= 1 then
		local fps = math.floor(frameCount / (currentTime - lastUpdate))
		fpsLabel.Text = "FPS: " .. fps
		lastUpdate = currentTime
		frameCount = 0
	end
end)
end)

local afkConnection

Tab8:Toggle("คุัมกัน AFK", false, function(state)

    if state then
	create:Notifile("", "ปกป้อง โดนเตะ " .. game.Players.LocalPlayer.Name .. " Can AFK Now :)", 3)
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

Tab8:Toggle("คุ้มกัน การโดนสตั้น", false, function(pol)
    _G.anti = pol
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            local success, err = pcall(function()
                local ResourceHolder = game.Workspace:FindFirstChild("ResourceHolder")

                if ResourceHolder then
                    for _, player in pairs(game.Players:GetPlayers()) do
                        local resourceFolderName = "Resources_" .. tostring(player.UserId)
                        local playerResourceFolder = ResourceHolder:FindFirstChild(resourceFolderName)

                        if playerResourceFolder then
                            local magmaPool = playerResourceFolder:FindFirstChild("MagmaPool")

                            if magmaPool then
                                for _, item in pairs(magmaPool:GetDescendants()) do
                                    if item:IsA("Instance") and item.Name == "TouchInterest" then
                                        item:Destroy()
                                    end
				end
				end
                        end
		end
                end
            end)
        end
    end
end)

task.spawn(function()
	while task.wait(0.01) do
		if _G.anti then
			pcall(function()
				for _, model in ipairs(workspace:GetChildren()) do
				if model:IsA("Model") and model:FindFirstChild("Humanoid") then
				local powers = model:FindFirstChild("Powers")
					if powers then
						local love = powers:FindFirstChild("Love")
						if love then
							local projectiles = love:FindFirstChild("Projectiles")
							if projectiles then

								-- ๐’ LoveHeartTrimFill > TouchInterest
								local heartTrim = projectiles:FindFirstChild("LoveHeartTrim")
								if heartTrim then
									local fill = heartTrim:FindFirstChild("LoveHeartTrimFill")
									if fill then
										local touch = fill:FindFirstChild("TouchInterest")
										if touch then
											touch:Destroy()
											print("[เธฅเธเนเธฅเนเธง] TouchInterest: LoveHeartTrimFill เธเธญเธ", model.Name)
										end
									end
								end
								end
								-- ๐น LoveArrow > Tip > TouchInterest
								local arrow = projectiles:FindFirstChild("LoveArrow")
								if arrow then
									local tip = arrow:FindFirstChild("Tip")
									if tip then
										local touch = tip:FindFirstChild("TouchInterest")
										if touch then
											touch:Destroy()
											print("[เธฅเธเนเธฅเนเธง] TouchInterest: Tip เธเธญเธ", model.Name)
										end
									end
								end

							end
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            pcall(function()
                for _, obj in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(obj.Name) then
                        local leftArm = obj:FindFirstChild("Left Arm")
                        if leftArm then
                            local weldablePart = leftArm:FindFirstChild("WeldablePart")
                            if weldablePart then
                                local bodyVelocity = weldablePart:FindFirstChildOfClass("BodyVelocity")
                                if bodyVelocity then
                                    bodyVelocity:Destroy()
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            pcall(function()
                for _, playerFolder in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(playerFolder.Name) then
                        local punchFolder = playerFolder:FindFirstChild("Powers")
                        if punchFolder then
                            local chillyFolder = punchFolder:FindFirstChild("Chilly")
                            if chillyFolder then
                                local punch = chillyFolder:FindFirstChild("Punch")
                                if punch then
                                    local part = punch:FindFirstChild("Part")
                                    if part then
                                        for _, desc in pairs(part:GetDescendants()) do
                                            if desc.Name == "TouchInterest" then
                                                desc:Destroy()
                                            end
                                        end
                                    end

                                    local rock1 = punch:FindFirstChild("Rock1")
                                    if rock1 then
                                        for _, child in pairs(rock1:GetChildren()) do
                                            if child:IsA("BodyVelocity") then
                                                child:Destroy()
                                            end
                                        end

                                        for _, desc in pairs(rock1:GetDescendants()) do
                                            if desc.Name == "TouchInterest" then
                                                desc:Destroy()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            pcall(function()
                for _, playerFolder in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(playerFolder.Name) then
                        local powersFolder = playerFolder:FindFirstChild("Powers")
                        if powersFolder then
                            local smokeFolder = powersFolder:FindFirstChild("Smoke")
                            if smokeFolder then
                                local projectiles = smokeFolder:FindFirstChild("Projectiles") -- แก้สะกดตรงนี้
                                if projectiles then
                                    local part = projectiles:FindFirstChild("Part")
                                    if part then
                                        for _, desc in pairs(part:GetDescendants()) do
                                            if desc:IsA("TouchTransmitter") or desc.Name == "TouchInterest" then
                                                desc:Destroy()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
	while task.wait(0.01) do
		if _G.anti then
			for _, model in ipairs(workspace:GetChildren()) do
				if model:IsA("Model") and model:FindFirstChild("Powers") then
					local powers = model.Powers
					local smelt = powers:FindFirstChild("String")
					if smelt then
						local resources = smelt:FindFirstChild("Strings")
						if resources then
							local smeltSpew = resources:FindFirstChild("WeldablePart")
							if smeltSpew then
								for _, child in ipairs(smeltSpew:GetChildren()) do
									if child.Name == "Attachment" then
										child:Destroy()
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            pcall(function()
                for _, obj in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(obj.Name) then
                        local powers = obj:FindFirstChild("Powers")
                        if powers then
                            local dark = powers:FindFirstChild("Dark")
                            if dark then
                                local projectiles = dark:FindFirstChild("Projectiles")
                                if projectiles then
                                    local darkStarBit = projectiles:FindFirstChild("DarkStarBit")
                                    if darkStarBit then
                                        local bodyVelocity = darkStarBit:FindFirstChildOfClass("BodyVelocity")
                                        if bodyVelocity then
                                            bodyVelocity:Destroy()
                                        end
                                        local attachment = darkStarBit:FindFirstChildOfClass("Attachment")
                                        if attachment then
                                            attachment:Destroy()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            pcall(function()
                for _, obj in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(obj.Name) then
                        local powers = obj:FindFirstChild("Powers")
                        if powers then
                            local dark = powers:FindFirstChild("Dark")
                            if dark then
                                local darkParts = dark:FindFirstChild("DarkParts") -- เธซเธฒ DarkParts เธ•เธฃเธเธเธตเนเน€เธฅเธข
                                if darkParts then
                                    for _, part in pairs(darkParts:GetChildren()) do
                                        local weldablePart = part:FindFirstChild("WeldablePart")
                                        if weldablePart then
                                            local attachment = weldablePart:FindFirstChildOfClass("Attachment")
                                            if attachment then
                                                attachment:Destroy()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            pcall(function()
                for _, obj in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(obj.Name) then
                        local returnBall1 = obj:FindFirstChild("ReturnBall1")
                        if returnBall1 then
                            for _, child in pairs(returnBall1:GetDescendants()) do
                                if child:IsA("Instance") and child.Name == "TouchInterest" then
                                        child:Destroy()
                                    end
                            end
			end
                        local returnBall2 = obj:FindFirstChild("ReturnBall2")
                        if returnBall2 then
                            for _, child in pairs(returnBall2:GetDescendants()) do
                                if child:IsA("Instance") and child.Name == "TouchInterest" then
                                       child:Destroy()
                                    end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            pcall(function()
                for _, playerChar in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(playerChar.Name) then
                        local powers = playerChar:FindFirstChild("Powers")
                        if powers then
                            local hollow = powers:FindFirstChild("Hollow")
                            if hollow then

                                -- Hollows โ’ Hollow โ’ HRP โ’ TouchInterest
                                local hollows = hollow:FindFirstChild("Hollows")
                                if hollows then
                                    for _, modelHollow in pairs(hollows:GetChildren()) do
                                        if modelHollow:IsA("Model") and modelHollow.Name == "Hollow" then
                                            local hrp = modelHollow:FindFirstChild("HumanoidRootPart")
                                            if hrp then
                                                local ti = hrp:FindFirstChildOfClass("TouchTransmitter") or hrp:FindFirstChild("TouchInterest")
                                                if ti then
                                                    ti:Destroy()
                                                end
                                            end
                                        end
                                    end
                                end

                                -- HollowsMini โ’ HollowMini โ’ HRP โ’ TouchInterest
                                local hollowsBody = hollow:FindFirstChild("HollowBody")
                                if hollowsBody then
                                    for _, modelMini in pairs(hollowsBody:GetChildren()) do
                                        if modelMini:IsA("Model") and modelMini.Name == "GhostBody" then
                                            local hrpMini = modelMini:FindFirstChild("HumanoidRootPart")
                                            if hrpMini then
                                                local tiMini = hrpMini:FindFirstChildOfClass("TouchTransmitter") or hrpMini:FindFirstChild("TouchInterest")
                                                if tiMini then
                                                    tiMini:Destroy()
                                                end
                                            end
                                        end
                                    end
                                end

                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            pcall(function()
                local plr = game:GetService("Players").LocalPlayer
                local char = workspace:FindFirstChild(plr.Name)
                if not char then return end

                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.PlatformStand then
                    hum.PlatformStand = false
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            pcall(function()
                for _, modelInWorkspace in pairs(workspace:GetChildren()) do
                    if modelInWorkspace:IsA("Model") then
                        local demonPartsToCheck = {
                            "DemonHead",
                            "DemonTorso",
                            "DemonRightArm",
                            "DemonLeftArm",
                            "DemonRightWing",
                            "DemonLeftWing"
                        }

                        for _, partName in ipairs(demonPartsToCheck) do
                            local part = modelInWorkspace:FindFirstChild(partName)
                            if part then
                                for _, child in pairs(part:GetChildren()) do
                                    if child.Name == "TouchInterest" then
                                        child:Destroy()
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
		
task.spawn(function()
    while task.wait(0.01) do
        if _G.anti then
            local resourceHolder = workspace:FindFirstChild("UserData")
            if resourceHolder then
                for _, player in ipairs(game.Players:GetPlayers()) do
                    local folderName = "User_" .. tostring(player.UserId)
                    local userFolder = resourceHolder:FindFirstChild(folderName)

                    if userFolder then
                        local success, err = pcall(function()
                            local specials = userFolder:FindFirstChild("Specials")
                            if specials then
                                local venom = specials:FindFirstChild("Venom")
                                if venom then
                                    local venomPool = venom:FindFirstChild("VenomPool")
                                    if venomPool then
                                        local touchInterest = venomPool:FindFirstChild("TouchInterest")
                                        if touchInterest then
                                            touchInterest:Destroy()
                                        end
                                    end
                                end
                            end
                        end)
                    end
		end
            end
        end
    end
end)

local RunService = game:GetService("RunService")
local followConnection
local seaPart

Tab8:Toggle("เดินบนน้ำ", false, function(walk)
    if walk then
        create:Notifile("", "เดินบนน้ำได้แล้ว! :)", 3)

        seaPart = Instance.new("Part")
        seaPart.Name = "InvisibleSea"
        seaPart.Anchored = true
        seaPart.CanCollide = true
        seaPart.Transparency = 1
        seaPart.Size = Vector3.new(50, 1, 50)
        seaPart.Parent = workspace

        followConnection = RunService.RenderStepped:Connect(function()
            local char = plr.Character or plr.CharacterAdded:Wait()
            local root = char:FindFirstChild("HumanoidRootPart")
            if root and seaPart then
                local goalPos = Vector3.new(root.Position.X, 211, root.Position.Z)
                seaPart.Position = seaPart.Position:Lerp(goalPos, 0.5)
            end
        end)

    else
        create:Notifile("", "Off walk on water now! :(", 3)

        if followConnection then
            followConnection:Disconnect()
            followConnection = nil
        end
        if seaPart then
            seaPart:Destroy()
            seaPart = nil
        end
    end
end)


local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local UserDataFolder = workspace:WaitForChild("UserData")
local myUserFolder = UserDataFolder:WaitForChild("User_" .. localPlayer.UserId)
local myData = myUserFolder:WaitForChild("Data")

local npcMapping = {
    NPC_Activation_Chef = function(obj)
        local value = tonumber(obj.Value)
        if value and value >= 1000000 then
            return "Aqua Staff: สำเร็จ!"
        else
            return "Aqua Staff: " .. (value or "Unknown") .. "/1000000"
        end
    end,
    NPC_Activation_Drinks = function(obj)
        local value = tonumber(obj.Value)
        if value and value >= 50000000 then
            return "Scissor Blade: สำเร็จ!"
        else
            return "Scissor Blade: " .. (value or "Unknown") .. "/50000000"
        end
    end,
    NPC_Activation_Expert = function(obj)
    local value = tonumber(obj.Value)
    if value and value >= 1000 then
        return "Divine Axe: สำเร็จ!"
    else
        return "Divine Axe: " .. (value or "Unknown") .. "/1000"
    end
end,
    NPC_Activation_Lucy = function(obj)
        local value = tonumber(obj.Value)
        if value and value >= 100000000 then
            return "Kanshou and Bakuya: สำเร็จ!"
        else
            return "Kanshou and Bakuya: " .. (value or "Unknown") .. "/100000000"
        end
    end,
    NPC_Activation_Merlin = function(obj)
        local value = tonumber(obj.Value)
        if value and value >= 200 then
            return "Lightning Sword: สำเร็จ!"
        else
            return "Lightning Sword: " .. (value or "Unknown") .. "/200"
        end
    end,
    NPC_Activation_Sam = function(obj)
        local value = tonumber(obj.Value)
        if value and value >= 1000 then
            return "Meteorite Sword: สำเร็จ!"
        else
            return "Meteorite Sword: " .. (value or "Unknown") .. "/1000"
        end
    end
}

local displayOptions = {}
local reverseLookup = {}

for name, transform in pairs(npcMapping) do
    local found = myData:FindFirstChild(name)
    if found then
        local displayName = transform(found)
        table.insert(displayOptions, displayName)
        reverseLookup[displayName] = name
    end
end

Tab8:Label("เช็คความคืบหน้าดาบลับได้ที่นี้")
Tab8:Dropdown("เช็คความคืบหน้า:", displayOptions, function(select)
    local originalName = reverseLookup[select]
end)

Tab8:Label("อาวุธปลอม")
Tab8:Button("Aqua Staff [ ต้องการเมรี เลเวล 500 ]" , function()
local A_1 = "Aqua Staff"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].UpdateMelee
    Event:FireServer(A_1)
end)

page8:Button("Seastone Cestus [ ต้องการเมรี เลเวล 500 ]" , function()
local A_1 = "Seastone Cestus"
    local Event = game:GetService("Workspace").UserData["User_"..game.Players.LocalPlayer.UserId].UpdateMelee
    Event:FireServer(A_1)
end)

local Tab9 = create.tabs:Taps("ดูปเพชร")

Tab9:Button("ดูปเพชร [ คำเตือน: รีแสตททั้งหมดทิ้งเพื่อใช้งานดูป ]" , function()
create:Notifile("", "เริ่มการดูปเพชร : " .. game.Players.LocalPlayer.Name .. " โปรดรอ", 3) -- เนเธเนเธเน€เธ•เธทเธญเธเน€เธฃเธดเนเธกเธฃเธตเธเธญเธข
wait(4)
workspace.UserData["User_"..game.Players.LocalPlayer.UserId].Stats:FireServer()
wait(20.5)
game.Players.LocalPlayer:Kick()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId) -- เธฃเธตเธเธญเธขเธเธฅเธฑเธเน€เธเธดเธฃเนเธเน€เธงเธญเธฃเนเน€เธ”เธดเธก
end)

Tab9:Button("เปลี่ยนเพชรเป็นเบรี", function()
    local player = game.Players.LocalPlayer
    local playerId = player.UserId
    local userDataName = game.Workspace.UserData:FindFirstChild("User_" .. playerId)
    if not userDataName then return end

    local AffMelee1 = userDataName.Data.DFT1Melee.Value
    local AffSniper1 = userDataName.Data.DFT1Sniper.Value
    local AffDefense1 = userDataName.Data.DFT1Defense.Value
    local AffSword1 = userDataName.Data.DFT1Sword.Value

    local function isLocked(value)
        return value >= 1.1 and value <= 2
    end

    local d = isLocked(AffDefense1) and nil or false
    local m = isLocked(AffMelee1) and nil or false
    local s = isLocked(AffSniper1) and nil or false
    local sw = isLocked(AffSword1) and nil or false

    local merchant = workspace:FindFirstChild("Merchants")
    if not merchant then return end

    local affinityMerchant = merchant:FindFirstChild("AffinityMerchant")
    if not affinityMerchant then return end

    local clickable = affinityMerchant:FindFirstChild("Clickable")
    if not clickable then return end

    local retum = clickable:FindFirstChild("Retum")
    if not retum then return end

    for i = 1, 50 do
        local args = {
            [1] = "DFT1",
            [2] = d,
            [3] = m,
            [4] = s,
            [5] = sw,
            [6] = "Gems"
        }
        retum:FireServer(unpack(args))
    end
end)

	end)
