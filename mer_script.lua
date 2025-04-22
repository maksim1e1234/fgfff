local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local imageId = "rbxassetid://93669941436109"
local soundId = "rbxassetid://128037871574654"
local repeatCount = 3
local delayBeforeStart = 5
local delayBetween = 10

wait(delayBeforeStart)

local function playMer()
	local g = Instance.new("ScreenGui")
	g.ResetOnSpawn = false
	g.Parent = playerGui

	local i = Instance.new("ImageLabel")
	i.Size = UDim2.new(1, 0, 1, 0)
	i.Position = UDim2.new(0, 0, 0, 0)
	i.BackgroundTransparency = 1
	i.Image = imageId
	i.Parent = g

	local s = Instance.new("Sound")
	s.SoundId = soundId
	s.Volume = 100
	s.Parent = playerGui
	s:Play()

	wait(2)
	g:Destroy()
end

local function neuroStorm()
	local gui = Instance.new("ScreenGui")
	gui.ResetOnSpawn = false
	gui.Parent = playerGui

	for _ = 1, 20 do
		local f = Instance.new("Frame")
		f.Size = UDim2.new(math.random(), 0, math.random(), 0)
		f.Position = UDim2.new(math.random(), 0, math.random(), 0)
		f.BackgroundColor3 = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
		f.BorderSizePixel = 0
		f.BackgroundTransparency = math.random()
		f.Parent = gui

		local rotTween = game:GetService("TweenService"):Create(
			f,
			TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
			{ Rotation = math.random(-180, 180) }
		)
		rotTween:Play()
	end

	for _ = 1, 10 do
		local txt = Instance.new("TextLabel")
		txt.Size = UDim2.new(0, 300, 0, 100)
		txt.Position = UDim2.new(math.random(), 0, math.random(), 0)
		txt.BackgroundTransparency = 1
		txt.Text = "???"
		txt.TextSize = math.random(40, 80)
		txt.TextColor3 = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
		txt.Font = Enum.Font.Arcade
		txt.Rotation = math.random(-45, 45)
		txt.Parent = gui
	end

	wait(3)
	gui:Destroy()
end

for _ = 1, repeatCount do
	playMer()
	wait(delayBetween)
	neuroStorm()
	wait(1)
end
