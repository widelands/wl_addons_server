push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_militarysite_type {
    name = "europeans_barrier",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Barrier"),
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_outpost",
        enhancement_cost = {
            planks = 2,
            cloth = 2,
            granite = 2,
            quartz = 2
        },
        enhancement_return_on_dismantle = {
            planks = 1,
            granite = 2,
            quartz = 2
        },
    },

    buildcost = {
        blackwood = 3,
        reed = 3,
        granite = 2
    },
    return_on_dismantle = {
        blackwood = 2,
        granite = 1
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 44, 62 },
            fps = 10
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 44, 62 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 44, 62 },
        }
    },

    aihints = {
        fighting = true
    },

    max_soldiers = 6,
    heal_per_second = 120,
    conquers = 6,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by a Barbarian military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your barrier."),
        -- TRANSLATORS: Message sent by a Barbarian military site
        aggressor = pgettext("europeans_building", "Your barrier discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Barbarian military site
        attack = pgettext("europeans_building", "Your barrier is under attack."),
        -- TRANSLATORS: Message sent by a Barbarian military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the barrier."),
        -- TRANSLATORS: Message sent by a Barbarian military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the barrier.")
    },
}

pop_textdomain()
