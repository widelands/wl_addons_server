----------------------------------------------------------------------------------------------
--                         Barbarian warehouses
----------------------------------------------------------------------------------------------

if N then

D:modify_unit("warehouse", "barbarians_headquarters", "heal_per_second", 10)
D:modify_unit("warehouse", "barbarians_warehouse", "heal_per_second", 10)
D:modify_unit("warehouse", "barbarians_port", "heal_per_second", 10)
D:modify_unit("building", "barbarians_port", "buildcost", "remove", "gold")
D:modify_unit("building", "barbarians_port", "return_on_dismantle", "remove", "gold")

end -- if N
