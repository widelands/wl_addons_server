push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "armor",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Armor"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 3, 11 },
      },
   }
}

pop_textdomain()

-- RST
--
-- Help Texts
-- ----------
--
-- See :ref:`lua_tribes_tribes_helptexts`.
--
