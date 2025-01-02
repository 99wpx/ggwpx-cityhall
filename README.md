# ggwpx-cityhall

-- Description: A City Hall system that integrates with QBCore for FiveM servers, providing access to documents and jobs.
--
-- Features:
-- - Interact with a Ped to access documents like ID Cards.
-- - Join various jobs (e.g., Taxi, Bus, Tow, Garbage).
-- - Supports both qb-target and interact for flexible interactions.
-- - Easily configurable through the config.lua file for Ped details, job locations, and documents.
-- - Simple and clean integration into your server.

Config = {}

--=========================================================
-- Configurations for Ped and Interactions
--=========================================================
Config.TypeTarget = 'interact' -- 'qb-target' , 'interact'

Config.Ped = {
    model = "a_m_m_business_01", -- Ped model
    coords = vector4(-552.1713, -191.6812, 38.2193, 206.6887), -- Coordinates for the Ped's location
}

Config.Documents = {
    { label = "ID Card", value = "id_card" }, -- Document available to claim
    -- { label = "Driver License", value = "driver_license" } -- Additional documents can be added
}

--=========================================================
-- Jobs Available for Players
--=========================================================
Config.Jobs = {
    { label = "Civilian", job = "unemployed", coords = vector3(0, 0, 0) }, -- Default job for civilians
    { label = "Taxi", job = "taxi", coords = vector3(909.5, -177.35, 74.22) },
    { label = "Bus", job = "bus", coords = vector3(462.22, -641.15, 28.45) },
    { label = "Tow", job = "tow", coords = vector3(471.39, -1311.03, 29.21) },
    { label = "Garbage", job = "garbage", coords = vector3(-322.24, -1546.02, 30.02) },
}

--=========================================================
-- Discord Link and Support Information
--=========================================================
-- For support, updates, or to join our community, visit:
-- Discord: https://discord.gg/Q6AbZgkJFq
