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
        -- European countries or regions
        pgettext("shipname", "Åland"),
        pgettext("shipname", "Albania"),
        pgettext("shipname", "Alsace"),
        pgettext("shipname", "Andorra"),
        pgettext("shipname", "Anhaltium"),
        pgettext("shipname", "Aquitaine"),
        pgettext("shipname", "Ardenne"),
        pgettext("shipname", "Armenia"),
        pgettext("shipname", "Austria"),
        pgettext("shipname", "Auvergne"),
        pgettext("shipname", "Azerbaijan"),
        pgettext("shipname", "Badenia"),
        pgettext("shipname", "Bavaria"),
        pgettext("shipname", "Belarus"),
        pgettext("shipname", "Bosnia"),
        pgettext("shipname", "Brabant"),
        pgettext("shipname", "Britannia"),
        pgettext("shipname", "Bulgaria"),
        pgettext("shipname", "Burgundy"),
        pgettext("shipname", "Carantoni"),
        pgettext("shipname", "Champagne"),
        pgettext("shipname", "Corsica"),
        pgettext("shipname", "Côte d'Azur"),
        pgettext("shipname", "Croatia"),
        pgettext("shipname", "Cyprus"),
        pgettext("shipname", "Czechia"),
        pgettext("shipname", "Denmark"),
        pgettext("shipname", "Drenthe"),
        pgettext("shipname", "England"),
        pgettext("shipname", "Estonia"),
        pgettext("shipname", "Faroer Islands"),
        pgettext("shipname", "Finland"),
        pgettext("shipname", "Flanders"),
        pgettext("shipname", "Flevoland"),
        pgettext("shipname", "Francia"),
        pgettext("shipname", "Friesland"),
        pgettext("shipname", "Gelderland"),
        pgettext("shipname", "Georgia"),
        pgettext("shipname", "Germania"),
        pgettext("shipname", "Gibraltar"),
        pgettext("shipname", "Greece"),
        pgettext("shipname", "Groningen"),
        pgettext("shipname", "Guernsey"),
        pgettext("shipname", "Hassia"),
        pgettext("shipname", "Herzegovina"),
        pgettext("shipname", "Holland"),
        pgettext("shipname", "Holstein"),
        pgettext("shipname", "Hungary"),
        pgettext("shipname", "Iceland"),
        pgettext("shipname", "Isle of Man"),
        pgettext("shipname", "Ireland"),
        pgettext("shipname", "Italia"),
        pgettext("shipname", "Jersey"),
        pgettext("shipname", "Kazakhstan"),
        pgettext("shipname", "Kosovo"),
        pgettext("shipname", "Languedoc"),
        pgettext("shipname", "Latvia"),
        pgettext("shipname", "Liechtenstein"),
        pgettext("shipname", "Limburg"),
        pgettext("shipname", "Limousin"),
        pgettext("shipname", "Lithuania"),
        pgettext("shipname", "Loire"),
        pgettext("shipname", "Lorraine"),
        pgettext("shipname", "Lower-Saxonia"),
        pgettext("shipname", "Luxembourg"),
        pgettext("shipname", "Malta"),
        pgettext("shipname", "Moldova"),
        pgettext("shipname", "Monaco"),
        pgettext("shipname", "Montenegro"),
        pgettext("shipname", "Normandy"),
        pgettext("shipname", "North Macedonia"),
        pgettext("shipname", "Norway"),
        pgettext("shipname", "Occitania"),
        pgettext("shipname", "Overijssel"),
        pgettext("shipname", "Palatina"),
        pgettext("shipname", "Picardy"),
        pgettext("shipname", "Pictaviensis"),
        pgettext("shipname", "Poland"),
        pgettext("shipname", "Pommern"),
        pgettext("shipname", "Portugal"),
        pgettext("shipname", "Prussia"),
        pgettext("shipname", "Rhenania"),
        pgettext("shipname", "Rhodanus"),
        pgettext("shipname", "Romania"),
        pgettext("shipname", "Roussillon"),
        pgettext("shipname", "Russia"),
        pgettext("shipname", "San Marino"),
        pgettext("shipname", "Saravia"),
        pgettext("shipname", "Sardinia"),
        pgettext("shipname", "Saxonia"),
        pgettext("shipname", "Schleswig"),
        pgettext("shipname", "Scotland"),
        pgettext("shipname", "Serbia"),
        pgettext("shipname", "Sicilia"),
        pgettext("shipname", "Slovakia"),
        pgettext("shipname", "Slovenia"),
        pgettext("shipname", "Spain"),
        pgettext("shipname", "Svalbard"),
        pgettext("shipname", "Sweden"),
        pgettext("shipname", "Switzerland"),
        pgettext("shipname", "Thuringia"),
        pgettext("shipname", "Turkey"),
        pgettext("shipname", "Ukraine"),
        pgettext("shipname", "Utrecht"),
        pgettext("shipname", "Vatican"),
        pgettext("shipname", "Virtembergia"),
        pgettext("shipname", "Wales"),
        pgettext("shipname", "Wallonia"),
        pgettext("shipname", "Westphalia"),
        pgettext("shipname", "Zeeland"),
    }
}

pop_textdomain()
