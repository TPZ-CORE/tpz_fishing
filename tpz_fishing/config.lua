Config = {}

Config.Debug = true

---------------------------------------------------------------
--[[ General Settings ]]--
---------------------------------------------------------------

Config.tpz_leveling = true

-- If you use -1 for testing the fish is very easy to catch --
Config.Difficulty   = 1250
Config.ReelSpeed    = 0.0125

-- Set to false if you don't want the fishing rod durability to be removed.
Config.Durability = { Enabled = true, RemoveValue = { min = 1, max = 3 } }

---------------------------------------------------------------
--[[ Webhooks ]]--
---------------------------------------------------------------

Config.Webhooks = {
    
    ['DEVTOOLS_INJECTION_CHEAT'] = { -- Warnings and Logs about players who used or atleast tried to use devtools injection.
        Enabled = false, 
        Url = "", 
        Color = 10038562,
    },

        
    ['FISH_RECEIVED'] = {
        Enabled = false, 
        Url = "", 
        Color = 10038562,
    },

}


---------------------------------------------------------------
--[[ Baits ]]--
---------------------------------------------------------------

-- Baits are also the names of the used items when holding a fishing rod.
Config.Baits = {
    "p_baitBread01x",
    "p_baitCorn01x",
    "p_baitCheese01x",
    "p_baitWorm01x",
    "p_baitCricket01x",
    "p_crawdad01x",
    "p_finishedragonfly01x",
    "p_FinisdFishlure01x",
    "p_finishdcrawd01x",
    "p_finishedragonflylegendary01x",
    "p_finisdfishlurelegendary01x",
    "p_finishdcrawdlegendary01x",
    "p_lgoc_spinner_v4",
    "p_lgoc_spinner_v6",
}

---------------------------------------------------------------
--[[ Baits ]]--
---------------------------------------------------------------

