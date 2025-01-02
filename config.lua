Config = {}

--=========================================================
--  _______   ______ ____    __    ____  ______   ___   ___ 
-- /  _____| /  ____|\   \  /  \  /   / |   _  \  \  \ /  / 
--|  |  __  |  |  __  \   \/    \/   /  |  |_)  |  \  V  /  
--|  | |_ | |  | |_ |  \            /   |   ___/    >   <   
--|  |__| | |  |__| |   \    /\    /    |  |       /  .  \  
-- \______|  \______|    \__/  \__/     |__|      /__/ \__\ 
--=========================================================
--      JOIN DISCORD : https://discord.gg/Q6AbZgkJFq
--=========================================================

Config.TypeTarget = 'interact' -- 'qb-target' , 'interact'

Config.Ped = {
    model = "a_m_m_business_01", -- Model ped
    coords = vector4(-552.1713, -191.6812, 38.2193, 206.6887), 
}

Config.Documents = {
    { label = "ID Card", value = "id_card" },
    --{ label = "Driver License", value = "driver_license" }
}

Config.Jobs = {
    { label = "Civilian", job = "unemployed", coords = vector3(0, 0, 0) },
    { label = "Taxi", job = "taxi", coords = vector3(909.5, -177.35, 74.22) },
    { label = "Bus", job = "bus", coords = vector3(462.22, -641.15, 28.45) },
    { label = "Tow", job = "tow", coords = vector3(471.39, -1311.03, 29.21) },
    { label = "Tow", job = "tow", coords = vector3(471.39, -1311.03, 29.21) },
    { label = "Garbage", job = "garbage", coords = vector3(-322.24, -1546.02, 30.02) }
}
