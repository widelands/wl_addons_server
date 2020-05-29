--##########################################
--#      Campaign configuration - file     #
--##########################################

set_addon_textdomain("dummy-campaign.wad")

return {
   --##########################################
   --#   Descriptions of difficulty levels    #
   --##########################################
   difficulties = {
      {
         -- This will be prefixed to any text that you might add in each
         -- campaign's difficulty description.
         -- TRANSLATORS: The difficulty level of a campaign
         descname = _"Easy.",
         -- An image to represent the difficulty level
         image = "images/ui_fsmenu/easy.png",
      },
   },

   --##########################################
   --#        The campaigns themselves        #
   --##########################################
   campaigns = {
      {
         descname = _"Dummy",
         tribe = "barbarians",
         difficulty = { level=1, description=_"Dummy campaign." },
         description = _"This campaign is not playable. It only demonstrates the campaign-type add-on feature.",
         scenarios = {
            "dummy-campaign.wad:example-dummy.wmf",
            "dummy.wmf"
         }
      }
   }
}
