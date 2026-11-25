local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. Vytvoření hlavního UI kontejneru (ScreenGui)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MainUI"
screenGui.ResetOnSpawn = false -- Zajistí, že UI nezmizí, když hráč zemře
screenGui.Parent = playerGui

-- 2. Vytvoření textového pole (TextLabel)
local moneyLabel = Instance.new("TextLabel")
moneyLabel.Name = "MoneyLabel"
moneyLabel.Size = UDim2.new(0, 120, 0, 40) -- Šířka 120px, výška 40px
moneyLabel.Position = UDim2.new(1, -150, 1, -50) -- Umístění do pravého dolního rohu
moneyLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
moneyLabel.BackgroundTransparency = 1 -- Poloprůhledné černé pozadí
moneyLabel.TextColor3 = Color3.fromRGB(0,0,0) -- Světle zelený text
moneyLabel.Font = Enum.Font.ArialBold
moneyLabel.TextScaled = true -- Text se automaticky přizpůsobí velikosti rámečku
moneyLabel.Parent = screenGui

-- 3. Propojení UI s penězi hráče (Leaderstats)
local leaderstats = player:WaitForChild("leaderstats")
local money = leaderstats:WaitForChild("Money")

-- Funkce pro přepsání textu
local function updateUI()
	moneyLabel.Text = "Money: $" .. tostring(money.Value)
end

-- Zavoláme hned při načtení hry
updateUI()

-- Automaticky zavoláme pokaždé, když se hodnota peněz změní
money.Changed:Connect(updateUI)