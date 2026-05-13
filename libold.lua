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
hubToggle.AutomaticSize = Enum.AutomaticSize.X
hubToggle.Size = UDim2.new(0,0,0,50)
hubToggle.Position = UDim2.new(0,20,0,20)
hubToggle.BackgroundColor3 = Color3.fromRGB(25,25,25)
hubToggle.BackgroundTransparency = 0.2
hubToggle.Text = " 😈 "
hubToggle.TextColor3 = Color3.fromRGB(255,255,255)
hubToggle.Font = Enum.Font.GothamBold
hubToggle.TextSize = 18
hubToggle.Visible = false
hubToggle.Active = true
hubToggle.Draggable = false
hubToggle.Parent = gui
createUICorner(hubToggle, UDim.new(1,0))

local hubPadding = Instance.new("UIPadding")
hubPadding.PaddingLeft = UDim.new(0,15)
hubPadding.PaddingRight = UDim.new(0,15)
hubPadding.Parent = hubToggle

-- DRAG SYSTEM
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil
local moved = false

hubToggle.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        moved = false
        dragStart = input.Position
        startPos = hubToggle.Position
        dragInput = input
    end
end)

hubToggle.InputChanged:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then

        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)

    if input == dragInput and dragging then

        local delta = input.Position - dragStart

        if math.abs(delta.X) > 3 or math.abs(delta.Y) > 3 then
            moved = true
        end

        hubToggle.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = false
    end
end)

-- ปิดเมนู
closeBtn.MouseButton1Click:Connect(function()

    main.Visible = false
    hubToggle.Visible = true

end)

-- เปิดเมนู
hubToggle.MouseButton1Click:Connect(function()

    -- กันตอนลากแล้วเด้งเปิด
    if moved then
        return
    end

    main.Visible = true
    hubToggle.Visible = false

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
        label.Text = "• " .. (txt or "") .. " •"
        label.TextColor3 = Color3.fromRGB(200,200,200)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = sectionFrame

        return sectionFrame
    end

function newPage:Button(text, desc, callback)

    local container = Instance.new("Frame")
    container.Size = UDim2.new(1,-10,0,50)
    container.BackgroundColor3 = Color3.fromRGB(40,40,40)
    container.BackgroundTransparency = 0.4
    container.Parent = page
    createUICorner(container, UDim.new(0,6))

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,-10,0,24)
    button.Position = UDim2.new(0,5,0,2)
    button.BackgroundColor3 = Color3.fromRGB(60,60,60)
    button.BackgroundTransparency = 0.2
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 16
    button.Text = text or "Button"
    button.Parent = container
    createUICorner(button, UDim.new(0,6))

    local description = Instance.new("TextLabel")
    description.Size = UDim2.new(1,-15,0,14)
    description.Position = UDim2.new(0,10,0,30)
    description.BackgroundTransparency = 1
    description.Text = desc or ""
    description.TextColor3 = Color3.fromRGB(180,180,180)
    description.Font = Enum.Font.SourceSans
    description.TextSize = 13
    description.TextXAlignment = Enum.TextXAlignment.Left
    description.Parent = container

    button.MouseButton1Click:Connect(function()
        if callback then
            pcall(callback)
        end
    end)

    return container
end

function newPage:Section(txt, desc)

    local sectionFrame = Instance.new("Frame")
    sectionFrame.Size = UDim2.new(1,-10,0,42)
    sectionFrame.BackgroundTransparency = 1
    sectionFrame.Parent = page

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,0,0,22)
    label.BackgroundTransparency = 1
    label.Text = "^| "..(txt or "").." |^"
    label.TextColor3 = Color3.fromRGB(200,200,200)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 17
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = sectionFrame

    local description = Instance.new("TextLabel")
    description.Size = UDim2.new(1,0,0,14)
    description.Position = UDim2.new(0,0,0,22)
    description.BackgroundTransparency = 1
    description.Text = desc or ""
    description.TextColor3 = Color3.fromRGB(150,150,150)
    description.Font = Enum.Font.SourceSans
    description.TextSize = 13
    description.TextXAlignment = Enum.TextXAlignment.Left
    description.Parent = sectionFrame

    return sectionFrame
