local DataStores = {}

local DataStoreService = game:GetService("DataStoreService")
local MoneyDataStore = DataStoreService:GetDataStore("MoneyDataStore")
local Players = game:GetService("Players")

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
	
	local rebirths = Instance.new("IntValue")
	rebirths.Name = "Rebirths"
	rebirths.Value = 0
	rebirths.Parent = leaderstats


        local key = "Player_" .. player.UserId

        -- Load data (přejmenováno err na data)
        local success, data = pcall(function()
            return MoneyDataStore:GetAsync(key)
        end)

        if success then
            if data ~= nil then
                money.Value = data
            end
        else
            warn("Failed to load data for " .. player.Name .. ": " .. tostring(data))
        end
    end)

    -- Run when player leaves
    Players.PlayerRemoving:Connect(function(player)
        local key = "Player_" .. player.UserId
        local leaderstats = player:FindFirstChild("leaderstats")
        
        -- Pojistka, zda objekt peněz vůbec existuje
        if leaderstats and leaderstats:FindFirstChild("Money") then
            local money = leaderstats.Money

            -- Save data
            local success, errorMessage = pcall(function()
                MoneyDataStore:SetAsync(key, money.Value)
            end)

            if not success then
                warn("Failed to save data for " .. player.Name .. ": " .. tostring(errorMessage))
            end
        end
    end)
end

return DataStores