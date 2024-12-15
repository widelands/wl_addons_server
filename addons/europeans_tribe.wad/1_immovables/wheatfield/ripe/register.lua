N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
      wheatfield_ripe = { "field", "ripe_wheat", "__replace_if_exists" }
    }
else
    return {}
end
