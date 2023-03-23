--[[ ===================================================== ]]--
--[[            MH Loot Areas Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

Config = {}
Config.debugPoly = true
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
--
Config.SendAreaClearMessage = false
--
Config.UseStress = false
Config.GainStressAmount = math.random(1, 3)
--
Config.UseRandomCount = true
Config.RandomItemsAmount = math.random(2, 4)
--
Config.ResetTimer = 900 --( 900 * 1000 ) this wil eset the entities so you can loot it again after the reset Area.
--
Config.MinMaxMoneyWin = math.random(20, 40)
--
Config.SearchTime = math.random(10000, 15000)

--
Config.Loot = {
    ['easy']   = {'water', 'tosti', 'money',},
    ['normal'] = {'beer', 'whiskey', 'vodka', 'money', 'bandage', 'iphone', 'samsungphone', 'rolex', 'diamond_ring', 'goldchain', 'acetone', 'lithium'},
    ['rare']   = {'security_card_01', 'security_card_02', 'meth', 'coke_brick', 'money'},
    ['scrap']  = {'plastic', 'metalscrap', 'copper', 'aluminum', 'iron', 'steel', 'rubber', 'glass', 'money'},
    ['weed']   = {'cannabis'},
    ['meth']   = {'methylamine'},
    ['coke']   = {'cocaineleaf'},
}

-- you can add other props if you want (https://gtahash.ru/)
--[[ Random Loot ]]--
Config.TargetProps = {
    -- Scrap Items
    ['scrapItems'] = {
        {hash = 591265130, prop = 'prop_rub_carwreck_2', loot = 'scrap', chance = 90, type = "item"},
        {hash = -915224107, prop = 'prop_rub_carwreck_3', loot = 'scrap', chance = 90, type = "item"},
        {hash = -273279397, prop = 'prop_rub_carwreck_5', loot = 'scrap', chance = 90, type = "item"},
        {hash = 322493792, prop = 'prop_rub_carwreck_7', loot = 'scrap', chance = 90, type = "item"},
        {hash = 10106915, prop = 'prop_rub_carwreck_8', loot = 'scrap', chance = 90, type = "item"},
        {hash = 1120812170, prop = 'prop_rub_carwreck_9', loot = 'scrap', chance = 90, type = "item"},
        {hash = 1898296526, prop = 'prop_rub_carwreck_10', loot = 'scrap', chance = 90, type = "item"},
        {hash = 1069797899, prop = 'prop_rub_carwreck_11', loot = 'scrap', chance = 90, type = "item"},
        {hash = 1434516869, prop = 'prop_rub_carwreck_12', loot = 'scrap', chance = 90, type = "item"},
        {hash = -896997473, prop = 'prop_rub_carwreck_13', loot = 'scrap', chance = 90, type = "item"},
        {hash = -1748303324, prop = 'prop_rub_carwreck_14', loot = 'scrap', chance = 90, type = "item"},
        {hash = -1366478936, prop = 'prop_rub_carwreck_15', loot = 'scrap', chance = 90, type = "item"},
        {hash = 2090224559, prop = 'prop_rub_carwreck_16', loot = 'scrap', chance = 90, type = "item"},
    },
    -- Airport Loot boxen
    ['aircargos'] = {
        {hash = 1891269362, prop = 'prop_air_cargo_01b', loot = 'easy', chance = 90, type = "item"},
    },
    ['airtrailers'] = {
        {hash = -397607777, prop = 'prop_air_trailer_1a', loot = 'normal', chance = 70, type = "item"},
    },
    ['boxpile'] = {
        {hash = 519908417, prop = 'prop_boxpile_07d', loot = 'normal', chance = 50, type = "item"},
    },
    ['boxwood'] = {
        {hash = 307713837, prop = 'prop_box_wood07a', loot = 'rare', chance = 25, type = "item"},
    },

    -- Drugs harvest
    ['weed'] = {
        {hash = 452618762, prop = 'prop_weed_02', loot = 'weed', amount = 15, chance = 100, type = "drugs"},
    },
    ['meth'] = {
        {hash = 1298403575, prop = 'prop_barrel_02a', loot = 'meth', amount = 15, chance = 100, type = "drugs"},
    },
    ['coke'] = {
        {hash = -1719175883, prop = 'prop_plant_fern_02b', loot = 'coke', amount = 15, chance = 100, type = "drugs"},
    },
}

--[[ Drugs ]]--
Config.UseDrugsLoot = true
-- change all locations if you want to use this
-- cause it is now on the airport as demo.
Config.DrugsAreas = { 
    ['weed'] = {coords = vector3(-1021.5588, -2983.8069, 13.9479), radius = 35},
    ['meth'] = {coords = vector3(-1088.0430, -2975.3093, 13.9449), radius = 35},
    ['coke'] = {coords = vector3(-1047.6152, -2918.8555, 13.9526), radius = 35},
}