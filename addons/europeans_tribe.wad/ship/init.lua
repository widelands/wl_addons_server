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
          -- Capital cities or big cities with more than 500.000 people
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Amsterdam"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Andorra la Vella"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Antwerpen"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Astrachan"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Athen"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Balaschicha"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Barcelona"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Beograd"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Berlin"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Bern"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Birmingham"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Bradford"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Bremen"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Bruxelles"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "București"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Budapest"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Charkiw"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Chișinău"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Den Haag"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Dnipro"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Donezk"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Dortmund"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Dresden"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Dublin"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Duisburg"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Düsseldorf"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Edinburgh"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Essen"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Frankfurt am Main"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Genova"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Glasgow"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Göteborg"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Hamburg"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Hannover"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Helsinki"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Homel"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Ischewsk"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Istanbul"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Jaroslawl"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Kasan"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Kirow"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "København"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Köln"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Kraków"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Krasnodar"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Krywyj Rih"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Kyiv"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Leeds"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Leipzig"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Lipezk"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Lisboa"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Ljubljana"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Łódź"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "London"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Luxemburg"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Lwiw"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Lyon"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Machatschkala"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Madrid"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Málaga"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Manchester"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Marseille"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Milano"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Minsk"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Monaco"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Moskwa"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "München"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Nabereschnyje Tschelny"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Napoli"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Nikosia"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Nischni Nowgorod"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Nürnberg"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Odessa"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Orenburg"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Oslo"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Palermo"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Paris"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Pensa"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Perm"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Podgorica"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Poznań"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Praha"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Prishtina"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Reykjavík"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Rīga"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Rjasan"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Roma"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Rostow-na-Donu"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Rotterdam"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "San Marino"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Samara"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Sankt Petersburg"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Saporischschja"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Sarajevo"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Saratow"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Sevilla"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Sheffield"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Skopje"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Sofia"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Stockholm"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Stuttgart"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Tallinn"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Tirana"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Toljatti"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Torino"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Ufa"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Uljanowsk"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Vaduz"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Valencia"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Valletta"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Vilnius"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Warszawa"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Wien"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Wolgograd"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Woronesch"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Wrocław"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Zagreb"),
          -- TRANSLATORS: This Europeans ship is named after a Europeans town
          pgettext("shipname", "Zaragoza"),
    }
}

pop_textdomain()
