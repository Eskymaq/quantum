-- init.lua
if not getgenv().QuantumLoaded then
    getgenv().QuantumLoaded = true
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Eskymaq/quantum/main/Main.lua"))()
end
