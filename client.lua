local isBMX = false

CreateThread(function()
    exports.qtarget:AddTargetModel(Config.BMXITEM, {
        options = {
            {
                event = "bmx:client",
                icon = "fas fa-bicycle",
                label = "Prendre le bmx",
            },
        },
        distance = 1.5
    })
end)

local function BMX()
    if not isBMX then
        isBMX = true
        if not IsPedInAnyVehicle(PlayerPedId()) then
            local playerid = PlayerPedId()
            local hash = GetHashKey('bmx')
            RequestModel()
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Wait(100)
            end
            bike = CreateVehicle(hash, GetEntityCoords(playerid), GetEntityHeading(playerid), true, true)
            SetVehicleOnGroundProperly(bike)
        end
    else
        DeleteEntity(bike)
        isBMX = false
        TriggerServerEvent("bmx:server")
    end
end

RegisterNetEvent("bmx:client", BMX)