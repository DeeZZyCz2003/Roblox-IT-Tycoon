local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local GamePassConfig = {
    Passes = {
        WalkSpeed = {
            Name = "WalkSpeed",
            GamePassId = 2099338821,
            RobuxCost = 199,
            Description = "Your walkspeed will be upgraded to 24 studs/s.",
            newSpeed = 60,
        }
    }
}

local function applyWalkSpeed(player: Player, character: Model)
    local humanoid = character:WaitForChild("Humanoid") :: Humanoid
    local passId = GamePassConfig.Passes.WalkSpeed.GamePassId
    
    local success, hasPass = pcall(function()
        return MarketplaceService:UserOwnsGamePassAsync(player.UserId, passId)
    end)

    if success and hasPass then
        humanoid.WalkSpeed = GamePassConfig.Passes.WalkSpeed.newSpeed
        end
end

function GamePassConfig.Start()
    Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        applyWalkSpeed(player, character)
    end)
end)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, passId, wasPurchased)
    if wasPurchased and passId == GamePassConfig.Passes.WalkSpeed.GamePassId then
        if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = GamePassConfig.Passes.WalkSpeed.newSpeed
                end
            end
        end
    end)
end

return GamePassConfig