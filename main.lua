local gpoid = {1730877806,3978370137,7465136166,11424731604}
local fbgid = {16190471004, 12413901502, 9224601490}
repeat wait() until game:IsLoaded()
local logo = "rbxassetid://14098292415"
function Noti(Title,Text,Duration,Icon)
game.StarterGui:SetCore("SendNotification", {
Title = Title or "Rei Hub"; -- the title (ofc)
Text = Text or "Welcome To Rei Hub Have Good Day With Rei Script https://discord.gg/GJNn6TTX5K"; 
Icon = Icon or logo; -- the image if u want. 
Duration = Duration or 15; -- how long the notification should in secounds
})end
Noti()
if table.find(gpoid, game.PlaceId) then
    spawn(function()
        if getgenv().rei.Method == "Impel" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/GrandPieceOnline/Impeldown.lua'))()
            Noti("Grand Piece Online","Impel down Auto Farm",5)
            return
        elseif getgenv().rei.Method == "Level" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/GrandPieceOnline/Level.lua'))()
            Noti("Grand Piece Online","Leveling Farming",5)
            return
        end
    end)
elseif table.find(fbgid, game.PlaceId) then
spawn(function()
        if getgenv().rei.Method == "Kaitun" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/FruitBattlegrounds/Kaitun.lua'))()
            Noti("Fruit Battlegrounds","Kaitun",5)
        elseif getgenv().rei.Method == "Mythic" or getgenv().rei.Method == "Legend" or getgenv().rei.Method == "Both" then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dum1121/ReiPublic/main/Scripts/FruitBattlegrounds/Autoroll.lua'))()
            Noti("Fruit Battlegrounds","Auto Roll",5)
        end
end)
end
