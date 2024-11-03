RegisterNetEvent("ex_coke:RazcepiKokata")
AddEventHandler("ex_coke:RazcepiKokata", function(k,v)
	
	local animDict = "misscarsteal1car_1_ext_leadin"
	local animName = "base_driver2"
	
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(10)
	end
	
	if not IsPedInAnyVehicle(PlayerPedId()) then
		TaskPlayAnim(PlayerPedId(),"misscarsteal1car_1_ext_leadin","base_driver2",8.0, -8, -1, 49, 0, 0, 0, 0)
		FreezeEntityPosition(PlayerPedId(), true)
		exports['progressBars']:startUI(v.ConversionTime, v.ProgressBarText)
		Wait(v.ConversionTime)
		FreezeEntityPosition(PlayerPedId(), false)
		ClearPedTasks(PlayerPedId())
	else
		exports['progressBars']:startUI(v.ConversionTime, v.ProgressBarText)
		Wait(v.ConversionTime)
	end
end)