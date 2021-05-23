----------------------------------------------------------------------------------------------
--                         Atlantean warehouses
----------------------------------------------------------------------------------------------

if N then

D:modify_unit("warehouse", "atlanteans_headquarters", "heal_per_second", 10)
D:modify_unit("warehouse", "atlanteans_warehouse", "heal_per_second", 10)
D:modify_unit("warehouse", "atlanteans_port", "heal_per_second", 10)
D:modify_unit("building", "atlanteans_port", "buildcost", "remove", "gold")
D:modify_unit("building", "atlanteans_port", "return_on_dismantle", "remove", "gold")

end -- if N
