-- ROBANIK ADVANCED GUI MENU | BY ROBANIK | STEAL A BRAINROT
-- Advanced Roblox Exploit GUI with Modern Design

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Camera = workspace.CurrentCamera

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- KEY SYSTEM SETTINGS (CHANGE YOUR KEY HERE)
local CORRECT_KEY = "ROBANIK2024"  -- Измени это на свой ключ
local keyEntered = false

-- GUI Variables
local ScreenGui
local MainFrame
local connections = {}
local states = {
    fly = false,
    freecam1 = false,
    freecam2 = false,
    float = false,
    noclip = false,
    speed = false,
    jump = false
}

-- Create Main GUI
local function createGUI()
    -- Destroy existing GUI if exists
    if ScreenGui then
        ScreenGui:Destroy()
    end
    
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RobanikGUI"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Main Frame
    MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -250)
    MainFrame.Size = UDim2.new(0, 600, 0, 500)
    MainFrame.ClipsDescendants = true
    
    -- Add corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = MainFrame
    
    -- Add gradient
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
    }
    gradient.Rotation = 45
    gradient.Parent = MainFrame
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Parent = MainFrame
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    titleBar.BorderSizePixel = 0
    titleBar.Size = UDim2.new(1, 0, 0, 50)
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 15)
    titleCorner.Parent = titleBar
    
    -- Title Text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "Title"
    titleText.Parent = titleBar
    titleText.BackgroundTransparency = 1
    titleText.Position = UDim2.new(0, 20, 0, 0)
    titleText.Size = UDim2.new(0.7, 0, 1, 0)
    titleText.Font = Enum.Font.GothamBold
    titleText.Text = "ROBANIK GUI | BY ROBANIK | STEAL A BRAINROT"
    titleText.TextColor3 = Color3.fromRGB(100, 200, 255)
    titleText.TextSize = 16
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Parent = titleBar
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    closeBtn.BorderSizePixel = 0
    closeBtn.Position = UDim2.new(1, -40, 0, 10)
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 18
    
    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 8)
    closeBtnCorner.Parent = closeBtn
    
    -- Minimize Button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "MinimizeButton"
    minimizeBtn.Parent = titleBar
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 60)
    minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Position = UDim2.new(1, -80, 0, 10)
    minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.Text = "−"
    minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeBtn.TextSize = 18
    
    local minimizeBtnCorner = Instance.new("UICorner")
    minimizeBtnCorner.CornerRadius = UDim.new(0, 8)
    minimizeBtnCorner.Parent = minimizeBtn
    
    return MainFrame
end

-- Key System GUI
local function createKeySystem()
    local keyFrame = Instance.new("Frame")
    keyFrame.Name = "KeySystem"
    keyFrame.Parent = ScreenGui
    keyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    keyFrame.BorderSizePixel = 0
    keyFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    keyFrame.Size = UDim2.new(0, 400, 0, 200)
    
    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = UDim.new(0, 15)
    keyCorner.Parent = keyFrame
    
    local keyTitle = Instance.new("TextLabel")
    keyTitle.Parent = keyFrame
    keyTitle.BackgroundTransparency = 1
    keyTitle.Position = UDim2.new(0, 0, 0, 20)
    keyTitle.Size = UDim2.new(1, 0, 0, 40)
    keyTitle.Font = Enum.Font.GothamBold
    keyTitle.Text = "🔐 ROBANIK KEY SYSTEM"
    keyTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
    keyTitle.TextSize = 20
    keyTitle.TextXAlignment = Enum.TextXAlignment.Center
    
    local keyInput = Instance.new("TextBox")
    keyInput.Parent = keyFrame
    keyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    keyInput.BorderSizePixel = 0
    keyInput.Position = UDim2.new(0, 50, 0, 80)
    keyInput.Size = UDim2.new(0, 300, 0, 40)
    keyInput.Font = Enum.Font.Gotham
    keyInput.PlaceholderText = "Enter Key..."
    keyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    keyInput.Text = ""
    keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyInput.TextSize = 16
    keyInput.TextXAlignment = Enum.TextXAlignment.Center
    
    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 8)
    inputCorner.Parent = keyInput
    
    local submitBtn = Instance.new("TextButton")
    submitBtn.Parent = keyFrame
    submitBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 60)
    submitBtn.BorderSizePixel = 0
    submitBtn.Position = UDim2.new(0, 150, 0, 140)
    submitBtn.Size = UDim2.new(0, 100, 0, 35)
    submitBtn.Font = Enum.Font.GothamBold
    submitBtn.Text = "SUBMIT"
    submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitBtn.TextSize = 14
    
    local submitCorner = Instance.new("UICorner")
    submitCorner.CornerRadius = UDim.new(0, 8)
    submitCorner.Parent = submitBtn
    
    submitBtn.MouseButton1Click:Connect(function()
        if keyInput.Text == CORRECT_KEY then
            keyEntered = true
            keyFrame:Destroy()
            initializeMenu()
        else
            keyInput.Text = ""
            keyInput.PlaceholderText = "❌ Wrong Key! Try Again..."
            keyInput.PlaceholderColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)
    
    return keyFrame
