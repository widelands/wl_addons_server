----------------------------------------------------------------------------------------------
--                         Barbarian militarysites
----------------------------------------------------------------------------------------------

if N then

D:modify_unit("building", "barbarians_barrier", "buildcost", "remove", "blackwood")
D:modify_unit("building", "barbarians_barrier", "buildcost", "remove", "grout")
D:modify_unit("building", "barbarians_barrier", "buildcost", "set", "reed", 7)
D:modify_unit("building", "barbarians_barrier", "return_on_dismantle", "remove", "blackwood")
D:modify_unit("building", "barbarians_barrier", "return_on_dismantle", "remove", "grout")
D:modify_unit("building", "barbarians_barrier", "return_on_dismantle", "set", "reed", 4)
D:modify_unit("militarysite", "barbarians_barrier", "conquers", 10)
D:modify_unit("building", "barbarians_barrier", "vision_range", 10)
D:modify_unit("militarysite", "barbarians_barrier", "max_soldiers", 6)
D:modify_unit("militarysite", "barbarians_barrier", "heal_per_second", 0)

D:modify_unit("building", "barbarians_fortress", "enhancement_cost", "remove", "log")
D:modify_unit("building", "barbarians_fortress", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "barbarians_fortress", "enhancement_cost", "remove", "grout")
D:modify_unit("building", "barbarians_fortress", "enhancement_cost", "set", "blackwood", 2)
D:modify_unit("building", "barbarians_fortress", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_fortress", "enhancement_return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_fortress", "enhancement_return_on_dismantle", "remove", "grout")
D:modify_unit("building", "barbarians_fortress", "enhancement_return_on_dismantle", "set", "blackwood", 1)
D:modify_unit("militarysite", "barbarians_citadel", "conquers", 15)
D:modify_unit("building", "barbarians_citadel", "vision_range", 15)
D:modify_unit("militarysite", "barbarians_citadel", "max_soldiers", 18)
D:modify_unit("militarysite", "barbarians_citadel", "heal_per_second", 10)

D:modify_unit("building", "barbarians_fortress", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_fortress", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_fortress", "buildcost", "remove", "grout")
D:modify_unit("building", "barbarians_fortress", "buildcost", "set", "blackwood", 9)
D:modify_unit("building", "barbarians_fortress", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_fortress", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "barbarians_fortress", "return_on_dismantle", "remove", "grout")
D:modify_unit("building", "barbarians_fortress", "return_on_dismantle", "set", "blackwood", 4)
D:modify_unit("militarysite", "barbarians_fortress", "conquers", 14)
D:modify_unit("building", "barbarians_fortress", "vision_range", 14)
D:modify_unit("militarysite", "barbarians_fortress", "max_soldiers", 12)
D:modify_unit("militarysite", "barbarians_fortress", "heal_per_second", 10)

D:modify_unit("building", "barbarians_sentry", "buildcost", "remove", "blackwood")
D:modify_unit("building", "barbarians_sentry", "buildcost", "set", "granite", 3)
D:modify_unit("building", "barbarians_sentry", "return_on_dismantle", "remove", "blackwood")
D:modify_unit("building", "barbarians_sentry", "return_on_dismantle", "set", "granite", 1)
D:modify_unit("militarysite", "barbarians_sentry", "conquers", 8)
D:modify_unit("building", "barbarians_sentry", "vision_range", 11)
D:modify_unit("militarysite", "barbarians_sentry", "max_soldiers", 1)
D:modify_unit("militarysite", "barbarians_sentry", "heal_per_second", 20)

D:modify_unit("building", "barbarians_tower", "buildcost", "remove", "blackwood")
D:modify_unit("building", "barbarians_tower", "buildcost", "remove", "log")
D:modify_unit("building", "barbarians_tower", "buildcost", "remove", "granite")
D:modify_unit("building", "barbarians_tower", "buildcost", "set", "reed", 9)
D:modify_unit("building", "barbarians_tower", "return_on_dismantle", "remove", "blackwood")
D:modify_unit("building", "barbarians_tower", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "barbarians_tower", "return_on_dismantle", "set", "reed", 4)
D:modify_unit("militarysite", "barbarians_tower", "conquers", 4)
D:modify_unit("militarysite", "barbarians_tower", "max_soldiers", 9)
D:modify_unit("militarysite", "barbarians_tower", "heal_per_second", 0)

end -- if N
