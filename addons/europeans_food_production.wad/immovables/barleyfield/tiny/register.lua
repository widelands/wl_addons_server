N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
      barleyfield_tiny = { "field", "growable", "seed_barley", "__replace_if_exists" }
    }
else
    return {}
end