end

-- Create Tab System
local function createTabSystem(parent)
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Parent = parent
    tabContainer.BackgroundTransparency = 1
    tabContainer.Position = UDim2.new(0, 0, 0, 60)
    tabContainer.Size = UDim2.new(1, 0, 1, -60)
    
    -- Tab Buttons Container
    local tabButtons = Instance.new("Frame")
    tabButtons.Name = "TabButtons"
    tabButtons.Parent = tabContainer
    tabButtons.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    tabButtons.BorderSizePixel = 0
    tabButtons.Size = UDim2.new(0, 150, 1, 0)
    
    local tabButtonsCorner = Instance.new("UICorner")
    tabButtonsCorner.CornerRadius = UDim.new(0, 10)
    tabButtonsCorner.Parent = tabButtons
    
    -- Content Container
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentContainer"
    contentContainer.Parent = tabContainer
    contentContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    contentContainer.BorderSizePixel = 0
    contentContainer.Position = UDim2.new(0, 160, 0, 0)
    contentContainer.Size = UDim2.new(1, -160, 1, 0)
    
    local contentCorner = Instance.new("UICorner")
    contentCorner.CornerRadius = UDim.new(0, 10)
    contentCorner.Parent = contentContainer
    
    return tabButtons, contentContainer
end

-- Create Toggle Button
local function createToggle(parent, text, position, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Parent = parent
    toggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Position = position
    toggleFrame.Size = UDim2.new(0, 200, 0, 40)
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleFrame
    
    local toggleText = Instance.new("TextLabel")
    toggleText.Parent = toggleFrame
    toggleText.BackgroundTransparency = 1
    toggleText.Position = UDim2.new(0, 10, 0, 0)
    toggleText.Size = UDim2.new(0.7, 0, 1, 0)
    toggleText.Font = Enum.Font.Gotham
    toggleText.Text = text
    toggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleText.TextSize = 14
    toggleText.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = toggleFrame
    toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Position = UDim2.new(1, -35, 0, 5)
    toggleBtn.Size = UDim2.new(0, 30, 0, 30)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.Text = "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.TextSize = 10
    
    local toggleBtnCorner = Instance.new("UICorner")
    toggleBtnCorner.CornerRadius = UDim.new(1, 0)
    toggleBtnCorner.Parent = toggleBtn
    
    local isEnabled = false
    
    toggleBtn.MouseButton1Click:Connect(function()
        isEnabled = not isEnabled
        if isEnabled then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 60)
            toggleBtn.Text = "ON"
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            toggleBtn.Text = "OFF"
        end
        callback(isEnabled)
    end)
    
    return toggleFrame
end

-- Flight Function
local function toggleFly(enabled)
    if enabled then
        states.fly = true
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = RootPart
        
        connections.fly = RunService.Heartbeat:Connect(function()
            if not states.fly then return end
            
            local moveVector = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveVector = moveVector + Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveVector = moveVector - Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveVector = moveVector - Camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveVector = moveVector + Camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveVector = moveVector + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveVector = moveVector - Vector3.new(0, 1, 0)
            end
            
            bodyVelocity.Velocity = moveVector * 50
        end)
    else
        states.fly = false
        if connections.fly then
            connections.fly:Disconnect()
        end
        if RootPart:FindFirstChild("BodyVelocity") then
            RootPart.BodyVelocity:Destroy()
        end
    end
