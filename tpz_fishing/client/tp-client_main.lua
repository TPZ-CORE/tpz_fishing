

local lastState = 0

local PlayerData = { 
    IsPlayerFishing     = false, 
    CurrentUsedLure     = nil,
    IsReady             = false, 
    Status              = nil,
    FishStatus          = 0,
    FishingLureCooldown = 0,
    FishForce           = 0.6,
    HorizontalMove      = 0,
    NextAttTime         = 0,
    
}

--[[-------------------------------------------------------
 Events
]]---------------------------------------------------------

RegisterNetEvent("tpz_fishing:client:useSelectedFishingBait")
AddEventHandler("tpz_fishing:client:useSelectedFishingBait", function(selectedBait)

    Citizen.CreateThread(function()

        Citizen.InvokeNative(0x1096603B519C905F, "MMFSH")

        PlayerData.IsPlayerFishing = true

        local sleep                = true
        PlayerData.CurrentUsedLure = selectedBait

        PlayerData.IsReady         = false

        while PlayerData.IsPlayerFishing do

            Citizen.Wait(0)

            GET_TASK_FISHING_DATA()

            if FISHING_GET_MINIGAME_STATE() == 1 and not PlayerData.IsReady then

                PlayerData.IsReady = true

                if Config.Debug then
                    print("Current bait: " .. PlayerData.CurrentUsedLure)
                end
                
                TaskSwapFishingBait(PlayerPedId(), PlayerData.CurrentUsedLure, 0)
                Citizen.InvokeNative(0x9B0C7FA063E67629, PlayerPedId(), PlayerData.CurrentUsedLure, 0, 1)
            end

            if HasMinigameOn then

                sleep = false

                local playerPed = PlayerPedId()

                if FISHING_GET_MINIGAME_STATE() == 2 then
                    FISHING_GET_MAX_THROWING_DISTANCE(math.random(25.0, 30.0))
                end

                if FISHING_GET_MINIGAME_STATE() == 6 then

                    if IsControlJustPressed(0, 0x8FFC75D6) then
                        FISHING_SET_F_(6, 128)
                    end

                    local bobberPosition = FISHING_GET_BOBBER_HANDLE()

                    local hookHandle = FISHING_GET_HOOK_HANDLE()
                    local hookPosition = GetEntityCoords(hookHandle)
                    local lured = false

                    if IsControlPressed(0, joaat("INPUT_DUCK")) then

                        local actualReelSpeed = Config.ReelSpeed

                        local playerCoords = GetEntityCoords(PlayerPedId(), true, true)

                        local distance = playerCoords - hookPosition

                        distance = hookPosition + distance * actualReelSpeed
                        SetEntityCoords(hookHandle, distance.x, distance.y, distance.z, false, false, false, false)
                    end

                    if FISHING_GET_LINE_DISTANCE() < 4.0 then
                        FISHING_SET_F_(14, 1.0)
                    else
                        FISHING_SET_F_(14, 0.4)
                    end

                    local fishHandle

                    for _, f in pairs(GetNearbyFishs(hookPosition, 50.0)) do

                        local fishPosition = GetEntityCoords(f)

                        if Config.Debug then
                            Citizen.InvokeNative(joaat("DRAW_LINE") & 0xFFFFFFFF, fishPosition, fishPosition + vec3(0, 0, 2.0), 255, 255, 0, 255)
                        end

                        if PlayerData.FishingLureCooldown <= GetGameTimer() then

                            local dist = #(hookPosition - fishPosition)
                            if dist <= 1.6 then
                                fishHandle = f
                            else
                                if IsFishInterested(GetEntityModel(f)) then
                                    TaskGoToEntity(f, bobberPosition, 100, 1, 1.0, 2.0, 0)
                                end
                            end

                            if not lured then
                                lured = true
                            end
                        end
                    end

                    if lured then
                        PlayerData.FishingLureCooldown = GetGameTimer() + (1 * 1000)
                    end

                    if fishHandle then

                        local probabilidadePuxar = math.random()

                        if probabilidadePuxar > 0.9 or probabilidadePuxar < 0.2 then

                            if FISHING_GET_F_(5) == 1 then
                                Citizen.InvokeNative(0xF0FBF193F1F5C0EA, fishHandle)

                                SetPedConfigFlag(fishHandle, 17, true)

                                Citizen.InvokeNative(0x1F298C7BD30D1240, playerPed)

                                ClearPedTasksImmediately(fishHandle, false, true)
                                TaskSetBlockingOfNonTemporaryEvents(fishHandle, true)

                                Citizen.InvokeNative(0x1A52076D26E09004, playerPed, fishHandle)

                                FISHING_SET_FISH_HANDLE(fishHandle)
                                PlayerData.FishForce = 0.6

                                FISHING_SET_TRANSITION_FLAG(4)
                            end
                        end
                    end
                end

                if FISHING_GET_MINIGAME_STATE() == 7 then
                    FishData.Weight = FISHING_GET_F_(8)

                    if IsControlJustPressed(0, 0x8FFC75D6) then
                        FISHING_SET_F_(6, 11)
                    end

                    local fishHandle = FISHING_GET_FISH_HANDLE()

                    if GetControlNormal(0, 0x390948DC) > 0 then
                        PlayerData.HorizontalMove = PlayerData.HorizontalMove - (0.05 * GetControlNormal(0, 0x390948DC))
                    end

                    if GetControlNormal(0, 0x390948DC) < 0 then
                        PlayerData.HorizontalMove = PlayerData.HorizontalMove + (0.05 * - GetControlNormal(0, 0x390948DC))
                    end

                    if PlayerData.HorizontalMove < 0 then
                        PlayerData.HorizontalMove = 0
                    end

                    if PlayerData.HorizontalMove > 1 then
                        PlayerData.HorizontalMove = 1
                    end

                    FISHING_SET_F_(22, PlayerData.HorizontalMove)


                    if FISHING_GET_LINE_DISTANCE() < 4.0 then
                        FISHING_SET_F_(6, 12)
                        FISHING_SET_F_(14, 1.0)
                    else
                        FISHING_SET_F_(14, 1.0)
                    end

                    if GetGameTimer() >= PlayerData.NextAttTime then

                        local tempoPuxando
                        local probabilidadePuxar = math.random()

                        if probabilidadePuxar > 0.8 or probabilidadePuxar < 0.2 then
                            PlayerData.FishForce = 0.8
                            tempoPuxando = math.random(3, 5) * 1000
                            PlayerData.FishStatus = 1 -- agitado
                            PlayerData.NextAttTime = GetGameTimer() + tempoPuxando

                            local _fishHandle = FISHING_GET_FISH_HANDLE()
                            local x, y, z = table.unpack(GetEntityCoords(_fishHandle))

                            local r = exports["tpz_fishing"]:VERTICAL_PROBE(x, y, z, 1)
                            local valid, height = r[1], r[2]

                            -- import from ptfx on tpz_fishing c# version
                            local particlecoords = GetEntityCoords(_fishHandle)
                            RequestNamedPtfxAsset(joaat('scr_mg_fishing'))
                            while not HasNamedPtfxAssetLoaded(joaat('scr_mg_fishing')) do
                                Wait(5)
                            end

                            UseParticleFxAsset("scr_mg_fishing")
                            local Fisheffect = StartParticleFxNonLoopedAtCoord("scr_mg_fish_struggle", particlecoords,
                                0.0, 0.0, math.random(0, 360) + 0.0001, 1.5, 0, 0, 0)
                            SetParticleFxLoopedAlpha(Fisheffect, 1.0)

                        else
                            PlayerData.FishForce = 0
                            tempoPuxando = math.random(6, 10) * 1000
                            PlayerData.FishStatus = 0 --calmo
                            PlayerData.NextAttTime = GetGameTimer() + tempoPuxando
                        end
                    end

                    if PlayerData.FishStatus == 1 then
                        if IsControlPressed(0, joaat("INPUT_GAME_MENU_OPTION")) then
                            FISHING_SET_ROD_WEIGHT(4)
                            PlayerData.FishForce = PlayerData.FishForce + 0.005
                        else
                            PlayerData.FishForce = PlayerData.FishForce - 0.005
                        end

                        if IsControlJustReleased(0, joaat("INPUT_GAME_MENU_OPTION")) then
                            FISHING_SET_ROD_WEIGHT(2)
                        end

                        if PlayerData.FishForce >= 1.4 then
                            FISHING_SET_F_(6, 11)
                        else
                            if PlayerData.FishForce < 0.8 then
                                PlayerData.FishForce = 0.8
                            end
                        end
                        TaskSmartFleeCoord(fishHandle, GetEntityCoords(playerPed), 40.0, 50, 8, 1077936128)

                        -- import from ptfx on tpz_fishing c# version
                        local particlecoords = GetEntityCoords(fishHandle)

                        RequestNamedPtfxAsset(joaat('scr_mg_fishing'))
                        while not HasNamedPtfxAssetLoaded(joaat('scr_mg_fishing')) do
                            Wait(5)
                        end

                        UseParticleFxAsset("scr_mg_fishing")
                        local Fisheffect = StartParticleFxNonLoopedAtCoord("scr_mg_fish_struggle", particlecoords, 0.0,
                            0.0, math.random(0, 360) + 0.0001, 1.5, 0, 0, 0)
                        SetParticleFxLoopedAlpha(Fisheffect, 1.0)
                    else

                        if IsControlJustPressed(0, joaat("INPUT_GAME_MENU_OPTION")) or (IsControlPressed(0, joaat("INPUT_GAME_MENU_OPTION")) and GetGameTimer() % 25 == 0) then
                            FISHING_SET_ROD_WEIGHT(4)
                            TaskGoToEntity(fishHandle, playerPed, Config.Difficulty, 1.0, 1.5, 0.0, 0)
                        end

                        if IsControlJustReleased(0, joaat("INPUT_GAME_MENU_OPTION")) then
                            FISHING_SET_ROD_WEIGHT(2)
                        end
                    end

                    if FISHING_GET_F_(6) ~= 11 and FISHING_GET_F_(6) ~= 12 then
                        FISHING_SET_F_(13, PlayerData.FishForce)
                        FISHING_SET_F_(21, PlayerData.FishForce)
                    end

                    if IsControlJustPressed(0, joaat("INPUT_ATTACK")) then
                        FISHING_SET_ROD_POSITION_UD(0.6)
                    end

                    if IsControlJustReleased(0, joaat("INPUT_ATTACK")) then
                        FISHING_SET_ROD_POSITION_UD(0.0)
                    end
                end

                if FISHING_GET_MINIGAME_STATE() == 12 then
                    if IsControlJustPressed(0, joaat("INPUT_ATTACK")) then
                        if PlayerData.IsPlayerFishing then
                            FISHING_SET_TRANSITION_FLAG(32)
                            PlayerData.IsPlayerFishing = false

                            PlayerData.Status = "keep"

                            local entity = FISHING_GET_FISH_HANDLE()
                            local fishModel = GetEntityModel(entity)
                            local currentWeaponId = exports.tpz_weapons:getWeaponsAPI().getUsedWeaponData().weaponId

                            TriggerServerEvent("tpz_fishing:server:addFishItemToPlayerInventory", fishModel, PlayerData.CurrentUsedLure, currentWeaponId)

                            SetEntityAsMissionEntity(entity, true, true)
                            Citizen.Wait(3000)
                            DeleteEntity(entity)
                            Citizen.InvokeNative(0x9B0C7FA063E67629, PlayerPedId(), "", 0, 1)
                        end
                    end

                    if IsControlJustPressed(0, joaat("INPUT_AIM")) then
                        if PlayerData.IsPlayerFishing then
                            PlayerData.IsPlayerFishing = false

                            PlayerData.Status = "throw"

                            local entity = FISHING_GET_FISH_HANDLE()
                            local fishModel = GetEntityModel(entity)
                            Citizen.InvokeNative(0x9B0C7FA063E67629, PlayerPedId(), "", 0, 1)
                            FISHING_SET_TRANSITION_FLAG(64)

                            SetEntityAsMissionEntity(entity, true, true)
                            Citizen.Wait(3000)
                            DeleteEntity(entity)
                        end
                    end

                    if FISHING_GET_F_(5) == 96 and FISHING_GET_F_(6) == 0 then
                        PlayerData.IsPlayerFishing = false
                        Citizen.InvokeNative(0x9B0C7FA063E67629, PlayerPedId(), "", 0, 1)
                        local entity = FISHING_GET_FISH_HANDLE()
                        SetEntityAsMissionEntity(entity, true, true)
                        Citizen.Wait(3000)
                        DeleteEntity(entity)
                    end
                end

                if IsControlJustPressed(0, joaat("INPUT_TOGGLE_HOLSTER")) then
                    PlayerData.IsPlayerFishing = false
                    FISHING_SET_TRANSITION_FLAG(8)
                    Citizen.InvokeNative(0x9B0C7FA063E67629, PlayerPedId(), "", 0, 1)
                end
            end

            lastState = FISHING_GET_MINIGAME_STATE()

            if sleep then
                Citizen.Wait(1500)
            end

        end
    end)
end)

