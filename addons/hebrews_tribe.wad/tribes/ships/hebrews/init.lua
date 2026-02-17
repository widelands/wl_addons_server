push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ship_type {
   name = "hebrews_ship",
   -- TRANSLATORS: This is the Hebrews' ship's name used in lists of units
   descname = pgettext("hebrews_ship", "Ship"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   capacity = 30,
   vision_range = 4,

   hitpoints    = 50000,
   min_attack   =   100,
   max_attack   = 10000,
   defense         =  5,
   attack_accuracy = 60,
   heal_per_second = 100,

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
      -- TRANSLATORS: This Hebrew ship is named after a biblical port city
      pgettext("shipname", "Acco"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical region
      pgettext("shipname", "Bashan"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical mountain
      pgettext("shipname", "Carmel"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical king
      pgettext("shipname", "David"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical port
      pgettext("shipname", "Eilat"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical port
      pgettext("shipname", "Ezion-Geber"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical region
      pgettext("shipname", "Galilee"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical city
      pgettext("shipname", "Haifa"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical patriarch
      pgettext("shipname", "Isaac"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical city
      pgettext("shipname", "Jaffa"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical city
      pgettext("shipname", "Jerusalem"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical river
      pgettext("shipname", "Jordan"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical king
      pgettext("shipname", "King Solomon"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical sea
      pgettext("shipname", "Kinneret"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical creature
      pgettext("shipname", "Leviathan"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical patriarch
      pgettext("shipname", "Moses"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical patriarch
      pgettext("shipname", "Noah"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical land
      pgettext("shipname", "Ophir"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical city
      pgettext("shipname", "Sidon"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical king
      pgettext("shipname", "Solomon"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical land
      pgettext("shipname", "Tarshish"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical city
      pgettext("shipname", "Tyre"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical city
      pgettext("shipname", "Zidon"),
      -- TRANSLATORS: This Hebrew ship is named after a biblical region
      pgettext("shipname", "Zion"),
   }
}

pop_textdomain()
