-- Init file of the Higher Experience add-on
local tribes = wl.Descriptions()
for i,descr in pairs(tribes.worker_descriptions) do
   if descr.becomes then
      tribes:modify_unit("worker", descr.name, "experience", 40 * descr.needed_experience)
   end
end
