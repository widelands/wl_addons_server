local dirname = path.dirname(__file__)

push_textdomain("europeans_all.wad", true)

wl.Descriptions():new_immovable_type {
   name = "oatfield_harvested",
   -- TRANSLATORS: This is an immovable name used in lists of immovables
   descname = pgettext("immovable", "Oat Field (harvested)"),
   icon = dirname .. "menu.png",
   programs = {
      main = {
         "animate=idle duration:1000s",
         "remove=",
      }
   },
   animations = {
      idle = {
         directory = dirname,
         basename = "idle",
         hotspot = {21, 34}
      }
   }
}
pop_textdomain()
