--====================================================================================================
--PRE INIT
--====================================================================================================

-- info

ei_mod = {}
ei_mod.stage = "data"

ei_mod.dev_mode = false

-- lib and paths

require("lib/paths")

--====================================================================================================
--MAIN CONTENT CODE
--====================================================================================================

-- add new categories, entities, items, techs, recipes fluids, resources

-- setup pipe covers
require("prototypes/pipe-covers")
-- add other
require("prototypes/other")
-- add age-techs
require("prototypes/age_techs")
-- add dark age prototypes
require("prototypes/dark_age/dark_age")
-- add steam age prototypes
require("prototypes/steam_age/steam_age")

--====================================================================================================
--COMPATIBILITY CODE
--====================================================================================================