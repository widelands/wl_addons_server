push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "gauls_stone_tower",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Stone Tower"),
   icon = dirname .. "menu.png",
   size = "medium",
   vision_range = 19,

    buildcost = {
        granite = 6,
        planks = 1,
        brick = 3,
        cloth = 2
    },
    return_on_dismantle = {
        granite = 3,
        brick = 2,
        cloth = 1
    },

animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 40, 107 },
      }
   },

   aihints = {
      prohibited_till = 1560,
      fighting = true,
   },

   max_soldiers = 6,
   heal_per_second = 170,
   conquers = 9,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Gallic military site
      occupied = pgettext("gauls_building", "Your warriors have occupied your stone tower."),
      -- TRANSLATORS: Message sent by a Gallic military site
      aggressor = pgettext("gauls_building", "Your stone tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Gallic military site
      attack = pgettext("gauls_building", "Your stone tower is under attack."),
      -- TRANSLATORS: Message sent by a Gallic military site
      defeated_enemy = pgettext("gauls_building", "The enemy defeated your warriors at the stone tower."),
      -- TRANSLATORS: Message sent by a Gallic military site
      defeated_you = pgettext("gauls_building", "Your warriors defeated the enemy at the stone tower.")
   },
}

pop_textdomain()
