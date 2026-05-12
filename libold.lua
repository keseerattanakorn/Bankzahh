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

local tabs = {}

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

    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(1,-10,0,28)
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
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 6
    page.CanvasSize = UDim2.new(0,0,0,0)
    page.Visible = false
    page.Parent = library.pages

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0,6)
    layout.Parent = page

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 10)
    end)

    local function hidePages()
        for _,v in pairs(library.pages:GetChildren()) do
            if v:IsA("ScrollingFrame") then
                v.Visible = false
            end
        end
    end

    tabButton.MouseButton1Click:Connect(function()
        hidePages()
        page.Visible = true
    end)

    if #library.pages:GetChildren() == 1 then
        page.Visible = true
    end

    local newPage = {}

    function newPage:Label(text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1,-10,0,24)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.Font = Enum.Font.SourceSans
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = page
    end

    return newPage
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

    function newPage:Toggle(text, default, callback)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, -10, 0, 30)
        container.BackgroundColor3 = Color3.fromRGB(40,40,40)
        container.BackgroundTransparency = 0.4
        container.Parent = page
        createUICorner(container, UDim.new(0,6))

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -70, 1, 0)
        label.Position = UDim2.new(0,10,0,0)
        label.BackgroundTransparency = 1
        label.Text = text or "Toggle"
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.Font = Enum.Font.SourceSans
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container

        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Size = UDim2.new(0,50,0,24)
        toggleBtn.Position = UDim2.new(1, -60, 0.5, -12)
        toggleBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
        toggleBtn.BackgroundTransparency = 0.4
        toggleBtn.Text = ""
        toggleBtn.Parent = container
        createUICorner(toggleBtn, UDim.new(0,6))

        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0,20,0,20)
        knob.Position = default and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0,2,0.5,-10)
        knob.BackgroundColor3 = default and Color3.fromRGB(0,170,255) or Color3.fromRGB(150,150,150)
        knob.Parent = toggleBtn
        createUICorner(knob, UDim.new(1,0))

        local state = default and true or false
        toggleBtn.MouseButton1Click:Connect(function()
            state = not state
            local newPos = state and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0,2,0.5,-10)
            knob:TweenPosition(newPos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.12, true)
            knob.BackgroundColor3 = state and Color3.fromRGB(0,170,255) or Color3.fromRGB(150,150,150)
            if callback then
                pcall(callback, state)
            end
        end)
        if callback then
            pcall(callback, state)
        end
        return container
    end

    function newPage:Textbox(title, placeholder, callback)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, -10, 0, 30)
        container.BackgroundTransparency = 1
        container.Parent = page

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.38, 0, 1, 0)
        label.Position = UDim2.new(0,10,0,0)
        label.BackgroundTransparency = 1
        label.Text = title or ""
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.Font = Enum.Font.SourceSans
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container

        local box = Instance.new("TextBox")
        box.Size = UDim2.new(0.58, -20, 0, 24)
        box.Position = UDim2.new(0.42, 0, 0.5, -12)
        box.BackgroundColor3 = Color3.fromRGB(50,50,50)
        box.BackgroundTransparency = 0.4
        box.PlaceholderText = placeholder or ""
        box.Text = ""
        box.TextColor3 = Color3.fromRGB(255,255,255)
        box.Font = Enum.Font.SourceSans
        box.TextSize = 16
        box.Parent = container
        createUICorner(box, UDim.new(0,6))

        box.FocusLost:Connect(function(enter)
            if enter and callback then
                pcall(callback, box.Text)
            end
        end)
        return container
    end

   function newPage:Dropdown(title, items, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -10, 0, 30)
    container.BackgroundTransparency = 1
    container.LayoutOrder = 0
    container.Parent = page

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(0.5, 0, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = container

    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -20, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "ยซ"
    arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    arrow.Font = Enum.Font.SourceSans
    arrow.TextSize = 16
    arrow.Parent = container

    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Size = UDim2.new(0.5, -20, 1, 0)
    dropdownButton.Position = UDim2.new(0.5, 0, 0, 0)
    dropdownButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    dropdownButton.BackgroundTransparency = 0.4
    dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownButton.Font = Enum.Font.SourceSans
    dropdownButton.TextSize = 16
    dropdownButton.Text = " . . . "
    dropdownButton.Parent = container

    local opened = false
    local selectedOption = nil

    -- โ… เนเธเน ScrollingFrame + เธเธดเธ”/เน€เธเธดเธ” Visible
    local optionContainer = Instance.new("ScrollingFrame")
    optionContainer.Size = UDim2.new(1, -10, 0, 0)
    optionContainer.BackgroundTransparency = 0.4
    optionContainer.ClipsDescendants = true
    optionContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    optionContainer.ScrollBarThickness = 4
    optionContainer.ZIndex = 5
    optionContainer.Visible = false -- โ— เน€เธฃเธดเนเธกเธ•เนเธเธเธดเธ”เนเธงเน
    optionContainer.Parent = container

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = optionContainer

    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        optionContainer.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    end)

    local searchBox = Instance.new("TextBox")
    searchBox.Size = UDim2.new(1, 0, 0, 25)
    searchBox.PlaceholderText = "📩 Search..."
    searchBox.Text = ""
    searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchBox.ClearTextOnFocus = false
    searchBox.Font = Enum.Font.SourceSans
    searchBox.TextSize = 16
    searchBox.ZIndex = 6
    searchBox.Parent = optionContainer

    local function createOptions(filter)
        for _, child in ipairs(optionContainer:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end

        for _, item in ipairs(items) do
            if filter == "" or string.find(string.lower(item), string.lower(filter)) then
                local option = Instance.new("TextButton")
                option.Size = UDim2.new(1, 0, 0, 25)
                option.BackgroundColor3 = (item == selectedOption) and Color3.fromRGB(90, 90, 90) or Color3.fromRGB(40, 40, 40)
                option.BackgroundTransparency = 0.4
                option.TextColor3 = Color3.fromRGB(255, 255, 255)
                option.Text = item
                option.Font = Enum.Font.SourceSans
                option.TextSize = 16
                option.ZIndex = 6
                option.Parent = optionContainer

                option.MouseEnter:Connect(function()
                    if item ~= selectedOption then
                        option.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    end
                end)
                option.MouseLeave:Connect(function()
                    if item ~= selectedOption then
                        option.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    end
                end)

                option.MouseButton1Click:Connect(function()
                    selectedOption = item
                    dropdownButton.Text = item
                    if callback then callback(item) end
                    opened = false
                    arrow.Text = "ยซ"

                    -- โ— เธเธดเธ” dropdown เธญเธขเนเธฒเธเธชเธกเธเธนเธฃเธ“เน
                    optionContainer:TweenSize(
                        UDim2.new(1, -10, 0, 0),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quad,
                        0.2,
                        true,
                        function()
                            optionContainer.Visible = false
                        end
                    )
                end)
            end
        end
    end

    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        createOptions(searchBox.Text)
    end)

    dropdownButton.MouseButton1Click:Connect(function()
        opened = not opened
        arrow.Text = opened and "ยป" or "ยซ"

        if opened then
            optionContainer.Visible = true -- โ… เน€เธเธดเธ”เนเธซเธกเนเธเนเธญเธ Tween
            searchBox.Text = ""
            createOptions("")
        end

        optionContainer:TweenSize(
            UDim2.new(1, -10, 0, opened and math.min(#items * 25 + 25, 150) or 0),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.2,
            true,
            function()
                if not opened then
                    optionContainer.Visible = false
                end
            end
        )
    end)

    return container
end
    
    if #library.pages:GetChildren() == 1 then
    page.Visible = true
end

    return newPage
end

-- Notification system (single, clean)
local activeNotifs = {}
function library:Notifile(title, msg, duration)
    local gui = CoreGui:FindFirstChild("redui")
    if not gui then return end
    if #activeNotifs >= 3 then
        local oldest = table.remove(activeNotifs, 1)
        if oldest and oldest.Destroy then oldest:Destroy() end
    end

    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0,300,0,60)
    notif.Position = UDim2.new(1, 310, 1, -80)
    notif.AnchorPoint = Vector2.new(1,1)
    notif.BackgroundColor3 = Color3.fromRGB(25,25,25)
    notif.BackgroundTransparency = 0.4
    notif.BorderSizePixel = 0
    notif.Parent = gui
    createUICorner(notif, UDim.new(0,8))

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0,5,0,0)
    label.BackgroundTransparency = 1
    label.Text = msg or ""
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = notif

    for i, n in ipairs(activeNotifs) do
        local goalPos = UDim2.new(1, -10, 1, -10 - (70 * i))
        TweenService:Create(n, TweenInfo.new(0.18), {Position = goalPos}):Play()
    end

    table.insert(activeNotifs, notif)

    TweenService:Create(notif, TweenInfo.new(0.28), {Position = UDim2.new(1, -10, 1, -10)}):Play()

    task.delay(duration or 3, function()
        local tweenOut = TweenService:Create(notif, TweenInfo.new(0.28), {Position = UDim2.new(1, 310, 1, -10)})
        tweenOut:Play()
        tweenOut.Completed:Wait()

        for i, n in ipairs(activeNotifs) do
            if n == notif then
                table.remove(activeNotifs, i)
                break
            end
        end

        for i, n in ipairs(activeNotifs) do
            local goalPos = UDim2.new(1, -10, 1, -10 - (70 * (i-1)))
            TweenService:Create(n, TweenInfo.new(0.18), {Position = goalPos}):Play()
        end

        notif:Destroy()
    end)
end

library.tabs = tabs

return library
