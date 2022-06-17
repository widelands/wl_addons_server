N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
      blackrootfield_ripe = { "field", "ripe_blackroot", "__replace_if_exists" }
    }
else
    return {}
end
