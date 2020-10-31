-- Init file of the Higher Experience add-on
if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
local tribes = wl.Descriptions()
for i,name in pairs(tribes.worker_descriptions) do
   local descr = egbase:get_worker_description(name)
   if descr.becomes then
      tribes:modify_unit("worker", name, "experience", 40 * descr.needed_experience)
   end
end
