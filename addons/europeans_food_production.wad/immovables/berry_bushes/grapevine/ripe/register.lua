N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
       grapevine_ripe = { "ripe_grapes", "ripe_bush", "field", "__replace_if_exists" },
    }
else
    return {}
end
