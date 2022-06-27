if game.CoreGui:FindFirstChild "FluxBreakMain" then game.CoreGui:FindFirstChild "FluxBreakMain":Remove() end
local Dialouge = game.Players.LocalPlayer.PlayerGui.Dialogue.MainFrame.DialogueText; Dialouge.Text = "wad"
local gm = game.Players.LocalPlayer.PlayerGui:FindFirstChild("GlobalMessage"); gm.TextLabel.Text = ""; gm.TextLabel.Visible = true
local A = game:GetService("Workspace").Map.dungeonThingIdk.BoardA
local B = game:GetService("Workspace").Map.dungeonThingIdk.BoardB
local C = game:GetService("Workspace").Map.dungeonThingIdk.BoardC
local key = game:GetService("Workspace").Map.dungeonThingIdk.touchLegend
local bricks = game:GetService("Workspace").Map.dungeonThingIdk.touchBricks 
local char = game.Players.LocalPlayer.Character
local L = loadstring(game:HttpGet("https://raw.githubusercontent.com/CreativeHell/public-scripts/master/uilib.lua"))()
local f = L:CreateWindow({text='them fightin herds'})
local function notification(text) game:GetService("StarterGui"):SetCore("SendNotification", {Title = "yo", Text = text}) end

f:AddButton(
    "Board A",
    function(z)
        fireclickdetector(A.ClickDetector)
    end
)

f:AddButton(
    "Board B",
    function(z)
        fireclickdetector(B.ClickDetector)
    end
)

f:AddButton(
    "Board C",
    function(z)
        fireclickdetector(C.ClickDetector)
    end
)

f:AddButton(
    "Complete boards",
    function(ihateyouloooo)
        
        local function place(tbl)
            function trim(s)
               return (s:gsub("^%s*(.-)%s*$", "%1"))
            end
            local final = {
            [1]='',
            [2]='',
            [3]='',
            }
            for i,v in pairs(tbl) do
                if string.match(v,"...<i>") and string.match(v,"</i>...") then
                    v = v:gsub("<[^<>]->", "")
                    v = v:sub(1,-4)
                    v = v:sub(4)
                    v = trim(v); v= trim(v)
                    final[2] = v
                elseif (not string.match(v,"...<i>")) and string.match(v,"</i>...") then
                    v = v:gsub("<[^<>]->", "")
                    v = v:gsub("[...]", "")
                    v = trim(v)
                    final[1] = v
                elseif string.match(v,"...<i>") and (not string.match(v,"</i>..."))then
                    v = v:gsub("<[^<>]->", "")
                    v = v:sub(4)
                    v = trim(v)
                    final[3] = v
                end
            end
            
            return final
        end

        local all = {}
        gm.TextLabel.Text = "Waiting for Board A"
        repeat wait() until Dialouge.Text ~= "wad"
        table.insert(all, Dialouge.Text)
        Dialouge.Text = "wad"
        gm.TextLabel.Text = ""
        wait()
        gm.TextLabel.Text = "Waiting for Board B"
        repeat wait() until Dialouge.Text ~= "wad"
        table.insert(all, Dialouge.Text)
        Dialouge.Text = "wad"
        gm.TextLabel.Text = ""
        wait()
        gm.TextLabel.Text = "Waiting for Board C"
        repeat wait() until Dialouge.Text ~= "wad"
        table.insert(all, Dialouge.Text)
        Dialouge.Text = "wad"
        gm.TextLabel.Text = ""
        wait()

        j = ""
        for i,v in pairs(place(all)) do
            j = j .. " ".. v
        end
        setclipboard(j)
    end

)

f:AddButton(
    "Color Correct Pads",
    function(AINFASFD)
        for i,v in pairs(key:GetChildren()) do
            
            if v.Name == "1" and v.BrickColor == BrickColor.New("Royal purple") then
                bricks[v.Name].BrickColor = BrickColor.New("Lime green")
            elseif v.BrickColor == BrickColor.New("Pink") then
                bricks[v.Name].BrickColor = BrickColor.New("Lime green")
            else
                continue
            end
            --char.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
        end

    end
)

f:AddButton(
    "Attempt Solve Pads",
    function(why)
        for i,v in pairs(key:GetChildren()) do
            if v.Name == "1" and v.BrickColor == BrickColor.New("Royal purple") then
                char.Humanoid:ChangeState(3)
                wait(0.1)
                char.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                firetouchinterest(char.HumanoidRootPart, bricks:FindFirstChild(v.Name), 0)
                wait()
                firetouchinterest(char.HumanoidRootPart, bricks:FindFirstChild(v.Name), 1)
                wait()
            elseif v.BrickColor == BrickColor.New("Pink") then
                char.Humanoid:ChangeState(3)
                wait(0.1)
                char.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                firetouchinterest(char.HumanoidRootPart, bricks:FindFirstChild(v.Name), 0)
                wait()
                firetouchinterest(char.HumanoidRootPart, bricks:FindFirstChild(v.Name), 1)
                wait()
            else
                continue
            end
            wait(0.5)
            --char.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
        end        
 
    end
    
)

f:AddButton(
    "Bring Cattacombs Door",
    function(z)
        local j = game:GetService("Workspace").Map.DOORS.HitboxDoor
        local me = game:GetService("Workspace").Alive[game.Players.LocalPlayer.Name]
        
        j.CFrame = (me.Torso.CFrame + Vector3.new(5,0,0)) 
    end
)

f:AddButton(
    "Start Crock Captcha",
    function(UDNFGDJHG)
        local j = game:GetService("Workspace")["The Eagle"]
        fireclickdetector(j.ClickDetector)
    end
)
