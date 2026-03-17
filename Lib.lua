-- ReaperUI Stable

local library = {}
local Players = game:GetService("Players")
local player = Players.LocalPlayer

function library:Win(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = "ReaperUI"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0,400,0,300)
    main.Position = UDim2.new(0.5,-200,0.5,-150)
    main.BackgroundColor3 = Color3.fromRGB(30,30,30)
    main.Parent = gui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1,0,0,30)
    titleLabel.Text = title or "UI"
    titleLabel.TextColor3 = Color3.new(1,1,1)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = main

    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(0,120,1,-30)
    tabFrame.Position = UDim2.new(0,0,0,30)
    tabFrame.Parent = main

    local pageFrame = Instance.new("Frame")
    pageFrame.Size = UDim2.new(1,-120,1,-30)
    pageFrame.Position = UDim2.new(0,120,0,30)
    pageFrame.Parent = main

    library.tabFrame = tabFrame
    library.pageFrame = pageFrame

    return library
end

local tabs = {}

function tabs:Tab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1,0,0,30)
    tabBtn.Text = name
    tabBtn.Parent = library.tabFrame

    local page = Instance.new("Frame")
    page.Size = UDim2.new(1,0,1,0)
    page.Visible = false
    page.Parent = library.pageFrame

    tabBtn.MouseButton1Click:Connect(function()
        for _,v in pairs(library.pageFrame:GetChildren()) do
            if v:IsA("Frame") then v.Visible = false end
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
        t.Text = text..":"..tostring(state)
        t.Parent = page
        t.MouseButton1Click:Connect(function()
            state = not state
            t.Text = text..":"..tostring(state)
            if callback then callback(state) end
        end)
    end

    function api:Textbox(text,placeholder,callback)
        local box = Instance.new("TextBox")
        box.Size = UDim2.new(1,0,0,30)
        box.PlaceholderText = placeholder or ""
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
            b.Text = text..":"..list[i]
            if callback then callback(list[i]) end
        end)
    end

    return api
end

library.tabs = tabs
return library