end

function newPage:Toggle(text, desc, default, callback)

    local container = Instance.new("Frame")
    container.Size = UDim2.new(1,-10,0,50)
    container.BackgroundColor3 = Color3.fromRGB(40,40,40)
    container.BackgroundTransparency = 0.4
    container.Parent = page
    createUICorner(container, UDim.new(0,6))

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,-70,0,24)
    label.Position = UDim2.new(0,10,0,2)
    label.BackgroundTransparency = 1
    label.Text = text or "Toggle"
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local description = Instance.new("TextLabel")
    description.Size = UDim2.new(1,-15,0,14)
    description.Position = UDim2.new(0,10,0,28)
    description.BackgroundTransparency = 1
    description.Text = desc or ""
    description.TextColor3 = Color3.fromRGB(180,180,180)
    description.Font = Enum.Font.SourceSans
    description.TextSize = 13
    description.TextXAlignment = Enum.TextXAlignment.Left
    description.Parent = container

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0,50,0,24)
    toggleBtn.Position = UDim2.new(1,-60,0.5,-12)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    toggleBtn.BackgroundTransparency = 0.4
    toggleBtn.Text = ""
    toggleBtn.Parent = container
    createUICorner(toggleBtn, UDim.new(0,6))

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0,20,0,20)
    knob.Position = default and UDim2.new(1,-22,0.5,-10) or UDim2.new(0,2,0.5,-10)
    knob.BackgroundColor3 = default and Color3.fromRGB(0,170,255) or Color3.fromRGB(150,150,150)
    knob.Parent = toggleBtn
    createUICorner(knob, UDim.new(1,0))

    local state = default and true or false

    toggleBtn.MouseButton1Click:Connect(function()

        state = not state

        local newPos = state
            and UDim2.new(1,-22,0.5,-10)
            or UDim2.new(0,2,0.5,-10)

        knob:TweenPosition(
            newPos,
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.12,
            true
        )

        knob.BackgroundColor3 = state
            and Color3.fromRGB(0,170,255)
            or Color3.fromRGB(150,150,150)

        if callback then
            pcall(callback,state)
        end
    end)

    if callback then
        pcall(callback,state)
    end

    return container
end

function newPage:Textbox(title, desc, placeholder, callback)

    local container = Instance.new("Frame")
    container.Size = UDim2.new(1,-10,0,50)
    container.BackgroundTransparency = 1
    container.Parent = page

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.38,0,0,20)
    label.Position = UDim2.new(0,10,0,0)
    label.BackgroundTransparency = 1
    label.Text = title or ""
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local description = Instance.new("TextLabel")
    description.Size = UDim2.new(1,-10,0,14)
    description.Position = UDim2.new(0,10,0,22)
    description.BackgroundTransparency = 1
    description.Text = desc or ""
    description.TextColor3 = Color3.fromRGB(180,180,180)
    description.Font = Enum.Font.SourceSans
    description.TextSize = 13
    description.TextXAlignment = Enum.TextXAlignment.Left
    description.Parent = container

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0.58,-20,0,24)
    box.Position = UDim2.new(0.42,0,0.5,-12)
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
            pcall(callback,box.Text)
        end
    end)

    return container
    end

