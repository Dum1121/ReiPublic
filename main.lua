local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Rei.lua"))()

local gpoid = {1730877806,3978370137,7465136166,11424731604,6811831486}
local fbgid = {16190471004, 12413901502, 9224601490}
local dmfid = {5094651510}

repeat wait() until game:IsLoaded()
local tps = game:GetService("TeleportService")
function Noti(Tit,Con,Dura,SubContent)
    Fluent:Notify({
        Title = Tit or "Rei Hub - Paid Version",
        Content = Con or "Welcome To Rei Hub\nChecking Key...",
        SubContent = SubContent or nil, -- Optional
        Duration = Dura or 5 -- Set to nil to make the notification not disappear
    })
end
Noti()
if table.find(gpoid, game.PlaceId) then
    spawn(function()
        if getgenv().rei.Method == "Main" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/GrandPieceOnline/Main.lua'))()
        elseif getgenv().rei.Method == "Impel" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/GrandPieceOnline/Impeldown.lua'))()
            Noti("Grand Piece Online","Impel down Auto Farm",5)
            return
        elseif getgenv().rei.Method == "Level" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/GrandPieceOnline/Level.lua'))()
            Noti("Grand Piece Online","Leveling Farming",5)
            return
        end
        if game.PlaceId == 6811831486 then
            tps:Teleport(11424731604)
        end
    end)
elseif table.find(fbgid, game.PlaceId) then
spawn(function()
        if getgenv().rei.Method == "Kaitun" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/FruitBattlegrounds/Kaitun.lua'))()
            Noti("Fruit Battlegrounds","Kaitun",5)
        elseif getgenv().rei.Method == "Roll" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/FruitBattlegrounds/Autoroll.lua'))()
            Noti("Fruit Battlegrounds","Auto Roll",5)
        end
end)
elseif table.find(dmfid, game.PlaceId) then
    spawn(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/DemonFall/main.lua'))()
    end)
end
