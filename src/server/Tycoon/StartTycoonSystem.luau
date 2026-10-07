local tycoonSystem = {}

-- Cesty si případně uprav podle své přesné struktury složek
local economyMathModule = require(script.Parent.Parent.Economy.Economy)
local allUpgrades = require(script.Parent.StuffToBuy)

-- Funkce přijímá hráče a konkrétní MoneyPad
function tycoonSystem.start(player, pad)
	task.spawn(function()
		economyMathModule.generateMoney(pad.Income, pad.StoredMoney)
	end)

	local buttonsFolder = workspace.Tycoon:WaitForChild("Buttons")

	for _, buttonPart in pairs(buttonsFolder:GetChildren()) do
		local upgradeObject = allUpgrades[buttonPart.Name]

		if upgradeObject then
			upgradeObject:SetupButton(buttonPart, player.leaderstats.Money)
		else
			warn("No upgrade object found for button: " .. buttonPart.Name)
		end
	end
end

return tycoonSystem