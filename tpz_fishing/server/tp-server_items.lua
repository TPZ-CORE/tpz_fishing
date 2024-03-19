local TPZInv      = exports.tpz_inventory:getInventoryAPI()

-----------------------------------------------------------
--[[ Items Registration  ]]--
-----------------------------------------------------------

-- @param source     - returns the player source.
-- @param item       - returns the item name.
-- @param itemId     - returns the itemId (itemId exists only for non-stackable items) otherwise it will return as "0"
-- @param id         - returns the item id which is located in the tpz_items table.
-- @param label      - returns the item label name.
-- @param weight     - returns the item weight.
-- @param durability - returns the durability (exists only for non-stackable items).
-- @param metadata   - returns the metadata that you have created on the given item.

Citizen.CreateThread(function()
    Citizen.Wait(2000)

    for index, item in pairs(Config.Baits) do

		TPZInv.registerUsableItem(item, GetCurrentResourceName(), function(data)
            local _source = data.source

            --exports.vorp_inventory:subItem(data.source, UsableBait, 1)
            TriggerClientEvent("tpz_fishing:useSelectedFishingBait", data.source, item)

			TPZInv.closeInventory(_source)

        end)
        
    end

end)
