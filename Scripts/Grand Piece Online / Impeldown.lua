repeat wait() until game:IsLoaded()
if getgenv().rei.Method == "Impel" then
local plr = game.Players.LocalPlayer

game.NetworkClient.ChildRemoved:Connect(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
  end)
  game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
      if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
          game:GetService("TeleportService"):Teleport(1730877806)
      end
  end)
local guiservice = game:GetService("GuiService")
local vim = game:GetService("VirtualInputManager")
local tps = game:GetService('TeleportService')

local dl = false
function click(path)
    if dl == false then
        dl = true
        print(path:GetFullName())
        guiservice.SelectedObject = path
        wait(.2)
        vim:SendKeyEvent(true, 13, false, game)
        wait(.1)
        vim:SendKeyEvent(false, 13, false, game)
        wait(.2)
        guiservice.SelectedObject = nil
        wait(.2)
        dl = false
    end
end

local sc = (debug and debug.setconstant) or setconstant
local gc = (debug and debug.getconstants) or getconstants

local pop = game.Players.LocalPlayer.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
for _, v in pairs(getgc()) do
    if type(v) == 'function' and getfenv(v).script == pop then
        for i, v1 in pairs(gc(v)) do
            if tonumber(v1) == .25 then
                sc(v, i, 0)
            elseif tonumber(v1) == 0 then
                sc(v, i, .25)
            end
        end
    end
end
function twn(targetPos, targetCFrame, highpos)
    local player = game.Players.LocalPlayer
    local rootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        return  -- Player's character or root part not found
    end
    local distance = (targetPos - rootPart.Position).Magnitude
    local duration = distance / getgenv().rei.Speed
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local offset = Vector3.new(0,highpos or 14, 0)
    local targetCF = targetCFrame * CFrame.new(offset)

    local TweenService = game:GetService("TweenService")
    local Tween = TweenService:Create(rootPart, tweenInfo, {CFrame = targetCF})
    
    Tween:Play()
    Tween.Completed:Wait() -- Wait for the tween to complete before returning
end

if getgenv().noclipsetup ~= true then
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Heartbeat = RunService.Heartbeat
    local Stepped = RunService.Stepped

    local function createLOL()
        local LOL = Instance.new("Part")
        LOL.Name = "LOL"
        LOL.Parent = Workspace
        LOL.Anchored = true
        LOL.Transparency = 1
        LOL.Size = Vector3.new(50, -0.5, 50)
        return LOL
    end

    local LOL

    spawn(function()
        Heartbeat:Connect(function()
            if getgenv().noclip then
                if not LOL then
                    LOL = createLOL()
                end
                LOL.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.4, 0)
            elseif LOL then
                LOL:Destroy()
                LOL = nil
            end
        end)
    end)
    if getgenv().rei.SetPing then
