push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ship_type {
   name = "lutas_atlanteans_ship",
   -- TRANSLATORS: This is the Lutas' Atlanteans' ship's name used in lists of units
   descname = pgettext("lutas_atlanteans_ship", "Ship"),
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
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Abaco"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Agate"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Alexandrite"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Amber"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Amethyst"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Anguilla"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Antigua"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Aquamarine"),
      -- TRANSLATORS: This is an Atlantean ship name
      pgettext("shipname", "Atlantean’s Stronghold"),
      -- TRANSLATORS: This is an Atlantean ship name
      pgettext("shipname", "Atlantis"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Bahama"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Barbados"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Barbuda"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Beryl"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Blanquilla"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Caicos"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Cassiterite"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Cat’s Eye"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Citrine"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Dominica"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Eleuthera"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Emerald"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Grenada"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Guadeloupe"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Inagua"),
      -- TRANSLATORS: This is an Atlantean ship name
      pgettext("shipname", "Juventud"),
      -- TRANSLATORS: This Atlantean ship is named after an in-game character
      pgettext("shipname", "King Ajanthul"),
      -- TRANSLATORS: This Atlantean ship is named after an in-game character
      pgettext("shipname", "King Askandor"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Kitts"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Malachite"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Martinique"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Montserrat"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Moonstone"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Mystic Quartz"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Nassau"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Nevis"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Obsidian"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Onyx"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Orchila"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Pearl"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Sapphire"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Sphalerite"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Spinel"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Sunstone"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Tiger Eye"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Tobago"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Topaz"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Tortuga"),
      -- TRANSLATORS: This Atlantean ship is named after a mineral
      pgettext("shipname", "Tourmaline"),
      -- TRANSLATORS: This Atlantean ship is named after an island
      pgettext("shipname", "Trinidad"),
   }
}

pop_textdomain()
