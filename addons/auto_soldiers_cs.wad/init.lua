include "scripting/coroutine.lua"

-- The actual player
local ia_plr = wl.Game().players[wl.Game().interactive_player]

-- own_ms_buildings stores information about a military site:
-- {buildingsname={vision_range, max_soldiers}, ...}
-- A construction site doesn't have those values, so we store it here for
-- lookups.
local own_ms_buildings = {}

local foreign_ms_buildings = {}

-- Array of ConstructionSite objects, see the following class
local cs_sites = {}

-- ##############################################
-- A class to handle each found military site
-- ##############################################
-- The purpose to have this as a class is that 
-- each construction site controls itself. 
-- Controling lasts during the lifetime of a 
-- construction site. Properies:
--
-- field:             Field where this cs stands on. Used to check if an 
--                    immovable still exists
-- bld_name:          The name of the building. Used as key for table 
--                    own_ms_buildings to get assigned values
-- enemy_nearby:      Bool wich indicates if an enemy is nearby
-- capacity:          Initial soldier capacity. Used to check if a player has 
--                    modified this setting
-- sold_preference:   Initial preference of soldiers. Used to check if a 
--                    player has modified this setting
-- pl_set_capacity:   Bool which indicates if a player has changed this setting
-- pl_set_preference: Bool which indicates if a player has changed this setting
-- reassign:          Bool which indicates if soldier settings have to be done
--                    again. Just to prevent to make the same setting again.
-- observed:          Bool wich indicates if this military site should
--                    still be observed. This is the communication between 
--                    a class object to outside the class. See start_observing()

local ConstructionSite = {}
ConstructionSite.__index = ConstructionSite
function ConstructionSite:new (field, becomes)
   local self = setmetatable({}, ConstructionSite)
   self.field = field
   self.bld_name = becomes
   self.enemy_nearby = false
   self.capacity = self.field.immovable.setting_soldier_capacity
   self.sold_preference = self.field.immovable.setting_soldier_preference
   self.pl_set_capacity = false
   self.pl_set_preference = false
   self.reassign = true
   self.observed = true
   return self
end

-- Determine if a player has modified one of the settings
function ConstructionSite:set_modified_by_player(im)
   if im then
      if im.setting_soldier_capacity ~= self.capacity then
         -- Player has changed capacity
         self.pl_set_capacity = true
      end
      if im.setting_soldier_preference ~= self.sold_preference then
         -- Player has changed preference
         self.pl_set_preference = true
      end
   end
end

-- Helperfunction for is_enemy_nearby()
-- Checks if an enemies miltary building or its construction site
-- is build on 'field'
function ConstructionSite:has_military_site(field)
   local im = field.immovable
   if im then
      if im.descr.type_name == 'militarysite' then
         return true
      elseif im.descr.type_name == 'constructionsite' then
         -- check if it becomes a military building
         for i, b_name in ipairs(foreign_ms_buildings) do
            if b_name == im.building then
               return true
            end
         end
      end
   end
   return false
end

function ConstructionSite:is_enemy_nearby(im)
   if im then
      local radius = own_ms_buildings[self.bld_name]["vrange"]
      for i, f in pairs(self.field:region(radius)) do
         if ia_plr:sees_field(f) then
            -- we do this only for fields with no fog of war, otherwise
            -- it is like cheating
            -- no mans land owner is nil
            if f.owner ~= nil and f.owner ~= ia_plr then
               if f.immovable and self:has_military_site(f) then 
                  return true
               end
            end
         end
      end
      return false
   end
end

-- Check if the construction site still exists or if it has changed
function ConstructionSite:check_state()
   local im = self.field.immovable
   if not im then
      -- print("CS destroyed", self.field)
      self.observed = false
      return nil
   elseif im.descr.type_name ~= "constructionsite" then
      -- print("CS built, dismantled or turned to ashes", self.field)
      self.observed = false
      return nil
   elseif im.building ~= self.bld_name then
      -- print("Building enhanced", self.field)
      -- adjust new values
      self.bld_name = im.building
      self.capacity = self.field.immovable.setting_soldier_capacity
      self.sold_preference = self.field.immovable.setting_soldier_preference
   end
   return im