spawn(function()
    while wait() do
        settings():GetService("NetworkSettings").IncomingReplicationLag = getgenv().rei.HighPing
        wait(3)
        settings():GetService("NetworkSettings").IncomingReplicationLag = 0
        wait(2)
    end
end)
end
    spawn(function()
        Stepped:Connect(function()
            if getgenv().noclip then
                for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)

    getgenv().noclipsetup = true
    print("Noclip Setuped!")
end
function hit()
    pcall(function()
        if workspace.NPCs:FindFirstChild("Kelvin, The Nutcracker") then
            if workspace.NPCs["Kelvin, The Nutcracker"]:FindFirstChild("Stun") then
                repeat wait()
                until not workspace.NPCs["Kelvin, The Nutcracker"]:FindFirstChild("Stun")
            end
        end
            local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer
    local Backpack = LocalPlayer.Backpack
    local Character = LocalPlayer.Character
    local Humanoid = Character.Humanoid
    
    for i,tool in pairs(Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("Combat") and not Character:FindFirstChildOfClass("Tool") then
            Humanoid:EquipTool(tool)
        end
    end
    if not getgenv().swing then
        for i = 1, 5 do
            spawn(function()
                local args = {
                    [1] = {
                        [1] = "swingsfx",
                        [2] = "Melee",
                        [3] = i,
                        [4] = "Ground",
                        [5] = false,
                        [6] = game.ReplicatedStorage:WaitForChild("CombatAnimations"):WaitForChild("Melee"):WaitForChild("Punch1"),
                        [7] = 1,
                        [8] = 5
                    }
                }
                game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("CombatRegister"):InvokeServer(unpack(args))
            end)
            wait(0.2)
            end
    end
    getgenv().swing = true

    local args = {
        [1] = {
            [1] = "damage",
            [2] = {},
            [3] = "Melee",
            [4] = {
                [1] = math.random(1,5),
                [2] = "Ground",
                [3] = "Melee"
            },
            [5] = true,
            [6] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        }
    }
    for i = 1, getgenv().rei.Stack do
        pcall(function()
            for i,v in pairs(game.Workspace.NPCs:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 200 then
                            table.insert(args[1][2], v:WaitForChild("HumanoidRootPart"))
                end
            end
        end)
    end

    game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("CombatRegister"):InvokeServer(unpack(args))
    end)
end     
function checkmob(a)
pcall(function()
    workspace.Camera.CFrame = CFrame.new(2911.09619, 2072.77393, -13938.9268, 0.977930188, -0.202968821, 0.0495605506, 0, 0.237208992, 0.971458614, -0.208932027, -0.950018704, 0.231973827)
    if plr.CameraMaxZoomDistance ~= 200 then
    plr.CameraMaxZoomDistance = 200
    plr.CameraMinZoomDistance = 200
    plr.CameraMinZoomDistance = 0.5
    end
    local workspace = game:GetService("Workspace")
    local NPCs = workspace.NPCs
    local LocalPlayer = game:GetService("Players").LocalPlayer

    for i,v in pairs(NPCs:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= (a or 100) then
            repeat wait()
                hit()
                twn(v.HumanoidRootPart.Position, v.HumanoidRootPart.CFrame)
                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                hit()
            until v.Humanoid.Health <= 0
        end
    end
end)
end
function instant(et)
    for i, x in next, game.Players.LocalPlayer.Character:GetDescendants() do
        if x:IsA("BasePart") and not x.Anchored then
            x.Anchored = et
        end
    end
    for i, x in next, game.Players.LocalPlayer.Character:GetDescendants() do
        if x.Name ~= floatName and x:IsA("BasePart") and x.Anchored then
            x.Anchored = et
        end
    end
end
function island(island,cframe,realpos)
    if game:GetService("ReplicatedStorage")["Stats"..plr.Name].Stats.SpawnPoint.Value ~= island then
        repeat wait()
                instant(true)
                plr.Character.HumanoidRootPart.CFrame = cframe
                wait(3)
                instant(false)
                wait(0.1)
                local args = {[1] = "self"}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("KnockedOut"):FireServer(unpack(args))
                            wait(0.1)
                            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SetSpawn"):FireServer()
                wait(2)
            print(realpos)
        until game:GetService("ReplicatedStorage")["Stats"..plr.Name].Stats.SpawnPoint.Value == island
        repeat wait()
        until not workspace.Ragdolls:FindFirstChild(plr.Name)
        wait(5)
        --[[if game.PlaceId == 3978370137 or game.PlaceId == 7465136166 then
        tps:Teleport(1730877806)
        end
        spawn(function()
            wait(20)
            tps:Teleport(1730877806)
        end) ]]
        return
    end 
end
spawn(function()
    while wait() do
        if getgenv().rei.Method == "Impel" then
            pcall(function()
                if getgenv().rei.Method == "Impel" then
                    if game.PlaceId == 7465136166 then
                        if getgenv().rei.WalkMethod == "TP" then
                        island("Impel Base",CFrame.new(5935, 7, -9471),Vector3.new(5937.09619140625, 6.067999839782715, -9470.6533203125))
                        elseif getgenv().rei.WalkMethod == "Tween" then
                            if game:GetService("ReplicatedStorage")["Stats"..plr.Name].Stats.SpawnPoint.Value ~= "Impel Base" then
                        getgenv().noclip = true
                            twn(Vector3.new(5935, 7, -9471),CFrame.new(5935, 7, -9471),0)
                            wait(1)
                            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SetSpawn"):FireServer()
                            end
                        end
                        getgenv().noclip = true
                        wait(1)
                        twn(Vector3.new(5990, 5, -10123),CFrame.new(5990, 5, -10123),0)
                        return
                    elseif game.PlaceId == 11424731604 then
                        getgenv().noclip = true
                    elseif game.PlaceId == 1730877806 then
                        if getgenv().rei.PrivateCode == "" or getgenv().rei.PrivateCode == nil then
                            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("playgame"):FireServer()
                        end
                    if getgenv().rei.PrivateCode ~= "" and getgenv().rei.PrivateCode ~= nil then
                        local args = {
                            [1] = getgenv().rei.PrivateCode
                        }
                        
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("reserved"):InvokeServer(unpack(args))
                        repeat wait(3)
                            if game:GetService("Players").LocalPlayer.PlayerGui.chooseType.Frame.regular.Visible == false then
                            local args = {
                                [1] = getgenv().rei.PrivateCode
                            }
                            
                            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("reserved"):InvokeServer(unpack(args))
                        end
                        until game:GetService("Players").LocalPlayer.PlayerGui.chooseType.Frame.regular.Visible == true
                        click(game:GetService("Players").LocalPlayer.PlayerGui.chooseType.Frame.regular)
                    end
                    return
                    elseif game.PlaceId == 3978370137 then
                        if string.find(game:GetService("ReplicatedStorage")["Stats"..game.Players.LocalPlayer.Name].Inventory.Inventory.Value,"World Scroll") then
                            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-14864, 33, -9046)
                        elseif not string.find(game:GetService("ReplicatedStorage")["Stats"..game.Players.LocalPlayer.Name].Inventory.Inventory.Value,"World Scroll") then
                            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-12187, 0, -18548)
                            wait(2)
                            repeat wait()
                                pcall(function()
                                    if not string.find(game:GetService("ReplicatedStorage")["Stats"..game.Players.LocalPlayer.Name].Inventory.Inventory.Value,"World Scroll") then
                                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-12187, 0, -18548)
                                    fireproximityprompt(workspace.Effects["World Scroll"].ProximityPrompt)
                                end
                            end)
                            until not workspace.Effects:FindFirstChild("World Scroll") or string.find(game:GetService("ReplicatedStorage")["Stats"..game.Players.LocalPlayer.Name].Inventory.Inventory.Value,"World Scroll")
                            if  not workspace.Effects:FindFirstChild("World Scroll") then
                                wait(30)
                        end
                        end
                    else
                        return
                    end
                end
                if game:GetService("ReplicatedStorage").ImpelData:FindFirstChild("Impel Base") then
                    if game:GetService("ReplicatedStorage").ImpelData["Impel Base"]:GetAttribute("Current") == true then
                        for i,v in pairs(workspace.NPCs:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= (a or 100) then
                                hit()
                            end
                        end
                    end
                end
                
                if getgenv().checkvote == nil then
                    getgenv().checkvote = true
                    repeat wait()
                    until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("DiffChooser") or workspace.NPCs:FindFirstChild("Vera")
                    click(game:GetService("Players").LocalPlayer.PlayerGui.DiffChooser.Frame.ScrollingFrame.Nightmare)
                    click(game:GetService("Players").LocalPlayer.PlayerGui.DiffChooser.Frame.ScrollingFrame.Nightmare)
                end
                spawn(function()
                    if game:GetService("ReplicatedStorage")["Stats"..game.Players.LocalPlayer.Name].Stats.SkillPoints.Value ~= 0 then
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("stats"):FireServer("Strength",nil,625)
                        
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("stats"):FireServer("Defense",nil,500)
                    end
                end)
                if game:GetService("ReplicatedStorage").ImpelData["Floor 1: Crimson Hell"]:GetAttribute("Current") == true then
                if game.Players.LocalPlayer.Character.FallDamage.Enabled then
                    game.Players.LocalPlayer.Character.FallDamage.Enabled = false
                end
                if plr.Character:FindFirstChild("Cuffed") then
                    plr.Character.HumanoidRootPart.CFrame = workspace.Effects.Key.Key.CFrame
                    fireproximityprompt(workspace.Effects.Key.Key.ProximityPrompt)
                elseif workspace.Islands["Impel Base - Floor 1"].Barriers:FindFirstChild("FirstBarrier") then
                    wait(0.5)
                    twn(Vector3.new(2950, 2081, -13716),CFrame.new(2950, 2081, -13716))
                    wait(0.5)
                    twn(Vector3.new(2947, 2075, -13960),CFrame.new(2947, 2075, -13960))
                    wait(0.5)
                    checkmob()
                elseif workspace.Islands:FindFirstChild("Impel Base - Floor 1") then
                    if workspace.Islands:FindFirstChild("Impel Base - Floor 2") then
                        workspace.Islands:FindFirstChild("Impel Base - Floor 1"):Destroy()
                    return
                    end
                    twn(Vector3.new(2676, 2074, -15484),CFrame.new(2676, 2074, -15484))
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(2676, 2074, -15484)
                    wait(1)
                    checkmob()
                    wait(3)
                end
                elseif game:GetService("ReplicatedStorage").ImpelData["Floor 2: Wild Hell"]:GetAttribute("Current") == true then
                    if game.Players.LocalPlayer.Character.FallDamage.Enabled then
                        game.Players.LocalPlayer.Character.FallDamage.Enabled = false
                    end
                    if workspace.Islands["Impel Base - Floor 2"].Barriers:FindFirstChild("FirstBarrier") then
                    twn(Vector3.new(3195, 2388, -20266),CFrame.new(3195, 2388, -20266))
                    getgenv().getflor2 = true
                    checkmob(200)
                    elseif workspace.Islands["Impel Base - Floor 2"].Barriers:FindFirstChild("MiddleBarrierRight") then
                    twn(Vector3.new(3195, 2350, -20402),CFrame.new(3195, 2390, -20402))
                    checkmob()
                    elseif workspace.Islands["Impel Base - Floor 2"].Barriers:FindFirstChild("RightFirstBarrier") then
                    twn(Vector3.new(3439, 2300, -20363),CFrame.new(3439, 2390, -20363))
                    checkmob()
                    elseif workspace.Islands["Impel Base - Floor 2"].Barriers:FindFirstChild("RightSecondBarrier") then
                        twn(Vector3.new(3466, 2398, -20636),CFrame.new(3466, 2388, -20636))
                        checkmob()
                    elseif workspace.Islands["Impel Base - Floor 2"].Barriers:FindFirstChild("MiddleBossBarrier") then
                        if workspace.Islands["Impel Base - Floor 2"].Interactables.BossGateLever.Lever["Meshes/Lev_Cube.004"]:FindFirstChild("ProximityPrompt").Enabled then
                        twn(Vector3.new(3197, 2347, -20541),CFrame.new(3197, 2347, -20541))
                        plr.Character.HumanoidRootPart.CFrame = workspace.Islands["Impel Base - Floor 2"].Interactables.BossGateLever.WorldPivot
                        wait(0.5)
                        fireproximityprompt(workspace.Islands["Impel Base - Floor 2"].Interactables.BossGateLever.Lever["Meshes/Lev_Cube.004"].ProximityPrompt)
                        wait(0.5)
                        else
                            twn(Vector3.new(3195, 2408, -20402),CFrame.new(3195, 2408, -20402))
                            checkmob()
                            wait(1)
                        end
                        elseif workspace.Islands["Impel Base - Floor 2"].Barriers:FindFirstChild("BossBarrier") then 
                            twn(Vector3.new(3201, 2378, -20543),CFrame.new(3201, 2378, -20543))
                            checkmob()
                            wait(1)
                        elseif workspace.Islands:FindFirstChild("Impel Base - Floor 2") and getgenv().getflor2 == true then
                        if workspace.Islands:FindFirstChild("Impel Base - Floor 3") then
                            workspace.Islands:FindFirstChild("Impel Base - Floor 2"):Destroy()
                        return
                        end
                        if getgenv().elitehigh == nil then
                        twn(Vector3.new(3194, 2377, -20821),CFrame.new(3194, 2377, -20821))
                        checkmob(2000)
                        getgenv().elitehigh = true
                        else
                        twn(Vector3.new(3190, 2364, -21088),CFrame.new(3190, 2364, -21088))
                        wait(1)
                        end
                end
                elseif game:GetService("ReplicatedStorage").ImpelData["Floor 3: Starvation Hell"]:GetAttribute("Current") == true then
                    if game.Players.LocalPlayer.Character.FallDamage.Enabled then
                        game.Players.LocalPlayer.Character.FallDamage.Enabled = false
                    end
                    if workspace.Islands["Impel Base - Floor 3"].Barriers:FindFirstChild("FirstBarrier") then
                        twn(Vector3.new(4972, 2314, -20762),CFrame.new(4972, 2314, -20762))
                        checkmob(200)
                    elseif not workspace.Islands["Impel Base - Floor 3"].Interactables.LeftAreaLever.Lever["Meshes/Lev_Cube.004"]:FindFirstChild("ProximityPrompt") then
                        twn(Vector3.new(4792, 2313, -20758),CFrame.new(4792, 2313, -20758))
                        checkmob(200)
                        elseif workspace.Islands["Impel Base - Floor 3"].Interactables.LeftAreaLever.Lever["Meshes/Lev_Cube.004"].ProximityPrompt.Enabled then
                        twn(Vector3.new(4702, 2306, -20719),CFrame.new(4702, 2306, -20719))
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(4702, 2306, -20719)
                        wait(0.5)
                        fireproximityprompt(workspace.Islands["Impel Base - Floor 3"].Interactables.LeftAreaLever.Lever["Meshes/Lev_Cube.004"].ProximityPrompt)
                        wait(1)
                    elseif not workspace.Islands["Impel Base - Floor 3"].Interactables.RightAreaLever.Lever["Meshes/Lev_Cube.004"]:FindFirstChild("ProximityPrompt") then
                        twn(Vector3.new(5106, 2309, -20783),CFrame.new(5106, 2309, -20783))
                        checkmob(200)
                        elseif workspace.Islands["Impel Base - Floor 3"].Interactables.RightAreaLever.Lever["Meshes/Lev_Cube.004"].ProximityPrompt.Enabled then
                        twn(Vector3.new(5160, 2306, -20795),CFrame.new(5160, 2306, -20795))
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(5160, 2306, -20795)
                        wait(0.5)
                        fireproximityprompt(workspace.Islands["Impel Base - Floor 3"].Interactables.RightAreaLever.Lever["Meshes/Lev_Cube.004"].ProximityPrompt)
                        wait(1)
                        elseif workspace.Islands["Impel Base - Floor 3"].Barriers:FindFirstChild("GateBarrier") then
                            twn(Vector3.new(4852, 2381, -20995),CFrame.new(4852, 2381, -20995))
                            wait(1)
                            checkmob(2000)
                        elseif  workspace.Islands["Impel Base - Floor 3"].Barriers:FindFirstChild("MiniBossExitBarrier") then
                            twn(Vector3.new(4826, 2426, -20829),CFrame.new(4826, 2426, -20829))
                            wait(1)
                            checkmob(2000)
                            elseif  workspace.Islands["Impel Base - Floor 3"].Barriers:FindFirstChild("BossFightBarrier") then
                                twn(Vector3.new(5223, 2408, -20804),CFrame.new(5223, 2408, -20804))
                                wait(1.3)
                                checkmob(2000)
                                twn(Vector3.new(5546, 2423, -20798),CFrame.new(5546, 2423, -20798))
                                wait(1.3)
                                checkmob(2000)
                                twn(Vector3.new(5588, 2511, -20952),CFrame.new(5588, 2511, -20952))
                                wait(1.3)
                                checkmob(2000)
                            elseif workspace.Islands["Impel Base - Floor 3"].Barriers:FindFirstChild("EndBarrier") then
                                twn(Vector3.new(5661, 2495, -20517),CFrame.new(5661, 2495, -20517))
                                checkmob(2000)
                            elseif workspace.Islands:FindFirstChild("Impel Base - Floor 3") then
                                if workspace.Islands:FindFirstChild("Impel Base - Floor 4") then
                                    workspace.Islands:FindFirstChild("Impel Base - Floor 3"):Destroy()
                                return
                                end
                                twn(Vector3.new(5669, 2492, -20246),CFrame.new(5669, 2492, -20246),5)
                                wait(7)
                    end
                elseif game:GetService("ReplicatedStorage").ImpelData["Floor 4: Freezing Hell"]:GetAttribute("Current") == true then
                    if workspace.Islands["Impel Base - Floor 4"].Barriers:FindFirstChild("FirstBarrier") then
                        twn(Vector3.new(10047, 1621, -19279),CFrame.new(10047, 1621, -19279))
                        checkmob(2000)
                        wait(1)
                    elseif workspace.Islands["Impel Base - Floor 4"].Barriers:FindFirstChild("SecondBarrier") then
                        twn(Vector3.new(9990, 1649, -19589),CFrame.new(9990, 1649, -19589))
                        checkmob(2000)
                    elseif workspace.Islands["Impel Base - Floor 4"].Barriers:FindFirstChild("ThirdBarrier") then
                        twn(Vector3.new(9755, 1639, -19722),CFrame.new(9755, 1639, -19722))
                        checkmob(2000)
                    elseif workspace.Islands["Impel Base - Floor 4"].Barriers:FindFirstChild("SixthBarrier") then
                    twn(Vector3.new(9662, 1641, -20263),CFrame.new(9662, 1641, -20263))
                    checkmob(2000)
                    elseif workspace.Islands["Impel Base - Floor 4"].Barriers:FindFirstChild("SeventhBarrier") then
                        twn(Vector3.new(10132, 1643, -20339),CFrame.new(10132, 1643, -20339))
                        checkmob(2000)
                        elseif workspace.Islands["Impel Base - Floor 4"].Barriers:FindFirstChild("SeventhBarrier2") then
                        twn(Vector3.new(10588, 1644, -20352),CFrame.new(10588, 1644, -20352))
                        checkmob(2000)
                        elseif workspace.Islands["Impel Base - Floor 4"].Barriers:FindFirstChild("EighthBarrier1") then
                        twn(Vector3.new(10960, 1643, -20466),CFrame.new(10960, 1643, -20466))
                        checkmob(2000)
                        elseif workspace.Islands["Impel Base - Floor 4"].Barriers:FindFirstChild("EighthBarrier2") then
                        twn(Vector3.new(10905, 1644, -20989),CFrame.new(10905, 1644, -20989))
                        checkmob(2000)
                        elseif workspace.Islands["Impel Base - Floor 4"].Barriers:FindFirstChild("NinthZone") then
                        twn(Vector3.new(10508, 1640, -20993),CFrame.new(10508, 1640, -20993))
                        checkmob(2000)
                        elseif workspace.Islands:FindFirstChild("Impel Base - Floor 4") then
                            if workspace.Islands:FindFirstChild("Impel Base - Floor 5") then
                                workspace.Islands:FindFirstChild("Impel Base - Floor 4"):Destroy()
                            return
                            end
                            if getgenv().blu == nil then
                            twn(Vector3.new(10003, 1664, -21817),CFrame.new(10003, 1664, -21817))
                            checkmob(2000)
                            getgenv().blu = true
                            else
                            twn(Vector3.new(9981, 1653, -22141),CFrame.new(9981, 1653, -22141),10)
                            wait(1)
                            end
                    end
                elseif game:GetService("ReplicatedStorage").ImpelData["Floor 5: Blazing Hell"]:GetAttribute("Current") == true then
                    if workspace.Islands["Impel Base - Floor 5"].Barriers:FindFirstChild("StartBarrier") then
                        twn(Vector3.new(9416, 588, -27927),CFrame.new(9416, 588, -27927))
                        checkmob(1000)
                    elseif workspace.Islands["Impel Base - Floor 5"].Barriers:FindFirstChild("Barrier1") then
                        twn(Vector3.new(10158, 597, -27379),CFrame.new(10158, 597, -27379))
                        wait(1)
                        checkmob(1000)
                        wait(2)
                        elseif workspace.Islands["Impel Base - Floor 5"].Barriers:FindFirstChild("Barrier2") then
                            twn(Vector3.new(10585, 554, -27438),CFrame.new(10585, 554, -27438))
                            checkmob(1000)
                        elseif workspace.Islands["Impel Base - Floor 5"].Barriers:FindFirstChild("Barrier4") then
                            twn(Vector3.new(10604, 507, -28507),CFrame.new(10604, 507, -28507))
                            checkmob(1000)
                            elseif workspace.Islands["Impel Base - Floor 5"].Barriers:FindFirstChild("Barrier5") then
                            twn(Vector3.new(10081, 476, -28448),CFrame.new(10081, 476, -28448))
                            checkmob(1000)
                                elseif workspace.Islands["Impel Base - Floor 5"].Barriers:FindFirstChild("Barrier6") then
                            twn(Vector3.new(9649, 516, -28459),CFrame.new(9649, 516, -28459))
                            wait(1)
                            checkmob(1000)
                                elseif workspace.Islands["Impel Base - Floor 5"].Barriers:FindFirstChild("Barrier7") then
                                    if workspace.NPCs:FindFirstChild("Warden of Impel Down, Vera") then
                                            hit()
                                        getgenv().impelvera = true
                                    elseif getgenv().impelvera == nil then
                                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(9636, 570, -27897)
                                    end
                    end
                elseif getgenv().rei.AutoNightmare then
                    if getgenv().rei.Webhook ~= "" and getgenv().sending == nil then
                    wait(10)
                    function shadowban()
                        if game:GetService("Players").LocalPlayer:GetAttribute("banned") == true then
                            return "✅ | gg, say goodbye to ur account"
                        else
                            return "❌"
                    end
                    end
                    function mythic()
                        if workspace.Islands["Impel Base - Finished"].Models:FindFirstChild("Mythical Fruit Chest") then
                            return "✅"
                        else
                            return "❌"
                    end
                    end
                    local Content = "[Dum Was Here](https://guns.lol/Dum1121)"
local Embed = {
    ["title"] = "Notification",
    ["description"] = "**PlaceName: ["..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."](https://roblox.com/games/"..game.PlaceId..")**\
    **PlaceId: "..game.PlaceId.."**\n\
    **Username: ||".. game.Players.LocalPlayer.Name .. "||\
    UserId: ||" .. game.Players.LocalPlayer.UserId .. "||**\n\
    ```Shadow Ban: "..shadowban().."```\
    ```Impel Points: "..game:GetService("Players").LocalPlayer.PlayerGui.BattleReportGui.Points.Text.."```\
    ```Mythic Chest: "..mythic().."```",
    ["type"] = "rich",
    ["color"] = tonumber(0x8AEEDC),
    thumbnail = {
        url = "https://media.discordapp.net/attachments/1137483144707199097/1139412932615225344/moon.png?ex=664e1b3c&is=664cc9bc&hm=c206bf56bf524438981efe6c69b699ed103f824b94ab97f9633b74933809eab1&"
    },
    footer = {
        text = "Rei Hub | GPO Impeldown ~ Clear time: "..game:GetService("Players").LocalPlayer.PlayerGui.BattleReportGui.BattleReport.LeftContainer["Clear Time"].Display.Text,
    },

};
if getgenv().rei.BuyMythicalChest then
    if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.BattleReportGui.Points.Text) >= tonumber(workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].Part.ProximityPrompt.ActionText:gsub("%,",""):gsub("255255126",""):gsub("%a",""):gsub("%<",""):gsub("%>",""):gsub("%/",""):gsub("%'",""):gsub("%=",""):gsub("%(",""):gsub("%)","")) then
        twn(workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].WorldPivot.Position,workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].WorldPivot)
        wait(1)
        fireproximityprompt(workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].Part.ProximityPrompt);
        Content = "_**[Dum Was Here](https://guns.lol/Dum1121)**_ \n @everyone Buyed Mythic Chest [idk if u alr have it]"
    end    
    end

