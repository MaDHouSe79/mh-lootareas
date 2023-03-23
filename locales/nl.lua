--[[ ===================================================== ]]--
--[[            MH Loot Areas Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

local Translations = {
    info = {
        ['pickup_weed'] = "Cannabis plukken",
        ['pickup_weed_loading_txt'] = "Cannabis plukken...",
        ['pickup_meth'] = "Methylamine verzamelen",
        ['pickup_meth_loading_txt'] = "Methylamine verzamelen...",
        ['pickup_coke'] = "Colablaadjes plukken",
        ['pickup_coke_loading_txt'] = "Colablaadjes plukken...",
        ['searching'] = "Gebied doorzoeken",
        ['not_find_anyting'] = "Je hebt niets gevonden...",
        ['already_taken'] = "Sorry, deze is al geloot...",
        ['areas_reset'] = "Alle gebieden zijn weer gereset! ",
        ['pickup_scrap'] = "Schroot verzamelen",
        ['pickup_scrap_loading_txt'] = "Schroot verzamelen...",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})