local library = {}

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

if CoreGui:FindFirstChild("redui") then
    CoreGui:FindFirstChild("redui"):Destroy()
end

local function createUICorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = radius or UDim.new(0,6)
    c.Parent = parent
    return c
end

-- Tabs system
local tabs = {}
library.tabs = tabs

function library:Win(title)

    if CoreGui:FindFirstChild("redui") then
        CoreGui:FindFirstChild("redui"):Destroy()
    end

    local gui = Instance.new("ScreenGui")
    gui.Name = "redui"
    gui.ResetOnSpawn = false
    gui.Parent = CoreGui

    local main = Instance.new("Frame")
    main.Name = "MainFrame"
    main.Size = UDim2.new(0.5,0,0.7,0)
    main.Position = UDim2.new(0.5,0,0.5,0)
    main.AnchorPoint = Vector2.new(0.5,0.5)
    main.BackgroundColor3 = Color3.fromRGB(0,0,0)
    main.BackgroundTransparency = 0.3
    main.BorderSizePixel = 0
    main.Parent = gui
    main.ClipsDescendants = true
    createUICorner(main, UDim.new(0,8))

    local border = Instance.new("UIStroke")
    border.Thickness = 2
    border.Color = Color3.fromRGB(255,255,255)
    border.Parent = main

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1,0,0,35)
    titleBar.BackgroundTransparency = 1
    titleBar.Parent = main
    titleBar.Active = true

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1,-70,1,0)
    titleLabel.Position = UDim2.new(0,10,0,0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title or "Window"
    titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 20
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0,28,0,28)
    closeBtn.Position = UDim2.new(1,-35,0.5,-14)
    closeBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
    closeBtn.BackgroundTransparency = 0.2
    closeBtn.Text = "-"
    closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 16
    closeBtn.Parent = titleBar
    createUICorner(closeBtn, UDim.new(0,6))

    local tabButtons = Instance.new("ScrollingFrame")
    tabButtons.Size = UDim2.new(0,120,1,-35)
    tabButtons.Position = UDim2.new(0,0,0,35)
    tabButtons.BackgroundTransparency = 1
    tabButtons.ScrollBarThickness = 4
    tabButtons.CanvasSize = UDim2.new(0,0,0,0)
    tabButtons.Parent = main

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.Padding = UDim.new(0,6)
    tabLayout.Parent = tabButtons

    tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabButtons.CanvasSize = UDim2.new(0,0,0,tabLayout.AbsoluteContentSize.Y)
    end)

    local pages = Instance.new("Frame")
    pages.Size = UDim2.new(1,-130,1,-45)
    pages.Position = UDim2.new(0,130,0,40)
    pages.BackgroundTransparency = 1
    pages.Parent = main

    -- DRAG MAIN
    local dragging = false
    local dragStart
    local startPos
    local dragInput

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

            dragging = true
            dragStart = input.Position
            startPos = main.Position
            dragInput = input
        end
    end)

    titleBar.InputEnded:Connect(function(input)
        if input == dragInput then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then

            local delta = input.Position - dragStart

            main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- HUB TOGGLE
    local hubToggle = Instance.new("TextButton")
    hubToggle.Name = "HubToggle"
    hubToggle.Size = UDim2.new(0,120,0,50)
    hubToggle.Position = UDim2.new(0.5,-90,0,10)
    hubToggle.AnchorPoint = Vector2.new(0.5,0)
    hubToggle.BackgroundColor3 = Color3.fromRGB(25,25,25)
    hubToggle.BackgroundTransparency = 0.2
    hubToggle.Text = "ReaperX Hub"
    hubToggle.TextColor3 = Color3.fromRGB(255,255,255)
    hubToggle.Font = Enum.Font.GothamBold
    hubToggle.TextSize = 18
    hubToggle.Visible = false
    hubToggle.Parent = gui
    createUICorner(hubToggle, UDim.new(1,0))

    -- DRAG HUB
    local hubDragging = false
    local hubDragStart
    local hubStartPos
    local hubDragInput

    hubToggle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

            hubDragging = true
            hubDragStart = input.Position
            hubStartPos = hubToggle.Position
            hubDragInput = input
        end
    end)

    hubToggle.InputEnded:Connect(function(input)
        if input == hubDragInput then
            hubDragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if hubDragging and input == hubDragInput then

            local delta = input.Position - hubDragStart

            hubToggle.Position = UDim2.new(
                hubStartPos.X.Scale,
                hubStartPos.X.Offset + delta.X,
                hubStartPos.Y.Scale,
                hubStartPos.Y.Offset + delta.Y
            )
        end
    end)

    -- CLOSE
    closeBtn.MouseButton1Click:Connect(function()

        TweenService:Create(
            main,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad),
            {
                Size = UDim2.new(0.5,0,0,0),
                Position = UDim2.new(0.5,0,-0.2,0)
            }
        ):Play()

        task.delay(0.45,function()

            main.Visible = false
            hubToggle.Visible = true

            hubToggle.Size = UDim2.new(0,50,0,50)

            TweenService:Create(
                hubToggle,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                {
                    Size = UDim2.new(0,120,0,50)
                }
            ):Play()

        end)
    end)

    -- OPEN
    hubToggle.MouseButton1Click:Connect(function()

        TweenService:Create(
            hubToggle,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad),
            {
                Size = UDim2.new(0,0,0,0)
            }
        ):Play()

        task.delay(0.35,function()

            hubToggle.Visible = false
            main.Visible = true

            main.Size = UDim2.new(0.5,0,0,0)
            main.Position = UDim2.new(0.5,0,-0.2,0)

            TweenService:Create(
                main,
                TweenInfo.new(0.45, Enum.EasingStyle.Quad),
                {
                    Size = UDim2.new(0.5,0,0.7,0),
                    Position = UDim2.new(0.5,0,0.5,0)
                }
            ):Play()

        end)
    end)

    library.tabButtons = tabButtons
    library.pages = pages
    library.gui = gui
    library.main = main
    library.hubToggle = hubToggle

    return self