(syn and syn.request or http_request or http.request) {
Url = getgenv().rei.Webhook;
Method = 'POST';
Headers = {
['Content-Type'] = 'application/json';
};
Body = game:GetService'HttpService':JSONEncode({content = Content; embeds = {Embed}; });
};
getgenv().sending = true
                end
                    wait(10)
                twn(Vector3.new(6396, 643, -27930),CFrame.new(6396, 643, -27930))
                elseif getgenv().rei.Webhook ~= "" and getgenv().sending == nil then
                    wait(10)
                    function shadowban()
                        if game:GetService("Players").LocalPlayer:GetAttribute("banned") == true then
                            return "✅ | gg, say goodbye to ur account"
                        else
                            return "❌"
                    end
                    end
                    function mythic()
                        if workspace.Islands["Impel Base - Finished"].Models:FindFirstChild("Mythical Fruit Chest") then
                            return "✅"
                        else
                            return "❌"
                    end
                    end
local Embed = {
    ["title"] = "Notification",
    ["description"] = "**PlaceName: ["..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."](https://roblox.com/games/"..game.PlaceId..")**\
    **PlaceId: "..game.PlaceId.."**\n\
    **Username: ||".. game.Players.LocalPlayer.Name .. "||\
    UserId: ||" .. game.Players.LocalPlayer.UserId .. "||**\n\
    ```Shadow Ban: "..shadowban().."```\
    ```Impel Points: "..game:GetService("Players").LocalPlayer.PlayerGui.BattleReportGui.Points.Text.."```\
    ```Mythic Chest: "..mythic().."```",
    ["type"] = "rich",
    ["color"] = tonumber(0x8AEEDC),
    thumbnail = {
        url = "https://media.discordapp.net/attachments/1137483144707199097/1139412932615225344/moon.png?ex=664e1b3c&is=664cc9bc&hm=c206bf56bf524438981efe6c69b699ed103f824b94ab97f9633b74933809eab1&"
    },
    footer = {
        text = "Rei Hub | GPO Impeldown ~ Clear time: "..game:GetService("Players").LocalPlayer.PlayerGui.BattleReportGui.BattleReport.LeftContainer["Clear Time"].Display.Text,
    },

};
(syn and syn.request or http_request or http.request) {
Url = getgenv().rei.Webhook;
Method = 'POST';
Headers = {
['Content-Type'] = 'application/json';
};
Body = game:GetService'HttpService':JSONEncode({content = '_**[Dum Was Here](https://guns.lol/Dum1121)**_'; embeds = {Embed}; });
};
getgenv().sending = true
if getgenv().rei.BuyMythicalChest then
if game:GetService("Players").LocalPlayer.PlayerGui.BattleReportGui.Points.Text >= workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].Part.ProximityPrompt.ActionText:gsub("%,",""):gsub("255255126",""):gsub("%a",""):gsub("%<",""):gsub("%>",""):gsub("%/",""):gsub("%'",""):gsub("%=",""):gsub("%(",""):gsub("%)","") then
    twn(workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].WorldPivot.Position,workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].WorldPivot)
    wait(1)
    fireproximityprompt(workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].Part.ProximityPrompt)
end    
end
elseif getgenv().rei.BuyMythicalChest then
    if game:GetService("Players").LocalPlayer.PlayerGui.BattleReportGui.Points.Text >= workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].Part.ProximityPrompt.ActionText:gsub("%,",""):gsub("255255126",""):gsub("%a",""):gsub("%<",""):gsub("%>",""):gsub("%/",""):gsub("%'",""):gsub("%=",""):gsub("%(",""):gsub("%)","") then
twn(workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].WorldPivot.Position,workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].WorldPivot)
wait(1)
fireproximityprompt(workspace.Islands["Impel Base - Finished"].Models["Mythical Fruit Chest"].Part.ProximityPrompt)
    end
end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        local args = {
            [1] = "Sky Walk2",
            [2] = {
                ["char"] = plr.Character:GetFullName(),
                ["cf"] = plr.Character.HumanoidRootPart.CFrame
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Skill"):InvokeServer(unpack(args))
    wait(1)
end
end)
end