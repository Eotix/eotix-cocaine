local ESX = exports['extendedmode']:getSharedObject()

CreateThread(function()
    exports['qtarget']:AddCircleZone("kokain:vlez:vutre", vector3(1242.16, -3113.78, 6.01), 1.2,
    { name = "kokain:vlez:vutre", debugPoly = false, useZ = true },
    { options = {
        { 
            event = "ex_coke:VlezVLaba", 
            icon = "fas fa-door-open", 
            label = 'Влез'
        }
    },
        distance = 2.5
    })
    exports['qtarget']:AddCircleZone("kokain:izlez:wunka", vector3(1088.66, -3187.51, -38.83), 0.8,
    { name = "kokain:izlez:wunka", debugPoly = false, useZ = true },
    { options = {
        { 
            event = "ex_coke:IzlezOtLaba", 
            icon = "fas fa-door-open", 
            label = 'Излез'
        }
    },
        distance = 2.5
    })
    exports['qtarget']:AddCircleZone("kokain:Izwlichane", vector3(1086.551, -3198.306, -39.1942), 0.8,
    { name = "kokain:Izwlichane", debugPoly = false, useZ = true },
    { options = {
        { 
            event = "ex_coke:ChisteneNaListaMenu", 
            icon = "fas fa-box-open", 
            label = 'Чистене на листа'
        }
    },
        distance = 2.5
    })
    exports['qtarget']:AddCircleZone("kokain:Nakiswane", vector3(1086.5548, -3194.993, -39.1942), 0.8,
    { name = "kokain:Nakiswane", debugPoly = false, useZ = true },
    { options = {
        { 
            event = "ex_coke:NakiswaneWBenzinMenu", 
            icon = "fas fa-box-open", 
            label = 'Накисни листата'
        }
    },
        distance = 2.5
    })
    exports['qtarget']:AddCircleZone("kokain:Fentanil", vector3(1090.0, -3195.336, -39.19725), 0.8,
    { name = "kokain:Fentanil", debugPoly = false, useZ = true },
    { options = {
        { 
            event = "ex_coke:RazrediMaterialaMenu", 
            icon = "fas fa-box-open", 
            label = 'Добави Фентанил'
        }
    },
        distance = 2.5
    })
    exports['qtarget']:AddCircleZone("kokain:Paketirane", vector3(1100.3636, -3199.414, -39.19412), 0.8,
    { name = "kokain:Paketirane", debugPoly = false, useZ = true },
    { options = {
        { 
            event = "ex_coke:PaketirayTuhlaMenu", 
            icon = "fas fa-box", 
            label = 'Пакетиране на стоката'
        }
    },
        distance = 2.5
    })
end)

RegisterNetEvent('ex_coke:VlezVLaba')
AddEventHandler('ex_coke:VlezVLaba', function()
    ESX.TriggerServerCallback('ex_coke:CheckItem', function(item) 
        if item > 0 then
            Wait(250)
            loadanimdict('mp_arresting')
            TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
            Wait(5500)
            ClearPedTasks(PlayerPedId())
            DoScreenFadeOut(100)
            Wait(750)
            SetEntityCoords(PlayerPedId(), 1088.76, -3187.68, -39.99, false, false, false, true)
            DoScreenFadeIn(100)
        else
            TriggerEvent('Eotix:Alert', 'error', 'БРАДЪРЕ НЯМАШ КЛЮЧ! НАМЕРИ НАСКО ЧЕРНИЯ :)')
        end
    end, 'cokelab_key')
end)

RegisterNetEvent('ex_coke:IzlezOtLaba')
AddEventHandler('ex_coke:IzlezOtLaba', function()
    Wait(250)
    loadanimdict('mp_arresting')
    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
    Wait(5500)
    ClearPedTasks(PlayerPedId())
    DoScreenFadeOut(100)
    Wait(750)
    SetEntityCoords(PlayerPedId(), 1242.16, -3113.78, 6.01, false, false, false, true)
    DoScreenFadeIn(100)
end)

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Wait(1)
		end
	end
end

RegisterNetEvent('ex_coke:ChisteneNaListaMenu')
AddEventHandler('ex_coke:ChisteneNaListaMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Лаборатория",
            txt = "Чистене на листа"
        },
        {
            id = 2,
            header = "Нужни предмети: 2x Кокаинови листа",
            txt = "",
            params = {
                event = "ex_coke:ChisteneNaLista",
            }
        }
    })
end)

