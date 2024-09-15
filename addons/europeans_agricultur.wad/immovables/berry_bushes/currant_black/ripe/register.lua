N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
       berry_bush_currant_black_ripe = { "field", "ripe_bush", "__replace_if_exists" },
    }
else
    return {}
end
