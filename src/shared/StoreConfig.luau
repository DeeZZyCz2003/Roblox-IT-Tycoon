
local StoreConfig = {}

--ID of my images
local ICON1_ID = "rbxassetid://105248160339790" --Robux Icon
local CASH_1000_ID = "rbxassetid://127770475567185"
local CASH_2500_ID = "rbxassetid://105443846595602"
local CASH_5000_ID = "rbxassetid://121866740290095"
local CASH_7500_ID = "rbxassetid://108405690098015"
local CASH_10000_ID = "rbxassetid://93306675618132"
local CASH_15000_ID = "rbxassetid://118054706766839"
local CASH_25000_ID = "rbxassetid://77213212525780"
local CASH_50000_ID = "rbxassetid://133098796080847"
local CASH_75000_ID = "rbxassetid://73000862065684"
local CASH_100000_ID = "rbxassetid://106402370322994"
local CASH_200000_ID = "rbxassetid://93492255002222"
local CASH_500000_ID = "rbxassetid://125313647746710"
local WALKSPEED_ID = "rbxassetid://74101719805988"
local STORE_ITEMS = {
    ["Money"] = {
        { name = "1,000 Cash",  price = "39 R$", icon = CASH_1000_ID, description = "Get 1,000 Cash to spend in the game!", itemId = 3736274514, itemType = "Product", rewardAmount = 1000 },
        { name = "2,500 Cash", price = "59 R$", icon = CASH_2500_ID, description = "Get 2,500 Cash to spend in the game!", itemId = 3736477575, itemType = "Product", rewardAmount = 2500 },
        { name = "5,000 Cash", price = "89 R$", icon = CASH_5000_ID, description = "Get 5,000 Cash to spend in the game!", itemId = 3736477782, itemType = "Product", rewardAmount = 5000 },
        { name = "7,500 Cash", price = "119 R$", icon = CASH_7500_ID, description = "Get 7,500 Cash to spend in the game!", itemId = 3736477944, itemType = "Product", rewardAmount = 7500 },
        { name = "10,000 Cash", price = "149 R$", icon = CASH_10000_ID, description = "Get 10,000 Cash to spend in the game!", itemId = 3736478043, itemType = "Product", rewardAmount = 10000 },
        { name = "15,000 Cash", price = "199 R$", icon = CASH_15000_ID, description = "Get 15,000 Cash to spend in the game!", itemId = 3736478207, itemType = "Product", rewardAmount = 15000 },
        { name = "25,000 Cash", price = "239 R$", icon = CASH_25000_ID, description = "Get 25,000 Cash to spend in the game!", itemId = 3736478283, itemType = "Product", rewardAmount = 25000 },
        { name = "50,000 Cash", price = "299 R$", icon = CASH_50000_ID, description = "Get 50,000 Cash to spend in the game!", itemId = 3736478429, itemType = "Product", rewardAmount = 50000 },
        { name = "75,000 Cash", price = "399 R$", icon = CASH_75000_ID, description = "Get 75,000 Cash to spend in the game!", itemId = 3736478825, itemType = "Product", rewardAmount = 75000 },
        { name = "100,000 Cash", price = "449 R$", icon = CASH_100000_ID, description = "Get 100,000 Cash to spend in the game!", itemId = 3736479373, itemType = "Product", rewardAmount = 100000 },
        { name = "200,000 Cash", price = "549 R$", icon = CASH_200000_ID, description = "Get 200,000 Cash to spend in the game!", itemId = 3736484232, itemType = "Product", rewardAmount = 200000 },
        { name = "500,000 Cash", price = "699 R$", icon = CASH_500000_ID, description = "Get 500,000 Cash to spend in the game!", itemId = 3736484461, itemType = "Product", rewardAmount = 500000 },
    },
    ["GamePasses"] = {
        { name = "WalkSpeed", price = "199 R$", icon = WALKSPEED_ID, description = "Your walkspeed will be upgraded to 24 studs/s.", itemId = 2099338821, itemType = "GamePass", newSpeed = 24},
    },
    ["Special Orders"] = {
            --TODO
    },
}

StoreConfig.STORE_ITEMS = STORE_ITEMS
StoreConfig.ICON1_ID = ICON1_ID
StoreConfig.CASH_1000_ID = CASH_1000_ID
StoreConfig.CASH_2500_ID = CASH_2500_ID
StoreConfig.CASH_5000_ID = CASH_5000_ID
StoreConfig.CASH_7500_ID = CASH_7500_ID
StoreConfig.CASH_10000_ID = CASH_10000_ID
StoreConfig.CASH_15000_ID = CASH_15000_ID
StoreConfig.CASH_25000_ID = CASH_25000_ID
StoreConfig.CASH_50000_ID = CASH_50000_ID
StoreConfig.CASH_75000_ID = CASH_75000_ID
StoreConfig.CASH_100000_ID = CASH_100000_ID
StoreConfig.CASH_200000_ID = CASH_200000_ID
StoreConfig.CASH_500000_ID = CASH_500000_ID
StoreConfig.WALKSPEED_ID = WALKSPEED_ID



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