-- Init file of the Higher Experience add-on

local tribes = wl.Descriptions()
local egbase = (wl.Game or wl.Editor)()

-- In v1.3 and newer, load all tribes first
for i,name in ipairs(tribes.all_tribes_names or {}) do
	egbase:get_tribe_description(name)
end

-- The actual modification of all loaded workers
for i,descr in pairs(tribes.worker_descriptions) do
   if descr.becomes then
      tribes:modify_unit("worker", descr.name, "experience", 10 * descr.needed_experience)
   end
end
