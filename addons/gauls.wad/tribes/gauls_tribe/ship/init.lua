
push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ship_type {
    name = "gauls_ship",
    -- TRANSLATORS: This is the gauls ship’s name used in lists of units
    descname = pgettext("gaulss_ship", "Ship"),
    icon = dirname .. "menu.png",
    capacity = 30,
    vision_range = 4,
    
    hitpoints    = 50000,
    min_attack   =  100,
    max_attack   =  10000,
    defense         =  5,
    attack_accuracy = 60,
    heal_per_second = 100,

    animation_directory = dirname,
    spritesheets = {
        idle = {
           fps = 10,
           frames = 39,
           rows = 7,
           columns = 6,
           hotspot = { 58, 65 }
        },
        sail = {
           fps = 10,
           frames = 40,
           rows = 7,
           columns = 6,
           directional = true,
           hotspot = { 86, 95 }
        },
        sinking = {
           fps = 7,
           frames = 22,
           rows = 6,
           columns = 4,
           hotspot = { 58, 64 }
        },
   },

    names = {
        pgettext("shipname", "Adyantumaros"), 
        pgettext("shipname", "Arduinna"), 
        pgettext("shipname", "Argyotalus"), 
        pgettext("shipname", "Artio"), 
        pgettext("shipname", "Aryogaisos"), 
        pgettext("shipname", "Atebodwos"), 
        pgettext("shipname", "Ategnatos"), 
        pgettext("shipname", "Atikoryos"), 
        pgettext("shipname", "Axrotalus"), 
        pgettext("shipname", "Bodwognatos"), 
        pgettext("shipname", "Bodyokassos"), 
        pgettext("shipname", "Borvo"), 
        pgettext("shipname", "Brennus"), 
        pgettext("shipname", "Brogimaros"), 
        pgettext("shipname", "Cernunnos"), 
        pgettext("shipname", "Cingetorix"), 
        pgettext("shipname", "Dagodubnos"), 
        pgettext("shipname", "Dagodurnos"), 
        pgettext("shipname", "Dagomaros"), 
        pgettext("shipname", "Dewognata"), 
        pgettext("shipname", "Dubnorix"), 
        pgettext("shipname", "Dumnorix"), 
        pgettext("shipname", "Epona"), 
        pgettext("shipname", "Garomaros"), 
        pgettext("shipname", "Gobannos"), 
        pgettext("shipname", "Indutiomarus"), 
        pgettext("shipname", "Katumaros"), 
        pgettext("shipname", "Katurix"), 
        pgettext("shipname", "Kingetorix"), 
        pgettext("shipname", "Kintugenos"), 
        pgettext("shipname", "Kintugnatos"), 
        pgettext("shipname", "Kunopennos"), 
        pgettext("shipname", "Lugh"), 
        pgettext("shipname", "Lugus"), 
        pgettext("shipname", "Lukotorix"), 
        pgettext("shipname", "Lutumaros"), 
        pgettext("shipname", "Mogurix"), 
        pgettext("shipname", "Nantosuelta"), 
        pgettext("shipname", "Ogmios"), 
        pgettext("shipname", "Orgetorix"), 
        pgettext("shipname", "Segomaros"), 
        pgettext("shipname", "Sirona"), 
        pgettext("shipname", "Suadurix"), 
        pgettext("shipname", "Sucellos"), 
        pgettext("shipname", "Taranis"), 
        pgettext("shipname", "Tinkomaros"), 
        pgettext("shipname", "Vercingetorix"), 
        pgettext("shipname", "Welyokassos"), 
        pgettext("shipname", "Wenikaros"), 
        pgettext("shipname", "Werkassiwellawnos"), 
        pgettext("shipname", "Werkingetorix"), 
        pgettext("shipname", "Wirogalos"), 
        pgettext("shipname", "Yantumaros"), 
    }
}

pop_textdomain()
