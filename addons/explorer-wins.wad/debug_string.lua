function debug_string(tbl)
    if true then -- only while debugging
        local mt = getmetatable(tbl)
        local tt = type(tbl)
        local t
        t = tt .. " " .. tostring(tbl) .. " = {"
        if nil ~= mt and nil == mt.pairs then
            -- a special user object
            t = t .. "* "
            for k, v in pairs(mt) do
                if string.sub(k, 0, 2) ~= "__" then -- when not a special entry
                    t = t .. "[" .. k .. "]= " .. tostring(tbl[k]) .. ", "
                end
            end
            return t.."}"
        else
            if "table" == type(tbl) or "userdata" == type(tbl) then
                -- goto end
            else return t.."-}"
            end

            for k, v in pairs(tbl) do
                t = t .. "[" .. k .. "]= " .. tostring(v) .. ", "
            end
            return t.."}"
        end
   end
   return ""
end
