N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
      barleyfield_ripe = { "field", "ripe_barley", "__replace_if_exists" }
    }
else
    return {}
end
