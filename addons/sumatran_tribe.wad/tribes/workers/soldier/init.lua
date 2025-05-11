push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

spritesheets = {
   atk_fail_e = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 13, 35 }
   },
   atk_fail_w = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 36, 39 }
   },
   atk_ok_e = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 13, 36 }
   },
   atk_ok_w = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 36, 39 }
   },
   die_e = {
      fps = 10,
      frames = 20,
      rows = 5,
      columns = 4,
      hotspot = { 10, 36 }
   },
   die_w = {
      fps = 10,
      frames = 20,
      rows = 5,
      columns = 4,
      hotspot = { 10, 36 }
   },
   eva_fail_e = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 14, 27 }
   },
   eva_fail_w = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 34, 26 }
   },
   eva_ok_e = {
      fps = 20,
      frames = 20,
      rows = 5,
      columns = 4,
      hotspot = { 21, 28 }
   },
   eva_ok_w = {
      fps = 20,
      frames = 20,
      rows = 5,
      columns = 4,
      hotspot = { 31, 31 }
   },
   idle = {
      fps = 5,
      frames = 40,
      rows = 7,
      columns = 6,
      hotspot = { 10, 32 }
   },
   walk = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      directional = true,
      hotspot = { 19, 27 }
   },
}

all_levels_kon = {
   min_health = 0,
   min_attack = 0,
   min_defense = 0,
   min_evade = 0,
   max_health = 3,
   max_attack = 3,
   max_defense = 3,
   max_evade = 1,
}

wl.Descriptions():new_soldier_type {
   name = "sumatran_soldier",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("sumatran_worker", "Warrior"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,

   spritesheets = spritesheets,

   -- Battle attributes - initial values and per level increase
    health = {
        max_level = 3,
        base = 12125,
        increase_per_level = 3925,
        pictures = path.list_files(dirname .. "health_level?.png"),
    },
    evade = {
        max_level = 1,
        base = 37,
        increase_per_level = 13,
        pictures = path.list_files(dirname .. "evade_level?.png"),
    },
    defense = {
        max_level = 3,
        base = 0,
        increase_per_level = 14,
        pictures = path.list_files(dirname .. "defense_level?.png"),
    },
    attack = {
        max_level = 3,
        base = 1400,
        maximum = 1500,
        increase_per_level = 763,
        pictures = path.list_files(dirname .. "attack_level?.png"),
    },

   -- Random animations for battle
   -- TODO(GunChleoc): Make more animations to use the random function
   attack_success_w = {
      atk_ok_w = all_levels_kon,
   },
   attack_success_e = {
      atk_ok_e = all_levels_kon,
   },
   attack_failure_w = {
      atk_fail_w = all_levels_kon,
   },
   attack_failure_e = {
      atk_fail_e = all_levels_kon,
   },
   evade_success_w = {
      eva_ok_w = all_levels_kon,
   },
   evade_success_e = {
      eva_ok_e = all_levels_kon,
   },
   evade_failure_w = {
      eva_fail_w = all_levels_kon,
   },
   evade_failure_e = {
      eva_fail_e = all_levels_kon,
   },
   die_w = {
      die_w = all_levels_kon,
   },
   die_e = {
      die_e = all_levels_kon,
   },
   idle = {
      idle = all_levels_kon,
   },
   walk = {
      {
         range = all_levels_kon,
         sw = "walk_sw",
         se = "walk_se",
         nw = "walk_nw",
         ne = "walk_ne",
         w = "walk_w",
         e = "walk_e",
      },
   },
}

pop_textdomain()
