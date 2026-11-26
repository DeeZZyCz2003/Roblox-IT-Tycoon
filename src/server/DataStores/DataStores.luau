local DataStores = {}

local DataStoreService = game:GetService("DataStoreService")
local MoneyDataStore = DataStoreService:GetDataStore("MoneyDataStore")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StoreConfig = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("StoreConfig"))


local function savePlayerData(player)
	if not player:GetAttribute("DataLoaded") then
		return
	end
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then
		return
	end

	local money = leaderstats:FindFirstChild("Money")
	local gems = leaderstats:FindFirstChild("Gems")
	local kills = leaderstats:FindFirstChild("Kills")
	local rebirths = leaderstats:FindFirstChild("Rebirths")

	if not money or not gems or not kills or not rebirths then
		return
	end

	local key= "Player_" .. player.UserId
	local dataToSave = {
		Money = money.Value, Gems = gems.Value, Kills = kills.Value, Rebirths = rebirths.Value, FirstJoinTime = player:GetAttribute("SpecialOfferFirstJoin") or os.time(), SpecialOfferBought = player:GetAttribute("SpecialOfferBought") == true
	}

	local success, errorMessage = pcall(function()
        MoneyDataStore:SetAsync(key, dataToSave)
    end)

    if not success then
        warn("Failed to save data for " .. player.Name .. ": " .. tostring(errorMessage))
    end
end


function DataStores.Start()
    -- Run when player joins
Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = 0
	money.Parent = leaderstats
	
	local gems = Instance.new("IntValue")
	gems.Name = "Gems"
	gems.Value = 0
	gems.Parent = leaderstats
	
	local kills = Instance.new("IntValue")
	kills.Name = "Kills"
	kills.Value = 0
	kills.Parent = leaderstats
	
	local rebirth = Instance.new("IntValue")
	rebirth.Name = "Rebirths"
	rebirth.Value = 0
	rebirth.Parent = leaderstats


        local key = "Player_" .. player.UserId

        -- Load data
        local success, data = pcall(function()
            return MoneyDataStore:GetAsync(key)
        end)

		local firstJoinTime = os.time()
		local specialOfferBought = false

        if success then
            if type(data) == "table" then
				money.Value = data.Money or 0
				gems.Value = data.Gems or 0
				kills.Value = data.Kills or 0
				rebirth.Value = data.Rebirths or 0
				firstJoinTime = data.FirstJoinTime or os.time()
				specialOfferBought = data.SpecialOfferBought == true
			elseif type(data) == "number" then
				money.Value = data
				end
			player:SetAttribute("DataLoaded", true)
        else
            warn("Failed to load data for " .. player.Name .. ": " .. tostring(data))
        end
		player:SetAttribute("SpecialOfferFirstJoin", firstJoinTime)
		player:SetAttribute("SpecialOfferExpiresAt", firstJoinTime + StoreConfig.SPECIAL_OFFER.duration)
		player:SetAttribute("SpecialOfferBought", specialOfferBought)
	end)

	-- Run when player leaves
		Players.PlayerRemoving:Connect(function(player)
			savePlayerData(player)
	end)

	game:BindToClose(function()
		for _, player in ipairs(Players:GetPlayers()) do
			savePlayerData(player)
		end
	end)
end

--TESTING NA BAKALARKU
--[[
function DataStores.Start()
	print("[DataStores] Služba DataStores spuštěna.")

	Players.PlayerAdded:Connect(function(player)
		print("[DataStores] Hráč se připojil:", player.Name, "| UserId:", player.UserId)
		local leaderstats = Instance.new("Folder")
		leaderstats.Name = "leaderstats"
		leaderstats.Parent = player

		local money = Instance.new("IntValue")
		money.Name = "Money"
		money.Value = 0
		money.Parent = leaderstats

		local gems = Instance.new("IntValue")
		gems.Name = "Gems"
		gems.Value = 0
		gems.Parent = leaderstats

		local kills = Instance.new("IntValue")
		kills.Name = "Kills"
		kills.Value = 0
		kills.Parent = leaderstats

		local rebirths = Instance.new("IntValue")
		rebirths.Name = "Rebirths"
		rebirths.Value = 0
		rebirths.Parent = leaderstats

		local key = "Player_" .. player.UserId
		local success, data = pcall(function()
			return MoneyDataStore:GetAsync(key)
		end)

		if success then
			if data ~= nil then
				money.Value = data
				print("[DataStores] Načteno pro", player.Name, "| Peníze:", data)
			else
				print("[DataStores] Nový hráč (žádná uložená data):", player.Name)
			end
		else
			warn("[DataStores] CHYBA načítání pro " .. player.Name .. ": " .. tostring(data))
		end
	end)

	Players.PlayerRemoving:Connect(function(player)
		local key = "Player_" .. player.UserId
		local leaderstats = player:FindFirstChild("leaderstats")

		if leaderstats and leaderstats:FindFirstChild("Money") then
			local money = leaderstats.Money
			local success, errorMessage = pcall(function()
				MoneyDataStore:SetAsync(key, money.Value)
			end)

			if success then
				print("[DataStores] Úspěšně uloženo pro", player.Name, "| Částka:", money.Value)
			else
				warn("[DataStores] CHYBA ukládání pro " .. player.Name .. ": " .. tostring(errorMessage))
			end
		else
			warn("[DataStores] CHYBA: Nelze uložit, chybí leaderstats/Money pro", player.Name)
		end
	end)
end
--]]

DataStores.SavePlayerData = savePlayerData
return DataStores