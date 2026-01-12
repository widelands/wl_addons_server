addon_dirname = path.dirname(__file__)
push_textdomain("lutas_atlanteans.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

---------------- --
--MILITARY SITES --
---------------- --

wl.Descriptions():modify_unit("building", "atlanteans_castle", "buildcost", "set", "planks", 5)
wl.Descriptions():modify_unit("building", "atlanteans_castle", "buildcost", "set", "diamond", 3)
wl.Descriptions():modify_unit("building", "atlanteans_castle", "buildcost", "set", "quartz", 2)

-- ------ --
-- MARKET --
-- ------ --

if get_build_id():find("1.2", 1, true) == nil then

wl.Descriptions():modify_unit("tribe", "lutas_atlanteans", "add_building", "lutas_atlanteans_market", { helptexts = { 
                  -- TRANSLATORS: Purpose help text for a Lutas’ Atlantean production site: Market
                  purpose = pgettext("lutas_atlanteans_building", "A market enables trading with other tribes."),
               }})


end

-- ----------------------- --
-- LUTAS' CROCODILE HUNTER --
-- ----------------------- --

for i, trb in ipairs(wl.Descriptions().tribes_descriptions) do
   if trb.name == "sumatrans" then

    wl.Descriptions():modify_unit("worker", "lutas_atlanteans_hunter", "programs", "set", "hunt_crocodile", {
         "findobject=type:bob radius:10 attrib:crocodile",
         "walk=object",
         "animate=idle duration:1s500ms",
         "removeobject",
         "createware=meat",
         "return"
      })

    wl.Descriptions():modify_unit("tribe", "lutas_atlanteans", "add_building", "lutas_atlanteans_crocodile_hunters_house", { helptexts = {
                  lore = pgettext("lutas_atlanteans_building", "Of course hunting crocodiles is a good idea. "..
                                                               "The efficiency of hunting should not increase much but the productivity can increase, if there are not enough animals in the nearby forests."),
                  -- TRANSLATORS: Lore author helptext for an Atlantean production site: Crocodile Hunter’s House
                  lore_author = pgettext("lutas_atlanteans_building", "Hunter advocates the idea of building a crocodile hunter's house"),
                  purpose = _"Hunts animals to produce meat. Hunters working at this house can hunt crocodiles too.",
                  note = {
                     -- TRANSLATORS: Note helptext for an Atlantean production site: Crocodile Hunter’s House, part 1
                     pgettext("lutas_atlanteans_building", "This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory."),
                     -- TRANSLATORS: Note helptext for an Atlantean production site: Crocodile Hunter’s House, part 2
                     pgettext("lutas_atlanteans_building", "The building has 2 different working areas, the smaller for crocodile hunting and the larger for game hunting."),
                  },
                  performance = {
                     -- TRANSLATORS: Performance helptext for an Atlantean production site: Crocodile Hunter’s House, part 1
                     pgettext("lutas_atlanteans_building", "If there is a sufficient amount of crocodiles and other animals, the hunters need %1$s on average to produce one meat. If there are no crocodiles, the building operates as a basic hunter's house and the hunters need %2$s on average to produce one meat."):bformat(format_minutes_seconds(1, 2), format_minutes_seconds(1, 13)),
                     -- TRANSLATORS: Performance helptext for an Atlantean production site: Crocodile Hunter’s House, part 2
                     pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased."),
                   }
               }})

    wl.Descriptions():modify_unit("building", "lutas_atlanteans_hunters_house", "enhancement", {
        name = "lutas_atlanteans_crocodile_hunters_house",
        enhancement_cost = {
            log = 1,
            granite = 1,
        },
        enhancement_return_on_dismantle = {
            log = 1,
        },
    })
  break
  end
end

pop_textdomain()
