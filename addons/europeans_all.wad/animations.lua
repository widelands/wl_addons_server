-- animation_loader.lua

local cache = {}

local DESCRIPTION_TYPES = {
   "new_market_type",
   "new_productionsite_type",
   "new_warehouse_type",
   "new_trainingsite_type",
   "new_militarysite_type",
   "new_shipyard_type",
   "new_ferry_yard_type",
   "new_constructionsite_type",
   "new_carrier_type",
   "new_worker_type",
}

-------------------------------------------------------------------------------
-- Hilfsfunktionen
-------------------------------------------------------------------------------

local function deepcopy(src)
   if type(src) ~= "table" then
      return src
   end

   local dst = {}

   for k, v in pairs(src) do
      dst[k] = deepcopy(v)
   end

   return dst
end

local function ensure_working_animation(def)
   local animations = def.animations or {}
   local spritesheets = def.spritesheets or {}

   -- working existiert bereits
   if animations.working or spritesheets.working then
      return
   end

   -- idle ist klassische Animation
   if animations.idle then
      animations.working = deepcopy(animations.idle)
      animations.working.basename = "idle"

      def.animations = animations
      return
   end

   -- idle ist Spritesheet
   if spritesheets.idle then
      spritesheets.working = deepcopy(spritesheets.idle)
      spritesheets.working.basename = "idle"

      def.spritesheets = spritesheets
      return
   end
end

-------------------------------------------------------------------------------
-- Internes Laden einer Gebäudedefinition
-------------------------------------------------------------------------------

local function load_building_definition(dirname)
   if cache[dirname] then
      return cache[dirname]
   end

   local captured
   local real_wl = wl

   local fake_wl = {}

   function fake_wl.Descriptions()
      local descriptions = {}

      for _, typename in ipairs(DESCRIPTION_TYPES) do
         descriptions[typename] = function(_, def)
            captured = def
         end
      end

      return descriptions
   end

   setmetatable(fake_wl, {
      __index = real_wl
   })

   wl = fake_wl

   local ok, err = pcall(function()
      include(dirname .. "init.lua")
   end)

   -- Original wiederherstellen
   wl = real_wl

   if not ok then
      error(err)
   end

   if not captured then
      error("No building definition found in " .. dirname)
   end

   ensure_working_animation(captured)

   cache[dirname] = captured
   return captured
end

-------------------------------------------------------------------------------
-- Öffentliche API
-------------------------------------------------------------------------------

function get_building_definition(dirname)
   return load_building_definition(dirname)
end

function get_animation_data(dirname)
   local def = load_building_definition(dirname)

   return {
      dirname = def.animation_directory,
      animations = def.animations or {},
      spritesheets = def.spritesheets or {},
   }
end

function get_animations(dirname)
   local def = load_building_definition(dirname)
   return def.animations or {}
end

function get_spritesheets(dirname)
   local def = load_building_definition(dirname)
   return def.spritesheets or {}
end

function get_animation_directory(dirname)
   local def = load_building_definition(dirname)
   return def.animation_directory
end

function get_animation(dirname, name)
   local def = load_building_definition(dirname)

   if def.animations and def.animations[name] then
      return def.animations[name], "animation"
   end

   if def.spritesheets and def.spritesheets[name] then
      return def.spritesheets[name], "spritesheet"
   end

   return nil
end
