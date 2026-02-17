-- init.lua for the Hebrew Tribe add-on
-- This file is the entry point executed when the add-on is loaded by the
-- Widelands engine. It sets up the textdomain and includes the tribe
-- initialization files.

push_textdomain("hebrews_tribe.wad", true)

-- Include the tribe initialization
-- The engine will handle loading based on register.lua
include("addons/hebrews_tribe.wad/tribes/initialization/hebrews/init.lua")

pop_textdomain()
