if game.CoreGui:FindFirstChild "FluxBreakMain" then
	game.CoreGui:FindFirstChild "FluxBreakMain":Remove()
end
local function GetPlayerFromString(s)
	s = s:lower() -- Remove this if you want case sensitivity
	for _, player in ipairs(game.Players:GetPlayers()) do
		if s == player.Name:lower():sub(1, #s) then
			return player.Name
		end
	end
	return nil
end

local lp = game.Players.LocalPlayer
local char = lp.Character
local LName = lp.Name
local PS = game:GetService("Players")
local function NoArms(HIT)
	local PLR = game.Workspace:FindFirstChild(HIT)
	local ohNumber1 = 102
	local ohInstance2 = char["Right Arm"]
	local ohCFrame3 = CFrame.new(0,0,0)
	local ohNumber4 = 0
	local ohInstance5 = char["Torso"].voiceline
	local ohInstance6 = PLR.Humanoid
	local ohBoolean7 = false
	local ohNil8 = nil
	local ohBoolean9 = false
	local ohBoolean10 = true

	game:GetService("ReplicatedStorage").Logic.hitbox:InvokeServer(ohNumber1, ohInstance2, ohCFrame3, ohNumber4, ohInstance5, ohInstance6, ohBoolean7, ohNil8, ohBoolean9, ohBoolean10)
end

local function SetFire(HIT)
	local PLR = game.Workspace:FindFirstChild(HIT)
	local ohNumber1 = 104
	local ohInstance2 = PLR.Torso
	local ohCFrame3 = CFrame.new(0, 0, 0)
	local ohNumber4 = 0
	local ohInstance5 = char.Torso.voiceline
	local ohInstance6 = PLR.Humanoid
	local ohBoolean7 = false

	game:GetService("ReplicatedStorage").Logic.hitbox:InvokeServer(ohNumber1, ohInstance2, ohCFrame3, ohNumber4, ohInstance5, ohInstance6, ohBoolean7)
	game:GetService("ReplicatedStorage").Logic.hitbox:InvokeServer(ohNumber1, ohInstance2, ohCFrame3, ohNumber4, ohInstance5, ohInstance6, ohBoolean7)
	game:GetService("ReplicatedStorage").Logic.hitbox:InvokeServer(ohNumber1, ohInstance2, ohCFrame3, ohNumber4, ohInstance5, ohInstance6, ohBoolean7)

end
local function Freeze(HIT, VAMP) -- Vamp's or White Album's
	local PLR = game.Workspace:FindFirstChild(HIT)
	local ohNumber1
	if VAMP then ohNumber1 = 5 else ohNumber1 = 89 end
	local ohInstance2 = char["Right Arm"]
	local ohCFrame3 = CFrame.new(0,0,0)
	local ohNumber4 = 0
	local ohInstance5 = char.Torso.voiceline
	local ohInstance6 = PLR.Humanoid
	local ohBoolean7 = false
	local ohInstance8 = PLR.HumanoidRootPart
	local ohBoolean9 = false
	local ohBoolean10 = false
	local ohBoolean11 = false

	game:GetService("ReplicatedStorage").Logic.hitbox:InvokeServer(ohNumber1, ohInstance2, ohCFrame3, ohNumber4, ohInstance5, ohInstance6, ohBoolean7, ohInstance8, ohBoolean9, ohBoolean10, ohBoolean11)
end
local function Decap(HIT, STICKY)
	HIT = game.Workspace:FindFirstChild(HIT)
	local ohNumber1 
	if STICKY then ohNumber1 = 101 else ohNumber1 = 109 end
	local ohInstance2 = char["Right Arm"]
	local ohCFrame3 = CFrame.new(0,0,0)
	local ohNumber4 = 0
	local ohInstance5 = char.Torso.voiceline
	local ohInstance6 = HIT.Humanoid
	local ohBoolean7 = true
	local ohNil8 = nil
	local ohBoolean9 = false
	local ohBoolean10 = false
	local ohNumber11 = 0

	game:GetService("ReplicatedStorage").Logic.hitbox:InvokeServer(ohNumber1, ohInstance2, ohCFrame3, ohNumber4, ohInstance5, ohInstance6, ohBoolean7, ohNil8, ohBoolean9, ohBoolean10, ohNumber11)
end
local function Annoy(HIT)
	HIT = game.Workspace:FindFirstChild(HIT)
	game.ReplicatedStorage.Logic.hitbox:InvokeServer(97, char["Head"], CFrame.new(nil, nil, nil), 0, char.Torso.voiceline, HIT.Humanoid, false, false, false)
end
local L = loadstring(game:HttpGet("https://raw.githubusercontent.com/CreativeHell/public-scripts/master/uilib.lua"))()
local W = L:CreateWindow({text = "lil trolling"})
local T = L:CreateWindow({text = "Other"})
T:AddLabel("All for every player")
T:AddBox(
	"Target",
	function(P)
		if string.lower(P.Text) ~= "all" then
			_G.TARGET = GetPlayerFromString(P.Text)
			wait()
			P.Text = _G.TARGET
			warn(_G.TARGET)
		elseif string.lower(P.Text) == "all" then
			_G.TARGET = "all"
			wait()
			--P.Text = _G.TARGET
		end
	end
)
_G.TIME = 0
T:AddBox(
	"Wait time(0)",
	function(T)
		if tonumber(T.Text) ~= nil or tonumber(T.Text) ~= "nil" then
			_G.TIME = tonumber(T.Text)
		else
			T.Text = "input a number"
		end
	end
)
W:AddToggle(
	"Set On Fire",
	function(on)
		if on then _G.FIRE = true else _G.FIRE = false end
		while _G.FIRE do
			if _G.TARGET ~= "all" then
				SetFire(_G.TARGET)
			else
				for i,v in pairs(PS:GetPlayers()) do
					if v.Name ~= LName then
						SetFire(v.Name)	
					end
				end
			end
			wait(_G.TIME)
		end


	end
)

W:AddToggle(
	"Freeze",
	function(on)
		if on then _G.ICE = true else _G.ICE = false end

		while _G.ICE do
			if _G.TARGET ~= "all" then
				Freeze(_G.TARGET, false)
			else

				for i,v in pairs(PS:GetPlayers()) do
					if v.Name ~= LName then
						Freeze(v.Name, false)	
					end
				end
			end
			wait(_G.TIME)
		end
	end
)

W:AddToggle(
	"Freeze v2",
	function(on)
		if on then _G.ICE = true else _G.ICE = false end
		while _G.ICE do


			if _G.TARGET ~= "all" then
				Freeze(_G.TARGET, true)
			else

				for i,v in pairs(PS:GetPlayers()) do
					if v.Name ~= LName then
						Freeze(v.Name, true)	
					end
				end
			end
			wait(_G.TIME)
		end
	end
)


W:AddToggle(
	"Decapatation",
	function(on)
		if on then _G.DECAP = true else _G.DECAP = false end
		while _G.DECAP do
			if _G.TARGET ~= "all" then
				Decap(_G.TARGET, false)
			else

				for i,v in pairs(PS:GetPlayers()) do
					if v.Name ~= LName then
						Decap(v.Name, false)	
					end
				end
			end
			wait(_G.TIME)
		end
	end
)
W:AddToggle(
	"Decapatation v2",
	function(on)
		if on then _G.DECAP = true else _G.DECAP = false end
		while _G.DECAP do
			if _G.TARGET ~= "all" then
				Decap(_G.TARGET, true)
			else

				for i,v in pairs(PS:GetPlayers()) do
					if v.Name ~= LName then
						Decap(v.Name, true)	
					end
				end
			end
			wait(_G.TIME)
		end
	end
)
W:AddToggle(
	"Annoy",
	function(on)
		if on then _G.ANNOY = true else _G.ANNOY = false end

		while _G.ANNOY do
			if _G.TARGET ~= "all" then
				Annoy(_G.TARGET)
			else

				for i,v in pairs(PS:GetPlayers()) do
					if v.Name ~= LName then
						Annoy(v.Name)	
					end
				end
			end
			wait(_G.TIME)
		end
	end
)

W:AddToggle(
	"Remove Arms",
	function(on)
		if on then _G.ARMS = true else _G.ARMS = false end

		while _G.ARMS do
			if _G.TARGET ~= "all" then
				NoArms(_G.TARGET)
			else

				for i,v in pairs(PS:GetPlayers()) do
					if v.Name ~= LName then
						NoArms(v.Name)	
					end
				end
			end
			wait(_G.TIME)
		end
	end
)

local LO = L:CreateWindow({text = "player"})
local function heal()
	local ohNumber1 = 7
	local ohInstance2 = char["Left Arm"]
	local ohCFrame3 = CFrame.new(1376.64026, 875.622192, -501.712738, -0.986103654, 0.136393815, 0.0948510915, -0.0762482062, 0.135684729, -0.987813711, -0.147601441, -0.981318891, -0.123399384)
	local ohNumber4 = 420
	local ohInstance5 = char.Torso.voiceline
	local ohInstance6 = char.Humanoid
	local ohBoolean7 = false
	local ohNil8 = nil
	local ohBoolean9 = false
	local ohBoolean10 = false
	game:GetService("ReplicatedStorage").Logic.hitbox:InvokeServer(ohNumber1, ohInstance2, ohCFrame3, ohNumber4, ohInstance5, ohInstance6, ohBoolean7, ohNil8, ohBoolean9, ohBoolean10)

end


LO:AddToggle(
	"Loop Heal",
	function (on)
		if on then _G.LOCALHEAL = true else _G.LOCALHEAL = false end
		while _G.LOCALHEAL do
			wait(0.1)
			heal()
		end
	end
)

LO:AddButton(
	"Anti-TS",
	function()
		
		game:GetService("Workspace").timestopped.Changed:Connect(function(NV)
			if NV == true then
				game.Workspace.timestopped.Value = false
			end
		end)

		game:GetService("Workspace").globaltimestopped.Changed:Connect(function(NV)
			if NV == true then
				game.Workspace.globaltimestopped.Value = false
			end
			
		end)
	end
)


LO:AddBox(
	"Change Strength & Special",
	function(T)
		if tonumber(T.Text) ~= nil or tonumber(T.Text) ~= "nil" then
			lp.Power.Value = tonumber(T.Text)
			lp.Special.Value = tonumber(T.Text)
		end
	end
)