RegisterNetEvent('ex_coke:ChisteneNaLista')
AddEventHandler('ex_coke:ChisteneNaLista', function()
    local pPed = PlayerPedId()
    local boxcoords = vector4(1101.81, -3193.14, -39.18, 90)
    ESX.TriggerServerCallback('ex_coke:CheckItem', function(item) 
        if item >= 2 then
            local finished = exports["reload-skillbar"]:taskBar(3000,math.random(5,15))
            if finished == 100 then
                local object = CreateObject(GetHashKey("bkr_prop_coke_box_01a"), boxcoords.x, boxcoords.y, boxcoords.z, true, true, false)
                -- Wait(2000)
                dict = "mp_arresting"
                clip = "a_uncuff"
                RequestAnimDict(dict)
                while (not HasAnimDictLoaded(dict)) do Wait(0) end
                TaskPlayAnim(pPed, dict, clip, 3.0, 1.0, -1, 49, 0, false, false, false)
                local hash = `ng_proc_leaves01`
                RequestModel(hash)
                while not HasModelLoaded(hash) do
                    Wait(100)
                    RequestModel(hash)
                end
                local prop = CreateObject(hash, GetEntityCoords(pPed), true, true, true)
                AttachEntityToEntity(prop, pPed, GetPedBoneIndex(pPed, 57005), 0.13, 0.05, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                FreezeEntityPosition(pPed, true)
                exports['progressBars']:startUI(6000, "Чистене на листата..")
                Wait(6000)
                DetachEntity(prop, false, false)
                DeleteEntity(prop)
                StopAnimTask(pPed, dict, clip, 1.0)
                Wait(0)
                FreezeEntityPosition(pPed, false)
                TriggerServerEvent('ex_coke:RemoveItem', 'coca_leaf', 2)
                TriggerServerEvent('ex_coke:GiveItem', 'clean_leaves', 1)
                DeleteObject(object)
            else
                TriggerEvent('Eotix:Alert', 'error', 'НЕ УСПЯ!')
            end
        else
            TriggerEvent('Eotix:Alert', 'error', 'НЯМАШ ЛИСТА Е МОЙ??')
        end
    end, 'coca_leaf') -- Plik s chist kokain
end)

RegisterNetEvent('ex_coke:NakiswaneWBenzinMenu')
AddEventHandler('ex_coke:NakiswaneWBenzinMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Лаборатория",
            txt = "Накисване на листата в бензин"
        },
        {
            id = 2,
            header = "Нужни предмети: 2x Плик чисти листа",
            txt = "",
            params = {
                event = "ex_coke:NakiswaneWBenzin",
            }
        }
    })
end)

