local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StoreConfig = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("StoreConfig"))

local GamePassConfig = {}

local function getGamePassById(passId: number)
	for _, item in ipairs(StoreConfig.STORE_ITEMS["GamePasses"]) do
		if item.itemId == passId then
			return item
		end
	end
	return nil
end

local function applyPassEffect(player: Player, character: Model, pass)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid

	-- Každý GamePass dostane efekt podle toho, co má nastavené v StoreConfig
	if pass.newSpeed then
		humanoid.WalkSpeed = pass.newSpeed
	end

	if pass.jumpPower then
		humanoid.UseJumpPower = true
		humanoid.JumpPower = pass.jumpPower
	end

	-- Příklad pro budoucí pasivní bonus (třeba 2x peníze pro Economy/MoneyPad)
	if pass.moneyMultiplier then
		player:SetAttribute("MoneyMultiplier", pass.moneyMultiplier)
	end
end

local function applyAllOwnedPasses(player: Player, character: Model)
	for _, pass in ipairs(StoreConfig.STORE_ITEMS["GamePasses"]) do
		local success, hasPass = pcall(function()
			return MarketplaceService:UserOwnsGamePassAsync(player.UserId, pass.itemId)
		end)

		if success and hasPass then
			applyPassEffect(player, character, pass)
		end
	end
end

function GamePassConfig.Start()
	Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function(character)
			applyAllOwnedPasses(player, character)
		end)
		if player.Character then
			applyAllOwnedPasses(player, player.Character)
		end
	end)

	MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, passId, wasPurchased)
		if not wasPurchased then
			return
		end

		local pass = getGamePassById(passId)
		if pass and player.Character then
			applyPassEffect(player, player.Character, pass)
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
