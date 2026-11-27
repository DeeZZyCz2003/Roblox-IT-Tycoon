local baseplateSetup = {}

function baseplateSetup.setup(baseplateInstance)
	baseplateInstance.Size = Vector3.new(1500, 20, 1500)
	baseplateInstance.Material = Enum.Material.Grass
	baseplateInstance.Color = Color3.fromRGB(75, 151, 75)
	baseplateInstance.Anchored = true

	local texture = baseplateInstance:FindFirstChild("Texture")
	if texture then
		texture:Destroy()
	end
end

--TESTING NA BAKALARKU
--[[
function baseplateSetup.setup(baseplateInstance)
	print("[Baseplate] Spouštím nastavení Baseplate:", baseplateInstance.Name)
	baseplateInstance.Size = Vector3.new(1500, 20, 1500)
	baseplateInstance.Material = Enum.Material.Grass
	baseplateInstance.Color = Color3.fromRGB(75, 151, 75)
	baseplateInstance.Anchored = true

	local texture = baseplateInstance:FindFirstChild("Texture")
	if texture then
		texture:Destroy()
		print("[Baseplate] Výchozí textura nalezena a odstraněna.")
	else
		print("[Baseplate] Žádná textura k odstranění.")
	end
	print("[Baseplate] Hotovo | Velikost:", baseplateInstance.Size, "| Materiál:", baseplateInstance.Material)
end
--]]

return baseplateSetup