RegisterNetEvent('ex_coke:NakiswaneWBenzin')
AddEventHandler('ex_coke:NakiswaneWBenzin', function()
    ESX.TriggerServerCallback('ex_coke:CheckItem', function(item) 
        if item >= 2 then
            local ped = PlayerPedId()
            local dict = "anim@amb@business@coc@coc_unpack_cut@" 
            local boxcoords = vector4(1087.2073, -3195.572, -38.99161, 89.999984)   
            RequestAnimDict(dict)
            RequestModel("bkr_prop_coke_box_01a")
            RequestModel("bkr_prop_coke_fullmetalbowl_02")
            RequestModel("bkr_prop_coke_fullscoop_01a")
            while not HasAnimDictLoaded(dict) and not HasModelLoaded("bkr_prop_coke_box_01a") and
                not HasModelLoaded("bkr_prop_coke_fullmetalbowl_02") and
                not HasModelLoaded("bkr_prop_coke_fullscoop_01a") do
                Wait(100)
            end 
            CokeBowl = CreateObject(GetHashKey('bkr_prop_coke_fullmetalbowl_02'), x, y, z, 1, 0, 1)
            CokeScoop = CreateObject(GetHashKey('bkr_prop_coke_fullscoop_01a'), x, y, z, 1, 0, 1)
            CokeBox = CreateObject(GetHashKey('bkr_prop_coke_box_01a'), x, y, z, 1, 0, 1)
            local targetRotation = vec3(180.0, 180.0, 0.0)
            local x, y, z = table.unpack(vector3(1087.31, -3196.04, -38.99))
            local netScene = NetworkCreateSynchronisedScene(x - 0.2, y - 0.1, z - 0.65, targetRotation, 2, false, false, 1148846080, 0, 1.3)    
            NetworkAddPedToSynchronisedScene(ped, netScene, dict, "fullcut_cycle_v1_cokepacker", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(CokeBowl, netScene, dict, "fullcut_cycle_v1_cokebowl", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(CokeBox, netScene, dict, 'fullcut_cycle_v1_cokebox', 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(CokeScoop, netScene, dict, 'fullcut_cycle_v1_cokescoop', 4.0, -8.0, 1)
            FreezeEntityPosition(ped, true)
            Wait(150)
            NetworkStartSynchronisedScene(netScene)
            SetEntityVisible(CokeScoop, false, 0)
            exports['progressBars']:startUI(43828, "Изсипване на листата в тава..")
            Wait(43828)
            RequestAnimDict("weapon@w_sp_jerrycan")
            while ( not HasAnimDictLoaded( "weapon@w_sp_jerrycan" ) ) do
                Wait(0)
            end
            TaskPlayAnim(PlayerPedId(),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
            exports['progressBars']:startUI(8000, "Изливане на бензин..")
            Wait(8000)
            ExecuteCommand('e wait')
            exports['progressBars']:startUI(8000, "Чакане на листата да се накиснат...")
            Wait(8000)
            -- Wait(2000)
            dict = "mp_arresting"
            clip = "a_uncuff"
            RequestAnimDict(dict)
            while (not HasAnimDictLoaded(dict)) do Wait(0) end
            TaskPlayAnim(ped, dict, clip, 3.0, 1.0, -1, 49, 0, false, false, false)
            local prop = CreateObject(hash, GetEntityCoords(ped), true, true, true)
            FreezeEntityPosition(ped, true)
            exports['progressBars']:startUI(6000, "Стържене на кокаин от листата..")
            Wait(6000)
            StopAnimTask(ped, dict, clip, 1.0)
            Wait(0)
            FreezeEntityPosition(ped, false)
            ClearPedTasks(ped)
            DeleteObject(CokeBowl)
            DeleteObject(CokeBox)
            DeleteObject(CokeScoop)
            FreezeEntityPosition(ped, false)
            TriggerServerEvent('ex_coke:RemoveItem', 'clean_leaves', 2)
            TriggerServerEvent('ex_coke:GiveItem', 'pure_coke', 1)
            Wait(GetAnimDuration(dict, "fullcut_cycle_v1_cokepacker") * 450)
            SetEntityVisible(CokeScoop, true, 0)
            Wait(GetAnimDuration(dict, "fullcut_cycle_v1_cokepacker") * 65)
            SetEntityVisible(CokeBox, false, 0)
            Wait(GetAnimDuration(dict, "fullcut_cycle_v1_cokepacker") * 245)
        else
            TriggerEvent('Eotix:Alert', 'error', 'НЯМАШ ЛИСТА Е МОЙ??')
        end
    end, 'clean_leaves')
end)

RegisterNetEvent('ex_coke:RazrediMaterialaMenu')
AddEventHandler('ex_coke:RazrediMaterialaMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Лаборатория",
            txt = "Добавяне на фентанил към материала"
        },
        {
            id = 2,
            header = "Нужни предмети: 1x Чист кокаин 100%",
            txt = "",
            params = {
                event = "ex_coke:RazrediMateriala",
            }
        }
    })
end)

RegisterNetEvent('ex_coke:RazrediMateriala')
AddEventHandler('ex_coke:RazrediMateriala', function()
    ESX.TriggerServerCallback('ex_coke:CheckItem', function(item) 
        if item > 0 then
            local pPed = PlayerPedId()
            FreezeEntityPosition(pPed, true)
            ExecuteCommand('e mechanic3')
            Wait(3000)
            ExecuteCommand('e c')
            Wait(200)
            ExecuteCommand('e mechanic4')
            exports['progressBars']:startUI(6000, "Добавяне на фентанил...")
            Wait(6000)
            ExecuteCommand('e mechanic3')
            Wait(3000)
            ExecuteCommand('e c')
            Wait(200)
            ExecuteCommand('e mechanic4')
            exports['progressBars']:startUI(6000, "Добавяне на кофеин...")
            Wait(6000)
            ExecuteCommand('e c')
            FreezeEntityPosition(pPed, false)
            TriggerServerEvent('ex_coke:RemoveItem', 'pure_coke', 1)
            TriggerServerEvent('ex_coke:GiveItem', 'diluted_coke', 1)
        else
            TriggerEvent('Eotix:Alert', 'error', 'НЯМАШ ЧИСТ КОКАИН?')
        end
    end, 'pure_coke')
end)

RegisterNetEvent('ex_coke:PaketirayTuhlaMenu')
AddEventHandler('ex_coke:PaketirayTuhlaMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Лаборатория",
            txt = "Пакетириане на кокаина в тухла"
        },
        {
            id = 2,
            header = "Нужни предмети:<br> 1x Разреден кокаин 65%<br>1x Черни Чували</br>",
            txt = "",
            params = {
                event = "ex_coke:PaketirayTuhla",
            }
        }
    })
