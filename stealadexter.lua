local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LexterHubUnavailable"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 450, 0, 220)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = frame

local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Position = UDim2.new(0.5, 4, 0.5, 4)
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.ZIndex = 0
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 20, 0, 10)
title.BackgroundTransparency = 1
title.Text = "LexterHub Notice"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local message = Instance.new("TextLabel")
message.Size = UDim2.new(1, -40, 1, -80)
message.Position = UDim2.new(0, 20, 0, 50)
message.BackgroundTransparency = 1
message.TextWrapped = true
message.Text = "LexterHub is temporarily unavailable due to backend changes.\nLexterHub will be back soon."
message.Font = Enum.Font.Gotham
message.TextColor3 = Color3.fromRGB(220, 220, 220)
message.TextSize = 20
message.TextYAlignment = Enum.TextYAlignment.Top
message.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.BackgroundTransparency = 0.2
closeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

closeButton.MouseEnter:Connect(function()
	TweenService:Create(closeButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(200, 50, 50)}):Play()
end)

closeButton.MouseLeave:Connect(function()
	TweenService:Create(closeButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
end)

closeButton.MouseButton1Click:Connect(function()
	local fadeOut = TweenService:Create(frame, TweenInfo.new(0.4), {BackgroundTransparency = 1})
	fadeOut:Play()
	fadeOut.Completed:Wait()
	screenGui:Destroy()
end)

frame.BackgroundTransparency = 1
title.TextTransparency = 1
message.TextTransparency = 1
closeButton.BackgroundTransparency = 1
closeButton.TextTransparency = 1

TweenService:Create(frame, TweenInfo.new(0.4), {BackgroundTransparency = 0.2}):Play()
TweenService:Create(title, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
TweenService:Create(message, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
TweenService:Create(closeButton, TweenInfo.new(0.4), {BackgroundTransparency = 0.2, TextTransparency = 0}):Play()