end

function ConstructionSite:init_all()
   local im = self:check_state()
   if im then
      self:set_modified_by_player(im)
      if self:is_enemy_nearby(im) then
         if not self.enemy_nearby then
            -- formerly there was no enemy nearby
            self.enemy_nearby = true
            self.reassign = true
         end
      else
         -- no enemy found
         if self.enemy_nearby then
            -- formerly there was an enemy nearby
            self.enemy_nearby = false
            self.reassign = true
         end
      end
      return im
   end
   return nil
end


function ConstructionSite:set_soldiers()
   local im = self:init_all()
   if im then
      if self.reassign then
         self.reassign = false
         if self.enemy_nearby then
            --print("Setting heroes", self.field)
            if not self.pl_set_preference then
               im.setting_soldier_preference = "heroes"
               self.sold_preference = "heroes"
            end
            if not self.pl_set_capacity then
               im.setting_soldier_capacity = own_ms_buildings[self.bld_name]["max_sold"]
               self.capacity = own_ms_buildings[self.bld_name]["max_sold"] 
            end
         else
            --print("Setting rookies", self.field)
            if not self.pl_set_preference then
               im.setting_soldier_preference = "rookies"
               self.sold_preference = "rookies"
            end
            if not self.pl_set_capacity then
               im.setting_soldier_capacity = 1
               self.capacity = 1
            end
         end
      end
   end
end
-- End of Class


-- Gather the names of military buildings.
-- For the actual player we store the names of military buildings in 
-- 'own_ms_buildings' and assign some values to it.
-- For the opposite players we store the names in 'foreign_ms_buildings'
local function get_mil_site_names()
   for i, plr in pairs(wl.Game().players) do
      local buildings = plr.tribe.buildings
      for i, b in pairs(buildings) do
         if b.type_name == 'militarysite' then
            if plr == ia_plr then
               if b.max_number_of_soldiers > 1 then
                  own_ms_buildings[b.name] = {
                  vrange = b.vision_range,
                  max_sold = b.max_number_of_soldiers
                  }
               end
            else
               table.insert(foreign_ms_buildings, b.name)
            end
         end
      end
   end
end

-- Remove class object from table of ConstructionSite objects
local function clean_cs_sites()
   for i, cs_obj in pairs(cs_sites) do
      if cs_obj.observed == false then
         -- print("Removing observed CS", cs_obj.field)
         table.remove(cs_sites, i)
      end
   end
end

-- Controling a ConstructionSite object
-- This coroutine is called for each new found Construction site and is running 
-- as long the Construction site exists.
-- The observing decision is made inside the class objects method check_state()
-- which adjusts the class propery 'observed'
local function start_observing(cs_obj)
   -- print("Start observing CS", cs_obj.field)
   while cs_obj.observed == true do
      cs_obj:set_soldiers()
      sleep(1000)
   end
   -- print("Stop observing CS", cs_obj.field)
   clean_cs_sites()
end

-- Check if a class object is already in cs_sites
local function already_observed(field)
   for i, cs_obj in ipairs(cs_sites) do
      if field == cs_obj.field then
         return true
      end
   end
   return false
end

-- Main coroutine
local function set_constuction_sites()
   while true do
      -- Search for new military sites
      for name, values in pairs(own_ms_buildings) do
         local constr_sites = ia_plr:get_constructionsites(name)
         for i, cs in ipairs(constr_sites) do
            if not already_observed(cs.fields[1]) then
               -- print("Adding cs", cs.fields[1])
               -- Found a new military construction site, create a 
               -- ConstructionSite object
               local new_cs = ConstructionSite:new(cs.fields[1], name)
               -- Start a coroutine to observe it
               run(start_observing, new_cs)
               table.insert(cs_sites, new_cs)
            end
         end
      end
      sleep(2000)
   end
end

get_mil_site_names()
run(set_constuction_sites)
