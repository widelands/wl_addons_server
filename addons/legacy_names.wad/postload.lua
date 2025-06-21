push_textdomain("legacy_names.wad", true)
local D = wl.Descriptions()

D:modify_unit("tribe", "barbarians", "add_building", "barbarians_stronghold", { helptexts = {
            -- TRANSLATORS: Purpose helptext for a Barbarian military site: Stronghold
            purpose = pgettext("barbarians_building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note helptext for a Barbarian military site: Stronghold
            note = pgettext("barbarians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }})

D:modify_unit("ware", "log", "descname", _("Trunk"))
D:modify_unit("ware", "granite", "descname", _("Raw Stone"))
D:modify_unit("ware", "reed", "descname", _("Thatch Reed"))

D:modify_unit("ware", "spear_wooden", "descname", _("Wood Lance"))
D:modify_unit("ware", "spear", "descname", _("Lance"))
D:modify_unit("ware", "spear_advanced", "descname", _("Advanced Lance"))
D:modify_unit("ware", "spear_heavy", "descname", _("Heavy Lance"))
D:modify_unit("ware", "spear_war", "descname", _("War-Lance"))

D:modify_unit("worker", "barbarians_gardener", "descname", _("Ferner"))

D:modify_unit("building", "barbarians_reed_yard", "descname", _("Fernery"))
D:modify_unit("building", "barbarians_tower", "descname", _("Donjon"))

pop_textdomain()
