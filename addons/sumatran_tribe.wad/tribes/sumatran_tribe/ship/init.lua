
push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ship_type {
    name = "sumatrans_ship",
    -- TRANSLATORS: This is the Sumatran ship's name used in lists of units
    descname = pgettext("sumatrans_ship", "Ship"),
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
           hotspot = { 58, 55 }
        },
        sail = {
           fps = 10,
           frames = 40,
           rows = 7,
           columns = 6,
           directional = true,
           hotspot = { 86, 85 }
        },
        sinking = {
           fps = 7,
           frames = 22,
           rows = 6,
           columns = 4,
           hotspot = { 58, 54 }
        },
   },

    names = {
        pgettext("shipname", "Mutiara"), -- pearl
        pgettext("shipname", "Tembakan"), -- shot
        pgettext("shipname", "Ular"), -- snake
        pgettext("shipname", "Berlian"), -- diamond
        pgettext("shipname", "Harimau"), -- tyger
        pgettext("shipname", "Matahari"), -- sun
        pgettext("shipname", "Bintang"), -- star
        pgettext("shipname", "Hitam"), -- black
        pgettext("shipname", "Putih"), -- white
        pgettext("shipname", "Angsa"), -- swan
        pgettext("shipname", "Tiang Tinggi"), -- high mast
        pgettext("shipname", "Harta Karun"), -- treasure
        pgettext("shipname", "Koncah"), -- wavelet
        pgettext("shipname", "Merah"), -- red
        pgettext("shipname", "Sinar"), -- beam
        pgettext("shipname", "Mawar Emas"), -- golden rose
        pgettext("shipname", "Mahkota"), -- crown
        pgettext("shipname", "Bahtera Baru"), -- new ark
        pgettext("shipname", "Ular Laut"), -- sea snake
        pgettext("shipname", "Ikan"), -- fish
        pgettext("shipname", "Awan Cepat"), -- fast cloud
        pgettext("shipname", "Istana Laut"), -- sea castle
        pgettext("shipname", "Buaian"), -- cradle
        pgettext("shipname", "Merpati"), -- dove
        pgettext("shipname", "Panah"), -- arrow
        pgettext("shipname", "Lentera"), -- lamp
        pgettext("shipname", "Paus Pembunuh"), -- orca
        pgettext("shipname", "Kerang"), -- shell
        pgettext("shipname", "Batok Kelapa"), -- coconut shell
        pgettext("shipname", "Layar Besar"), -- larg sail
    }
}

pop_textdomain()
