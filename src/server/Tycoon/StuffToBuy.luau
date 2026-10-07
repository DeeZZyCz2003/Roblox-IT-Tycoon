local stuffToBuy = {}

-- OPRAVA CESTY: Přidáno druhé .Parent, aby skript vyskočil ze složky Tycoon
local upgradesData = require(script.Parent.Parent.Upgrades.Upgrades)

stuffToBuy.__index = stuffToBuy

function stuffToBuy.new(name: string, basePrice: number, baseIncome: number, components: {})
	local self = setmetatable({}, stuffToBuy)
	self.Name = name
	self.Price = basePrice or 0
	self.Income = baseIncome or 0
	self.Components = components or {}
	return self
end

local ServerStorage = game:GetService("ServerStorage")

function stuffToBuy:SetupButton(buttonPart, playerMoney)
	local isPurchasing = false

	-- 1. VYTVOŘENÍ 3D TEXTU (BillboardGui) NAD TLAČÍTKEM
	local billboard = Instance.new("BillboardGui")
	billboard.Size = UDim2.new(4, 0, 1.5, 0) -- Velikost cedulky
	billboard.StudsOffset = Vector3.new(0, 2, 0) -- Posune text 2 study nad kostku
	billboard.Parent = buttonPart

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1 -- Průhledné pozadí
	textLabel.TextScaled = true
	textLabel.TextColor3 = Color3.fromRGB(0,0,0) -- Černý text
	textLabel.Font = Enum.Font.FredokaOne
	textLabel.Text = self.Name .. " - $" .. self.Price -- Vypíše např: "RightWall - $50"
	textLabel.Parent = billboard

	-- 2. FUNKCE PRO ZMĚNU BARVY
	local function updateColor()
		-- Ochrana: Pokud nám Main Script neposlal peníze, vypíšeme varování
		if not playerMoney then
			warn("Chyba: Tlačítko " .. self.Name .. " nezná peníze hráče!")
			return
		end

		if playerMoney.Value >= self.Price then
			buttonPart.Color = Color3.fromRGB(0, 255, 0) -- Zelená
		else
			buttonPart.Color = Color3.fromRGB(255, 0, 0) -- Červená
		end
	end

	-- Okamžité obarvení při startu
	updateColor()

	-- 3. SLEDOVÁNÍ PENĚZ PRO DYNAMICKÉ OBARVOVÁNÍ
	local colorConnection = nil
	if playerMoney then
		colorConnection = playerMoney:GetPropertyChangedSignal("Value"):Connect(updateColor)
	end

	-- 4. LOGIKA NÁKUPU
	buttonPart.Touched:Connect(function(hit)
		if isPurchasing then return end

		local character = hit.Parent
		local player = game.Players:GetPlayerFromCharacter(character)

		-- Zkontrolujeme, jestli na tlačítko šlápl majitel
		if player and player.leaderstats.Money == playerMoney then
			if playerMoney.Value >= self.Price then
				isPurchasing = true
				playerMoney.Value -= self.Price

				-- Zhmotnění modelu
				local modelInStorage = ServerStorage:FindFirstChild(self.Name)
				if modelInStorage then
					local newModel = modelInStorage:Clone()
					newModel.Parent = workspace.Tycoon.FirstFloor
				else
					warn("Model " .. self.Name .. " chybí v ServerStorage!")
				end

				-- Zvýšení příjmu
				local incomeValue = workspace.Tycoon.FirstFloor.MoneyPad:FindFirstChild("Income")
				if incomeValue then
					incomeValue.Value += self.Income
				end

				-- Úklid tlačítka
				if colorConnection then colorConnection:Disconnect() end
				buttonPart:Destroy() 
			end
		end
	end)
end

local allUpgrades = {}

for pcName, pcData in pairs(upgradesData) do
	allUpgrades[pcName] = stuffToBuy.new(
		pcName,
		pcData.BasePrice,
		pcData.BaseIncome,
		pcData.Components
	)
end

return allUpgrades