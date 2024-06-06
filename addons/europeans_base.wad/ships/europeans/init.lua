-- RST
-- .. _lua_tribes_ships:
--
-- Ships
-- -----
--
-- Each tribe can have one ship that is used to explore the seas and transport
-- wares between ports.
--
-- Ships are defined in
-- ``data/tribes/ships/<tribe_name>/init.lua``.
--
-- .. function:: new_ship_type(table)
--
--    This function adds the definition of a ship to the engine.
--
--    :arg table: This table contains all the data that the game engine will
--                add to this ship. It contains the following entries:
--
--    **name**: A string containing the internal name of this ship.
--
--    **descname**: The translatable display name. Use ``pgettext`` to fetch the string.
--
--    **icon**: Path to the menu icon file.
--
--    **capacity**: An int defining how many wares or workers this ship can transport
--
--    **vision_range**: How far the ship can see.
--
--    **animations**: A table containing all animations for this ship.
--    Ships have an "idle", a "sinking" and a directional "sail" animation.
--
--    **names**: A list of strings with ship names presented to the user - be creative :)
--
-- For making the UI texts translateable, we also need to push/pop the correct textdomain.
--
-- Example:
--
-- .. code-block:: lua
--
--    push_textdomain("europeans_tribe.wad", true)
--
--    dirname = path.dirname(__file__)
--
--    wl.Descriptions():new_ship_type {
--       name = "europeans_ship",
--       descname = pgettext("europeans_ship", "Ship"),
--       animation_directory = dirname,
--       icon = dirname .. "menu.png",
--       capacity = 30,
--       vision_range = 4,
--
--       animations = {
--          idle = {
--             hotspot = { 89, 86 },
--             fps = 10
--          },
--          sinking = {
--             hotspot = { 89, 86 },
--             fps = 7
--          },
--          sail = {
--             hotspot = { 89, 86 },
--             fps = 10,
--             directional = true
--          }
--       },
--       names = {
--          pgettext("shipname", "Abaco"),
--          pgettext("shipname", "Agate"),
--       }
--    }
--
--    pop_textdomain()

push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ship_type {
    name = "europeans_ship",
    -- TRANSLATORS: This is the Europeans' ship's name used in lists of units
    descname = pgettext("europeans_ship", "Ship"),
    icon = dirname .. "menu.png",
    capacity = 32,
    vision_range = 4,
    
    hitpoints    = 50000,
    min_attack   =   100,
    max_attack   = 10000,
    defense         =  5,
    attack_accuracy = 60,
    heal_per_second = 100,

    animation_directory = dirname,
    spritesheets = {
        idle = {
           fps = 10,
           frames = 39,
           rows = 7,
           columns = 6,
           hotspot = { 58, 55 }
        },
        sail = {
           fps = 10,
           frames = 40,
           rows = 7,
           columns = 6,
           directional = true,
           hotspot = { 86, 85 }
        },
        sinking = {
           fps = 7,
           frames = 22,
           rows = 6,
           columns = 4,
           hotspot = { 58, 54 }
        },
   },

    names = {
        -- German / Greek / Roman Gods
        pgettext("shipname", "Aphrodite"),
        pgettext("shipname", "Apollo"),
        pgettext("shipname", "Ares"),
        pgettext("shipname", "Artemis"),
        pgettext("shipname", "Athena"),
        pgettext("shipname", "Ceres"),
        pgettext("shipname", "Demeter"),
        pgettext("shipname", "Dionysus"),
        pgettext("shipname", "Europa"),
        pgettext("shipname", "Freyr"),
        pgettext("shipname", "Gaia"),
        pgettext("shipname", "Hades"),
        pgettext("shipname", "Hephaestus"),
        pgettext("shipname", "Hera"),
        pgettext("shipname", "Hermes"),
        pgettext("shipname", "Hestia"),
        pgettext("shipname", "Jupiter"),
        pgettext("shipname", "Mars"),
        pgettext("shipname", "Mercury"),
        pgettext("shipname", "Neptune"),
        pgettext("shipname", "Odin"),
        pgettext("shipname", "Persephone"),
        pgettext("shipname", "Poseidon"),
        pgettext("shipname", "Prometheus"),
        pgettext("shipname", "Saturn"),
        pgettext("shipname", "Thor"),
        pgettext("shipname", "Uranus"),
        pgettext("shipname", "Venus"),
        pgettext("shipname", "Zeus"),
    }
}

pop_textdomain()
