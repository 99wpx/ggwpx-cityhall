# ggwpx-cityhall

## Description

The `ggwpx-cityhall` script provides a City Hall system for FiveM servers, integrated with QBCore, offering an interactive interface for players to access various government services. Players can interact with a Ped to access documents and join jobs such as Taxi, Bus, Tow, and Garbage. The system supports various document types (e.g., ID Card) and integrates seamlessly with both `qb-target` and `interact` for player interactions.

### Key Features:
- **Interactive Ped**: Players can interact with the City Hall Ped to access services.
- **Document Access**: Players can claim important documents like ID Cards.
- **Job System**: Players can sign up for various jobs (e.g., Taxi, Tow, Garbage).
- **Configurable**: Easily configure Ped models, coordinates, available documents, and jobs.
- **Target System**: Supports both `qb-target` and `interact` for flexible player interactions.

---

## Configuration

```lua
Config = {}

-- Target Type: 'qb-target' or 'interact'
Config.TypeTarget = 'interact'

-- Ped Configuration (model and coordinates)
Config.Ped = {
    model = "a_m_m_business_01", -- Ped model
    coords = vector4(-552.1713, -191.6812, 38.2193, 206.6887), -- Ped location coordinates
}

-- Available Documents
Config.Documents = {
    { label = "ID Card", value = "id_card" },
    -- { label = "Driver License", value = "driver_license" } -- Additional documents can be added
}

-- Job List
Config.Jobs = {
    { label = "Civilian", job = "unemployed", coords = vector3(0, 0, 0) },
    { label = "Taxi", job = "taxi", coords = vector3(909.5, -177.35, 74.22) },
    { label = "Bus", job = "bus", coords = vector3(462.22, -641.15, 28.45) },
    { label = "Tow", job = "tow", coords = vector3(471.39, -1311.03, 29.21) },
    { label = "Garbage", job = "garbage", coords = vector3(-322.24, -1546.02, 30.02) },
}
