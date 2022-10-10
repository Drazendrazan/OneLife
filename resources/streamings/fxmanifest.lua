fx_version 'adamant'
game 'gta5'

this_is_a_map 'yes'

data_file 'TIMECYCLEMOD_FILE' 'gabz_mrpd_timecycle.xml'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

files {
	'gabz_mrpd_timecycle.xml',
	'interiorproxies.meta'
}

client_script {
    "gabz_mrpd_entitysets.lua"
}

files({
	'timecycle_mods_1.xml'
})

data_file('TIMECYCLEMOD_FILE')('timecycle_mods_1.xml')

file 'gabz_timecycle_mods_1.xml'

data_file 'TIMECYCLEMOD_FILE' 'gabz_timecycle_mods_1.xml'

data_file 'DLC_ITYP_REQUEST' 'stream/builderdefaddons.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/altercity_sign1.ytyp'

files({
	'data/**/carcols.meta',
	'data/**/carvariations.meta',
	'data/**/contentunlocks.meta',
	'data/**/handling.meta',
	'data/**/vehiclelayouts.meta',
	'data/**/vehicles.meta'
})

client_scripts({
	'client/main.lua',
	"ipl/client.lua",
	"ipl/*.lua",
    "ipl/**/*.lua"
})

ui_page "hud/ui/index.html"
files {
	"hud/ui/index.html",
	"hud/ui/assets/test.png",
	"hud/ui/assets/hunger.svg",
	"hud/ui/assets/thirst.svg",
	"hud/ui/assets/inventory.svg",
	"hud/ui/assets/battery.svg",
	"hud/ui/assets/reseau.svg",
	"hud/ui/fonts/fonts/Circular-Bold.ttf",
	"hud/ui/fonts/fonts/Circular-Bold.ttf",
	"hud/ui/fonts/fonts/Circular-Regular.ttf",
	"hud/ui/script.js",
	"hud/ui/style.css",
	"hud/ui/debounce.min.js"
}

client_scripts {
    'hud/client.lua',
}

data_file('CONTENT_UNLOCKING_META_FILE')('data/**/contentunlocks.meta')
data_file('HANDLING_FILE')('data/**/handling.meta')
data_file('VEHICLE_METADATA_FILE')('data/**/vehicles.meta')
data_file('CARCOLS_FILE')('data/**/carcols.meta')
data_file('VEHICLE_VARIATION_FILE')('data/**/carvariations.meta')
data_file('VEHICLE_LAYOUTS_FILE')('data/**/vehiclelayouts.meta')

data_file 'DLC_ITYP_REQUEST' 'stream/vw_ch3_additions.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_ch3_additions_strm.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/hei_ch3_lod.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/hei_cityhills_03_metadata_001.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/hei_cityhills_03_metadata_001_strm.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_accs.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_accs_01.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_animated_walls.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_cabinets.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_cards.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_casino.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_casinochips.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_casino_art_01.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_casino_art_02.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vw_prop_vw_casino_art_03.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_casino_art_04.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_casino_art_05.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_collectibles.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_disposal.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_door_break.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_machinery.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_screens.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_storage.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_tables.ytyp'
data_file 'DLC_ITYP_REQUEST' 'vw_prop_vw_turntable.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/fv_props.ytyp'

----DoK

data_file "PED_METADATA_FILE" "peds.meta"

files {
	'peds.meta',
}