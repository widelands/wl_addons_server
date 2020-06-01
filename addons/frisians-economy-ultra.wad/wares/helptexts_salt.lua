function ware_helptext(tribe)
   local helptext = {
      -- TRANSLATORS: Helptext for a ware: ???
      frisians = pgettext("frisians_ware", "TODO(Nordfriese): Write helptexts")
   }
   local result = ""
   if tribe then
      result = helptext[tribe]
   else
      result = helptext["default"]
   end
   if (result == nil) then result = "" end
   return result
end
