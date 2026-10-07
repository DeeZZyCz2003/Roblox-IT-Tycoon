local baseplateSetup = {}

function baseplateSetup.setup(baseplateInstance)
	baseplateInstance.Size = Vector3.new(1500, 20, 1500)
	baseplateInstance.Material = Enum.Material.Grass
	baseplateInstance.Color = Color3.fromRGB(75, 151, 75) -- Přirozenější zelená
	baseplateInstance.Anchored = true
	
	local texture = baseplateInstance:FindFirstChild("Texture")
	if texture then
		texture:Destroy()
	end
end

return baseplateSetup