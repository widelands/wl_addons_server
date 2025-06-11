addon_dirname = path.dirname(__file__)
push_textdomain("europeans_all.wad", true)

--------------------------------------------------------------------------------
--                                 Workers
--------------------------------------------------------------------------------
-- additional or modified planting programms
wl.Descriptions():modify_unit("worker", "amazons_jungle_master", "programs", "set", "plant_liana", {
         "findspace=size:any radius:5 avoid:field saplingsearches:7",
         "walk=coords",
         "animate=dig duration:2s",
         "animate=planting duration:1s",
         "plant=attrib:liana_tree_sapling",
         "animate=planting duration:1s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "amazons_cassava_farmer", "programs", "set", "plant_cotton", {
         "findspace=size:any radius:4 space avoid:field",
         "walk=coords",
         "animate=planting_harvesting duration:6s",
         "plant=attrib:seed_cotton",
         "animate=planting_harvesting duration:6s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "empire_farmer", "programs", "set", "plant_rye", {
         "findspace=size:any radius:2 space avoid:field",
         "walk=coords",
         "animate=planting duration:6s",
         "plant=attrib:seed_rye",
         "animate=planting duration:6s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "empire_vinefarmer", "programs", "set", "plant_grape", {
         "findspace=size:any radius:4 space avoid:field",
         "walk=coords",
         "animate=dig duration:5s",
         "plant=attrib:seed_grapes",
         "animate=planting duration:5s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_berry_farmer", "programs", "set", "plant_berry", {
         "findspace=size:any radius:6 space avoid:field",
         "walk=coords",
         "animate=dig duration:2s",
         "animate=planting duration:1s",
         "plant=attrib:seed_berrybush",
         "animate=water duration:2s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_berry_farmer", "programs", "set", "plant_grape", {
         "findspace=size:any radius:6 space avoid:field",
         "walk=coords",
         "animate=dig duration:2s",
         "animate=planting duration:1s",
         "plant=attrib:seed_grapes",
         "animate=water duration:2s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "plant_oat", {
         "findspace=size:any radius:4 space avoid:field",
         "walk=coords",
         "animate=planting duration:6s",
         "plant=attrib:seed_oat",
         "animate=planting duration:6s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "plant_rye", {
         "findspace=size:any radius:4 space avoid:field",
         "walk=coords",
         "animate=planting duration:6s",
         "plant=attrib:seed_rye",
         "animate=planting duration:6s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "plant_wheat", {
         "findspace=size:any radius:4 space avoid:field",
         "walk=coords",
         "animate=planting duration:6s",
         "plant=attrib:seed_wheat",
         "animate=planting duration:6s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_fruit_collector", "programs", "set", "plant_berry", {
         "findspace=size:any radius:6 space avoid:field",
         "walk=coords",
         "animate=idle duration:2s",
         "animate=idle duration:1s",
         "plant=attrib:seed_berrybush",
         "animate=idle duration:2s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_fruit_collector", "programs", "set", "plant_grape", {
         "findspace=size:any radius:6 space avoid:field",
         "walk=coords",
         "animate=idle duration:2s",
         "animate=idle duration:1s",
         "plant=attrib:seed_grapes",
         "animate=idle duration:2s",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_reed_farmer", "programs", "set", "plant_reed", {
         "findspace=size:any radius:2 space avoid:field",
         "walk=coords",
         "animate=dig duration:2s",
         "animate=planting duration:1s",
         "plant=attrib:seed_reed",
         "return"
      })
-- additional or modified harvesting programms
wl.Descriptions():modify_unit("worker", "amazons_cassava_farmer", "programs", "set", "harvest_cotton", {
         "findobject=attrib:ripe_cotton radius:4",
         "walk=object",
         "animate=planting_harvesting duration:10s",
         "callobject=harvest",
         "animate=planting_harvesting duration:4s",
         "createware=cotton",
         "return"
      })
wl.Descriptions():modify_unit("worker", "amazons_liana_cutter", "programs", "set", "harvest_liana", {
         "findobject=attrib:liana_tree radius:10",
         "walk=object",
         "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
         "animate=work duration:4s",
         "playsound=sound/woodcutting/tree_falling priority:100%",
         "animate=work duration:1s",
         "createware=liana",
         "return"
      })
wl.Descriptions():modify_unit("worker", "amazons_woodcutter", "programs", "set", "harvest_liana", {
         "findobject=attrib:liana_tree radius:10",
         "walk=object",
         "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
         "animate=hacking duration:30s",
         "playsound=sound/woodcutting/tree_falling priority:100%",
         "callobject=fall",
         "animate=hacking duration:2s",
         "createware=liana",
         "return"
      })
wl.Descriptions():modify_unit("worker", "amazons_woodcutter", "programs", "set", "harvest_log", {
         "findobject=attrib:tree radius:10",
         "walk=object",
         "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
         "animate=hacking duration:30s",
         "playsound=sound/woodcutting/tree_falling priority:100%",
         "callobject=fall",
         "animate=hacking duration:2s",
         "createware=log",
         "return"
      })
wl.Descriptions():modify_unit("worker", "amazons_woodcutter_master", "programs", "set", "harvest_liana", {
         "findobject=attrib:liana_tree radius:10",
         "walk=object",
         "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
         "animate=hacking duration:25s",
         "playsound=sound/woodcutting/tree_falling priority:100%",
         "callobject=fall",
         "animate=hacking duration:2s",
         "createware=liana",
         "return"
      })
wl.Descriptions():modify_unit("worker", "amazons_woodcutter_master", "programs", "set", "harvest_log", {
         "findobject=attrib:tree radius:10",
         "walk=object",
         "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
         "animate=hacking duration:25s",
         "playsound=sound/woodcutting/tree_falling priority:100%",
         "callobject=fall",
         "animate=hacking duration:2s",
         "createware=log",
         "return"
      })
wl.Descriptions():modify_unit("worker", "empire_farmer", "programs", "set", "harvest_rye", {
         "findobject=attrib:ripe_rye radius:2",
         "walk=object",
         "animate=harvesting duration:10s",
         "callobject=harvest",
         "animate=gathering duration:4s",
         "createware=rye",
         "return"
      })
wl.Descriptions():modify_unit("worker", "empire_vinefarmer", "programs", "set", "harvest_grape", {
         "findobject=attrib:ripe_grapes radius:4",
         "walk=object",
         "animate=gathering duration:8s",
         "callobject=harvest",
         "animate=gathering duration:2s",
         "createware=grape",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_berry_farmer", "programs", "set", "harvest_berry", {
         "findobject=attrib:ripe_bush radius:6",
         "walk=object",
         "animate=planting duration:8s",
         "callobject=harvest",
         "animate=idle duration:1s",
         "createware=fruit",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_berry_farmer", "programs", "set", "harvest_grape", {
         "findobject=attrib:ripe_grapes radius:6",
         "walk=object",
         "animate=planting duration:8s",
         "callobject=harvest",
         "animate=idle duration:1s",
         "createware=grape",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "harvest_oat", {
         "findobject=attrib:ripe_oat radius:4",
         "walk=object",
         "animate=harvesting duration:10s",
         "callobject=harvest",
         "animate=gathering duration:4s",
         "createware=oat",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "harvest_rye", {
         "findobject=attrib:ripe_rye radius:4",
         "walk=object",
         "animate=harvesting duration:10s",
         "callobject=harvest",
         "animate=gathering duration:4s",
         "createware=rye",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_farmer", "programs", "set", "harvest_wheat", {
         "findobject=attrib:ripe_wheat radius:4",
         "walk=object",
         "animate=harvesting duration:10s",
         "callobject=harvest",
         "animate=gathering duration:4s",
         "createware=wheat",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_fruit_collector", "programs", "set", "harvest_berry", {
         "findobject=attrib:ripe_bush radius:6",
         "walk=object",
         "animate=gather duration:8s",
         "callobject=harvest",
         "animate=idle duration:1s",
         "createware=fruit",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_fruit_collector", "programs", "set", "harvest_grape", {
         "findobject=attrib:ripe_grapes radius:6",
         "walk=object",
         "animate=gather duration:8s",
         "callobject=harvest",
         "animate=idle duration:1s",
         "createware=grape",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_reed_farmer", "programs", "set", "harvest_reed", {
         "findobject=attrib:ripe_reed radius:2",
         "walk=object",
         "animate=harvesting duration:6s",
         "callobject=harvest",
         "animate=harvesting duration:6s",
         "createware=reed",
         "return"
      })
-- additional collecting programms
wl.Descriptions():modify_unit("worker", "atlanteans_stonecutter", "programs", "set", "cut_marble", {
         "findobject=attrib:rocks radius:6",
         "walk=object",
         "playsound=sound/stonecutting/stonecutter priority:70% allow_multiple",
         "animate=hacking duration:17s500ms",
         "callobject=shrink",
         "createware=marble",
         "return"
      })
wl.Descriptions():modify_unit("worker", "atlanteans_fishbreeder", "programs", "set", "fish_in_pond", {
         "findobject=attrib:pond_mature radius:8",
         "walk=object",
         "animate=freeing duration:3s",
         "callobject=fall_dry",
         "createware=fish",
         "return"
      })
wl.Descriptions():modify_unit("worker", "atlanteans_fishbreeder", "programs", "set", "breed_in_pond", {
         "findobject=attrib:pond_dry radius:8",
         "walk=object",
         "animate=freeing duration:2s",
         "callobject=with_fish",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_stonemason", "programs", "set", "cut_marble", {
         "findobject=attrib:rocks radius:6",
         "walk=object",
         "playsound=sound/stonecutting/stonecutter priority:70% allow_multiple",
         "animate=hacking duration:17s500ms",
         "callobject=shrink",
         "createware=marble",
         "return"
      })
-- modified diking programms
wl.Descriptions():modify_unit("worker", "frisians_diker", "programs", "set", "check_build", {
         "findspace=size:swim radius:32 terraform:diking",
      })
wl.Descriptions():modify_unit("worker", "frisians_diker", "programs", "set", "build", {
         "findspace=size:swim radius:32 terraform:diking",
         "walk=coords",
         "animate=work duration:60s",
         "plant=attrib:dike",
         "return"
      })
wl.Descriptions():modify_unit("worker", "frisians_diker", "programs", "set", "check_dike", {
         "findobject=attrib:dike radius:32",
      })
wl.Descriptions():modify_unit("worker", "frisians_diker", "programs", "set", "dike", {
         "findobject=attrib:dike radius:32",
         "walk=object",
         "animate=work duration:30s",
         "callobject=maybe_remove",
         "animate=work duration:30s",
         "terraform=diking",
         "animate=work duration:30s",
         "return"
      })

pop_textdomain()