--[[-------------------------------------------------------
 Minigame Tasks (Prompts)
]]---------------------------------------------------------

Citizen.CreateThread(function()
    RegisterAllPrompts()

    while true do
        Citizen.Wait(0)

        if FISHING_GET_MINIGAME_STATE() == 1 then
            PromptSetActiveGroupThisFrame(Prompts.Prepare.Group, CreateVarString(10, "LITERAL_STRING", Locales['READY_TO_FISH']))
        end

        if FISHING_GET_MINIGAME_STATE() == 6 then
            PromptSetActiveGroupThisFrame(Prompts.Waiting.Group, CreateVarString(10, "LITERAL_STRING", Locales['FISHING']))
        end

        if FISHING_GET_MINIGAME_STATE() == 7 then
            FishData.Weight = FISHING_GET_F_(8)
            PromptSetActiveGroupThisFrame(Prompts.Hook.Group, CreateVarString(10, "LITERAL_STRING", Locales['GET_THE_FISH']))
        end

        if FISHING_GET_MINIGAME_STATE() == 12 then

            if FishList[GetEntityModel(FISHING_GET_FISH_HANDLE())] then
                PromptSetActiveGroupThisFrame(Prompts.Finish.Group, CreateVarString(10, "LITERAL_STRING", Locales['FISH_NAME'] .. " : " .. FishList[GetEntityModel(FISHING_GET_FISH_HANDLE())][1] .. " | " .. Locales['FISH_WEIGHT'] .. " : " .. string.format("%.2f%%", (FishData.Weight * 54.25)):gsub("%%", "") .. "Kg"))
            end

        end
    end
end)



