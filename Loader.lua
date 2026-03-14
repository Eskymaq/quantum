-- Loader.lua
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local KEY_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/keys.json"
local MAIN_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/main.lua"

-- Funkce ověření klíče
local function VerifyKey(key)
    local ok, data = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(KEY_URL))
    end)
    if not ok then return false end

    local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

    if not data[key] then
        return false
    end

    if data[key] == "" or data[key] == HWID then
        return true
    end

    return false
end

-- UI (jednoduchý TextBox + Button)
local ScreenGui = Instance.new("ScreenGui", gethui())
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 200)
Frame.Position = UDim2.new(0.5, -200, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
Instance.new("UICorner", Frame)

local KeyBox = Instance.new("TextBox", Frame)
KeyBox.Size = UDim2.new(0.8,0,0,50)
KeyBox.Position = UDim2.new(0.1,0,0.3,0)
KeyBox.PlaceholderText = "Enter key..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
KeyBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", KeyBox)

local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(0.8,0,0,50)
Button.Position = UDim2.new(0.1,0,0.7,0)
Button.Text = "Execute"
Button.TextColor3 = Color3.new(1,1,1)
Button.BackgroundColor3 = Color3.fromRGB(46,204,113)
Instance.new("UICorner", Button)

Button.MouseButton1Click:Connect(function()
    local key = KeyBox.Text
    if VerifyKey(key) then
        ScreenGui:Destroy()
        local ok, err = pcall(function()
            loadstring(game:HttpGet(MAIN_URL))()
        end)
        if not ok then
            warn("Failed to load main.lua", err)
        end
    else
        KeyBox.TextColor3 = Color3.fromRGB(255,0,0)
        KeyBox.Text = "Invalid key!"
    end
end)
