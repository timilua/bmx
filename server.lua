ESX.RegisterUsableItem(Config.BMXITEM, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if source == nil and xPlayer == nil then return end
    xPlayer.removeInventoryItem(Config.BMXITEM, 1)
    TriggerClientEvent("bmx:client", source)
end)

RegisterNetEvent("bmx:server")
AddEventHandler("bmx:server", function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if source == nil and xPlayer == nil then return end
    xPlayer.addInventoryItem(Config.BMXITEM, 1)
end)