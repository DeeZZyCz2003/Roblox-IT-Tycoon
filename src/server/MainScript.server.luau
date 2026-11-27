local ServerStorage = game:GetService("ServerStorage")
local moneyPadModule = require(script.Parent.Tycoon.MoneyPad)
local tycoonModule = require(script.Parent.Tycoon.OwnerDoor)
local baseColorModule = require(script.Parent.Tycoon.BaseButtonColor)
local tycoonSystem = require(script.Parent.Tycoon.StartTycoonSystem)
local baseplateSetup = require(script.Parent.Baseplate.Baseplate)
local dataStores = require(script.Parent.DataStores.DataStores)
local gamepassModule = require(script.Parent.Gamepass.Gamepass)
local storeServer = require(script.Parent.Store.StoreServer)

local baseplate = workspace:WaitForChild("Baseplate")
local pad = workspace.Tycoon.FirstFloor:WaitForChild("MoneyPad")
local buttonsFolder = workspace.Tycoon:WaitForChild("Buttons")

dataStores.Start()
gamepassModule.Start()
storeServer.Start()
baseplateSetup.setup(baseplate)
baseColorModule.setupColors()

buttonsFolder.Parent = ServerStorage

-- Function will start if player claims the OwnerDoor
tycoonModule.init(function(player)
	moneyPadModule.setupMoneyPad(pad, player)
	buttonsFolder.Parent = workspace.Tycoon
	tycoonSystem.start(player, pad)
end)

--TESTING NA BAKALARKU
--[[
print("=========================================")
print("[MainScript] Start serverové inicializace...")
print(" -> Baseplate:", baseplate ~= nil)
print(" -> MoneyPad:", pad ~= nil)
print(" -> ButtonsFolder:", buttonsFolder ~= nil, "| Počet tlačítek:", #buttonsFolder:GetChildren())
print("[MainScript] Všechny moduly úspěšně načteny a spuštěny.")
print("=========================================")
--]]