Config.BaitsPerFish = {

    ["p_baitBread01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
    },

    ["p_baitCorn01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
    },

    ["p_baitCheese01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
    },

    ["p_baitCricket01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHMUSKIE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHRAINBOWTROUT_01_LG",
        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHSMALLMOUTHBASS_01_LG",
    },

    ["p_baitWorm01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHCHAINPICKEREL_01_MS",
        "A_C_FISHCHAINPICKEREL_01_SM",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHRAINBOWTROUT_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHROCKBASS_01_MS",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },

    ["p_crawdad01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHMUSKIE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
    },

    ["p_finishedragonfly01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },

    ["p_FinisdFishlure01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHLONGNOSEGAR_01_LG",
        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },

    ["p_finishdcrawd01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHCHAINPICKEREL_01_SM",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHLONGNOSEGAR_01_LG",
        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },

    ["p_finishedragonflylegendary01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHCHAINPICKEREL_01_MS",
        "A_C_FISHCHAINPICKEREL_01_SM",
        "A_C_FISHCHANNELCATFISH_01_LG",
        "A_C_FISHCHANNELCATFISH_01_XL",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHLONGNOSEGAR_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },

    ["p_finisdfishlurelegendary01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHCHAINPICKEREL_01_MS",
        "A_C_FISHCHANNELCATFISH_01_LG",
        "A_C_FISHCHANNELCATFISH_01_XL",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHLONGNOSEGAR_01_LG",
        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_LG",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },

    ["p_finishdcrawdlegendary01x"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHCHAINPICKEREL_01_MS",
        "A_C_FISHCHANNELCATFISH_01_LG",
        "A_C_FISHCHANNELCATFISH_01_XL",
        "A_C_FISHLAKESTURGEON_01_LG",
        "A_C_FISHLONGNOSEGAR_01_LG",
        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_LG",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },

    ["p_lgoc_spinner_v4"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHCHAINPICKEREL_01_MS",
        "A_C_FISHCHAINPICKEREL_01_SM",
        "A_C_FISHLARGEMOUTHBASS_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHLONGNOSEGAR_01_LG",
        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHROCKBASS_01_MS",
        "A_C_FISHROCKBASS_01_SM",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_LG",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    },
    
    ["p_lgoc_spinner_v6"] = {
        "A_C_FISHBLUEGIL_01_MS",
        "A_C_FISHBLUEGIL_01_SM",
        "A_C_FISHBULLHEADCAT_01_MS",
        "A_C_FISHBULLHEADCAT_01_SM",
        "A_C_FISHCHAINPICKEREL_01_MS",
        "A_C_FISHCHAINPICKEREL_01_SM",
        "A_C_FISHLARGEMOUTHBASS_01_LG",
        "A_C_FISHLARGEMOUTHBASS_01_MS",
        "A_C_FISHLONGNOSEGAR_01_LG",
        "A_C_FISHNORTHERNPIKE_01_LG",
        "A_C_FISHPERCH_01_MS",
        "A_C_FISHPERCH_01_SM",
        "A_C_FISHREDFINPICKEREL_01_MS",
        "A_C_FISHREDFINPICKEREL_01_SM",
        "A_C_FISHROCKBASS_01_MS",
        "A_C_FISHROCKBASS_01_SM",
        "A_C_FISHSALMONSOCKEYE_01_LG",
        "A_C_FISHSALMONSOCKEYE_01_ML",
        "A_C_FISHSALMONSOCKEYE_01_MS",
        "A_C_FISHSMALLMOUTHBASS_01_LG",
        "A_C_FISHSMALLMOUTHBASS_01_MS",
    }
}

---------------------------------------------------------------
--[[ Baits ]]--
---------------------------------------------------------------

-- args[4] (number): the leveling experience to be received if tpz_leveling is enabled.
Config.FishData = {
	A_C_FISHBLUEGIL_01_MS        = { "Blue Gil (Medium)", "PROVISION_FISH_BLUEGILL", "PROVISION_BLUEGILL_DESC", 100 },
	A_C_FISHBLUEGIL_01_SM        = { "Blue Gil (Small)", "PROVISION_FISH_BLUEGILL", "PROVISION_BLUEGILL_DESC", 100 },
	A_C_FISHBULLHEADCAT_01_MS    = { "Bullhead Cat (medium)", "PROVISION_FISH_BULLHEAD_CATFISH", "PROVISION_BLUEGILL_DESC", 100 },
	A_C_FISHBULLHEADCAT_01_SM    = { "Bullhead Cat (small)", "PROVISION_FISH_BULLHEAD_CATFISH", "PROVISION_BLUEGILL_DESC", 100 },
	A_C_FISHCHAINPICKEREL_01_MS  = { "Chain Pickerel (medium)", "PROVISION_FISH_CHAIN_PICKEREL", "PROVISION_CHNPKRL_DESC", 100 },
	A_C_FISHCHAINPICKEREL_01_SM  = { "Chain Pickerel (small)", "PROVISION_FISH_CHAIN_PICKEREL", "PROVISION_CHNPKRL_DESC", 100 },
	A_C_FISHCHANNELCATFISH_01_LG = { "Channel Catfish (Large)", "PROVISION_FISH_CHANNEL_CATFISH", "PROVISION_CHNCATFSH_DESC", 100 },
	A_C_FISHCHANNELCATFISH_01_XL = { "Channel Catfish (Extra Large)", "PROVISION_FISH_CHANNEL_CATFISH", "PROVISION_CHNCATFSH_DESC", 100 },
	A_C_FISHLAKESTURGEON_01_LG   = { "Lake Sturgeon (Large)", "PROVISION_FISH_LAKE_STURGEON", "PROVISION_LKSTURG_DESC", 100 },
	A_C_FISHLARGEMOUTHBASS_01_LG = { "Large Mouth Bass (Large)", "PROVISION_FISH_LARGEMOUTH_BASS", "PROVISION_LRGMTHBASS_DESC", 100 },
	A_C_FISHLARGEMOUTHBASS_01_MS = { "Large Mouth Bass (Medium)", "PROVISION_FISH_LARGEMOUTH_BASS", "PROVISION_LRGMTHBASS_DESC", 100 },
	A_C_FISHLONGNOSEGAR_01_LG    = { "Long Nose Gar (Large)", "PROVISION_FISH_LONGNOSE_GAR", "PROVISION_LNGNOSEGAR_DESC", 100 },
	A_C_FISHMUSKIE_01_LG         = { "Muskie (Large)", "PROVISION_FISH_MUSKIE", "PROVISION_MUSKIE_DESC", 100 },
	A_C_FISHNORTHERNPIKE_01_LG   = { "Northern Pike (Large)", "PROVISION_FISH_NORTHERN_PIKE", "PROVISION_NPIKE_DESC", 100 },
	A_C_FISHPERCH_01_MS          = { "Perch (medium)", "PROVISION_FISH_PERCH", "PROVISION_PERCH_DESC", 100 },
	A_C_FISHPERCH_01_SM          = { "Perch (small)", "PROVISION_FISH_PERCH", "PROVISION_PERCH_DESC", 100 },
	A_C_FISHRAINBOWTROUT_01_LG   = { "Rainbow Trout (Large)", "PROVISION_FISH_STEELHEAD_TROUT", "PROVISION_FISH_STHDTROUT_DESC", 100 },
	A_C_FISHRAINBOWTROUT_01_MS   = { "Rainbow Trout (Medium)", "PROVISION_FISH_STEELHEAD_TROUT", "PROVISION_FISH_STHDTROUT_DESC", 100 },
	A_C_FISHREDFINPICKEREL_01_MS = { "Red Fin Pickerel (Medium)", "PROVISION_FISH_REDFIN_PICKEREL", "PROVISION_RDFNPCKREL_DESC", 100 },
	A_C_FISHREDFINPICKEREL_01_SM = { "Red Fin Pickerel (Small)", "PROVISION_FISH_REDFIN_PICKEREL", "PROVISION_RDFNPCKREL_DESC", 100 },
	A_C_FISHROCKBASS_01_MS       = { "Rock Bass (medium)", "PROVISION_FISH_ROCK_BASS", "PROVISION_ROCKBASS_DESC", 100 },
	A_C_FISHROCKBASS_01_SM       = { "Rock Bass (small)", "PROVISION_FISH_ROCK_BASS", "PROVISION_ROCKBASS_DESC", 100 },
	A_C_FISHSALMONSOCKEYE_01_LG  = { "Salmon Sockeye (Large)", "PROVISION_FISH_SOCKEYE_SALMON_LEGENDARY", "PROVISION_SCKEYESAL_DESC", 100 },
	A_C_FISHSALMONSOCKEYE_01_ML  = { "Salmon Sockeye (Medium-Large)", "PROVISION_FISH_SOCKEYE_SALMON", "PROVISION_SCKEYESAL_DESC", 100 },
	A_C_FISHSALMONSOCKEYE_01_MS  = { "Salmon Sockeye (Medium)", "PROVISION_FISH_SOCKEYE_SALMON", "PROVISION_SCKEYESAL_DESC", 100 },
	A_C_FISHSMALLMOUTHBASS_01_LG = { "Small Mouth Bass (Large)", "PROVISION_FISH_SMALLMOUTH_BASS", "PROVISION_SMLMTHBASS_DESC", 100 },
	A_C_FISHSMALLMOUTHBASS_01_MS = { "Small Mouth Bass (Medium)", "PROVISION_FISH_SMALLMOUTH_BASS", "PROVISION_SMLMTHBASS_DESC", 100 },
}

-----------------------------------------------------------
--[[ Notification Functions  ]]--
-----------------------------------------------------------

-- @param source is always null when called from client.
-- @param messageType returns "success" or "error" depends when and where the message is sent.
function SendNotification(source, message, messageType)

    if not source then
        TriggerEvent('tpz_core:sendRightTipNotification', message, 3000)
    else
        TriggerClientEvent('tpz_core:sendRightTipNotification', source, message, 3000)
    end
  
end
