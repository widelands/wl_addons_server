----------------------------------------------------------------------------------------------
--                         Atlantean militarysites
----------------------------------------------------------------------------------------------

if N then

D:modify_unit("building", "atlanteans_castle", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_castle", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_castle", "buildcost", "remove", "spidercloth")
D:modify_unit("building", "atlanteans_castle", "buildcost", "remove", "diamond")
D:modify_unit("building", "atlanteans_castle", "buildcost", "remove", "quartz")
D:modify_unit("building", "atlanteans_castle", "buildcost", "set", "log", 11)
D:modify_unit("building", "atlanteans_castle", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_castle", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "atlanteans_castle", "return_on_dismantle", "remove", "quartz")
D:modify_unit("building", "atlanteans_castle", "return_on_dismantle", "set", "log", 4)
D:modify_unit("militarysite", "atlanteans_castle", "conquers", 13)
D:modify_unit("building", "atlanteans_castle", "vision_range", 13)
D:modify_unit("militarysite", "atlanteans_castle", "max_soldiers", 15)
D:modify_unit("militarysite", "atlanteans_castle", "heal_per_second", 10)

D:modify_unit("building", "atlanteans_guardhall", "buildcost", "remove", "diamond")
D:modify_unit("building", "atlanteans_guardhall", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_guardhall", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_guardhall", "buildcost", "set", "granite", 7)
D:modify_unit("building", "atlanteans_guardhall", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "atlanteans_guardhall", "return_on_dismantle", "remove", "planks")
D:modify_unit("building", "atlanteans_guardhall", "return_on_dismantle", "set", "granite", 4)
D:modify_unit("building", "atlanteans_guardhall", "vision_range", 7)
D:modify_unit("militarysite", "atlanteans_guardhall", "max_soldiers", 5)
D:modify_unit("militarysite", "atlanteans_guardhall", "heal_per_second", 0)

D:modify_unit("building", "atlanteans_guardhouse", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_guardhouse", "buildcost", "remove", "planks")
D:modify_unit("building", "atlanteans_guardhouse", "buildcost", "set", "granite", 3)
D:modify_unit("militarysite", "atlanteans_guardhouse", "conquers", 7)
D:modify_unit("building", "atlanteans_guardhouse", "vision_range", 7)
D:modify_unit("militarysite", "atlanteans_guardhouse", "max_soldiers", 1)
D:modify_unit("militarysite", "atlanteans_guardhouse", "heal_per_second", 20)

D:modify_unit("building", "atlanteans_tower", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_tower", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_tower", "buildcost", "remove", "spidercloth")
D:modify_unit("building", "atlanteans_tower", "buildcost", "set", "planks", 7)
D:modify_unit("building", "atlanteans_tower", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_tower", "return_on_dismantle", "remove", "log")
D:modify_unit("building", "atlanteans_tower", "return_on_dismantle", "set", "planks", 3)
D:modify_unit("militarysite", "atlanteans_tower", "conquers", 8)
D:modify_unit("building", "atlanteans_tower", "vision_range", 15)
D:modify_unit("militarysite", "atlanteans_tower", "max_soldiers", 3)
D:modify_unit("militarysite", "atlanteans_tower", "heal_per_second", 0)

D:modify_unit("building", "atlanteans_tower", "enhancement_cost", "remove", "log")
D:modify_unit("building", "atlanteans_tower", "enhancement_cost", "remove", "granite")
D:modify_unit("building", "atlanteans_tower", "enhancement_cost", "set", "planks", 4)
D:modify_unit("building", "atlanteans_tower", "enhancement_return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_tower", "enhancement_return_on_dismantle", "set", "planks", 1)
D:modify_unit("militarysite", "atlanteans_tower_high", "conquers", 8)
D:modify_unit("building", "atlanteans_tower_high", "vision_range", 18)
D:modify_unit("militarysite", "atlanteans_tower_high", "heal_per_second", 0)

D:modify_unit("building", "atlanteans_tower_small", "buildcost", "remove", "log")
D:modify_unit("building", "atlanteans_tower_small", "buildcost", "remove", "granite")
D:modify_unit("building", "atlanteans_tower_small", "buildcost", "set", "planks", 1)
D:modify_unit("building", "atlanteans_tower_small", "return_on_dismantle", "remove", "granite")
D:modify_unit("building", "atlanteans_tower_small", "return_on_dismantle", "set", "planks", 1)
D:modify_unit("militarysite", "atlanteans_tower_small", "conquers", 4)
D:modify_unit("building", "atlanteans_tower_small", "vision_range", 11)
D:modify_unit("militarysite", "atlanteans_tower_small", "max_soldiers", 1)
D:modify_unit("militarysite", "atlanteans_tower_small", "heal_per_second", 0)

end -- if N
