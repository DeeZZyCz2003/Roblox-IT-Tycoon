local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--ID of my images
local ICON1_ID = "rbxassetid://105248160339790" --Robux Icon
local ICON2_ID = "rbxassetid://128824638429848" --Cash Icon

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RobuxStoreUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui


local function createOpenButton(parentGui)
    local baseSize = UDim2.new(0, 80, 0, 80)
    local hoverSize = UDim2.new(0, 88, 0, 88) -- 10% bigger on hover

    local openButton = Instance.new("ImageButton")
    openButton.Name = "RobuxStoreButton"
    openButton.AnchorPoint = Vector2.new(0.5, 0.5)
    openButton.Size = baseSize
    openButton.Position = UDim2.new(0, 60, 0.5, 0)
    openButton.BackgroundColor3 = Color3.fromRGB(25, 110, 220)
    openButton.Image = ICON1_ID
    openButton.ScaleType = Enum.ScaleType.Crop
    openButton.Parent = parentGui

    local openCorner = Instance.new("UICorner")
    openCorner.CornerRadius = UDim.new(1, 0)
    openCorner.Parent = openButton

    local openStroke = Instance.new("UIStroke")
    openStroke.Color = Color3.fromRGB(255, 255, 255)
    openStroke.Thickness = 3
    openStroke.Parent = openButton

    --creates a non-clickable label for the hover tooltip
    local hoverLabel = Instance.new("TextLabel")
    hoverLabel.Name = "HoverLabel"
    hoverLabel.Size = UDim2.new(0, 120, 0, 32) 
    hoverLabel.Position = UDim2.new(1, 12, 0.5, -16) -- Positions the label 12px to the right of the button, vertically centered
    hoverLabel.BackgroundColor3 = Color3.fromRGB(18, 28, 48)
    hoverLabel.BackgroundTransparency = 0.15 --Slightly transparent background (0 = fully opaque, 1 = fully invisible)
    hoverLabel.Text = "Robux Store"
    hoverLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    hoverLabel.Font = Enum.Font.FredokaOne
    hoverLabel.TextSize = 18
    hoverLabel.Visible = false --hidden by default; becomes visible only when hovering over the button
    hoverLabel.Parent = openButton -- parented to the button so its position is calculated relative to the button

    --rounds the corners of the label by 8px
    local labelCorner = Instance.new("UICorner")
    labelCorner.CornerRadius = UDim.new(0, 8)
    labelCorner.Parent = hoverLabel

    local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out) -- defines the animation settings (0.15s duration, smooth case-out)

    openButton.MouseLeave:Connect(function() --runs when the mouse cursor leaves the button
		  TweenService:Create(openButton, tweenInfo, { Size = baseSize }):Play() --smoothly animates the button back to its original size
		  hoverLabel.Visible = false -- hides the "Robux Store" tooltip
	  end)
    openButton.MouseEnter:Connect(function() --runs when the mouse cursor enters the button
		  TweenService:Create(openButton, tweenInfo, { Size = hoverSize }):Play() --smoothly animates the button to its larger size
		  hoverLabel.Visible = true -- shows the "Robux Store" tooltip
	  end)

	return openButton --returns the created button so it can be used outside this function
end


local function createStoreWindow(parentGui) --function that creates the main semi-transparent store window and returns it
    local mainFrame = Instance.new("Frame") --main background container for the store
    mainFrame.Name = "StoreWindow"
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5) --sets the anchor point to the exact center of the frame
    mainFrame.Size = UDim2.new(0, 620, 0, 420)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0) --places a window in the exact center of the player's screen
    mainFrame.BackgroundColor3 = Color3.fromRGB(18, 28, 48)
    mainFrame.BackgroundTransparency = 0.15 --slightly transparent background (0 = fully opaque, 1 = fully invisible)
    mainFrame.Visible = false --hidden by default; becomes visible only when the player clicks the "Robux Store" button
    mainFrame.Parent = parentGui

    local mainCorner = Instance.new("UICorner") --rounds the corners of the main store window by 20px
    mainCorner.CornerRadius = UDim.new(0, 20)
    mainCorner.Parent = mainFrame

    local mainStroke = Instance.new("UIStroke") --adds a light blue border around the main store window
    mainStroke.Color = Color3.fromRGB(70, 130, 220) --light blue color
    mainStroke.Thickness = 3
    mainStroke.Parent = mainFrame

    local closeButton = Instance.new("TextButton") --Red close button ("X") in the top-right corner
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 42, 0, 42)
    closeButton.Position = UDim2.new(1, -28, 0, -14) --Positioned slightly overlapping the top-right edge of the window
    closeButton.BackgroundColor3 = Color3.fromRGB(235, 50, 50)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.FredokaOne
    closeButton.TextSize = 26
    closeButton.Parent = mainFrame

    local closeCorner = Instance.new("UICorner") -- rounds the corners of the close button
    closeCorner.CornerRadius = UDim.new(0, 10)
    closeCorner.Parent = closeButton

    local closeStroke = Instance.new("UIStroke") -- adds a white outline to the close button
    closeStroke.Color = Color3.fromRGB(255, 255, 255)
    closeStroke.Thickness = 2
    closeStroke.Parent = closeButton

    closeButton.MouseButton1Click:Connect(function()
          mainFrame.Visible = false --hides the store window when the close button is clicked
    end)

    return mainFrame --returns the created store window so it can be used outside this function
