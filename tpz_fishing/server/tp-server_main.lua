
local TPZ    = {}

TriggerEvent("getTPZCore", function(cb) TPZ = cb end)

local TPZInv      = exports.tpz_inventory:getInventoryAPI()

-----------------------------------------------------------
--[[ Local Functions ]]--
-----------------------------------------------------------

-- @GetFishModelDataParameters returns all fish data such as name, label, textures and desc.
local GetFishModelDataParameters = function (fishModel)
    
    for _, data in pairs (Config.FishData) do
        
        local model = GetHashKey(_)

        if model == fishModel then

            -- Adding an extra data parameter with the fish item name.
            data[4] = tostring(_)
            data[4] = string.lower(data[4])
            
            return data
        end

    end

    return nil

end

-----------------------------------------------------------
--[[ Events ]]--
-----------------------------------------------------------

RegisterServerEvent('tpz_fishing:addFishItemToPlayerInventory')
AddEventHandler("tpz_fishing:addFishItemToPlayerInventory", function(fishModel)
    local _source = source

    local catchedFishData = GetFishModelDataParameters(fishModel)
    if catchedFishData == nil then
        return
    end

    local name, texture, fish = catchedFishData[1], catchedFishData[2], catchedFishData[4]
    
    TPZInv.addItem(_source, fish, 1)

    TriggerClientEvent('tpz_core:sendAdvancedRightNotification', _source, string.format(Locales['FISH_CATCHED'], name), "inventory_items", texture, "COLOR_PURE_WHITE", 4000)
end)

-- The following event is triggered by client and sends a webhook when the player catches a fish.
RegisterServerEvent('tpz_fishing:sendToDiscord')
AddEventHandler("tpz_fishing:sendToDiscord", function(fishModel, weight, status)
    local _source         = source

    local xPlayer         = TPZ.GetPlayer(_source)
	local charidentifier  = xPlayer.getCharacterIdentifier()
    local steamName       = GetPlayerName(_source)

    local catchedFishData = GetFishModelDataParameters(fishModel)

    if catchedFishData == nil then
        return
    end

    local fishName        = catchedFishData[1]
    local fishWeight      = string.format("%.2f%%", (weight * 54.25))

    local title   = "🎣` Fishing`"
    local message = "The following fish has been found: **`( Name: " .. fishName .. ", Weight: " .. fishWeight .. ")`** by the player: \n\n`" .. steamName .. " (Char Id : " .. charidentifier .. ")`"

    local webhookData = Config.DiscordWebhooking
    TriggerEvent("tpz_core:sendToDiscord", webhookData.Url, title, message, webhookData.Color)
end)
