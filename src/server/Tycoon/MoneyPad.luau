local moneyPad = {}

local economyMath = require(script.Parent.Parent.Economy.Economy)

function moneyPad.setupMoneyPad(pad)
	-- Initializes the pad and handles the physical interaction.
	-- Uses a "debounce" boolean to prevent multiple triggers from physics engine.
	local debounce = false
	pad.Color = Color3.fromRGB(0, 150, 0) -- Green means ready

	pad.Touched:Connect(function(hit)

		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		if player == nil then return end

		-- If unlocked, proceed with collection and lock it immediately.
		if debounce == false then
			debounce = true
			pad.Color = Color3.fromRGB(255, 0, 0) -- Red means locked/processing

			economyMath.collectMoney(pad.StoredMoney, player.leaderstats.Money)

			pad["Coin Collect - SFX"]:Play()
			pad.ParticleEmitter:Emit(15)

			-- Wait 1 second (cooldown) before unlocking again.
			task.wait(1)
			debounce = false
			pad.Color = Color3.fromRGB(0, 150, 0)
		end
	end)
end

return moneyPad
