local ServerStorage = game:GetService("ServerStorage")
local moneyPadModule = require(script.Parent.Tycoon.MoneyPad)
local tycoonModule = require(script.Parent.Tycoon.OwnerDoor)
local baseColorModule = require(script.Parent.Tycoon.BaseButtonColor)
local tycoonSystem = require(script.Parent.Tycoon.StartTycoonSystem)
local baseplateSetup = require(script.Parent.Baseplate.Baseplate)
local dataStores = require(script.Parent.DataStores.DataStores)

local baseplate = workspace:WaitForChild("Baseplate")
local pad = workspace.Tycoon.FirstFloor:WaitForChild("MoneyPad")
local buttonsFolder = workspace.Tycoon:WaitForChild("Buttons")

dataStores.Start()
baseplateSetup.setup(baseplate)
moneyPadModule.setupMoneyPad(pad)
baseColorModule.setupColors()

buttonsFolder.Parent = ServerStorage

-- Function will start if player claims the OwnerDoor
tycoonModule.init(function(player)
	buttonsFolder.Parent = workspace.Tycoon
	tycoonSystem.start(player, pad)
end)