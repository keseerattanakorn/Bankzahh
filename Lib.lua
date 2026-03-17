-- ReaperUI V2 (Dark Smooth)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local lib = {}

function lib:Create(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = "ReaperUI"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 450, 0, 320)
    main.Position = UDim2.new(0.5, -225, 0.5, -160)
    main.BackgroundColor3 = Color3.fromRGB(20,20,20)
    main.BackgroundTransparency = 0.15
    main.Parent = gui
    main.ClipsDescendants = true

    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1,0,0,40)
    titleLabel.Text = title or "Reaper UI"
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.new(1,1,1)
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = main

    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(0,130,1,-40)
    tabFrame.Position = UDim2.new(0,0,0,40)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Parent = main

    local pageFrame = Instance.new("Frame")
    pageFrame.Size = UDim2.new(1,-130,1,-40)
    pageFrame.Position = UDim2.new(0,130,0,40)
    pageFrame.BackgroundTransparency = 1
    pageFrame.Parent = main

    local layout = Instance.new("UIListLayout", tabFrame)
    layout.Padding = UDim.new(0,5)

    lib.tabFrame = tabFrame
    lib.pageFrame = pageFrame

    return lib
end

-- DRAG SYSTEM (Mouse + Mobile)
local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    main.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPos = main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local tabs = {}

function tabs:Tab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-10,0,35)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.Parent = lib.tabFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

    local page = Instance.new("Frame")
    page.Size = UDim2.new(1,0,1,0)
    page.Visible = false
    page.BackgroundTransparency = 1
    page.Parent = lib.pageFrame

    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0,6)

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        for _,v in pairs(lib.pageFrame:GetChildren()) do
            if v:IsA("Frame") then v.Visible = false end
        end
        page.Visible = true
    end)

    local api = {}

    function api:Button(text, callback)
        local b = btn:Clone()
        b.Text = text
        b.Parent = page

        b.MouseButton1Click:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.1), {Size = UDim2.new(1,-10,0,30)}):Play()
            task.wait(0.1)
            TweenService:Create(b, TweenInfo.new(0.1), {Size = UDim2.new(1,-10,0,35)}):Play()
            if callback then callback() end
        end)
    end

    function api:Toggle(text, default, callback)
        local t = btn:Clone()
        local state = default or false
        t.Text = text.." : "..(state and "ON" or "OFF")
        t.Parent = page

        t.MouseButton1Click:Connect(function()
            state = not state
            t.Text = text.." : "..(state and "ON" or "OFF")
            if callback then callback(state) end
        end)
    end

    function api:Textbox(text, placeholder, callback)
        local box = Instance.new("TextBox")
        box.Size = UDim2.new(1,-10,0,35)
        box.PlaceholderText = placeholder or ""
        box.Text = ""
        box.BackgroundColor3 = Color3.fromRGB(30,30,30)
        box.TextColor3 = Color3.new(1,1,1)
        box.Parent = page
        Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)

        box.FocusLost:Connect(function()
            if callback then callback(box.Text) end
        end)
    end

    function api:Dropdown(text, list, callback)
        local d = btn:Clone()
        local open = false
        d.Text = text
        d.Parent = page

        local drop = Instance.new("Frame")
        drop.Size = UDim2.new(1,-10,0,0)
        drop.ClipsDescendants = true
        drop.BackgroundTransparency = 1
        drop.Parent = page

        local lay = Instance.new("UIListLayout", drop)

        for _,v in pairs(list) do
            local opt = btn:Clone()
            opt.Text = v
            opt.Parent = drop

            opt.MouseButton1Click:Connect(function()
                d.Text = text.." : "..v
                if callback then callback(v) end
            end)
        end

        d.MouseButton1Click:Connect(function()
            open = not open
            local size = open and (#list * 40) or 0
            TweenService:Create(drop, TweenInfo.new(0.25), {
                Size = UDim2.new(1,-10,0,size)
            }):Play()
        end)
    end

    return api
end

lib.tabs = tabs
return lib
