--[[ ===================================================== ]]--
--[[            MH Loot Areas Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--
local QBCore = exports['qb-core']:GetCoreObject()
local isBizy = false
local lootedEntities = {}
local drugsProps = {}

local function Reset()
    for k, v in pairs(lootedEntities) do
        v = nil
    end
    lootedEntities = {}
end

local function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end
end

local function GetRandomPosition(coords, radius)
    local x = (coords.x + math.random(-radius, radius)) 
	local y = (coords.y + math.random(-radius, radius)) 
	local _, z = GetGroundZFor_3dCoord(x, y, coords.z, 0)
    return x, y, z
end

local function IsAlreadyLooted(entity)
    local isLooted = false
    if lootedEntities[entity] then isLooted = true end
    return isLooted
end

local function SetIsLooted(entity)
    if not lootedEntities[entity] then lootedEntities[entity] = true end
end

local function LootEntity(entity, loot, chance)
    if not IsAlreadyLooted(entity) then
        SetIsLooted(entity)
        isBizy = true
        LocalPlayer.state:set("inv_busy", true, true) -- lock
        TaskTurnPedToFaceEntity(PlayerPedId(), entity, 5000)
        Wait(1000)
        FreezeEntityPosition(PlayerPedId(), true)
        QBCore.Functions.Progressbar('searching', Lang:t('info.pickup_'..loot..'_loading_txt'), Config.SearchTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "amb@world_human_gardener_plant@male@base",
            anim = "base",
            flags = 49,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('mh-lootareas:server:loot', entity, loot, chance)
            LocalPlayer.state:set("inv_busy", false, true) -- unlock
            isBizy = false
            FreezeEntityPosition(PlayerPedId(), false)
        end, function() -- cansel
            LocalPlayer.state:set("inv_busy", false, true) -- unlock
            isBizy = false
            FreezeEntityPosition(PlayerPedId(), false)
        end)
    else
        QBCore.Functions.Notify(Lang:t('info.already_taken'), "error", 5000)
    end
end

local function DeleteAllProps()
    for k, v in pairs(drugsProps) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
    end
end

local function LoadTargetProps()
    lootedEntities = {}
    for k, props in pairs(Config.TargetProps) do
        for k, v in pairs(props) do
            if v.loot then
                if v.type == 'item' then
                    if Config.Target == "qb-target" then
                        exports['qb-target']:AddTargetModel(v.hash, {
                            options = {
                                {
                                    type = "client",
                                    icon = "fas fa-hand",
                                    label = Lang:t('info.searching'),
                                    action = function(entity) LootEntity(entity, v.loot, v.chance) end,
                                    canInteract = function(entity, distance, data)
                                        if IsPedAPlayer(entity) or isBizy then return false end
                                        return true
                                    end
                                },
                            },
                            distance = 1.5 
                        })
                    elseif Config.Target == "ox_target" then
                        exports.ox_target:addModel(v.hash, {
                            icon = 'fas fa-hand',
                            label = Lang:t('info.searching'),
                            onSelect = function(data) return LootEntity(data.entity, v.loot, v.chance) end,
                            distance = 2
                        })
                    end
                end
            end
        end
    end
end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    LoadTargetProps()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        LoadTargetProps()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DeleteAllProps()
    end
end)

RegisterNetEvent('mh-lootareas:client:reset', function()
    Reset()
end)