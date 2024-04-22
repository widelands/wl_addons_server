N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
       grapevine_ripe = { "field", "ripe_grapes", "ripe_bush", "__replace_if_exists" },
    }
else
    return {}
end
