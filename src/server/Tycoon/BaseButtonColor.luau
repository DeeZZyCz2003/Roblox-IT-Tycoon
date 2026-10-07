local baseButtonColor = {}

function baseButtonColor.setupColors()
	
    local buttonsFolder = workspace.Tycoon:WaitForChild("Buttons")
		
        for _, button in pairs(buttonsFolder:GetChildren()) do
			if button:FindFirstChild("Base") then
				local base = button.Base

				base.Color = Color3.fromRGB(139, 69, 19)
				base.Reflectance = 0
				base.Material = Enum.Material.Fabric
			end
		end
    end

return baseButtonColor