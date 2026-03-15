-- CONFIG
local SCRIPT_VERSION = "1.0"
local LIBRARY_ID = "quantum_library"
local CONFIG_FILE = "Quantum_Config.json"

-- SERVICES
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")


LoadMainScript()

-- ==========================================
-- MAIN SCRIPT
-- ==========================================

function LoadMainScript(initialOptions)
CreateStatsOverlay()

local script_running = true

-- SAFE LIBRARY LOAD
local library
local success, err = pcall(function()
    library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
end)

if not success then
    warn("Failed to load library:", err)
    return
end

getgenv()[LIBRARY_ID] = library

local window = library:CreateWindow(
{WindowName="Quantum Scripts | V"..SCRIPT_VERSION},
gethui()
)

local my_gui = gethui():GetChildren()[#gethui():GetChildren()]

local Options = initialOptions or {

-- AIM ASSIST
AimAssist = false,
FOVSize = 120,
FOVColor = {255,0,0},
AimMaxDistance = 300,

-- ESP
PlayerESP = false,
ESPDistance = 500,
ESPColor = {255,0,0}, -- default red
Friends = {},

-- MOVEMENT
Noclip = false,

WalkSpeed = false,
WalkSpeedValue = 16,

InfiniteJump = false,

JumpPowerEnabled = false,
JumpPower = 50,

Fly = false,
FlySpeed = 60,

-- HITBOX
Hitbox = false,
HitboxSize = 5,

-- PLAYER
ClickTeleport = false,
SelectedPlayer = nil,
Spectating = false,

-- SETTINGS
ToggleKeyName = "Insert"

}


-- ==========================================
-- TABS
-- ==========================================

local aim_tab = window:CreateTab("Aim Assist")
local movement_tab = window:CreateTab("Movement")
local hitbox_tab = window:CreateTab("Hitboxes")
local esp_tab = window:CreateTab("ESP")
local player_tab = window:CreateTab("Player")
local config_tab = window:CreateTab("Settings")

-- ==========================================
-- AIM ASSIST
-- ==========================================

local aim_sec = aim_tab:CreateSection("Aim Assist")

local Camera = workspace.CurrentCamera

-- CHECK IF HOLDING WEAPON

local function HoldingWeapon()

    local char = LocalPlayer.Character
    if not char then return false end

    return char:FindFirstChildOfClass("Tool") ~= nil
end

-- ==========================================
-- FOV CIRCLE
-- ==========================================

local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Thickness = 2
FOVCircle.Filled = false
FOVCircle.NumSides = 100
FOVCircle.Color = Color3.fromRGB(
    Options.FOVColor[1],
    Options.FOVColor[2],
    Options.FOVColor[3]
)

RunService.RenderStepped:Connect(function()

    local viewport = Camera.ViewportSize

    FOVCircle.Position = Vector2.new(
        viewport.X / 2,
        viewport.Y / 2
    )

    FOVCircle.Radius = Options.FOVSize

    FOVCircle.Color = Color3.fromRGB(
        Options.FOVColor[1],
        Options.FOVColor[2],
        Options.FOVColor[3]
    )

    FOVCircle.Visible = Options.AimAssist

end)

-- ==========================================
-- AIM TOGGLE
-- ==========================================

aim_sec:CreateToggle("Enable Aim Assist", Options.AimAssist, function(v)

    Options.AimAssist = v
    FOVCircle.Visible = v

end)

-- ==========================================
-- FOV SIZE
-- ==========================================

local fov_sec = aim_tab:CreateSection("FOV Size")

fov_sec:CreateButton("FOV +20", function()
    Options.FOVSize += 20
end)

fov_sec:CreateButton("FOV -20", function()
    Options.FOVSize = math.max(20, Options.FOVSize - 20)
end)

fov_sec:CreateButton("Reset FOV", function()
    Options.FOVSize = 120
end)

-- ==========================================
-- AIM DISTANCE
-- ==========================================

local dist_sec = aim_tab:CreateSection("Aim Distance")

dist_sec:CreateButton("Distance +50", function()
    Options.AimMaxDistance += 50
end)

dist_sec:CreateButton("Distance -50", function()
    Options.AimMaxDistance = math.max(50, Options.AimMaxDistance - 50)
end)

dist_sec:CreateButton("Reset Distance", function()
    Options.AimMaxDistance = 300
end)

-- ==========================================
-- FOV COLORS
-- ==========================================

local color_sec = aim_tab:CreateSection("FOV Color")

color_sec:CreateButton("Red FOV", function()
    Options.FOVColor = {255,0,0}
end)

color_sec:CreateButton("Green FOV", function()
    Options.FOVColor = {0,255,0}
end)

color_sec:CreateButton("White FOV", function()
    Options.FOVColor = {255,255,255}
end)

-- ==========================================
-- FIND CLOSEST TARGET
-- ==========================================

local function GetClosestPlayer()

    local closest = nil
    local shortest = Options.FOVSize

    local myChar = LocalPlayer.Character
    if not myChar then return nil end

    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    for _,plr in pairs(Players:GetPlayers()) do

    if plr ~= LocalPlayer
       and not Options.Friends[plr.Name] -- IGNORE FRIENDS
       and plr.Character
       and plr.Character:FindFirstChild("Head")
       and plr.Character:FindFirstChild("Humanoid")
       and plr.Character:FindFirstChild("HumanoidRootPart")
    and plr.Character.Humanoid.Health > 0 then

            local head = plr.Character.Head
            local root = plr.Character.HumanoidRootPart

            local distance = (myRoot.Position - root.Position).Magnitude

            -- distance limit
            if distance > Options.AimMaxDistance then
                continue
            end

            local pos, visible = Camera:WorldToViewportPoint(head.Position)

            if visible then

                local dist = (Vector2.new(pos.X,pos.Y) -
                    Vector2.new(
                        Camera.ViewportSize.X/2,
                        Camera.ViewportSize.Y/2
                    )).Magnitude

                if dist < shortest then
                    shortest = dist
                    closest = head
                end

            end

        end

    end

    return closest

end

-- ==========================================
-- AIM LOOP
-- ==========================================

RunService.RenderStepped:Connect(function()

    if not Options.AimAssist then return end
    if not HoldingWeapon() then return end

    local target = GetClosestPlayer()

    if target then

        Camera.CFrame = Camera.CFrame:Lerp(
            CFrame.new(Camera.CFrame.Position, target.Position),
            0.08
        )

    end

end)

-- ==========================================
-- MOVEMENT
-- ==========================================

local move_sec = movement_tab:CreateSection("Movement")
local walk_sec = movement_tab:CreateSection("WalkSpeed")
local jump_sec = movement_tab:CreateSection("Jump")
local fly_sec = movement_tab:CreateSection("Fly")

-- NOCLIP

move_sec:CreateToggle("Noclip",Options.Noclip,function(v)
Options.Noclip=v
end)

RunService.Stepped:Connect(function()

if LocalPlayer.Character and Options.Noclip then

for _,part in pairs(LocalPlayer.Character:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide=false
end
end

end

end)

-- WALKSPEED

walk_sec:CreateToggle("Enable WalkSpeed",Options.WalkSpeed,function(v)

Options.WalkSpeed=v

local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

if hum then
hum.WalkSpeed = v and Options.WalkSpeedValue or 16
end

end)

walk_sec:CreateButton("WalkSpeed +10",function()

Options.WalkSpeedValue += 10

local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

if hum and Options.WalkSpeed then
hum.WalkSpeed = Options.WalkSpeedValue
end

end)

walk_sec:CreateButton("Reset WalkSpeed",function()

Options.WalkSpeedValue = 16

local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
if hum then hum.WalkSpeed = 16 end

end)

-- JUMP

jump_sec:CreateToggle("Infinite Jump",Options.InfiniteJump,function(v)
Options.InfiniteJump=v
end)

jump_sec:CreateToggle("Enable JumpPower",Options.JumpPowerEnabled,function(v)

Options.JumpPowerEnabled=v

local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

if hum then
hum.JumpPower = v and Options.JumpPower or 50
end

end)

jump_sec:CreateButton("JumpPower +20",function()

Options.JumpPower += 20

local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

if hum then
hum.JumpPower = Options.JumpPower
end

end)

jump_sec:CreateButton("Reset JumpPower",function()

Options.JumpPower = 50

local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

if hum then
hum.JumpPower = 50
end

end)

UserInputService.JumpRequest:Connect(function()

if Options.InfiniteJump then

local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

if hum then
hum:ChangeState(Enum.HumanoidStateType.Jumping)
end

end

end)

-- ==========================================
-- FLY
-- ==========================================

local fly_velocity
local fly_attachment

fly_sec:CreateToggle("Enable Fly", Options.Fly, function(v)

    Options.Fly = v

    local char = LocalPlayer.Character
    if not char then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    if not v then

        if fly_velocity then
            fly_velocity:Destroy()
            fly_velocity = nil
        end

        if fly_attachment then
            fly_attachment:Destroy()
            fly_attachment = nil
        end

    end

end)

-- FLY SPEED SETTINGS

fly_sec:CreateButton("FlySpeed +20", function()
    Options.FlySpeed += 20
end)

fly_sec:CreateButton("FlySpeed -20", function()
    Options.FlySpeed = math.max(20, Options.FlySpeed - 20)
end)

fly_sec:CreateButton("Reset FlySpeed", function()
    Options.FlySpeed = 60
end)

-- FLY LOOP

RunService.RenderStepped:Connect(function()

    if not Options.Fly then return end

    local char = LocalPlayer.Character
    if not char then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    if not fly_attachment then

        fly_attachment = Instance.new("Attachment")
        fly_attachment.Parent = root

    end

    if not fly_velocity then

        fly_velocity = Instance.new("LinearVelocity")
        fly_velocity.Attachment0 = fly_attachment
        fly_velocity.MaxForce = 15000
        fly_velocity.RelativeTo = Enum.ActuatorRelativeTo.World
        fly_velocity.Parent = root

    end

    local cam = workspace.CurrentCamera
    local move = Vector3.zero

    -- FORWARD / BACK / SIDE

    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        move += cam.CFrame.LookVector
    end

    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        move -= cam.CFrame.LookVector
    end

    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        move -= cam.CFrame.RightVector
    end

    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        move += cam.CFrame.RightVector
    end

    -- UP

    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        move += Vector3.new(0,1,0)
    end

    -- DOWN

    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        move -= Vector3.new(0,1,0)
    end

    fly_velocity.VectorVelocity = move * Options.FlySpeed

end)


-- ==========================================
-- HITBOX
-- ==========================================

local hitbox_sec = hitbox_tab:CreateSection("Head Hitbox")

local DEFAULT_HEAD_SIZE = Vector3.new(2,1,1)

hitbox_sec:CreateToggle("Enable Hitbox", Options.Hitbox, function(v)

Options.Hitbox = v

if not v then
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            if head then
                head.Size = DEFAULT_HEAD_SIZE
                head.Transparency = 0
            end
        end
    end
end

end)

hitbox_sec:CreateButton("Hitbox +1", function()
Options.HitboxSize += 1
end)

hitbox_sec:CreateButton("Reset Hitbox", function()
Options.HitboxSize = 3
end)

-- MAIN LOOP
task.spawn(function()

while true do
task.wait(0.25)

if Options.Hitbox then

for _,plr in pairs(Players:GetPlayers()) do

if plr ~= LocalPlayer and plr.Character then

local head = plr.Character:FindFirstChild("Head")
local hum = plr.Character:FindFirstChild("Humanoid")

if head and hum and hum.Health > 0 then

local newSize = Vector3.new(
Options.HitboxSize,
Options.HitboxSize,
Options.HitboxSize
)

if head.Size ~= newSize then
head.Size = newSize
head.Transparency = 0.35
head.CanCollide = false
end

end

end

end

end

end

end)

-- RESET WHEN PLAYER RESPAWNS
Players.PlayerAdded:Connect(function(plr)

plr.CharacterAdded:Connect(function(char)

task.wait(1)

if not Options.Hitbox then return end

local head = char:FindFirstChild("Head")

if head then
head.Size = Vector3.new(
Options.HitboxSize,
Options.HitboxSize,
Options.HitboxSize
)
head.Transparency = 0.35
end

end)

end)



-- ==========================================
-- ESP
-- ==========================================

local esp_sec = esp_tab:CreateSection("Player ESP")

Options.ESPColor = Options.ESPColor or {255,0,0}
Options.Friends = Options.Friends or {}

esp_sec:CreateToggle("Enable Player ESP", Options.PlayerESP, function(v)

Options.PlayerESP = v

if not v then
ClearAllHighlights()
end

end)

-- ==========================================
-- FRIENDS
-- ==========================================

local friends_sec = esp_tab:CreateSection("Friends")

local friendsOpen = false
local playerButtons = {}

local function RefreshFriends()

-- smaže staré tlačítka
for _,btn in pairs(playerButtons) do
pcall(function() btn:Destroy() end)
end
playerButtons = {}

-- vytvoří nové
for _,plr in pairs(Players:GetPlayers()) do

if plr ~= LocalPlayer then

local name = plr.Name

if Options.Friends[name] then
name = "✓ "..name
end

local btn = friends_sec:CreateButton(name,function()

if Options.Friends[plr.Name] then
Options.Friends[plr.Name] = nil
else
Options.Friends[plr.Name] = true
end

task.wait()
RefreshFriends()

end)

table.insert(playerButtons,btn)

end

end

end

friends_sec:CreateButton("Friends",function()

friendsOpen = not friendsOpen

-- zavření listu
if not friendsOpen then

for _,btn in pairs(playerButtons) do
pcall(function() btn:Destroy() end)
end

playerButtons = {}
return

end

RefreshFriends()

end)

-- auto refresh když někdo join/leave
Players.PlayerAdded:Connect(function()
if friendsOpen then
task.wait(1)
RefreshFriends()
end
end)

Players.PlayerRemoving:Connect(function()
if friendsOpen then
task.wait(1)
RefreshFriends()
end
end)

-- ==========================================
-- ESP DISTANCE
-- ==========================================

local esp_dist_sec = esp_tab:CreateSection("ESP Distance")

esp_dist_sec:CreateButton("Distance +100", function()
Options.ESPDistance += 100
end)

esp_dist_sec:CreateButton("Distance -100", function()
Options.ESPDistance = math.max(100, Options.ESPDistance - 100)
end)

esp_dist_sec:CreateButton("Reset Distance", function()
Options.ESPDistance = 500
end)

-- ==========================================
-- CREATE ESP
-- ==========================================

local function CreateESP(plr)

if plr == LocalPlayer then return end
if not plr.Character then return end

local char = plr.Character
local root = char:FindFirstChild("HumanoidRootPart")

if not root then return end

-- highlight
local highlight = char:FindFirstChild("PlayerESP")

if not highlight then

highlight = Instance.new("Highlight")
highlight.Name = "PlayerESP"
highlight.FillTransparency = 0.6
highlight.OutlineTransparency = 0
highlight.Parent = char

end

-- color

if Options.Friends[plr.Name] then
highlight.FillColor = Color3.fromRGB(0,255,0)
else
highlight.FillColor = Color3.fromRGB(
Options.ESPColor[1],
Options.ESPColor[2],
Options.ESPColor[3]
)
end

-- text gui
local gui = root:FindFirstChild("ESPLabel")

if not gui then

gui = Instance.new("BillboardGui")
gui.Name = "ESPLabel"
gui.Size = UDim2.new(0,200,0,80)
gui.AlwaysOnTop = true
gui.StudsOffset = Vector3.new(0,3,0)
gui.Parent = root

local text = Instance.new("TextLabel")
text.Name = "Text"
text.Size = UDim2.new(1,0,1,0)
text.BackgroundTransparency = 1
text.TextStrokeTransparency = 0
text.Font = Enum.Font.GothamBold
text.TextSize = 20
text.RichText = true
text.Parent = gui

end

end

-- ==========================================
-- ESP LOOP
-- ==========================================

task.spawn(function()

while script_running do
task.wait(0.3)

if not Options.PlayerESP then
continue
end

local myChar = LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

if not myRoot then
continue
end

for _,plr in pairs(Players:GetPlayers()) do


if plr ~= LocalPlayer and plr.Character then

local root = plr.Character:FindFirstChild("HumanoidRootPart")
local hum = plr.Character:FindFirstChild("Humanoid")

if root and hum and hum.Health > 0 then

local distance = (myRoot.Position - root.Position).Magnitude

if distance > Options.ESPDistance then

local gui = root:FindFirstChild("ESPLabel")
if gui then gui:Destroy() end

local highlight = plr.Character:FindFirstChild("PlayerESP")
if highlight then highlight:Destroy() end

continue
end

CreateESP(plr)

local gui = root:FindFirstChild("ESPLabel")

if gui then

local label = gui:FindFirstChild("Text")

if label then

local hpPercent = (hum.Health / hum.MaxHealth) * 100
local hpColor

if hpPercent >= 80 then
hpColor = "0,255,0"
elseif hpPercent >= 40 then
hpColor = "255,170,0"
else
hpColor = "255,0,0"
end

if Options.Friends[plr.Name] then

label.Text =
"<font color='rgb(0,255,0)'>★ FRIEND ★</font>\n"..
"<font color='rgb(255,255,255)'>"..plr.Name.."</font>\n"..
"<font color='rgb("..hpColor..")'>HP: "..math.floor(hum.Health).."</font>\n"..
"<font color='rgb(255,255,255)'>Distance: "..math.floor(distance).."m</font>"

else

label.Text =
"<font color='rgb(255,255,255)'>"..plr.Name.."</font>\n"..
"<font color='rgb("..hpColor..")'>HP: "..math.floor(hum.Health).."</font>\n"..
"<font color='rgb(255,255,255)'>Distance: "..math.floor(distance).."m</font>"

end

end

end

end

end

end

end

end)


-- ==========================================
-- PLAYER
-- ==========================================

local player_sec = player_tab:CreateSection("Player Utilities")
local players_sec = player_tab:CreateSection("Players")

local followingPlayer = false
local followConnection
local frozenPlayer = nil

local spectating = false
local spectateConnection

local Mouse = LocalPlayer:GetMouse()

-- CLICK TELEPORT

player_sec:CreateToggle("Click Teleport", Options.ClickTeleport, function(v)
Options.ClickTeleport = v
end)

Mouse.Button1Down:Connect(function()

if not Options.ClickTeleport then return end
if not LocalPlayer.Character then return end
if UserInputService:GetFocusedTextBox() then return end

local pos = Mouse.Hit.Position
LocalPlayer.Character:MoveTo(pos + Vector3.new(0,3,0))

end)

-- PLAYER LIST

local selectedPlayer = nil
local playersOpen = false
local playerButtons = {}

local function RefreshPlayerList()

for _,btn in pairs(playerButtons) do
pcall(function() btn:Destroy() end)
end
playerButtons = {}

for _,plr in pairs(Players:GetPlayers()) do

if plr ~= LocalPlayer then

local name = plr.Name

if selectedPlayer == plr then
name = "▶ "..name
end

local btn = players_sec:CreateButton(name,function()

selectedPlayer = plr
window:Notify("Selected Player", plr.Name)

RefreshPlayerList()

end)

table.insert(playerButtons,btn)

end

end

end

players_sec:CreateButton("Players",function()

playersOpen = not playersOpen

if not playersOpen then

for _,btn in pairs(playerButtons) do
pcall(function() btn:Destroy() end)
end

playerButtons = {}

return
end

RefreshPlayerList()

end)

Players.PlayerAdded:Connect(function()
if playersOpen then
task.wait(1)
RefreshPlayerList()
end
end)

Players.PlayerRemoving:Connect(function()
if playersOpen then
task.wait(1)
RefreshPlayerList()
end
end)

-- TELEPORT TO PLAYER

player_sec:CreateButton("Teleport To Player",function()

if not selectedPlayer then
window:Notify("Error","No player selected")
return
end

if not selectedPlayer.Character then return end
if not LocalPlayer.Character then return end

local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
local targetRoot = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")

if myRoot and targetRoot then

myRoot.CFrame = targetRoot.CFrame * CFrame.new(0,0,-4)

window:Notify("Teleport","Teleported to "..selectedPlayer.Name)

end

end)

-- FLING PLAYER
player_sec:CreateButton("Fling Player - DO NOT PRESS", function()

    if not selectedPlayer then
        window:Notify("Error","No player selected")
        return
    end

    if not selectedPlayer.Character then return end
    if not LocalPlayer.Character then return end

    local targetRoot = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
    local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    if not targetRoot or not myRoot then return end

    local original = myRoot.CFrame

    -- BodyAngularVelocity pro rychlé rotování
    local bav = Instance.new("BodyAngularVelocity")
    bav.AngularVelocity = Vector3.new(0,99999,0)
    bav.MaxTorque = Vector3.new(0,math.huge,0)
    bav.P = math.huge
    bav.Parent = myRoot

    -- teleport k hráči a rotuj
    for i = 1,20 do
        myRoot.CFrame = targetRoot.CFrame * CFrame.new(0,0,0)
        task.wait()
    end

    bav:Destroy()

    -- vrátí tě zpět
    myRoot.CFrame = original

    window:Notify("Fling","Tried to fling "..selectedPlayer.Name)

end)

-- FREEZE PLAYER

player_sec:CreateButton("Freeze Player",function()

if not selectedPlayer then
window:Notify("Error","No player selected")
return
end

if not selectedPlayer.Character then return end

local root = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")

if root then

frozenPlayer = root
root.Anchored = true
root.Velocity = Vector3.zero

window:Notify("Freeze",selectedPlayer.Name.." frozen")

end

end)

-- UNFREEZE PLAYER

player_sec:CreateButton("Unfreeze Player",function()

if frozenPlayer then

frozenPlayer.Anchored = false
frozenPlayer = nil

window:Notify("Freeze","Player unfrozen")

end

end)

-- FOLLOW PLAYER

player_sec:CreateButton("Follow Player",function()

if not selectedPlayer then
window:Notify("Error","No player selected")
return
end

if not selectedPlayer.Character then return end

followingPlayer = true

if followConnection then
followConnection:Disconnect()
end

followConnection = RunService.RenderStepped:Connect(function()

if not followingPlayer then return end
if not selectedPlayer.Character then return end
if not LocalPlayer.Character then return end

local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
local targetRoot = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")

if myRoot and targetRoot then

myRoot.CFrame = myRoot.CFrame:Lerp(
targetRoot.CFrame * CFrame.new(0,0,4),
0.15
)

end

end)

window:Notify("Follow","Following "..selectedPlayer.Name)

end)

-- STOP FOLLOW

player_sec:CreateButton("Stop Follow",function()

followingPlayer = false

if followConnection then
followConnection:Disconnect()
followConnection = nil
end

window:Notify("Follow","Stopped")

end)

-- SPECTATE PLAYER

player_sec:CreateButton("Spectate Player",function()

if not selectedPlayer then
window:Notify("Error","No player selected")
return
end

if not selectedPlayer.Character then return end

local hum = selectedPlayer.Character:FindFirstChild("Humanoid")
if not hum then return end

Camera.CameraSubject = hum

spectating = true

if spectateConnection then
spectateConnection:Disconnect()
end

spectateConnection = RunService.RenderStepped:Connect(function()

if not spectating then return end
if not selectedPlayer.Character then return end

local root = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")

if root then

Camera.CFrame = Camera.CFrame:Lerp(
CFrame.new(
root.Position + Vector3.new(0,4,10),
root.Position
),
0.08
)

end

end)

window:Notify("Spectating",selectedPlayer.Name)

end)

-- STOP SPECTATE

player_sec:CreateButton("Stop Spectate",function()

spectating = false

if spectateConnection then
spectateConnection:Disconnect()
spectateConnection = nil
end

if LocalPlayer.Character then

local hum = LocalPlayer.Character:FindFirstChild("Humanoid")

if hum then
Camera.CameraSubject = hum
end

end

window:Notify("Spectate","Stopped")

end)

-- ==========================================
-- SETTINGS
-- ==========================================

local config_sec=config_tab:CreateSection("Settings")

local isBindingKey=false

local function CreateBindButton()

return config_sec:CreateButton("Menu Key: "..Options.ToggleKeyName,function()

isBindingKey=true
window:Notify("Keybind","Press new key")

end)

end

local bind_btn=CreateBindButton()

config_sec:CreateButton("Save Config",function()
writefile(CONFIG_FILE,HttpService:JSONEncode(Options))
window:Notify("Config","Saved")
end)

config_sec:CreateButton("Load Config",function()

if isfile(CONFIG_FILE) then

local data=HttpService:JSONDecode(readfile(CONFIG_FILE))

script_running=false
ClearAllHighlights()

library:Destroy()

task.wait(.2)

LoadMainScript(data)

end

end)

config_sec:CreateButton("Unload Script",function()

script_running = false
Options.PlayerESP = false

ClearAllHighlights()

if FOVCircle then
FOVCircle:Remove()
end

task.wait(0.1)

library:Destroy()

end)



-- AUTO APPLY ON LOAD
task.spawn(function()
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid", 3)
if hum then
if Options.WalkSpeed then hum.WalkSpeed = Options.WalkSpeedValue end
if Options.JumpPowerEnabled then hum.JumpPower = Options.JumpPower end
end
end)

-- KEYBIND

UserInputService.InputBegan:Connect(function(input,gp)

if gp then return end

if isBindingKey and input.UserInputType==Enum.UserInputType.Keyboard then

Options.ToggleKeyName=input.KeyCode.Name
isBindingKey=false

bind_btn:Destroy()
bind_btn=CreateBindButton()

elseif input.UserInputType==Enum.UserInputType.Keyboard then

if input.KeyCode.Name==Options.ToggleKeyName then

if my_gui then
my_gui.Enabled = not my_gui.Enabled
end

end

end

end)

end

LoadMainScript()
