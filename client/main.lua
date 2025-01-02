local QBCore = exports['qb-core']:GetCoreObject()
local ped
local blip

CreateThread(function()
    local model = GetHashKey(Config.Ped.model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end

    ped = CreatePed(0, model, Config.Ped.coords.x, Config.Ped.coords.y, Config.Ped.coords.z - 1, Config.Ped.coords.w, false, false)
    SetEntityInvincible(ped, true)  
    FreezeEntityPosition(ped, true)  
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) 
    SetBlockingOfNonTemporaryEvents(ped, true)  

    local pedNetId = NetworkGetNetworkIdFromEntity(ped)
    SetNetworkIdCanMigrate(pedNetId, false)

    blip = AddBlipForCoord(Config.Ped.coords.x, Config.Ped.coords.y, Config.Ped.coords.z)
    SetBlipSprite(blip, 590)  
    SetBlipDisplay(blip, 4)  
    SetBlipScale(blip, 0.8)  
    SetBlipColour(blip, 2)   
    SetBlipAsShortRange(blip, true) 

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("City Hall Services")  
    EndTextCommandSetBlipName(blip)

    if Config.TypeTarget == 'qb-target' then
        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    label = "City Hall Services",
                    icon = "fas fa-building",
                    action = function()
                        OpenCityhallMenu()
                    end
                }
            },
            distance = 2.5
        })
    elseif Config.TypeTarget == 'interact' then
        exports.interact:AddEntityInteraction({
            netId = pedNetId,
            name = 'CityHallInteraction',
            id = 'cityHallUniqueId',
            distance = 8.0,
            interactDst = 5.5,
            options = {
                {
                    label = "City Hall Services",
                    action = function(entity, coords, args)
                        OpenCityhallMenu()  
                    end
                }
            }
        })
    end
end)


function OpenCityhallMenu()
    local menu = {
        {
            header = "City Hall Services",
            isMenuHeader = true
        },
        {
            header = "Documents",
            txt = "Request or renew your documents",
            params = { event = "qb-cityhall:client:OpenDocumentsMenu" }
        },
        {
            header = "Jobs",
            txt = "Apply for a job",
            params = { event = "qb-cityhall:client:OpenJobsMenu" }
        },
        {
            header = "Close",
            params = { event = "qb-menu:closeMenu" }
        }
    }
    exports['qb-menu']:openMenu(menu)
end

RegisterNetEvent("qb-cityhall:client:OpenDocumentsMenu", function()
    local menu = {
        {
            header = "Documents",
            isMenuHeader = true
        }
    }
    
    for _, doc in ipairs(Config.Documents) do
        menu[#menu + 1] = {
            header = doc.label,
            txt = "Get your " .. doc.label,
            params = { event = "qb-cityhall:client:RequestDocument", args = { type = doc.value } }
        }
    end
    
    menu[#menu + 1] = {
        header = "Close",
        params = { event = "qb-menu:closeMenu" }
    }

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("qb-cityhall:client:RequestDocument", function(data)
    TriggerServerEvent("qb-cityhall:server:GiveDocument", data.type)
end)

RegisterNetEvent("qb-cityhall:client:OpenJobsMenu", function()
    local menu = {
        {
            header = "Select Jobs",
            isMenuHeader = true
        }
    }

    for _, job in ipairs(Config.Jobs) do
        menu[#menu + 1] = {
            header = job.label,
            txt = "Apply for " .. job.label .. " job",
            params = { event = "qb-cityhall:client:SetJob", args = { job = job.job, coords = job.coords } }
        }
    end

    menu[#menu + 1] = {
        header = "Close",
        params = { event = "qb-menu:closeMenu" }
    }

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("qb-cityhall:client:SetJob", function(data)
    TriggerServerEvent("qb-cityhall:server:SetJob", data.job)
    SetNewWaypoint(data.coords.x, data.coords.y)
    QBCore.Functions.Notify("Waypoint set to your new job location!", "success")
end)
