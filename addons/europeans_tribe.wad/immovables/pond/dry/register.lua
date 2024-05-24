N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
      pond_dry = { "field", "pond_dry", "__replace_if_exists" }
    }
else
    return {}
end
