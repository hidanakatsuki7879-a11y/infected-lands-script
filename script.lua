-- ====================================================================
-- CRIMSON MOBILE INTERFACE (COMPLETE VERSION)
-- ==================================================================== 

local CoreGui = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService") 

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InfectedLandsControlGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui 

-- ============================================================
-- CRIMSON THEME CONFIG
-- ============================================================
local CRIMSON = Color3.fromRGB(220, 20, 60)
local DARK_CRIMSON = Color3.fromRGB(120, 8, 30)
local DEEP_RED = Color3.fromRGB(80, 5, 18)
local BLACK = Color3.fromRGB(8, 8, 10)
local DARK = Color3.fromRGB(15, 15, 18)
local PANEL = Color3.fromRGB(20, 20, 24)
local WHITE = Color3.fromRGB(255, 255, 255)
local LIGHT_TEXT = Color3.fromRGB(220, 220, 225)
local MUTED = Color3.fromRGB(145, 145, 155) 

shared.CrimsonConfig = shared.CrimsonConfig or {
WeaponESP = false,
LootESP = false,
GPSTracking = false
} 

-- ============================================================
-- MAIN TOGGLE BUTTON
-- ============================================================
local mainToggleBtn = Instance.new("TextButton")
mainToggleBtn.Name = "CrimsonToggle"
mainToggleBtn.Size = UDim2.new(0, 55, 0, 55)
mainToggleBtn.Position = UDim2.new(1, -75, 0.25, 0)
mainToggleBtn.BackgroundColor3 = BLACK
mainToggleBtn.Text = "☰"
mainToggleBtn.TextSize = 25
mainToggleBtn.TextColor3 = CRIMSON
mainToggleBtn.Font = Enum.Font.SourceSansBold
mainToggleBtn.ZIndex = 20
mainToggleBtn.Parent = screenGui 

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 14)
btnCorner.Parent = mainToggleBtn 

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = CRIMSON
btnStroke.Thickness = 2
btnStroke.Parent = mainToggleBtn 

-- ============================================================
-- MAIN FRAME
-- ============================================================
local menuFrame = Instance.new("Frame")
menuFrame.Name = "CrimsonPanel"
menuFrame.Size = UDim2.new(0, 330, 0, 330)
menuFrame.Position = UDim2.new(0.5, -165, 0.5, -165)
menuFrame.BackgroundColor3 = BLACK
menuFrame.Visible = false
menuFrame.ClipsDescendants = true
menuFrame.Parent = screenGui 

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 12)
menuCorner.Parent = menuFrame 

local menuStroke = Instance.new("UIStroke")
menuStroke.Color = CRIMSON
menuStroke.Thickness = 2
menuStroke.Parent = menuFrame 

mainToggleBtn.MouseButton1Click:Connect(function()
menuFrame.Visible = not menuFrame.Visible
end) 

-- ============================================================
-- HEADER & CLOSE
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 70)
header.BackgroundColor3 = DEEP_RED
header.Parent = menuFrame 

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -55, 0, 32)
title.Position = UDim2.new(0, 16, 0, 7)
title.BackgroundTransparency = 1
title.Text = "INFECTED LANDS"
title.TextColor3 = WHITE
title.Font = Enum.Font.SourceSansBold
title.TextSize = 21
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header 

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -55, 0, 20)
subtitle.Position = UDim2.new(0, 17, 0, 38)
subtitle.BackgroundTransparency = 1
subtitle.Text = "CRIMSON CONTROL PANEL"
subtitle.TextColor3 = CRIMSON
subtitle.Font = Enum.Font.SourceSansBold
subtitle.TextSize = 11
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = header 

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -43, 0, 10)
closeBtn.BackgroundColor3 = DARK_CRIMSON
closeBtn.Text = "×"
closeBtn.TextColor3 = WHITE
closeBtn.TextSize = 25
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header 

closeBtn.MouseButton1Click:Connect(function()
menuFrame.Visible = false
end) 

-- ============================================================
-- STATUS BAR
-- ============================================================
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -30, 0, 28)
status.Position = UDim2.new(0, 15, 0, 82)
status.BackgroundColor3 = PANEL
status.Text = "●  INFECTED LANDS  |  ENGINE READY"
status.TextColor3 = LIGHT_TEXT
status.Font = Enum.Font.SourceSans
status.TextSize = 11
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = menuFrame 

-- ============================================================
-- CONTAINER & OPTIONS CREATOR
-- ============================================================
local itemContainer = Instance.new("Frame")
itemContainer.Size = UDim2.new(1, -30, 0, 195)
itemContainer.Position = UDim2.new(0, 15, 0, 120)
itemContainer.BackgroundTransparency = 1
itemContainer.Parent = menuFrame 

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 8)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = itemContainer 

local function createToggleOption(text, globalVarName, sortOrder)
local optionFrame = Instance.new("Frame")
optionFrame.Size = UDim2.new(1, 0, 0, 56)
optionFrame.BackgroundColor3 = PANEL
optionFrame.LayoutOrder = sortOrder
optionFrame.Parent = itemContainer 

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -90, 0, 25)
label.Position = UDim2.new(0, 14, 0, 6)
label.BackgroundTransparency = 1
label.Text = text
label.TextColor3 = WHITE
label.Font = Enum.Font.SourceSansBold
label.TextSize = 13
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = optionFrame

local description = Instance.new("TextLabel")
description.Size = UDim2.new(1, -90, 0, 18)
description.Position = UDim2.new(0, 14, 0, 29)
description.BackgroundTransparency = 1
description.TextColor3 = MUTED
description.Font = Enum.Font.SourceSans
description.TextSize = 10
description.TextXAlignment = Enum.TextXAlignment.Left
description.Parent = optionFrame

if globalVarName == "WeaponESP" then description.Text = "Show weapon pickups"
elseif globalVarName == "LootESP" then description.Text = "Show supplies and loot"
elseif globalVarName == "GPSTracking" then description.Text = "Show distance tracking" end

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 55, 0, 28)
toggle.Position = UDim2.new(1, -65, 0.5, -14)
toggle.BackgroundColor3 = DARK
toggle.Text = "OFF"
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 12
toggle.TextColor3 = MUTED
toggle.Parent = optionFrame

local function updateToggleVisuals(enabled)
if enabled then
toggle.Text = "ON"
toggle.TextColor3 = WHITE
TweenService:Create(toggle, TweenInfo.new(0.2), {BackgroundColor3 = CRIMSON}):Play()
else
toggle.Text = "OFF"
toggle.TextColor3 = MUTED
TweenService:Create(toggle, TweenInfo.new(0.2), {BackgroundColor3 = DARK}):Play()
end
end

toggle.MouseButton1Click:Connect(function()
shared.CrimsonConfig[globalVarName] = not shared.CrimsonConfig[globalVarName]
updateToggleVisuals(shared.CrimsonConfig[globalVarName])
end)

updateToggleVisuals(shared.CrimsonConfig[globalVarName])

end 

createToggleOption("Weapon ESP", "WeaponESP", 1)
createToggleOption("Loot ESP", "LootESP", 2)
createToggleOption("GPS Tracking", "GPSTracking", 3)
