Config = {}
Config.CircleZones = {
	CokeField = {coords = vector3(2806.5, 4774.46, 46.98), name = ('Coke'), radius = 100.0},
	CokeProcessing = {coords = vector3(1087.14, -3195.31, -38.99), name = ('Coke Process'), radius = 20.0}, 
	CokePowder = {coords = vector3(1092.9, -3196.65, -38.99), name = ('Powder Cutting'), radius = 20.0},--vector3(1092.9, -3196.65, -38.99)
	CokeBrick = {coords = vector3(1099.57, -3194.35, -38.99), name = ('Brick Up Packages'), radius = 20.0},--vector3(1099.57, -3194.35, -38.99)
}
-- Conversion Settings:
Config.DrugConversion = {
	{ 
		UsableItem 				= "coke_brick",					-- име на предмет в базата данни за използваем предмет
		RewardItem 				= "coke10g",					-- име на предмет в базата данни за необходимия предмет
		RewardAmount 			= {a = 6, b = 10},				-- Количество RewardItem, което играчът получава. "a" е без везна, а "b" е с везна
		MaxRewardItemInv		= {e = 44, f = 40},				-- Количеството RewardItem, което играчът може да съхранява в инвентара. "e" е без везна, а "f" е с везна
		RequiredItem 			= "drugbags",					-- име на предмет в базата данни за необходимия предмет
		RequiredItemAmount 		= {c = 6, d = 10},				-- Количество RequiredItem за преобразуване. "c" е без везна, а "d" е с везна
		HighQualityScale		= true,							-- активиране/деактивиране на функцията за везна за drugType
		hqscale					= "hqscale",					-- име на предмет в базата данни за везната
		ProgressBarText			= "Кока 100G > Кока 10G",	    -- текст за progressbar
		ConversionTime			= 5000,							-- Време за чакане в MS
	},
	{ 
		UsableItem 				= "coke10g",					-- име на предмет в базата данни за използваем предмет
		RewardItem 				= "coke1g",						-- име на предмет в базата данни за необходимия предмет
		RewardAmount 			= {a = 6, b = 10},				-- Количество RewardItem, което играчът получава. "a" е без везна, а "b" е с везна
		MaxRewardItemInv		= {e = 44, f = 40},				-- Количеството RewardItem, което играчът може да съхранява в инвентара. "e" е без везна, а "f" е с везна
		RequiredItem 			= "drugbags",					-- име на предмет в базата данни за необходимия предмет
		RequiredItemAmount 		= {c = 6, d = 10},				-- Количество RequiredItem за преобразуване. "c" е без везна, а "d" е с везна
		HighQualityScale		= true,							-- активиране/деактивиране на функцията за везна за drugType
		hqscale					= "hqscale",					-- име на предмет в базата данни за везната
		ProgressBarText			= "Кока 10G > Кока 1G",			-- текст за progressbar
		ConversionTime			= 5000,							-- Време за чакане в MS
	}
}


