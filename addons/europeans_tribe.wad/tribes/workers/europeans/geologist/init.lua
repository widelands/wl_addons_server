include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/atlanteans/geologist/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_worker_type {
    name = "europeans_geologist",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Geologist"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = animations,
    spritesheets = spritesheets,

    vision_range = 2,

    buildcost = {
        europeans_carrier = 1,
        hammer = 1
    },

    programs = {
        -- Expedition is the main program
        -- The specialized geologist command walks the geologist around his starting
        -- location, executing the search program from time to time.
        expedition = {
            "repeatsearch=search repetitions:15 radius:5"
        },
        -- Search program, executed when we have found a place to hack on
        search = {
            "animate=hacking duration:5s",
            "animate=working duration:2s",
            "playsound=sound/hammering/geologist_hammer priority:50% allow_multiple",
            "animate=hacking duration:3s",
            "findresources"
        }
    },

}
pop_textdomain()
