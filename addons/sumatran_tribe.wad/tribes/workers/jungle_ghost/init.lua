push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_carrier_type {
    name = "sumatran_jungle_ghost",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("sumatran_worker", "Jungle Ghost"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    buildcost = { 
      sumatrans_carrier = 1,
    },

   programs = {
      release_crocodile = {
         "findspace=size:any radius:2",
         "walk=coords",
         "createbob=crocodile",
         "return"
      },
      release = {
         "findspace=size:any radius:2",
         "walk=coords",
         "createbob=rhinoceros lynx",
         "return"
      },
      check_spring = {
         "findspace=size:any radius:8 terraform:amazons",
      },
      terraform_spring = {
         "findspace=size:any radius:8 terraform:amazons",
         "walk=coords",
         "terraform=amazons",
         "return"
      },
   },
    
    animation_directory = dirname,    
    spritesheets = {
      idle = {
         fps = 10,
         frames = 50,
         rows = 8,
         columns = 7,
         hotspot = { 13, 24 }
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 25 }
      }
    },
}

pop_textdomain()
