-- [[ PYROVEX PREMIUM UI - FINAL FIX ]]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local ESP_ENABLED = false
local ESP_Storage = {}

-- ✅ SIMPLE FLAG
local isMinimized = false

-- UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PyrovexPremiumHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 230)
MainFrame.Position = UDim2.new(0.5, -180, 0.4, -115)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(110, 30, 180)

-- TOP BAR
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 55)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

-- LOGO
local Logo = Instance.new("TextLabel", TopBar)
Logo.Size = UDim2.new(0, 42, 0, 42)
Logo.Position = UDim2.new(0, 12, 0, 6)
Logo.BackgroundColor3 = Color3.fromRGB(35, 30, 45)
Logo.Text = "N"
Logo.TextColor3 = Color3.fromRGB(255, 40, 40)
Logo.TextSize = 26
Logo.Font = Enum.Font.GothamBold
Instance.new("UICorner", Logo).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", Logo).Color = Color3.fromRGB(150, 40, 255)

coroutine.wrap(function()
	while task.wait(2) do
		TweenService:Create(Logo, TweenInfo.new(2), {TextColor3 = Color3.fromRGB(160, 30, 240)}):Play()
		task.wait(2)
		TweenService:Create(Logo, TweenInfo.new(2), {TextColor3 = Color3.fromRGB(255, 40, 40)}):Play()
	end
end)()

-- TITLE
local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(0, 150, 0, 22)
Title.Position = UDim2.new(0, 66, 0, 8)
Title.BackgroundTransparency = 1
Title.Text = "Pyrovex"
Title.TextColor3 = Color3.fromRGB(245, 245, 245)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold

local Subtitle = Instance.new("TextLabel", TopBar)
Subtitle.Size = UDim2.new(0, 150, 0, 15)
Subtitle.Position = UDim2.new(0, 66, 0, 28)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "By kingflame"
Subtitle.TextColor3 = Color3.fromRGB(160, 150, 175)
Subtitle.TextSize = 12
Subtitle.Font = Enum.Font.GothamMedium

-- CLOSE BUTTON
local CloseButton = Instance.new("TextButton", TopBar)
CloseButton.Size = UDim2.new(0, 32, 0, 32)
CloseButton.Position = UDim2.new(1, -42, 0, 12)
CloseButton.BackgroundColor3 = Color3.fromRGB(45, 20, 25)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 75, 75)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
CloseButton.AutoButtonColor = false
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 8)

-- MINIMIZE BUTTON
local MinimizeButton = Instance.new("TextButton", TopBar)
MinimizeButton.Size = UDim2.new(0, 32, 0, 32)
MinimizeButton.Position = UDim2.new(1, -82, 0, 12)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(180, 150, 255)
MinimizeButton.TextSize = 18
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.AutoButtonColor = false
Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 8)

-- MINIMIZED BUTTON
local MinGui = Instance.new("TextButton")
MinGui.Size = UDim2.new(0, 55, 0, 55)
MinGui.Position = UDim2.new(0.05, 0, 0.4, 0)
MinGui.BackgroundColor3 = Color3.fromRGB(22, 20, 30)
MinGui.Text = "N"
MinGui.TextColor3 = Color3.fromRGB(255, 50, 50)
MinGui.TextSize = 30
MinGui.Font = Enum.Font.GothamBold
MinGui.Visible = false
MinGui.Active = true
MinGui.Draggable = true
MinGui.AutoButtonColor = false
MinGui.Parent = ScreenGui
Instance.new("UICorner", MinGui).CornerRadius = UDim.new(0, 14)
Instance.new("UIStroke", MinGui).Color = Color3.fromRGB(130, 40, 240)

-- CONTENT
local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, 0, 1, -55)
ContentFrame.Position = UDim2.new(0, 0, 0, 55)
ContentFrame.BackgroundTransparency = 1

local FeatureLabel = Instance.new("TextLabel", ContentFrame)
FeatureLabel.Size = UDim2.new(0, 300, 0, 40)
FeatureLabel.Position = UDim2.new(0, 25, 0, 10)
FeatureLabel.BackgroundTransparency = 1
FeatureLabel.Text = "Master Players & NPC ESP"
FeatureLabel.TextColor3 = Color3.fromRGB(220, 215, 230)
FeatureLabel.TextSize = 15
FeatureLabel.Font = Enum.Font.GothamBold

-- TOGGLE
local ToggleButton = Instance.new("TextButton", ContentFrame)
ToggleButton.Size = UDim2.new(0, 65, 0, 32)
ToggleButton.Position = UDim2.new(1, -90, 0, 49)
ToggleButton.BackgroundColor3 = Color3.fromRGB(130, 35, 45)
ToggleButton.Text = ""
ToggleButton.AutoButtonColor = false
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", ToggleButton).Thickness = 1.5

