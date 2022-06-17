N = (get_build_id():find("1.0") ~= 1)

if N then
    return {
       berry_bush_desert_hackberry_medium = { "flowering", "__replace_if_exists" },
    }
else
    return {}
end