end

function tabs:Taps(name)
    assert(library.tabButtons and library.pages, "Call library:Win(title) before creating tabs.")

    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(1, -10, 0, 28)
    tabButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
    tabButton.BackgroundTransparency = 0.6
    tabButton.TextColor3 = Color3.fromRGB(255,255,255)
    tabButton.Font = Enum.Font.SourceSans
    tabButton.TextSize = 16
    tabButton.Text = name
    tabButton.Parent = library.tabButtons
    createUICorner(tabButton, UDim.new(0,6))

    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1,0,1,0)
    page.Position = UDim2.new(0,0,0,0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 6
    page.CanvasSize = UDim2.new(0,0,0,0)
    page.Visible = false
    page.Parent = library.pages
    page.Name = name.."_Page"

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0,6)
    layout.Parent = page

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0,0,0, layout.AbsoluteContentSize.Y + 12)
    end)

    local function hideAllPages()
        for _, v in pairs(library.pages:GetChildren()) do
            if v:IsA("ScrollingFrame") then
                v.Visible = false
            end
        end
    end

    tabButton.MouseButton1Click:Connect(function()
        hideAllPages()
        page.Visible = true
    end)

    local count = 0
    for _,v in pairs(library.pages:GetChildren()) do
        if v:IsA("ScrollingFrame") then
            count += 1
        end
    end

    if count == 1 then
        page.Visible = true
    end

    local newPage = {}

    function newPage:Button(text, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -10, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(60,60,60)
        button.BackgroundTransparency = 0.4
        button.TextColor3 = Color3.fromRGB(255,255,255)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 16
        button.Text = text or "Button"
        button.Parent = page
        createUICorner(button, UDim.new(0,6))

        button.MouseButton1Click:Connect(function()
            if callback then
                pcall(callback)
            end
        end)

        return button
    end

    function newPage:Label(txt)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 0, 24)
        label.BackgroundTransparency = 1
        label.Text = txt or ""
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.Font = Enum.Font.SourceSans
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = page
        return label
    end

    function newPage:Section(txt)
        local sectionFrame = Instance.new("Frame")
        sectionFrame.Size = UDim2.new(1, -10, 0, 30)
        sectionFrame.BackgroundTransparency = 1
        sectionFrame.Parent = page

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 1, 0)
        label.Position = UDim2.new(0,5,0,0)
        label.BackgroundTransparency = 1
        label.Text = "^| " .. (txt or "") .. " |^"
        label.TextColor3 = Color3.fromRGB(200,200,200)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = sectionFrame

        return sectionFrame
    end

    return newPage
end

-- Notification system
local activeNotifs = {}

function library:Notifile(title, msg, duration)

    local gui = CoreGui:FindFirstChild("redui")
    if not gui then return end

    if #activeNotifs >= 3 then
        local oldest = table.remove(activeNotifs,1)
        if oldest then
            oldest:Destroy()
        end
    end

    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0,300,0,60)
    notif.Position = UDim2.new(1,310,1,-80)
    notif.AnchorPoint = Vector2.new(1,1)
    notif.BackgroundColor3 = Color3.fromRGB(25,25,25)
    notif.BackgroundTransparency = 0.4
    notif.BorderSizePixel = 0
    notif.Parent = gui
    createUICorner(notif, UDim.new(0,8))

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,-10,1,0)
    label.Position = UDim2.new(0,5,0,0)
    label.BackgroundTransparency = 1
    label.Text = msg or ""
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = notif

    for i,n in ipairs(activeNotifs) do
        local goalPos = UDim2.new(1,-10,1,-10-(70*i))
        TweenService:Create(n,TweenInfo.new(0.18),{
            Position = goalPos
        }):Play()
    end

    table.insert(activeNotifs,notif)

    TweenService:Create(
        notif,
        TweenInfo.new(0.28),
        {
            Position = UDim2.new(1,-10,1,-10)
        }
    ):Play()

    task.delay(duration or 3,function()

        local tweenOut = TweenService:Create(
            notif,
            TweenInfo.new(0.28),
            {
                Position = UDim2.new(1,310,1,-10)
            }
        )

        tweenOut:Play()
        tweenOut.Completed:Wait()

        for i,n in ipairs(activeNotifs) do
            if n == notif then
                table.remove(activeNotifs,i)
                break
            end
        end

        notif:Destroy()
    end)
end

library.tabs = tabs

return library
