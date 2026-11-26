local Players = game:getService("Players")
local MarketplaceService = game:getService("MarketplaceService")
local ReplicatedStorage = game:getService("ReplicatedStorage")

local StoreConfig = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("StoreConfig"))

local StoreServer = {}

local function findItemById(productId)
        for _, categoryItems in pairs(StoreConfig.STORE_ITEMS) do
            for _, item in ipairs(categoryItems) do
                if item.itemId == productId then
                    return item
                end
            end
        end
    return nil
end

function StoreServer.Start()
    MarketplaceService.ProcessReceipt = function(receiptInfo)
        local player = Players:GetPlayerByUserId(receiptInfo.PlayerId)
        if not player then
            return Enum.ProductPurchaseDecision.NotProcessedYet
        end

        local item = findItemById(receiptInfo.ProductId)
        if not item then
            warn("Unknown ProductId:", receiptInfo.ProductId)
            return Enum.ProductPurchaseDecision.NotProcessedYet
        end

        local leaderstats = player:FindFirstChild("leaderstats")
        local playerMoney = leaderstats and leaderstats:FindFirstChild("Money")

        if not playerMoney then
            warn("Player does not have loaded leaderstats / money:", player.Name)
            return Enum.ProductPurchaseDecision.NotProcessedYet
        end

        if item.rewardAmount then
            playerMoney.Value += item.rewardAmount
            print(player.Name .. " bought " .. item.name .. " (+" .. item.rewardAmount .. ")")
            return Enum.ProductPurchaseDecision.PurchaseGranted
        end

        return Enum.ProductPurchaseDecision.NotProcessedYet
    end
end

--TESTING NA BAKALARKU
--[[
function StoreServer.Start()
	print("[StoreServer] Inicializace ProcessReceipt...")

	MarketplaceService.ProcessReceipt = function(receiptInfo)
		print("-----------------------------------------")
		print("[StoreServer] 1. Nová transakce přijata!")
		print(" -> PlayerId:", receiptInfo.PlayerId)
		print(" -> ProductId:", receiptInfo.ProductId)
		print(" -> PurchaseId:", receiptInfo.PurchaseId)

		local player = Players:GetPlayerByUserId(receiptInfo.PlayerId)
		if not player then
			warn("[StoreServer] CHYBA: Hráč není na serveru.")
			return Enum.ProductPurchaseDecision.NotProcessedYet
		end
		print("[StoreServer] 2. Hráč nalezen:", player.Name)

		local item = findItemById(receiptInfo.ProductId)
		if not item then
			warn("[StoreServer] CHYBA: Neznámé ProductId:", receiptInfo.ProductId)
			return Enum.ProductPurchaseDecision.NotProcessedYet
		end
		print("[StoreServer] 3. Produkt nalezen:", item.name, "| Odměna:", item.rewardAmount)

		local leaderstats = player:FindFirstChild("leaderstats")
		local playerMoney = leaderstats and leaderstats:FindFirstChild("Money")

		if not playerMoney then
			warn("[StoreServer] CHYBA: Chybí leaderstats nebo Money u hráče:", player.Name)
			return Enum.ProductPurchaseDecision.NotProcessedYet
		end

		if item.rewardAmount then
			local oldBalance = playerMoney.Value
			playerMoney.Value += item.rewardAmount
			print("[StoreServer] 4. Připsáno! Zůstatek:", oldBalance, "->", playerMoney.Value)
			print("[StoreServer] 5. Nákup potvrzen (PurchaseGranted).")
			print("-----------------------------------------")
			return Enum.ProductPurchaseDecision.PurchaseGranted
		end

		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
end
--]]
return StoreServer