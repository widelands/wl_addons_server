----------------------------------------------------------------------------------------------
--                         Frisian militarysites
----------------------------------------------------------------------------------------------

if N then

D:modify_unit("building", "frisians_fortress", "buildcost", "remove", "brick")
D:modify_unit("building", "frisians_fortress", "buildcost", "remove", "granite")
D:modify_unit("building", "frisians_fortress", "buildcost", "remove", "reed")
D:modify_unit("building", "frisians_fortress", "buildcost", "set", "log", 11)
D:modify_unit("building", "frisians_fortress", "return_on_dismantle", "remove", "brick")
D:modify_unit("building", "frisians_fortress", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "frisians_fortress", "return_on_dismantle", "remove", "reed")
D:modify_unit("building", "frisians_fortress", "return_on_dismantle", "set", "log", 9)
D:modify_unit("building", "frisians_fortress", "vision_range", 12)
D:modify_unit("militarysite", "frisians_fortress", "heal_per_second", 10)

D:modify_unit("building", "frisians_outpost", "buildcost", "remove", "brick")
D:modify_unit("building", "frisians_outpost", "buildcost", "remove", "granite")
D:modify_unit("building", "frisians_outpost", "buildcost", "remove", "log")
D:modify_unit("building", "frisians_outpost", "buildcost", "set", "reed", 9)
D:modify_unit("building", "frisians_outpost", "return_on_dismantle", "remove", "brick")
D:modify_unit("building", "frisians_outpost", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "frisians_outpost", "return_on_dismantle", "set", "reed", 8)
D:modify_unit("militarysite", "frisians_outpost", "conquers", 8)
D:modify_unit("building", "frisians_outpost", "vision_range", 8)
D:modify_unit("militarysite", "frisians_outpost", "max_soldiers", 5)
D:modify_unit("militarysite", "frisians_outpost", "heal_per_second", 0)

D:modify_unit("building", "frisians_sentinel", "buildcost", "remove", "brick")
D:modify_unit("building", "frisians_sentinel", "buildcost", "remove", "reed")
D:modify_unit("building", "frisians_sentinel", "buildcost", "remove", "log")
D:modify_unit("building", "frisians_sentinel", "buildcost", "set", "granite", 5)
D:modify_unit("building", "frisians_sentinel", "return_on_dismantle", "remove", "brick")
D:modify_unit("building", "frisians_sentinel", "return_on_dismantle", "set", "granite", 1)
D:modify_unit("militarysite", "frisians_sentinel", "conquers", 8)
D:modify_unit("building", "frisians_sentinel", "vision_range", 8)
D:modify_unit("militarysite", "frisians_sentinel", "max_soldiers", 5)
D:modify_unit("militarysite", "frisians_sentinel", "heal_per_second", 0)

D:modify_unit("building", "frisians_tower", "buildcost", "remove", "brick")
D:modify_unit("building", "frisians_tower", "buildcost", "remove", "granite")
D:modify_unit("building", "frisians_tower", "buildcost", "remove", "log")
D:modify_unit("building", "frisians_tower", "buildcost", "set", "reed", 29)
D:modify_unit("building", "frisians_tower", "return_on_dismantle", "remove", "brick")
D:modify_unit("building", "frisians_tower", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "frisians_tower", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "frisians_tower", "return_on_dismantle", "set", "reed", 9)
D:modify_unit("building", "frisians_tower", "vision_range", 20)
D:modify_unit("militarysite", "frisians_tower", "max_soldiers", 10)
D:modify_unit("militarysite", "frisians_tower", "heal_per_second", 0)

D:modify_unit("building", "frisians_wooden_tower", "buildcost", "remove", "reed")
D:modify_unit("building", "frisians_wooden_tower", "buildcost", "set", "log", 5)
D:modify_unit("building", "frisians_wooden_tower", "return_on_dismantle", "set", "log", 3)
D:modify_unit("militarysite", "frisians_wooden_tower", "conquers", 7)
D:modify_unit("building", "frisians_wooden_tower", "vision_range", 13)
D:modify_unit("militarysite", "frisians_wooden_tower", "heal_per_second", 0)

D:modify_unit("building", "frisians_wooden_tower", "enhancement_cost", "remove", "reed")
D:modify_unit("building", "frisians_wooden_tower", "enhancement_cost", "set", "log", 4)
D:modify_unit("militarysite", "frisians_wooden_tower_high", "conquers", 7)
D:modify_unit("militarysite", "frisians_wooden_tower_high", "max_soldiers", 1)
D:modify_unit("militarysite", "frisians_wooden_tower_high", "heal_per_second", 0)

end -- if N
