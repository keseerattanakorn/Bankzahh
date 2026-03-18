-- ReaperUI FIXED

local library = {}
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- ลบ UI เก่า ถ้ามี
if PlayerGui:FindFirstChild("ReaperUI") then
    PlayerGui:FindFirstChild("ReaperUI"):Destroy()
end

function library:Win(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = "ReaperUI"
    gui.ResetOnSpawn = false
    gui.Parent = PlayerGui

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0,400,0,300)
    main.Position = UDim2.new(0.5,-200,0.5,-150)
    main.BackgroundColor3 = Color3.fromRGB(30,30,30)
    main.Active = true
    main.Parent = gui

    -- TITLE
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1,-30,0,30)
    titleLabel.Text = title or "UI"
    titleLabel.TextColor3 = Color3.new(1,1,1)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = main

    -- CLOSE
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0,30,0,30)
    closeBtn.Position = UDim2.new(1,-30,0,0)
    closeBtn.Text = "X"
    closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.Parent = main

    closeBtn.MouseButton1Click:Connect(function()
        main.Visible = false
    end)

    -- OPEN BUTTON
    local openBtn = Instance.new("TextButton")
    openBtn.Size = UDim2.new(0,100,0,30)
    openBtn.Position = UDim2.new(0,10,0,10)
    openBtn.Text = "Open UI"
    openBtn.Parent = gui

    openBtn.MouseButton1Click:Connect(function()
        main.Visible = not main.Visible
    end)

    -- TAB FRAME
    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(0,120,1,-30)
    tabFrame.Position = UDim2.new(0,0,0,30)
    tabFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    tabFrame.Parent = main

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.Parent = tabFrame
    tabLayout.Padding = UDim.new(0,5)

    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingTop = UDim.new(0,5)
    tabPadding.Parent = tabFrame

    -- PAGE FRAME
    local pageFrame = Instance.new("Frame")
    pageFrame.Size = UDim2.new(1,-120,1,-30)
    pageFrame.Position = UDim2.new(0,120,0,30)
    pageFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
    pageFrame.Parent = main

    library.tabFrame = tabFrame
    library.pageFrame = pageFrame

    -- DRAG
    local dragging = false
    local dragInput, mousePos, framePos

    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            main.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)

    return library
end

local tabs = {}

function tabs:Tab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1,-10,0,30)
    tabBtn.Text = name
    tabBtn.Parent = library.tabFrame

    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1,0,1,0)
    page.CanvasSize = UDim2.new(0,0,0,0)
    page.ScrollBarThickness = 4
    page.Visible = false
    page.Parent = library.pageFrame

    -- FIX สำคัญ: Layout + Padding ต้องใส่แบบนี้
    local layout = Instance.new("UIListLayout")
    layout.Parent = page
    layout.Padding = UDim.new(0,5)

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0,5)
    padding.PaddingLeft = UDim.new(0,5)
    padding.PaddingRight = UDim.new(0,5)
    padding.Parent = page

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 10)
    end)

    tabBtn.MouseButton1Click:Connect(function()
        for _,v in pairs(library.pageFrame:GetChildren()) do
            if v:IsA("ScrollingFrame") then
                v.Visible = false
            end
        end
        page.Visible = true
    end)

    local api = {}

    function api:Button(text,callback)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1,0,0,30)
        b.Text = text
        b.Parent = page

        b.MouseButton1Click:Connect(function()
            if callback then callback() end
        end)
    end

    function api:Toggle(text,default,callback)
        local t = Instance.new("TextButton")
        t.Size = UDim2.new(1,0,0,30)
        local state = default or false
        t.Text = text..": "..tostring(state)
        t.Parent = page

        t.MouseButton1Click:Connect(function()
            state = not state
            t.Text = text..": "..tostring(state)
            if callback then callback(state) end
        end)
    end

    function api:Textbox(text,placeholder,callback)
        local box = Instance.new("TextBox")
        box.Size = UDim2.new(1,0,0,30)
        box.PlaceholderText = placeholder or text
        box.Text = ""
        box.Parent = page

        box.FocusLost:Connect(function()
            if callback then callback(box.Text) end
        end)
    end

    function api:Dropdown(text,list,callback)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1,0,0,30)
        b.Text = text
        b.Parent = page

        local i = 1
        b.MouseButton1Click:Connect(function()
            i = i + 1
            if i > #list then i = 1 end
            b.Text = text..": "..list[i]
            if callback then callback(list[i]) end
        end)
    end

    return api
end

library.tabs = tabs
return library
