local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-cityhall:server:GiveDocument", function(docType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}

    if docType == "id_card" then
        info = {
            citizenid = Player.PlayerData.citizenid,
            firstname = Player.PlayerData.charinfo.firstname,
            lastname = Player.PlayerData.charinfo.lastname,
            birthdate = Player.PlayerData.charinfo.birthdate,
            gender = Player.PlayerData.charinfo.gender,
            nationality = Player.PlayerData.charinfo.nationality,
        }
        exports['qb-inventory']:AddItem(src, "id_card", 1, false, info, 'qb-cityhall:server:GiveDocument')
    elseif docType == "driver_license" then
        info = {
            firstname = Player.PlayerData.charinfo.firstname,
            lastname = Player.PlayerData.charinfo.lastname,
            birthdate = Player.PlayerData.charinfo.birthdate,
            type = "Class C Driver License",
        }
        exports['qb-inventory']:AddItem(src, "driver_license", 1, false, info, 'qb-cityhall:server:GiveDocument')
    else
        TriggerClientEvent('QBCore:Notify', src, "Invalid document type.", "error")
        return
    end

    TriggerClientEvent('QBCore:Notify', src, "You received your " .. docType, "success")
end)

RegisterServerEvent("qb-cityhall:server:SetJob", function(job)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob(job, 0)
    TriggerClientEvent('QBCore:Notify', src, "You are now working as a " .. job, "success")
end)
