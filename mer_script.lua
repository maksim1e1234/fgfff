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

local function visualBurst()
	local vbGui = Instance.new("ScreenGui")
	vbGui.ResetOnSpawn = false
	vbGui.Parent = playerGui

	for _ = 1, 10 do
		local t = Instance.new("TextLabel")
		t.Size = UDim2.new(0, math.random(50, 200), 0, math.random(50, 200))
		t.Position = UDim2.new(math.random(), 0, math.random(), 0)
		t.BackgroundTransparency = 1
		t.Text = "!!!"
		t.TextColor3 = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
		t.TextSize = math.random(20, 50)
		t.Font = Enum.Font.GothamBlack
		t.Parent = vbGui

		local ts = game:GetService("TweenService")
		local goal = { Position = UDim2.new(math.random(), 0, math.random(), 0) }
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
		ts:Create(t, ti, goal):Play()

		wait(0.1)
	end

	local f = Instance.new("Frame")
	f.Size = UDim2.new(1, 0, 1, 0)
	f.BackgroundColor3 = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
	f.BackgroundTransparency = 0.5
	f.Parent = vbGui

	wait(2)
	vbGui:Destroy()
end

for _ = 1, repeatCount do
	playMer()
	wait(delayBetween)
	visualBurst()
	wait(1)
end
