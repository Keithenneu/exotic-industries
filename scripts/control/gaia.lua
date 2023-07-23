local model = {}

--====================================================================================================
--GAIA
--====================================================================================================

local tile_settings = {
}

local entity_settings = {
    ["tree-01"] = {frequency = 0, size = 0, richness = 0},
    ["tree-02"] = {frequency = 0, size = 0, richness = 0},
    ["tree-05"] = {frequency = 0, size = 0, richness = 0},
    ["tree-09"] = {frequency = 0, size = 0, richness = 0},
}

local decorative_settings = {
    ["green-pita"] = {frequency = 0.1, size = 1, richness = 1},
}

--====================================================================================================
--SURFACE CREATION
--====================================================================================================

--CREATE GAIA SURFACE
------------------------------------------------------------------------------------------------------

function model.create_gaia()

    -- check if the surface already exists
    if game.surfaces["gaia"] then
        return
    end
    
    -- create the surface
    local gaia = game.create_surface("gaia", {

        terrain_segmentation = 2,
        water = 20,
        starting_area = "none",
        peaceful_mode = true,

        cliff_settings = {
            name = "cliff", -- swap for custom cliffs later
            cliff_elevation_0 = 12, -- elevation of the first row of cliffs
            cliff_elevation_interval = 7, -- elevation difference between each row
            richness = 2,
        },

        autoplace_controls = {
            ["ei_neodym-patch"] = {frequency = 50, size = 1, richness = 1},
            ["ei_gold-patch"] = {frequency = 50, size = 0.5, richness = 1},
            ["ei_uranium-patch"] = {frequency = 0, size = 0, richness = 0},

            ["ei_core-patch"] = {frequency = 800, size = 2, richness = 0.5},
            ["ei_phytogas-patch"] = {frequency = 400, size = 1, richness = 0.5},
            ["ei_cryoflux-patch"] = {frequency = 400, size = 1, richness = 0.5},
        },

        default_enable_all_autoplace_controls = true,

        autoplace_settings = {
            tile = { treat_missing_as_default = true, settings = tile_settings},
            entity = { treat_missing_as_default = true, settings = entity_settings},
            decorative = { treat_missing_as_default = true, settings = decorative_settings},
        },

        property_expression_names = {
            enemy_base_probability = 0,

            -- make gaia high in plant life
            ["control-setting:moisture:bias"] = 0.7,
            --["control-setting:temperature:bias"] = 0.8,
            ["control-setting:moisture:frequency:multiplier"] = -10,
        },
    })

end

--====================================================================================================
--UTIL
--====================================================================================================

--DEV COMMANDS
------------------------------------------------------------------------------------------------------

-- give the player the spawner tool, when creating a new player
function model.spawn_command(event)

    if not event.player_index then
        return
    end

    local player = game.get_player(event.player_index)
    
    if event.command == "gaia" then
        game.print("Spawning Gaia")

        model.create_gaia()
        player.teleport({0,0}, "gaia")
    end
    
end

--====================================================================================================
--HANDLERS
--====================================================================================================

return model