return {
   func = function(present, stationed, capacity)
   push_textdomain("europeans_tribe.wad", true)
      local result = ""
      if present == stationed then
         if capacity > stationed then
            -- TRANSLATORS: %1% is the number of europeans soldiers the plural refers to. %2% is the maximum number of soldier slots in the building.
            result = npgettext("europeans_building", "%1% soldier (+%2%)", "%1% soldiers (+%2%)", stationed):bformat(stationed, (capacity - stationed))
         else
            -- TRANSLATORS: Number of europeans soldiers stationed at a militarysite.
            result = npgettext("europeans_building", "%1% soldier", "%1% soldiers", stationed):bformat(stationed)
         end
      else
         if capacity > stationed then
            -- TRANSLATORS: %1% is the number of europeans soldiers the plural refers to. %2% are currently open soldier slots in the building. %3% is the maximum number of soldier slots in the building
            result = npgettext("europeans_building", "%1%(+%2%) soldier (+%3%)", "%1%(+%2%) soldiers (+%3%)", stationed):bformat(present, (stationed - present), (capacity - stationed))
         else
            -- TRANSLATORS: %1% is the number of europeans soldiers the plural refers to. %2% are currently open soldier slots in the building.
            result = npgettext("europeans_building", "%1%(+%2%) soldier", "%1%(+%2%) soldiers", stationed):bformat(present, (stationed - present))
         end
      end
      pop_textdomain()
      return result
   end
}
