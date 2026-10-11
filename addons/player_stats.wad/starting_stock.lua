function store_starting_stock()
   -- run only once, if this is a new game
   if _player_stats_starting_stock_ ~= nil then
      return
   end
   local game = wl.Game()
   if game.time > 2000 then
      return
   end

   -- global
   _player_stats_starting_stock_ = {}

   for i,p in ipairs(game.players) do
      local n = p.number
      -- we want to check that nothing is produced yet, and this gives us the list of
      -- the tribe's wares too that we can use in get_wares()
      _player_stats_starting_stock_[n] = p:get_produced_wares_count("all")
      for w,c in pairs(_player_stats_starting_stock_[n]) do
         if c ~= 0 then
            -- something's wrong, abort everything
            _player_stats_starting_stock_ = nil
            return
         end

         _player_stats_starting_stock_[n][w] = p:get_wares(w)
      end
   end
end

-- UI plugin scripts are run too early for new games and replays, before the game is set up,
-- and before the starting condition script.
-- We want to run as soon as possible *after* the starting condition script, however we can't
-- start a coroutine for sleep() yet, so we have to use a plugin timer.
-- Also, we can't test whether _player_stats_starting_stock_ will be already set in the game,
-- because we can't tell whether the game will be a new one, a loaded one, or a replay
-- starting from the beginning or from a saved game, so we always have to run
-- store_starting_stock() once.
-- Single use timers are only possible from v1.4, so we need to check the version first.

local wlver = string.match(get_build_id(), "[0-9]*[.][0-9]*")
if string.len(wlver) < 3 then
   -- failure parsing the version, e.g. very old version (build-...)
   return
end

if string.len(wlver) == 3 and wlver + 0.0 >= 1.4 then
   wl.ui.MapView():add_plugin_timer(
      "store_starting_stock()", 1000, "store_starting_stock", 1
   )
else
   -- version 1.3 (or older, which is not guaranteed to work)
   -- Plugin timers can not be stopped cleanly, so it will run indefinitely, relying on the
   -- test in the beginning of the function to not overwrite the stored values.
   wl.ui.MapView():add_plugin_timer("store_starting_stock()", 1000)
end