function newPage:Dropdown(title, desc, items, callback)

    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -10, 0, 50)
    container.BackgroundColor3 = Color3.fromRGB(40,40,40)
    container.BackgroundTransparency = 0.4
    container.ClipsDescendants = true
    container.LayoutOrder = 0
    container.Parent = page
    createUICorner(container, UDim.new(0,6))

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(0.45, 0, 0, 20)
    titleLabel.Position = UDim2.new(0,10,0,2)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title or "Dropdown"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = container

    local description = Instance.new("TextLabel")
    description.Size = UDim2.new(1,-15,0,14)
    description.Position = UDim2.new(0,10,0,30)
    description.BackgroundTransparency = 1
    description.Text = desc or ""
    description.TextColor3 = Color3.fromRGB(180,180,180)
    description.Font = Enum.Font.SourceSans
    description.TextSize = 13
    description.TextXAlignment = Enum.TextXAlignment.Left
    description.Parent = container

    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Size = UDim2.new(0.45, -10, 0, 24)
    dropdownButton.Position = UDim2.new(0.55, 0, 0, 3)
    dropdownButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    dropdownButton.BackgroundTransparency = 0.3
    dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownButton.Font = Enum.Font.SourceSans
    dropdownButton.TextSize = 16
    dropdownButton.Text = " . . . "
    dropdownButton.Parent = container
    createUICorner(dropdownButton, UDim.new(0,6))

    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -20, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "▶"
    arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    arrow.Font = Enum.Font.SourceSansBold
    arrow.TextSize = 14
    arrow.Parent = dropdownButton

    local opened = false
    local selectedOption = nil

    local optionContainer = Instance.new("ScrollingFrame")
    optionContainer.Size = UDim2.new(1, -10, 0, 0)
    optionContainer.Position = UDim2.new(0,5,0,52)
    optionContainer.BackgroundColor3 = Color3.fromRGB(35,35,35)
    optionContainer.BackgroundTransparency = 0.2
    optionContainer.BorderSizePixel = 0
    optionContainer.ClipsDescendants = true
    optionContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    optionContainer.ScrollBarThickness = 4
    optionContainer.ZIndex = 5
    optionContainer.Visible = false
    optionContainer.Parent = container
    createUICorner(optionContainer, UDim.new(0,6))

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0,2)
    UIListLayout.Parent = optionContainer

    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        optionContainer.CanvasSize = UDim2.new(
            0,
            0,
            0,
            UIListLayout.AbsoluteContentSize.Y + 5
        )
    end)

    local searchBox = Instance.new("TextBox")
    searchBox.Size = UDim2.new(1,-4,0,24)
    searchBox.Position = UDim2.new(0,2,0,2)
    searchBox.PlaceholderText = "Search..."
    searchBox.Text = ""
    searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchBox.ClearTextOnFocus = false
    searchBox.Font = Enum.Font.SourceSans
    searchBox.TextSize = 16
    searchBox.ZIndex = 6
    searchBox.Parent = optionContainer
    createUICorner(searchBox, UDim.new(0,6))

    local function createOptions(filter)

        for _, child in ipairs(optionContainer:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end

        for _, item in ipairs(items) do

            if filter == "" or string.find(
                string.lower(item),
                string.lower(filter)
            ) then

                local option = Instance.new("TextButton")
                option.Size = UDim2.new(1,-4,0,25)

                option.BackgroundColor3 =
                    (item == selectedOption)
                    and Color3.fromRGB(90, 90, 90)
                    or Color3.fromRGB(40, 40, 40)

                option.BackgroundTransparency = 0.4
                option.TextColor3 = Color3.fromRGB(255, 255, 255)
                option.Text = item
                option.Font = Enum.Font.SourceSans
                option.TextSize = 16
                option.ZIndex = 6
                option.Parent = optionContainer

                createUICorner(option, UDim.new(0,6))

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

                    if callback then
                        callback(item)
                    end

                    opened = false
                    arrow.Text = "▶"

                    optionContainer:TweenSize(
                        UDim2.new(1, -10, 0, 0),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quad,
                        0.2,
                        true
                    )

                    container:TweenSize(
                        UDim2.new(1,-10,0,50),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quad,
                        0.2,
                        true
                    )

                    task.delay(0.2,function()
                        optionContainer.Visible = false
                    end)
                end)
            end
        end
    end

    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        createOptions(searchBox.Text)
    end)

    dropdownButton.MouseButton1Click:Connect(function()

        opened = not opened

        arrow.Text = opened and "▼" or "▶"

        if opened then

            optionContainer.Visible = true
            searchBox.Text = ""

            createOptions("")

            local dropSize = math.min(#items * 25 + 30, 150)

            container:TweenSize(
                UDim2.new(1,-10,0,55 + dropSize),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )

            optionContainer:TweenSize(
                UDim2.new(1, -10, 0, dropSize),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )

        else

            optionContainer:TweenSize(
                UDim2.new(1, -10, 0, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )

            container:TweenSize(
                UDim2.new(1,-10,0,50),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )

            task.delay(0.2,function()
                optionContainer.Visible = false
            end)
        end
    end)

    return container
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
