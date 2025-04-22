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
	g.IgnoreGuiInset = true
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
	gui.IgnoreGuiInset = true
	gui.Parent = playerGui

	local ts = game:GetService("TweenService")

	local soundId = "rbxassetid://9118823105"

	spawn(function()
		for i = 1, 2 do
			local sound = Instance.new("Sound")
			sound.SoundId = soundId
			sound.Volume = 5
			sound.Looped = false
			sound.Parent = gui
			sound:Play()
			wait(3.5)
		end
	end)

	for _ = 1, 100 do
		local f = Instance.new("Frame")
		f.Size = UDim2.new(math.random(2, 4), 0, math.random(2, 4), 0)
		f.Position = UDim2.new(math.random(), 0, math.random(), 0)
		f.BackgroundColor3 = Color3.fromRGB(math.random(100, 255), math.random(100, 255), math.random(100, 255))
		f.BorderSizePixel = 0
		f.BackgroundTransparency = 0.2
		f.Rotation = math.random(-360, 360)
		f.ZIndex = math.random(5, 20)
		f.Parent = gui

		local tween = ts:Create(f, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
			Position = UDim2.new(math.random(), 0, math.random(), 0),
			Rotation = math.random(-720, 720),
		})
		tween:Play()
	end

	for _ = 1, 50 do
		local txt = Instance.new("TextLabel")
		txt.Size = UDim2.new(0, math.random(300, 500), 0, math.random(50, 100))
		txt.Position = UDim2.new(math.random(), 0, math.random(), 0)
		txt.BackgroundTransparency = 1
		txt.Text = "!!!"
		txt.TextSize = math.random(60, 120)
		txt.TextColor3 = Color3.fromRGB(math.random(100, 255), math.random(100, 255), math.random(100, 255))
		txt.Font = Enum.Font.Arcade
		txt.Rotation = math.random(-180, 180)
		txt.ZIndex = 20
		txt.Parent = gui
	end

	spawn(function()
		for _ = 1, 150 do
			gui.BackgroundColor3 = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
			gui.BackgroundTransparency = 0.1
			wait(0.02)
			gui.BackgroundTransparency = 0.5
			wait(0.02)
		end
	end)

	wait(10)
	gui:Destroy()
end

for _ = 1, repeatCount do
	playMer()
	wait(delayBetween)
	neuroStorm()
	wait(1)
end
