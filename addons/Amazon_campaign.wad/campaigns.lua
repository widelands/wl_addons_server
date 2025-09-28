-- See data/campaigns/campaigns.lua and
-- https://www.widelands.org/documentation/add-ons/#campaign

--##########################################
--#      Campaign configuration - file     #
--##########################################

push_textdomain("Amazon_campaign.wad", true)

local r = {
   --##########################################
   --#   Descriptions of difficulty levels    #
   --##########################################
   difficulties = {
      {
         -- This will be prefixed to any text that you might add in each
         -- campaign's difficulty description.
         descname = _("Medium."),
         -- An image to represent the difficulty level
         -- Available: easy, medium, hard, challenging
         image = "images/ui_fsmenu/medium.png",
      },
   },

   --##########################################
   --#        The campaigns themselves        #
   --##########################################
   campaigns = {
      {
         descname = _("The Rise to Power"),
         tribe = "amazons",
         difficulty = { level=1, description=_("Introduces the amazons") },
         -- The difficulty stages of this campaign. The user gets to choose them in the
         -- campaign select screen and the choice is available to the scenario scripts.
         difficulties = {
            -- TRANSLATORS: A campaign difficulty (easiest of three options)
            _("Easy"),
            -- TRANSLATORS: A campaign difficulty (medium of three options)
            _("Medium"),
            -- TRANSLATORS: A campaign difficulty (hardest of three options)
            _("Hard"),
         },
         -- Index of the entry in `difficulties` that is selected by default
         default_difficulty = 2,
         description = _("This is the story of Pachiquima, an amazon woman from a small mountain village. We follow her on her journey through life and her rise to power."),
         scenarios = {
            "Amazon_campaign.wad:Amazon_campaign/ama01.wmf",
            "dummy.wmf"
         }
      }
   }
}
pop_textdomain()
return r
