push_textdomain("europeans_all.wad", true)

local dirname = path.dirname(__file__)

spritesheets = {
   atk_ok_e = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 3, 32 }
   },
   atk_ok_w = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 30, 36 }
   },
   atk_fail_e = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 3, 32 }
   },
   atk_fail_w = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 30, 36 }
   },
   die_e = {
      fps = 10,
      frames = 20,
      rows = 5,
      columns = 4,
      hotspot = { 9, 36 }
   },
   die_w = {
      fps = 10,
      frames = 20,
      rows = 5,
      columns = 4,
      hotspot = { 9, 36 }
   },
   eva_fail_e = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 6, 24 }
   },
   eva_fail_w = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      hotspot = { 29, 22 }
   },
   eva_ok_e = {
      fps = 20,
      frames = 20,
      rows = 5,
      columns = 4,
      hotspot = { 14, 27 }
   },
   eva_ok_w = {
      fps = 20,
      frames = 20,
      rows = 5,
      columns = 4,
      hotspot = { 25, 27 }
   },
   idle = {
      fps = 5,
      frames = 40,
      rows = 7,
      columns = 6,
      hotspot = { 5, 34 }
   },
   walk = {
      fps = 10,
      frames = 10,
      rows = 4,
      columns = 3,
      directional = true,
      hotspot = { 9, 35 }
   },
}

all_levels_emp = {
    min_health = 0,
    min_attack = 0,
    min_defense = 0,
    min_evade = 0,
    max_health = 5,
    max_attack = 5,
    max_defense = 2,
    max_evade = 2,
}

wl.Descriptions():new_soldier_type {
    name = "europeans_soldier",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Soldier"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    animation_directory = dirname,
    spritesheets = spritesheets,
    
    -- buildcost = {
        -- europeans_recruit = 1,
        -- diamond = 1
    -- },
        
    -- Battle attributes - initial values and per level increase
    health = {
        max_level = 5,
        base = 13000,
        increase_per_level = 1600,
        pictures = path.list_files(dirname .. "health_level?.png"),
    },
    evade = {
        max_level = 2,
        base = 20,
        increase_per_level = 20,
        pictures = path.list_files(dirname .. "evade_level?.png"),
    },
    defense = {
        max_level = 2,
        base = 10,
        increase_per_level = 10,
        pictures = path.list_files(dirname .. "defense_level?.png"),
    },
    attack = {
        max_level = 5,
        base = 1300,
        maximum = 1500,
        increase_per_level = 720,
        pictures = path.list_files(dirname .. "attack_level?.png"),
    },

    -- Random animations for battle
    attack_success_w = {
        atk_ok_w = all_levels_emp,
    },
    attack_success_e = {
        atk_ok_e = all_levels_emp,
    },
    attack_failure_w = {
        atk_fail_w = all_levels_emp,
    },
    attack_failure_e = {
        atk_fail_e = all_levels_emp,
    },
    evade_success_w = {
        eva_ok_w = all_levels_emp,
    },
    evade_success_e = {
        eva_ok_e = all_levels_emp,
    },
    evade_failure_w = {
        eva_fail_w = all_levels_emp,
    },
    evade_failure_e = {
        eva_fail_e = all_levels_emp,
    },
    die_w = {
        die_w = all_levels_emp,
    },
    die_e = {
        die_e = all_levels_emp,
    },
    idle = {
        idle = all_levels_emp,
    },
    walk = {
        {
            range = all_levels_emp,
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
