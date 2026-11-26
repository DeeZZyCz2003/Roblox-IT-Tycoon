local economy = {}

-- MONEY FUNCTIONS

function economy.generateMoney(incomeObject, storedMoney)
	-- Runs an infinite loop on the background.
	-- Every second, it adds the current income value to the pad's stored money.
	while true do
		task.wait(0.1)
		storedMoney.Value += incomeObject.Value + 19
		storedMoney.BillboardGui.TextLabel.Text = storedMoney.Value.."$"
	end
end

function economy.collectMoney(storedMoney, playerMoney)
	-- Transfers funds securely. 
	-- Adds stored money to the player's balance and resets the pad to zero.
	playerMoney.Value += storedMoney.Value
	storedMoney.Value = 0
	storedMoney.BillboardGui.TextLabel.Text = storedMoney.Value.."$"
end


--TESTING NA BAKALARKU
--[[
function economy.generateMoney(incomeObject, storedMoney)
	print("[Economy] Generování peněz spuštěno | Základní příjem:", incomeObject.Value)
	local tickCount = 0
	while true do
		task.wait(0.1)
		local added = incomeObject.Value + 19
		storedMoney.Value += added
		storedMoney.BillboardGui.TextLabel.Text = storedMoney.Value .. "$"
		tickCount += 1
		if tickCount % 50 == 0 then -- Vypíše každých 5 sekund, aby nezahltil konzoli
			print("[Economy] Stav MoneyPadu:", storedMoney.Value .. "$ (Příjem/tick:", added .. ")")
		end
	end
end

function economy.collectMoney(storedMoney, playerMoney)
	local collected = storedMoney.Value
	local oldBalance = playerMoney.Value
	playerMoney.Value += collected
	storedMoney.Value = 0
	storedMoney.BillboardGui.TextLabel.Text = storedMoney.Value .. "$"
	print("[Economy] Výběr peněz | Vybráno:", collected .. "$ | Zůstatek:", oldBalance, "->", playerMoney.Value)
end
--]]


return economy