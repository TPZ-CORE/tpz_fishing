local TPZ    = exports.tpz_core:getCoreAPI()
local TPZInv = exports.tpz_inventory:getInventoryAPI()

local PlayerBaits = {}

-----------------------------------------------------------
--[[ Local Functions ]]--
-----------------------------------------------------------

-- @GetFishModelDataParameters returns all fish data such as name, label, textures and desc.
local GetFishModelDataParameters = function (fishModel)
    
    for _, data in pairs (Config.FishData) do
        
        local model = GetHashKey(_)

        if model == fishModel then

            -- Adding an extra data parameter with the fish item name.
            data[5] = tostring(_)
            data[5] = string.lower(data[5])
            
            return data
        end

    end

    return nil

end

local function GetPlayerData(source)
	local _source     = source
    local xPlayer     = TPZ.GetPlayer(_source)

	return {
        steamName      = GetPlayerName(_source),
        username       = xPlayer.getFirstName() .. ' ' .. xPlayer.getLastName(),
		identifier     = xPlayer.getIdentifier(),
        charIdentifier = xPlayer.getCharacterIdentifier(),
	}

end

-----------------------------------------------------------
--[[ Base Events  ]]--
-----------------------------------------------------------
 
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
      
    PlayerBaits = nil -- clearing all data
end)


-----------------------------------------------------------
--[[ Events ]]--
-----------------------------------------------------------

-- DO NOT USE THIS EVENT FOR OTHER REASONS THAN FISHING SCRIPT, IT IS USING DEVTOOL / INJECTIONS PROTECTION.
RegisterServerEvent('tpz_fishing:server:addFishItemToPlayerInventory')
AddEventHandler("tpz_fishing:server:addFishItemToPlayerInventory", function(fishModel, usedBait, itemId)
    local _source         = source 
    local catchedFishData = GetFishModelDataParameters(fishModel)

    if catchedFishData == nil then
        return
    end

    local PlayerData = GetPlayerData(_source)

    if (PlayerBaits[_source] == nil) or (PlayerBaits[_source] ~= usedBait) or (usedBait == nil) then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat on fish reward.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end
    
        ListedPlayers[_source] = nil
        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])

        return
    end

    local name, texture, experience, fishRewardItem = catchedFishData[1], catchedFishData[2], catchedFishData[4], catchedFishData[5]

    local canCarryItem  = TPZInv.canCarryItem(_source, fishRewardItem, 1)

    Wait(500)

    if canCarryItem then

        TPZInv.addItem(_source, fishRewardItem, 1)

        local webhookData = Config.DiscordWebhooking['FISH_RECEIVED']

        if webhookData.Enabled then
            local title = "🐟`Found a fish`"
            local message = string.format("**Steam Name: **`%s - (%s)`**\nIdentifier: **`%s (Char: %s)`\n\n**Fish Name:**`%s`", PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, name)
            
            API.sendToDiscord(webhookData.Url, title, message, webhookData.Color)
        end

        TriggerClientEvent('tpz_core:sendAdvancedRightNotification', _source, string.format(Locales['FISH_CATCHED'], name), "inventory_items", texture, "COLOR_PURE_WHITE", 4000)

    else
        TriggerClientEvent('tpz_core:sendAdvancedRightNotification', _source, string.format(Locales['FISH_LOST'], name), "inventory_items", texture, "COLOR_PURE_WHITE", 4000)
    end

    -- We add leveling experience even if the player does not get the item if its lost.
    if Config.tpz_leveling then

        local LevelingAPI = exports.tpz_leveling:getAPI()
        LevelingAPI.AddPlayerLevelExperience(_source, 'fishing', experience)
    end

    PlayerBaits[_source] = nil

end)

-----------------------------------------------------------
--[[ Items Registration  ]]--
-----------------------------------------------------------

Citizen.CreateThread(function()
    Citizen.Wait(2000)

    for index, item in pairs(Config.Baits) do

		TPZInv.registerUsableItem(item, GetCurrentResourceName(), function(data)
            local _source = data.source

            TPZInv.removeItem(_source, item, 1)
            TriggerClientEvent("tpz_fishing:client:useSelectedFishingBait", data.source, item)

            PlayerBaits[_source] = item

			TPZInv.closeInventory(_source)

        end)
        
    end

end)