end)

RegisterNetEvent('ex_coke:PaketirayTuhla')
AddEventHandler('ex_coke:PaketirayTuhla', function()
    ESX.TriggerServerCallback('ex_coke:CheckItem', function(item) 
        if item > 0 then
            ESX.TriggerServerCallback('ex_coke:CheckItem', function(item2) 
                if item2 > 0 then
	                local animDict = "misscarsteal1car_1_ext_leadin"
	                local animName = "base_driver2"
	                RequestAnimDict(animDict)
	                while not HasAnimDictLoaded(animDict) do
	                	Wait(10)
	                end
	                TaskPlayAnim(PlayerPedId(),"misscarsteal1car_1_ext_leadin","base_driver2",8.0, -8, -1, 49, 0, 0, 0, 0)
	                FreezeEntityPosition(PlayerPedId(), true)
	                exports['progressBars']:startUI(10000, 'Пакетиране на тухла..')
	                Wait(10000)
	                FreezeEntityPosition(PlayerPedId(), false)
	                ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('ex_coke:RemoveItem', 'black_bags', 1)
                    TriggerServerEvent('ex_coke:RemoveItem', 'diluted_coke', 1)
                    TriggerServerEvent('ex_coke:GiveItem', 'coke_brick', 1)
                else
                    TriggerEvent('Eotix:Alert', 'error', 'НЯМАШ ЧЕРНИ ЧУВАЛИ?')
                end
            end, 'black_bags')
        else
            TriggerEvent('Eotix:Alert', 'error', 'НЯМАШ РАЗРЕДЕН КОКАИН?')
        end
    end, 'diluted_coke')
end)

RegisterNetEvent('ex_coke:OpenSMS')
AddEventHandler('ex_coke:OpenSMS', function()
    local minigame = exports['hackingminigame']:Open()   
    if(minigame == true) then
        SetNewWaypoint(174.02725, -1547.385)
        -- HERE ADD YOUR OWN PHONE NOTIFICATION 
        TriggerEvent('phone:addnotification', 'EMAIL', "Брат ми отбелязвам ти един телефон, отиди на него и звънни на 3598966420!", 'NaskoCherniq@grp.bg', 'СМС С ЛОКАЦИЯ')
        exports['qtarget']:AddCircleZone("Zwynni:mehmed", vector3(174.02725, -1547.385, 29.261768), 0.8,
        { name = "Zwynni:mehmed", debugPoly = false, useZ = true },
        { options = {
            { 
                event = "ex_coke:SendphoneMemet", 
                icon = "fas fa-phone", 
                label = 'Използвай телефона'
            }
        },
            distance = 2.5
        })
    else
        print('ne staash za nish')
    end
end)


RegisterNetEvent('ex_coke:SendphoneMemet')
AddEventHandler('ex_coke:SendphoneMemet', function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'eotix-coke:OtworiTelefona', {
        title = "Въведи Тел. номер"
    }, function(datam, menu)
        menu.close()
        local NewPSS = tonumber(datam.value)
        if NewPSS ~= json.decode('3598966420') then
            exports["qtarget"]:RemoveZone("Zwynni:mehmed")
        else
            ExecuteCommand('e phonecall')
            exports['progressBars']:startUI(7000, "Разбирате се с Мехмед Лудия..")
            Wait(7000)
            ExecuteCommand('e c')
            SetNewWaypoint(1242.16, -3113.78)
            -- HERE ADD YOUR OWN PHONE NOTIFICATION 
            TriggerEvent('phone:addnotification', 'EMAIL', "Брат ми отбелязвам ти адреса на лабораторията, ама на никой не я казвай!", 'MehmedLudiq@grp.bg', 'СМС С ЛОКАЦИЯ')
            exports["qtarget"]:RemoveZone("Zwynni:mehmed")
        end
    end,
    function(datam, menu)
        menu.close()	
    end)
end)
