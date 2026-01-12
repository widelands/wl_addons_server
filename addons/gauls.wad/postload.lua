descriptions = wl.Descriptions()

push_textdomain("gauls.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-- For lore texts
-- TRANSLATORS: Format string for a latin quote and its translation
quote_with_translation_format = pgettext("empire_lore", "‘%1%’<br>(%2%)")
function latin_lore(latin, translation)
   return quote_with_translation_format:bformat(latin, translation)
end

-- ------ --
-- MARKET --
-- ------ --

if get_build_id():find("1.2", 1, true) == nil then

wl.Descriptions():modify_unit("tribe", "gauls", "add_building", "gauls_market", { helptexts = { 
                  -- TRANSLATORS: Purpose help text for a Gallic production site: Market
                  purpose = pgettext("gauls_building", "A market enables trading with other tribes."),
               }})


end

-- ---------------- --
-- CROCODILE HUNTER --
-- ---------------- --

for i, trb in ipairs(wl.Descriptions().tribes_descriptions) do
   if trb.name == "sumatrans" then

    wl.Descriptions():modify_unit("worker", "gauls_hunter", "programs", "set", "hunt_crocodile", {
         "findobject=type:bob radius:10 attrib:crocodile",
         "walk=object",
         "animate=idle duration:1s500ms",
         "removeobject",
         "createware=meat",
         "return"
      })

    wl.Descriptions():modify_unit("tribe", "gauls", "add_building", "gauls_crocodile_hunters_hut", { helptexts = {
                  lore = pgettext("gauls_building", "Of course hunting crocodiles is a good idea. "..
                                                    "The efficiency of hunting should not increase much but the productivity can increase, if there are not enough animals in the nearby forests."),
                  -- TRANSLATORS: Lore author helptext for a Gallic production site: Crocodile Hunter’s Hut
                  lore_author = pgettext("gauls_building", "Hunter advocates the idea of building a crocodile hunter's house"),
                  purpose = _"Hunts animals to produce meat. Hunters working at this house can hunt crocodiles too.",
                  note = {
                     -- TRANSLATORS: Note helptext for a Gallic production site: Crocodile Hunter’s Hut, part 1
                     pgettext("gauls_building", "This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory."),
                     -- TRANSLATORS: Note helptext for a Gallic production site: Crocodile Hunter’s Hut, part 2
                     pgettext("gauls_building", "The building has 2 different working areas, the smaller for crocodile hunting and the larger for game hunting."),
                  },
                  performance = {
                     -- TRANSLATORS: Performance helptext for a Gallic production site: Crocodile Hunter’s Hut, part 1
                     pgettext("gauls_building", "If there is a sufficient amount of crocodiles and other animals, the hunters need %1$s on average to produce one meat. If there are no crocodiles, the building operates as a basic hunter's hut and the hunters need %2$s on average to produce one meat."):bformat(format_minutes(1), format_minutes_seconds(1, 11)),
                     -- TRANSLATORS: Performance helptext for a Gallic production site: Crocodile Hunter’s Hut, part 2
                     pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased."),
                   }
               }})

    wl.Descriptions():modify_unit("building", "gauls_hunters_hut", "enhancement", {
        name = "gauls_crocodile_hunters_hut",
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
