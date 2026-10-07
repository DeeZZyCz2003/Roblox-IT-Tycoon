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

return economy