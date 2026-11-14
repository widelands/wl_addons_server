push_textdomain("europeans_all.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
   name = "europeans_trade_pole",
   -- TRANSLATORS: This is a resource name used in lists of resources
   descname = pgettext("immovable", "Trade Pole"),
   size = "small",
   icon = dirname .. "tradepole_1.png",

    animation_directory = dirname,
    animations = {
      idle = {
         basename = "tradepole",
         hotspot = {8, 27}
      }
   },
   
    programs = {
      main = {
         "animate=idle",
      }
   },
}

pop_textdomain()
