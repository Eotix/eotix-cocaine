local ESX = exports['extendedmode']:getSharedObject()

-- print('baluk')845.95141, 2122.9184, 52.861194, 269.21902
local appearance = nil
CreateThread(function() 
    local inZone = false 
    local enteredZone = false 
    while true do 
    inZone = false 
    local sleep = 1000 
    local ped = PlayerPedId() 
    local pedCoords = GetEntityCoords(ped)
    local distance = #(pedCoords - vector3(-58.91, -1530.98, 34.5))
    if distance < 7 then
        sleep = 5
        DrawMarker(2, -58.91, -1530.98, 34.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.5, 0.5, 128, 47, 235, 155, 0, 0, 0, 1, 0, 0, 0)
        if distance < 1 then
            sleep = 5
            inZone = true
            if IsControlJustReleased(0, 38) then                   
                Pochukay()
            end
        end
    end
        if not enteredZone and inZone then
            Triggerevent('cd_drawtextui:ShowUI', 'show', '[E] АПАРТАМЕНТА НА НАСКО')
            enteredZone = true
        elseif enteredZone and not inZone then
            TriggerEvent('cd_drawtextui:HideUI')
            enteredZone = false
        end
        Wait(sleep)
    end
end)

Pochukay = function()
    local pPed = PlayerPedId()
    TriggerEvent('cd_drawtextui:HideUI')
    SetEntityHeading(pPed, 229.64)
    Wait(1500)
    dict = "mini@safe_cracking"
    clip = "idle_base"
    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do Wait(0) end
    TaskPlayAnim(pPed, dict, clip, 3.0, 1.0, -1, 49, 0, false, false, false)
    FreezeEntityPosition(pPed, true)
    exports['progressBars']:startUI(2000, "Слушане дали има някой вътре...")
    Wait(2000)
    StopAnimTask(pPed, dict, clip, 1.0)
    Wait(0)
    FreezeEntityPosition(pPed, false)
    TriggerEvent('Eotix:Alert', 'inform', 'НАСКО Е ВКЪЩИ!')
    -- local h = GetClockHours()
    -- if h > 18 then
        print('tuka e nasko')
        TriggerEvent('nh-context:sendMenu', {
            {
                id = 1,
                header = "НАСКО ЧЕРНИЯ",
                txt = "Закупи ключ за кокаинова лаборатория"
            },
            {
                id = 2,
                header = "Дай 20x Трева (1г) за ключа",
                txt = "",
                params = {
                    event = "ex_coke:OfertaSJoro",
                }
            }
        })
    -- else
    --     print('nasko ne wkushti ela pak')
    --     TriggerEvent('Eotix:Alert', 'inform', 'ИЗГЛЕЖДА, ЧЕ НАСКО НЕ Е ВКЪЩИ. ЕЛА ПО-КЪСНО!')
    -- end
end

RegisterNetEvent('ex_coke:OfertaSJoro')
AddEventHandler('ex_coke:OfertaSJoro', function()
    ESX.TriggerServerCallback('ex_coke:CheckItem', function(item) 
        if item > 0 then
            local pPed = PlayerPedId()
            FreezeEntityPosition(pPed, true)
            ExecuteCommand('e knock')
            exports['progressBars']:startUI(2000, "Чукане...")
            Wait(3000)
            FreezeEntityPosition(pPed, false)
            ExecuteCommand('e c')
            -- Wait(200)
            GetSkin()
            local x, y, z = table.unpack(GetEntityCoords(pPed, false))
            RequestCutscene('mp_intro_mcs_10_a2', 8)
            while not (HasCutsceneLoaded()) do
                Wait(0)
            end
            local model = GetHashKey("s_m_y_marine_01")
            RequestModel(model)
            while not HasModelLoaded(model) do
                RequestModel(model)
                Wait(0)
            end
            local ped = CreatePed(7, model, x, y, z - 40, 0.0, true, true)
            local ped2 = CreatePed(7, model, x, y, z - 40, 0.0, true, true)
            local ped3 = CreatePed(7, model, x, y, z - 40, 0.0, true, true)
            SetEntityVisible(ped2, false, false)
            SetEntityVisible(ped, false, false)
            SetEntityVisible(ped3, false, false)
            SetEntityCollision(ped2, false, false)
            SetEntityCollision(ped, false, false)
            SetEntityCollision(ped3, false, false)
            SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
            RegisterEntityForCutscene(pPed, 'MP_1', 0, 0, 64)
            SetCutsceneEntityStreamingFlags('MP_2', 0, 1)
            RegisterEntityForCutscene(ped, 'MP_2', 0, 0, 64)
            SetCutsceneEntityStreamingFlags('MP_3', 0, 1)
            RegisterEntityForCutscene(ped2, 'MP_3', 0, 0, 64)
            SetCutsceneEntityStreamingFlags('MP_4', 0, 1)
            RegisterEntityForCutscene(ped3, 'MP_4', 0, 0, 64)
            StartCutscene(0)
            while not (DoesCutsceneEntityExist('MP_2', 0)) do
                Wait(0)
            end
            while not (DoesCutsceneEntityExist('MP_1', 0)) do
                Wait(0)
            end
            while not (DoesCutsceneEntityExist('MP_3', 0)) do
                Wait(0)
            end
            while not (DoesCutsceneEntityExist('MP_4', 0)) do
                Wait(0)
            end
            ApplySkin()
            while not (HasCutsceneFinished()) do
                SetEntityCollision(pPed, true, true)
                Wait(0)
            end
            DeleteEntity(ped)
            DeleteEntity(ped2)
            DeleteEntity(ped3)
            ApplySkin()
            SetEntityCollision(pPed, true, true)
            TriggerServerEvent('ex_coke:GiveKey')
        else
            TriggerEvent('Eotix:Alert', 'error', 'НАСКО ЧЕРНИЯ : ЕЙ ХУЙО НЕМАШ МАТЕРИАЛ БЕГИ ОТ ТУКА!')
        end
    end, 'weed20g')
end)

GetSkin = function()
    TriggerEvent('skinchanger:getSkin', function(skin)
        appearance = skin
    end)
end

ApplySkin = function()
    TriggerEvent('skinchanger:loadSkin', appearance)
end

RegisterNetEvent('Eotix:Alert')
AddEventHandler('Eotix:Alert', function(cl, text)
    exports['mythic_notify']:DoHudText(cl, text)
end)