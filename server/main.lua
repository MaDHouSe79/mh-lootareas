--[[ ===================================================== ]]--
--[[            MH Loot Areas Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()

local resetTimer = 900 -- 900 -- 15 min
local netEntities = {}

local function ResetAreas()
    Citizen.SetTimeout(resetTimer * 1000, function()
        netEntities = {}
        if Config.SendAreaClearMessage then
            TriggerClientEvent('QBCore:Notify', -1, Lang:t('info.areas_reset'))
        end
        ResetAreas()
    end)
end

local function IsAlreadyLooted(netID)
    local isLooted = false
    if netEntities[netID] then isLooted = true end
    return isLooted
end

local function SetIsLooted(netID)
    if not netEntities[netID] then netEntities[netID] = true end
end

local function GainStress(id)
    local Player = QBCore.Functions.GetPlayer(id)
    local newStress = 0
    if not Player.PlayerData.metadata['stress'] then Player.PlayerData.metadata['stress'] = 0 end
    newStress = Player.PlayerData.metadata['stress'] + Config.GainStressAmount
    if newStress <= 0 then newStress = 0 end
    if newStress > 100 then newStress = 100 end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', id, newStress)
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        netEntities = {}
        ResetAreas()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        netEntities = {}
        ResetAreas()
    end
end)

RegisterNetEvent("mh-lootareas:server:loot", function(entity, type, chance)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not IsAlreadyLooted(entity) then
        local item = Config.Loot[type][math.random(1, #Config.Loot[type])] 
        local amount = Config.RandomItemsAmount
        SetIsLooted(entity)
        if Config.UseStress then GainStress(src) end
        if type == 'scrap' then  
            for _ = 1, Config.GainStressAmount, 1 do
                local randItem = Config.Loot[type][math.random(1, #Config.Loot[type])] 
                Player.Functions.AddItem(randItem, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
                Wait(500)
            end
        else
            local win = math.random(1, 100)
            if chance >= 100 then win = 100 end
            if win >= chance then
                if item == 'money' then
                    Player.Functions.AddMoney('cash', Config.MinMaxMoneyWin)
                else
                    Player.Functions.AddItem(item, amount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t('info.not_find_anyting'), "error")
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('info.already_taken'), "error")
    end
end)