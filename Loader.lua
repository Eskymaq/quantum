-- ==========================================
-- ANTI DUMP
-- ==========================================

if not getgenv then
    return
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

pcall(function()
    if hookfunction then
        return
    end
end)

-- ==========================================
-- GAME CHECK
-- ==========================================

local ALLOWED_GAME = 12673840215

if game.PlaceId ~= ALLOWED_GAME then
    return
end


--!hood gang

-- ==========================================
-- CONFIG
-- ==========================================

local SCRIPT_VERSION = "3.4"
local LIBRARY_ID = "pe_pubmain"
local CONFIG_FILE = "PeakEvolution_Config.json"
local DISCORD_LINK = "https://discord.gg/c7AxxyBKXr"

if getgenv()[LIBRARY_ID] then
    pcall(function()
        getgenv()[LIBRARY_ID]:Destroy()
    end)
end


-- ==========================================
-- SERVICES
-- ==========================================

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
