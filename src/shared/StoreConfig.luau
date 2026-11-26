local StoreConfig = {}

--ID of my images
local ICON1_ID = "rbxassetid://105248160339790" --Robux Icon
local ICON2_ID = "rbxassetid://128824638429848" --Cash Icon
local STORE_ITEMS = {
    ["Money"] = {
        {
            name = "1,000 Cash", price = "39 R$", icon = ICON2_ID, description = "Get 1,000 Cash to spend in the game!", itemId = 3736274514, itemType = "Product", rewardAmount = 1000
        },
    },
    ["GamePasses"] = {
            --TODO (itemType = "GamePass")
    },
    ["Special Orders"] = {
            --TODO
    },
}

StoreConfig.STORE_ITEMS = STORE_ITEMS
StoreConfig.ICON1_ID = ICON1_ID
StoreConfig.ICON2_ID = ICON2_ID


--TESTING NA BAKALARKU
--[[
local totalStoreItems = 0
for category, items in pairs(STORE_ITEMS) do
	for _, item in ipairs(items) do
		assert(item.name ~= nil, "[StoreConfig] Chybí name v kategorii: " .. category)
		assert(type(item.itemId) == "number" and item.itemId > 0, "[StoreConfig] Neplatné itemId u: " .. tostring(item.name))
		assert(item.itemType == "Product" or item.itemType == "GamePass", "[StoreConfig] Neplatný itemType u: " .. tostring(item.name))
		totalStoreItems += 1
	end
end
print("[StoreConfig] Validace obchodu OK | Ověřeno položek:", totalStoreItems)
--]]


return StoreConfig