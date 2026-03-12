-- Main.lua
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow({WindowName="Quantum Debug"}, game.CoreGui)

local tab = window:CreateTab("Test")
local sec = tab:CreateSection("Debug")
sec:CreateToggle("Funguje to!", false, function(v) print("Toggle:", v) end)
