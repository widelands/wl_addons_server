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
        -- German / Greek / Roman Gods or Giants
        pgettext("shipname", "Achlys"),
        pgettext("shipname", "Aether"),
        pgettext("shipname", "Aion"),
        pgettext("shipname", "Alcyoneus"),
        pgettext("shipname", "Aloadae"),
        pgettext("shipname", "Ananke"),
        pgettext("shipname", "Anax"),
        pgettext("shipname", "Antaeus"),
        pgettext("shipname", "Antiphates"),
        pgettext("shipname", "Anytos"),
        pgettext("shipname", "Aphrodite"),
        pgettext("shipname", "Apollo"),
        pgettext("shipname", "Ares"),
        pgettext("shipname", "Argus"),
        pgettext("shipname", "Artemis"),
        pgettext("shipname", "Asteria"),
        pgettext("shipname", "Asterius"),
        pgettext("shipname", "Astraeus"),
        pgettext("shipname", "Athena"),
        pgettext("shipname", "Atlas"),
        pgettext("shipname", "Bacchus"),
        pgettext("shipname", "Bellona"),
        pgettext("shipname", "Bona Dea"),
        pgettext("shipname", "Cacus"),
        pgettext("shipname", "Callisto"),
        pgettext("shipname", "Carmentis"),
        pgettext("shipname", "Ceres"),
        pgettext("shipname", "Chaos"),
        pgettext("shipname", "Charon"),
        pgettext("shipname", "Chronos"),
        pgettext("shipname", "Chthonius"),
        pgettext("shipname", "Coeus"),
        pgettext("shipname", "Crius"),
        pgettext("shipname", "Cronus"),
        pgettext("shipname", "Cyclopes"),
        pgettext("shipname", "Damysus"),
        pgettext("shipname", "Demeter"),
        pgettext("shipname", "Diana"),
        pgettext("shipname", "Dione"),
        pgettext("shipname", "Dionysus"),
        pgettext("shipname", "Enceladus"),
        pgettext("shipname", "Eos"),
        pgettext("shipname", "Epimetheus"),
        pgettext("shipname", "Erebus"),
        pgettext("shipname", "Eros"),
        pgettext("shipname", "Europa"),
        pgettext("shipname", "Falacer"),
        pgettext("shipname", "Fauna"),
        pgettext("shipname", "Flora"),
        pgettext("shipname", "Fortuna"),
        pgettext("shipname", "Freyr"),
        pgettext("shipname", "Furrina"),
        pgettext("shipname", "Gaia"),
        pgettext("shipname", "Ganymede"),
        pgettext("shipname", "Gegenees"),
        pgettext("shipname", "Genius"),
        pgettext("shipname", "Geryon"),
        pgettext("shipname", "Hades"),
        pgettext("shipname", "Helios"),
        pgettext("shipname", "Hemera"),
        pgettext("shipname", "Hephaestus"),
        pgettext("shipname", "Hera"),
        pgettext("shipname", "Hermes"),
        pgettext("shipname", "Hestia"),
        pgettext("shipname", "Hyperion"),
        pgettext("shipname", "Iapetus"),
        pgettext("shipname", "Io"),
        pgettext("shipname", "Janus"),
        pgettext("shipname", "Juno"),
        pgettext("shipname", "Jupiter"),
        pgettext("shipname", "Lelantos"),
        pgettext("shipname", "Leto"),
        pgettext("shipname", "Liber"),
        pgettext("shipname", "Luna"),
        pgettext("shipname", "Mars"),
        pgettext("shipname", "Menoetius"),
        pgettext("shipname", "Mercury"),
        pgettext("shipname", "Metis"),
        pgettext("shipname", "Mimas"),
        pgettext("shipname", "Minerva"),
        pgettext("shipname", "Mnemosyne"),
        pgettext("shipname", "Neptune"),
        pgettext("shipname", "Nesoi"),
        pgettext("shipname", "Nyx"),
        pgettext("shipname", "Oceanus"),
        pgettext("shipname", "Odin"),
        pgettext("shipname", "Orcus"),
        pgettext("shipname", "Orion"),
        pgettext("shipname", "Ourea"),
        pgettext("shipname", "Palatua"),
        pgettext("shipname", "Pallas"),
        pgettext("shipname", "Persephone"),
        pgettext("shipname", "Perses"),
        pgettext("shipname", "Phanes"),
        pgettext("shipname", "Phoebe"),
        pgettext("shipname", "Picolous"),
        pgettext("shipname", "Pluto"),
        pgettext("shipname", "Polybotes"),
        pgettext("shipname", "Pomona"),
        pgettext("shipname", "Pontus"),
        pgettext("shipname", "Porphyrion"),
        pgettext("shipname", "Portunus"),
        pgettext("shipname", "Poseidon"),
        pgettext("shipname", "Prometheus"),
        pgettext("shipname", "Proteus"),
        pgettext("shipname", "Quirinus"),
        pgettext("shipname", "Rhea"),
        pgettext("shipname", "Saturn"),
        pgettext("shipname", "Selene"),
        pgettext("shipname", "Sol"),
        pgettext("shipname", "Styx"),
        pgettext("shipname", "Syceus"),
        pgettext("shipname", "Talos"),
        pgettext("shipname", "Tartarus"),
        pgettext("shipname", "Tellus"),
        pgettext("shipname", "Tethys"),
        pgettext("shipname", "Thalassa"),
        pgettext("shipname", "Theia"),
        pgettext("shipname", "Themis"),
        pgettext("shipname", "Thoas"),
        pgettext("shipname", "Thor"),
        pgettext("shipname", "Titan"),
        pgettext("shipname", "Tityos"),
        pgettext("shipname", "Triton"),
        pgettext("shipname", "Typhon"),
        pgettext("shipname", "Uranus"),
        pgettext("shipname", "Venus"),
        pgettext("shipname", "Vesta"),
        pgettext("shipname", "Volturnus"),
        pgettext("shipname", "Vulcan"),
        pgettext("shipname", "Zeus"),
    }
}

pop_textdomain()
