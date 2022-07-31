N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
      ryefield_ripe = { "field", "ripe_rye", "__replace_if_exists" }
    }
else
    return {
      ryefield_ripe = { "field", "ripe_rye", "__replace_if_exists" }
    }
end