end

-- Float Function with Visual Effects
local function toggleFloat(enabled)
    if enabled then
        states.float = true
        
        -- Create clone below
        local clone = Character:Clone()
        clone.Name = "FloatClone"
        clone.Parent = workspace
        clone.HumanoidRootPart.Position = RootPart.Position - Vector3.new(0, 10, 0)
        clone.HumanoidRootPart.Anchored = true
        
        -- Make clone transparent
        for _, part in pairs(clone:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 0.8
            end
        end
        
        -- Add "FLOAT" text above player
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Size = UDim2.new(0, 200, 0, 50)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.Parent = RootPart
        
        local floatText = Instance.new("TextLabel")
        floatText.Size = UDim2.new(1, 0, 1, 0)
        floatText.BackgroundTransparency = 1
        floatText.Font = Enum.Font.GothamBold
        floatText.Text = "FLOAT"
        floatText.TextColor3 = Color3.fromRGB(100, 200, 255)
        floatText.TextSize = 24
        floatText.TextStrokeTransparency = 0
        floatText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        floatText.Parent = billboardGui
        
        -- Create floating particles
        local particles = {}
        for i = 1, 8 do
            local part = Instance.new("Part")
            part.Name = "FloatParticle"
            part.Size = Vector3.new(0.5, 0.5, 0.5)
            part.Material = Enum.Material.Neon
            part.BrickColor = BrickColor.new("Bright blue")
            part.CanCollide = false
            part.Anchored = true
            part.Shape = Enum.PartType.Block
            part.Parent = workspace
            table.insert(particles, part)
        end
        
        connections.float = RunService.Heartbeat:Connect(function()
            if not states.float then return end
            
            -- Animate particles around player
            for i, part in ipairs(particles) do
                local angle = (tick() * 2 + i * (math.pi * 2 / #particles)) % (math.pi * 2)
                local radius = 3
                local x = math.cos(angle) * radius
                local z = math.sin(angle) * radius
                local y = math.sin(tick() * 3 + i) * 1.5
                
                part.Position = RootPart.Position + Vector3.new(x, y + 2, z)
                part.Rotation = Vector3.new(
                    tick() * 50 + i * 30,
                    tick() * 40 + i * 25,
                    tick() * 60 + i * 35
                )
            end
        end)
        
        -- Network manipulation (simulate standing on clone)
        connections.floatNetwork = RunService.Heartbeat:Connect(function()
            if clone and clone.Parent then
                -- Keep clone position synced below player
                clone.HumanoidRootPart.Position = Vector3.new(
                    RootPart.Position.X,
                    RootPart.Position.Y - 10,
                    RootPart.Position.Z
                )
            end
        end)
        
    else
        states.float = false
        
        -- Clean up connections
        if connections.float then
            connections.float:Disconnect()
        end
        if connections.floatNetwork then
            connections.floatNetwork:Disconnect()
        end
        
        -- Remove visual effects
        if RootPart:FindFirstChild("BillboardGui") then
            RootPart.BillboardGui:Destroy()
        end
        
        -- Remove particles
        for _, part in pairs(workspace:GetChildren()) do
            if part.Name == "FloatParticle" then
                part:Destroy()
            end
        end
        
        -- Remove clone
        if workspace:FindFirstChild("FloatClone") then
            workspace.FloatClone:Destroy()
        end
    end
end

-- FreeCam Functions
local function toggleFreeCam1(enabled)
    if enabled then
        states.freecam1 = true
        Camera.CameraType = Enum.CameraType.Scriptable
        local savedCFrame = Camera.CFrame
        
        connections.freecam1 = RunService.Heartbeat:Connect(function()
            if not states.freecam1 then return end
            Camera.CFrame = savedCFrame
        end)
    else
        states.freecam1 = false
        Camera.CameraType = Enum.CameraType.Custom
        if connections.freecam1 then
            connections.freecam1:Disconnect()
        end
    end
end

local function toggleFreeCam2(enabled)
    if enabled then
        states.freecam2 = true
        Camera.CameraType = Enum.CameraType.Scriptable
        
        local speed = 50
        connections.freecam2 = RunService.Heartbeat:Connect(function()
            if not states.freecam2 then return end
            
            local moveVector = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveVector = moveVector + Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveVector = moveVector - Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveVector = moveVector - Camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveVector = moveVector + Camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.E) then
                moveVector = moveVector + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
                moveVector = moveVector - Vector3.new(0, 1, 0)
            end
            
            Camera.CFrame = Camera.CFrame + (moveVector * speed * (1/60))
        end)
    else
        states.freecam2 = false
        Camera.CameraType = Enum.CameraType.Custom
        if connections.freecam2 then
            connections.freecam2:Disconnect()
        end
    end
end

-- Additional Functions
local function toggleNoclip(enabled)
    states.noclip = enabled
    if enabled then
        connections.noclip = RunService.Stepped:Connect(function()
            if not states.noclip then return end
            for _, part in pairs(Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    else
        if connections.noclip then
            connections.noclip:Disconnect()
        end
        for _, part in pairs(Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

local function setWalkSpeed(speed)
    Humanoid.WalkSpeed = speed
end

local function setJumpPower(power)
    Humanoid.JumpPower = power
end

-- Initialize Menu
function initializeMenu()
    local mainFrame = createGUI()
    local tabButtons, contentContainer = createTabSystem(mainFrame)
    
-- Tab Configuration
    local tabs = {
        {name = "Movement", icon = "🚀"},
        {name = "Visual", icon = "👁️"},
        {name = "World", icon = "🌍"},
        {name = "Player", icon = "👤"},
        {name = "Config", icon = "⚙️"}
    }
    
    local tabFrames = {}
    local currentTab = 1
    
    -- Create tab buttons and frames
    for i, tab in ipairs(tabs) do
        -- Tab Button
        local tabBtn = Instance.new("TextButton")
        tabBtn.Name = tab.name .. "Tab"
        tabBtn.Parent = tabButtons
        tabBtn.BackgroundColor3 = (i == 1) and Color3.fromRGB(100, 200, 255) or Color3.fromRGB(50, 50, 60)
        tabBtn.BorderSizePixel = 0
        tabBtn.Position = UDim2.new(0, 10, 0, 10 + (i-1) * 50)
        tabBtn.Size = UDim2.new(1, -20, 0, 40)
        tabBtn.Font = Enum.Font.GothamBold
        tabBtn.Text = tab.icon .. " " .. tab.name
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabBtn.TextSize = 14
        
        local tabBtnCorner = Instance.new("UICorner")
        tabBtnCorner.CornerRadius = UDim.new(0, 8)
        tabBtnCorner.Parent = tabBtn
        
        -- Tab Frame
        local tabFrame = Instance.new("ScrollingFrame")
        tabFrame.Name = tab.name .. "Frame"
        tabFrame.Parent = contentContainer
        tabFrame.BackgroundTransparency = 1
        tabFrame.BorderSizePixel = 0
        tabFrame.Size = UDim2.new(1, 0, 1, 0)
        tabFrame.ScrollBarThickness = 8
        tabFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 255)
        tabFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
        tabFrame.Visible = (i == 1)
        
        tabFrames[tab.name] = tabFrame
        
        -- Tab button click event
        tabBtn.MouseButton1Click:Connect(function()
            -- Hide all tabs
            for _, frame in pairs(tabFrames) do
                frame.Visible = false
            end
            -- Hide all tab buttons
            for _, child in pairs(tabButtons:GetChildren()) do
                if child:IsA("TextButton") then
                    child.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
                end
            end
            -- Show selected tab
            tabFrame.Visible = true
            tabBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
        end)
    end
    
    -- Movement Tab Content
    createToggle(tabFrames.Movement, "🚀 Fly", UDim2.new(0, 20, 0, 20), toggleFly)
    createToggle(tabFrames.Movement, "⭐ Float", UDim2.new(0, 250, 0, 20), toggleFloat)
    createToggle(tabFrames.Movement, "👻 Noclip", UDim2.new(0, 20, 0, 80), toggleNoclip)
    createToggle(tabFrames.Movement, "🏃 Speed Boost", UDim2.new(0, 250, 0, 80), function(enabled)
        setWalkSpeed(enabled and 50 or 16)
    end)
    createToggle(tabFrames.Movement, "🦘 Jump Boost", UDim2.new(0, 20, 0, 140), function(enabled)
        setJumpPower(enabled and 100 or 50)
    end)
    createToggle(tabFrames.Movement, "🌪️ Infinite Jump", UDim2.new(0, 250, 0, 140), function(enabled)
        if enabled then
            connections.infJump = UserInputService.JumpRequest:Connect(function()
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end)
        else
            if connections.infJump then
                connections.infJump:Disconnect()
            end
        end
    end)
    
    -- Visual Tab Content
    createToggle(tabFrames.Visual, "📹 FreeCam (Static)", UDim2.new(0, 20, 0, 20), toggleFreeCam1)
    createToggle(tabFrames.Visual, "🎥 FreeCam (Flying)", UDim2.new(0, 250, 0, 20), toggleFreeCam2)
    createToggle(tabFrames.Visual, "🌟 Fullbright", UDim2.new(0, 20, 0, 80), function(enabled)
        if enabled then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
        else
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = true
        end
    end)
    createToggle(tabFrames.Visual, "🔍 ESP Players", UDim2.new(0, 250, 0, 80), function(enabled)
        if enabled then
            states.esp = true
            connections.esp = {}
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                    table.insert(connections.esp, highlight)
                end
            end
            
            -- Handle new players joining
            connections.espPlayerAdded = Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(character)
                    wait(1)
                    if states.esp and character:FindFirstChild("HumanoidRootPart") then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = character
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.FillTransparency = 0.5
                        highlight.OutlineTransparency = 0
                        table.insert(connections.esp, highlight)
                    end
                end)
            end)
        else
            states.esp = false
            if connections.esp then
                for _, highlight in pairs(connections.esp) do
                    if highlight then highlight:Destroy() end
                end
                connections.esp = nil
            end
            if connections.espPlayerAdded then
                connections.espPlayerAdded:Disconnect()
            end
        end
    end)
    createToggle(tabFrames.Visual, "🎯 Aimbot", UDim2.new(0, 20, 0, 140), function(enabled)
        if enabled then
            connections.aimbot = RunService.Heartbeat:Connect(function()
                local target = nil
                local shortestDistance = math.huge
                
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= Player and player.Character and player.Character:FindFirstChild("Head") then
                        local distance = (player.Character.Head.Position - RootPart.Position).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            target = player
                        end
                    end
                end
                
                if target and target.Character:FindFirstChild("Head") then
                    Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, target.Character.Head.Position)
                end
            end)
        else
            if connections.aimbot then
                connections.aimbot:Disconnect()
            end
        end
    end)
    createToggle(tabFrames.Visual, "🌈 Rainbow Character", UDim2.new(0, 250, 0, 140), function(enabled)
        if enabled then
            connections.rainbow = RunService.Heartbeat:Connect(function()
                local hue = (tick() * 0.5) % 1
                local color = Color3.fromHSV(hue, 1, 1)
                for _, part in pairs(Character:GetChildren()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.Color = color
                    end
                end
            end)
        else
            if connections.rainbow then
                connections.rainbow:Disconnect()
            end
            -- Reset colors to default
            for _, part in pairs(Character:GetChildren()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Color = Color3.fromRGB(255, 184, 148)
                end
            end
        end
    end)
    createToggle(tabFrames.Visual, "⭐ Chams", UDim2.new(0, 20, 0, 200), function(enabled)
        if enabled then
            for _, part in pairs(Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.ForceField
                end
            end
        else
            for _, part in pairs(Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.Plastic
                end
            end
        end
    end)
    createToggle(tabFrames.Visual, "🌙 X-Ray Vision", UDim2.new(0, 250, 0, 200), function(enabled)
        if enabled then
            connections.xray = RunService.Heartbeat:Connect(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and not obj.Parent:FindFirstChild("Humanoid") then
                        obj.Transparency = 0.8
                    end
                end
            end)
        else
            if connections.xray then
                connections.xray:Disconnect()
            end
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj.Parent:FindFirstChild("Humanoid") then
                    obj.Transparency = 0
                end
            end
        end
    end)
    
    -- World Tab Content
    createToggle(tabFrames.World, "❄️ Anti-Lag", UDim2.new(0, 20, 0, 20), function(enabled)
        if enabled then
            states.antilag = true
            connections.antilag = RunService.Heartbeat:Connect(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Explosion") or obj:IsA("Sparkles") then
                        obj:Destroy()
                    end
                end
            end)
        else
            states.antilag = false
            if connections.antilag then
                connections.antilag:Disconnect()
            end
        end
    end)
    createToggle(tabFrames.World, "🔧 Click Teleport", UDim2.new(0, 250, 0, 20), function(enabled)
        if enabled then
            connections.clicktp = UserInputService.Button1Down:Connect(function()
                local mouse = Player:GetMouse()
                if mouse.Target then
                    RootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 5, 0))
                end
            end)
        else
            if connections.clicktp then
                connections.clicktp:Disconnect()
            end
        end
    end)
    createToggle(tabFrames.World, "🌊 Walk on Water", UDim2.new(0, 20, 0, 80), function(enabled)
        if enabled then
            connections.walkwater = RunService.Heartbeat:Connect(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj.Name == "Water" and obj:IsA("BasePart") then
                        obj.CanCollide = true
                    end
                end
            end)
        else
            if connections.walkwater then
                connections.walkwater:Disconnect()
            end
        end
    end)
    createToggle(tabFrames.World, "🌍 Remove Barriers", UDim2.new(0, 250, 0, 80), function(enabled)
        if enabled then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and (obj.Name:lower():find("barrier") or obj.Name:lower():find("wall") or obj.Name:lower():find("invisible")) then
                    obj:Destroy()
                end
            end
        end
    end)
    createToggle(tabFrames.World, "⚡ Kill Aura", UDim2.new(0, 20, 0, 140), function(enabled)
        if enabled then
            connections.killaura = RunService.Heartbeat:Connect(function()
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= Player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (player.Character.HumanoidRootPart.Position - RootPart.Position).Magnitude
                        if distance < 20 then
                            player.Character.Humanoid.Health = 0
                        end
                    end
                end
            end)
        else
            if connections.killaura then
                connections.killaura:Disconnect()
            end
        end
    end)
    createToggle(tabFrames.World, "🔥 Destroy Map", UDim2.new(0, 250, 0, 140), function(enabled)
        if enabled then
            for _, obj in pairs(workspace:GetChildren()) do
                if obj ~= workspace.CurrentCamera and obj.Name ~= "Baseplate" and not Players:GetPlayerFromCharacter(obj) then
                    obj:Destroy()
                end
            end
        end
    end)
    createToggle(tabFrames.World, "🌪️ Tornado", UDim2.new(0, 20, 0, 200), function(enabled)
        if enabled then
            connections.tornado = RunService.Heartbeat:Connect(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj.Parent ~= Character and not obj.Anchored then
                        local bodyVelocity = obj:FindFirstChild("TornadoForce") or Instance.new("BodyVelocity")
                        bodyVelocity.Name = "TornadoForce"
                        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
                        bodyVelocity.Velocity = Vector3.new(math.random(-50, 50), math.random(10, 50), math.random(-50, 50))
                        bodyVelocity.Parent = obj
                    end
                end
            end)
        else
            if connections.tornado then
                connections.tornado:Disconnect()
            end
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BodyVelocity") and obj.Name == "TornadoForce" then
                    obj:Destroy()
                end
            end
        end
    end)
    
-- Player Tab Content
    createToggle(tabFrames.Player, "😈 Godmode", UDim2.new(0, 20, 0, 20), function(enabled)
        if enabled then
            connections.godmode = RunService.Heartbeat:Connect(function()
                Humanoid.Health = Humanoid.MaxHealth
            end)
        else
            if connections.godmode then
                connections.godmode:Disconnect()
            end
        end
    end)
    createToggle(tabFrames.Player, "👤 Invisible", UDim2.new(0, 250, 0, 20), function(enabled)
        if enabled then
            for _, part in pairs(Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Transparency = 1
                elseif part:IsA("Accessory") then
                    part.Handle.Transparency = 1
                end
            end
            Character.Head.face.Transparency = 1
        else
            for _, part in pairs(Character:GetChildren()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = 0
                elseif part:IsA("Accessory") then
                    part.Handle.Transparency = 0
                end
            end
            Character.Head.face.Transparency = 0
        end
    end)
    createToggle(tabFrames.Player, "🏃‍♂️ Auto Sprint", UDim2.new(0, 20, 0, 80), function(enabled)
        if enabled then
            connections.autosprint = RunService.Heartbeat:Connect(function()
                Humanoid.WalkSpeed = 24
            end)
        else
            if connections.autosprint then
                connections.autosprint:Disconnect()
            end
            Humanoid.WalkSpeed = 16
        end
    end)
    createToggle(tabFrames.Player, "💪 Super Strength", UDim2.new(0, 250, 0, 80), function(enabled)
        if enabled then
            connections.strength = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local mouse = Player:GetMouse()
                    if mouse.Target and mouse.Target.Parent:FindFirstChild("Humanoid") then
                        mouse.Target.Parent.Humanoid.Health = 0
                    end
                end
            end)
        else
            if connections.strength then
                connections.strength:Disconnect()
            end
        end
    end)
    createToggle(tabFrames.Player, "🎭 Name Spoof", UDim2.new(0, 20, 0, 140), function(enabled)
        if enabled then
            Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        else
            Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
        end
    end)
    createToggle(tabFrames.Player, "🔄 Reset Character", UDim2.new(0, 250, 0, 140), function(enabled)
        if enabled then
            Character.Humanoid.Health = 0
        end
    end)
    
    -- Config Tab Content
    local configFrame = Instance.new("Frame")
    configFrame.Name = "ConfigFrame"
    configFrame.Parent = tabFrames.Config
    configFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    configFrame.BorderSizePixel = 0
    configFrame.Position = UDim2.new(0, 20, 0, 20)
    configFrame.Size = UDim2.new(1, -40, 0, 300)
    
    local configCorner = Instance.new("UICorner")
    configCorner.CornerRadius = UDim.new(0, 10)
    configCorner.Parent = configFrame
    
    local configTitle = Instance.new("TextLabel")
    configTitle.Parent = configFrame
    configTitle.BackgroundTransparency = 1
    configTitle.Position = UDim2.new(0, 20, 0, 10)
    configTitle.Size = UDim2.new(1, -40, 0, 30)
    configTitle.Font = Enum.Font.GothamBold
    configTitle.Text = "⚙️ Configuration Manager"
    configTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
    configTitle.TextSize = 18
    configTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local configNameInput = Instance.new("TextBox")
    configNameInput.Parent = configFrame
    configNameInput.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    configNameInput.BorderSizePixel = 0
    configNameInput.Position = UDim2.new(0, 20, 0, 60)
    configNameInput.Size = UDim2.new(0, 200, 0, 35)
    configNameInput.Font = Enum.Font.Gotham
    configNameInput.PlaceholderText = "Config Name..."
    configNameInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    configNameInput.Text = ""
    configNameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    configNameInput.TextSize = 14
    
    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 8)
    inputCorner.Parent = configNameInput
    
    local saveBtn = Instance.new("TextButton")
    saveBtn.Parent = configFrame
    saveBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 60)
    saveBtn.BorderSizePixel = 0
    saveBtn.Position = UDim2.new(0, 240, 0, 60)
    saveBtn.Size = UDim2.new(0, 80, 0, 35)
    saveBtn.Font = Enum.Font.GothamBold
    saveBtn.Text = "SAVE"
    saveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    saveBtn.TextSize = 12
    
    local saveBtnCorner = Instance.new("UICorner")
    saveBtnCorner.CornerRadius = UDim.new(0, 8)
    saveBtnCorner.Parent = saveBtn
    
    local loadBtn = Instance.new("TextButton")
    loadBtn.Parent = configFrame
    loadBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
    loadBtn.BorderSizePixel = 0
    loadBtn.Position = UDim2.new(0, 330, 0, 60)
    loadBtn.Size = UDim2.new(0, 80, 0, 35)
    loadBtn.Font = Enum.Font.GothamBold
    loadBtn.Text = "LOAD"
    loadBtn.T