local ToggleCircle = Instance.new("Frame", ToggleButton)
ToggleCircle.Size = UDim2.new(0, 26, 0, 26)
ToggleCircle.Position = UDim2.new(0, 3, 0, 3)
ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", ToggleCircle).CornerRadius = UDim.new(1, 0)

-- HOVER
local function setupHover(btn, enterBg, leaveBg)
	btn.MouseEnter:Connect(function() TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = enterBg}):Play() end)
	btn.MouseLeave:Connect(function() TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = leaveBg}):Play() end)
end
setupHover(CloseButton, Color3.fromRGB(200, 40, 50), Color3.fromRGB(45, 20, 25))
setupHover(MinimizeButton, Color3.fromRGB(60, 50, 90), Color3.fromRGB(35, 35, 45))
setupHover(MinGui, Color3.fromRGB(40, 25, 70), Color3.fromRGB(22, 20, 30))

-- ESP LOGIC
local function getMyAttachment()
	local char = LocalPlayer.Character
	if not char then return end
	local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso")
	if not root then return end
	local att = root:FindFirstChild("PyrovexOrigin") or Instance.new("Attachment", root)
	att.Name = "PyrovexOrigin"
	return att
end

local function applyEffects(model, color)
	if not model then return end
	local hl = model:FindFirstChild("PyrovexHighlight") or Instance.new("Highlight", model)
	hl.Name = "PyrovexHighlight"
	hl.FillColor = color
	hl.OutlineColor = Color3.new(1,1,1)
	hl.FillTransparency = 0.35
	hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	hl.Adornee = model
	if not table.find(ESP_Storage, hl) then table.insert(ESP_Storage, hl) end

	local part = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("UpperTorso")
	local myAtt = getMyAttachment()
	if part and myAtt then
		local tAtt = part:FindFirstChild("PyrovexTarget") or Instance.new("Attachment", part)
		tAtt.Name = "PyrovexTarget"
		if not table.find(ESP_Storage, tAtt) then table.insert(ESP_Storage, tAtt) end

		local beam = part:FindFirstChild("PyrovexTracer") or Instance.new("Beam", part)
		beam.Name = "PyrovexTracer"
		beam.Width0, beam.Width1 = 0.75, 0.75
		beam.LightEmission = 0.8
		beam.Attachment0 = myAtt
		beam.Attachment1 = tAtt
		beam.Color = ColorSequence.new(color)
		if not table.find(ESP_Storage, beam) then table.insert(ESP_Storage, beam) end
	end
end

local function clearESP()
	for _, v in pairs(ESP_Storage) do if v then pcall(function() v:Destroy() end) end end
	table.clear(ESP_Storage)
end

-- ESP LOOP
RunService.RenderStepped:Connect(function()
	if not ESP_ENABLED then return end
	local tracked = {}
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and p.Character then
			tracked[p.Character] = true
			applyEffects(p.Character, Color3.fromRGB(0,130,255))
		end
	end
	for _, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and not tracked[v] and v ~= LocalPlayer.Character then
			applyEffects(v, Color3.fromRGB(255,30,30))
		end
	end
end)

-- TOGGLE CLICK
ToggleButton.MouseButton1Click:Connect(function()
	ESP_ENABLED = not ESP_ENABLED
	local pos = ESP_ENABLED and UDim2.new(0,36,0,3) or UDim2.new(0,3,0,3)
	local col = ESP_ENABLED and Color3.fromRGB(120,30,210) or Color3.fromRGB(130,35,45)
	TweenService:Create(ToggleCircle, TweenInfo.new(0.18), {Position = pos}):Play()
	TweenService:Create(ToggleButton, TweenInfo.new(0.18), {BackgroundColor3 = col}):Play()
	if not ESP_ENABLED then clearESP() end
end)

-- ✅ MINIMIZE — SIMPLEST POSSIBLE
MinimizeButton.MouseButton1Click:Connect(function()
	if isMinimized then return end
	isMinimized = true
	MainFrame.Visible = false
	MinGui.Visible = true
end)

MinGui.MouseButton1Click:Connect(function()
	if not isMinimized then return end
	isMinimized = false
	MinGui.Visible = false
	MainFrame.Visible = true
end)

-- CLOSE
CloseButton.MouseButton1Click:Connect(function()
	ESP_ENABLED = false
	clearESP()
	ScreenGui:Destroy()
end)

print("✅ LOADED!")
