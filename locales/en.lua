--[[ ===================================================== ]]--
--[[            MH Loot Areas Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

local Translations = {
    info = {
        ['pickup_weed'] = "Pickup Cannabis",
        ['pickup_weed_loading_txt'] = "Picking cannabis...",
        ['pickup_meth'] = "Collect methylamine",
        ['pickup_meth_loading_txt'] = "Collect methylamine..",
        ['pickup_coke'] = "Pickup Cokeleaf",
        ['pickup_coke_loading_txt'] = "Picking coke leaves...",
        ['searching'] = "Search Area",
        ['not_find_anyting'] = "You didn't find anything...",
        ['already_taken'] = "Sorry, this is already taken...",
        ['areas_reset'] = "All areas has been reset!",
        ['pickup_scrap'] = "Collect Scrap",
        ['pickup_scrap_loading_txt'] = "Collect scrap...",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})