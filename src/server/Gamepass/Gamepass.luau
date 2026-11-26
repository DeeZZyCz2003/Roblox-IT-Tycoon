local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StoreConfig = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("StoreConfig"))

local GamePassConfig = {}

local function filterGamePasses()
        for _, item in ipairs(StoreConfig.STORE_ITEMS["GamePasses"]) do
            if item.name == "WalkSpeed" then
            return item
            end
        end
    return nil
end

local walkSpeedPass = filterGamePasses()

local function applyWalkSpeed(player: Player, character: Model)
    local humanoid = character:WaitForChild("Humanoid") :: Humanoid
    local passId = walkSpeedPass.itemId
    
    local success, hasPass = pcall(function()
        return MarketplaceService:UserOwnsGamePassAsync(player.UserId, passId)
    end)

    if success and hasPass then
        humanoid.WalkSpeed = walkSpeedPass.newSpeed
        end
end

function GamePassConfig.Start()
    Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        applyWalkSpeed(player, character)
    end)
    if player.Character then
        applyWalkSpeed(player, player.Character)
    end
end)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, passId, wasPurchased)
    if wasPurchased and passId == walkSpeedPass.itemId then
        if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = walkSpeedPass.newSpeed
                end
            end
        end
    end)
end


--TESTING NA BAKALARKU
--[[
local function applyWalkSpeedDebug(player: Player, character: Model)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	local passId = GamePassConfig.Passes.WalkSpeed.GamePassId
	print("[Gamepass] Kontroluji vlastnictví GamePassu (" .. passId .. ") pro:", player.Name)

	local success, hasPass = pcall(function()
		return MarketplaceService:UserOwnsGamePassAsync(player.UserId, passId)
	end)

	if success and hasPass then
		humanoid.WalkSpeed = GamePassConfig.Passes.WalkSpeed.newSpeed
		print("[Gamepass] Hráč vlastní WalkSpeed -> rychlost nastavena na:", humanoid.WalkSpeed)
	elseif success then
		print("[Gamepass] Hráč NEVLASTNÍ WalkSpeed -> výchozí rychlost:", humanoid.WalkSpeed)
	else
		warn("[Gamepass] CHYBA při ověřování GamePassu pro:", player.Name)
	end
end

function GamePassConfig.Start()
	print("[Gamepass] Modul Gamepass spuštěn.")
	Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function(character)
			applyWalkSpeedDebug(player, character)
		end)
	end)

	MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, passId, wasPurchased)
		print("[Gamepass] Nákup dokončen | Hráč:", player.Name, "| PassId:", passId, "| Koupeno:", wasPurchased)
		if wasPurchased and passId == GamePassConfig.Passes.WalkSpeed.GamePassId then
			local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.WalkSpeed = GamePassConfig.Passes.WalkSpeed.newSpeed
				print("[Gamepass] Rychlost ihned aplikována:", humanoid.WalkSpeed)
			end
		end
	end)
end
--]]


return GamePassConfig