end

local function createStoreLayout(parentFrame) --function that creates the top tabs and the scrollable content area inside the store window
    local tabBar = Instance.new("Frame") --invisible container for the tob bar buttons
    tabBar.Name = "TabBar"
    tabBar.Size = UDim2.new(1, -40, 0, 48) -- Full width minus 40px margins (20 px left + 20 px right), 48px tall
    tabBar.Position = UDim2.new(0, 20, 0, 16)
    tabBar.BackgroundTransparency = 1 -- fully transparent background so the buttons are only visible
    tabBar.Parent = parentFrame

    local tabLayout = Instance.new("UIListLayout") -- automatically arranges the tab uttons isde by side in the center
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabLayout.Padding = UDim.new(0, 14) -- 14px space between each button
    tabLayout.Parent = tabBar

    local tabButtons = {} --table to store references to all 3 tab buttons so we can highlight the active one
    local tabNames = { "Money", "GamePasses", "Special Orders" }

    for _, tabName in ipairs(tabNames) do
          local btn = Instance.new("TextButton")
          btn.Name = tabName .. "TabButton"
          btn.Size = UDim2.new(0, 170, 0, 44)
          btn.BackgroundColor3 = Color3.fromRGB(32, 46, 74)
          btn.Text = tabName
          btn.TextColor3 = Color3.fromRGB(255, 255, 255)
          btn.Font = Enum.Font.FredokaOne
          btn.TextSize = 20
          btn.Parent = tabBar

          local btnCorner = Instance.new("UICorner") --rounds the corners of each tab button
          btnCorner.CornerRadius = UDim.new(0, 12)
          btnCorner.Parent = btn

          local btnStroke = Instance.new("UIStroke") --adds a light blue outline to each tab button
          btnStroke.Color = Color3.fromRGB(90, 150, 240)
          btnStroke.Thickness = 2
          btnStroke.Parent = btn

          tabButtons[tabName] = btn -- saves the button under its name
    end

          local contentScroll = Instance.new("ScrollingFrame")
          contentScroll.Name = "ContentScroll"
          contentScroll.Size = UDim2.new(1, -40, 1, -90) -- Fills the remaining space inside the store window
          contentScroll.Position = UDim2.new(0, 20, 0, 74)
          contentScroll.BackgroundTransparency = 1
          contentScroll.BorderSizePixel = 0
          contentScroll.ScrollBarThickness = 8 -- Width and color of the scrollbar on the right
          contentScroll.ScrollBarImageColor3 = Color3.fromRGB(90, 160, 255)
          contentScroll.CanvasSize = UDim2.new(0, 0, 0, 0) -- Automatically adjusts scroll height based on how many items are inside
          contentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
          contentScroll.Parent = parentFrame

          local scrollPadding = Instance.new("UIPadding") --adds inner spacing so items do not touch the edges of the scrollbar
          scrollPadding.PaddingTop = UDim.new(0, 8)
          scrollPadding.PaddingBottom = UDim.new(0, 12)
          scrollPadding.PaddingLeft = UDim.new(0, 8)
          scrollPadding.PaddingRight = UDim.new(0, 16)
          scrollPadding.Parent = contentScroll

          return tabButtons, contentScroll --returns the created tab buttons and the scrollable content area so they can be used outside this function
end

-- Spuštění funkce a uložení vráceného tlačítka do proměnné
local robuxButton = createOpenButton(screenGui)
local storeWindow = createStoreWindow(screenGui)
local tabButtons, contentScroll = createStoreLayout(storeWindow)

robuxButton.MouseButton1Click:Connect(function()
    storeWindow.Visible = not storeWindow.Visible -- Toggles the store window visibility when clicking the Robux Store button
end)

local function selectTab(selectedName)
    for name, btn in pairs(tabButtons) do
        if name == selectedName then
            btn.BackgroundColor3 = Color3.fromRGB(50, 130, 240)
        else
            btn.BackgroundColor3 = Color3.fromRGB(32, 46, 74)
        end
    end
end

for name, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        selectTab(name)
    end)
end

selectTab("Money") -- Set the default selected tab to "Money" when the store window is first opened