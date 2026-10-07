local tycoon = {}

function tycoon.claimOwnerDoor(door, onTycoonClaimedCallback)
	local ownerPlayer = nil
	
	-- Vytvoření UI s textem přímo na kostce
	local surfaceGui = Instance.new("SurfaceGui")
	surfaceGui.Face = Enum.NormalId.Front
	surfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
	surfaceGui.PixelsPerStud = 50
	surfaceGui.Parent = door

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.fromRGB(255,255,255)
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SourceSansBold
	textLabel.Text = "Claim Tycoon"
	textLabel.Parent = surfaceGui

	local isOpening = false

	-- Funkce pro otevření (zneviditelnění) dveří
	door.Touched:Connect(function(hit)
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		if not player then return end
		
		if ownerPlayer == nil then
			ownerPlayer = player
			textLabel.Text = ownerPlayer.Name .. "’s Tycoon"
			
			door.Transparency = 0.7
			textLabel.TextTransparency = 0.5
			door.CanCollide = false
			
			if onTycoonClaimedCallback then
				onTycoonClaimedCallback(ownerPlayer)
			end
		end
	end)
end

function tycoon.init(onTycoonClaimedCallback)
	-- Inicializace proběhne ihned při startu hry (bez čekání na PlayerAdded)
	local doorPart = workspace.Tycoon.FirstFloor:WaitForChild("OwnerDoor")
	tycoon.claimOwnerDoor(doorPart, onTycoonClaimedCallback)
end

return tycoon