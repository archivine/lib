local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/archivine/lib/main/release.lua"))()
 
local Window = Library:CreateWindow("sheizehax", {
        AccentColor = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(600, 700)
    }
);

local MainTab = Window:AddTab("Tab 0")
local LeftGP = MainTab:AddLeftGroupBox("Groupbox 0");
local RightGP = MainTab:AddRightGroupBox("Groupbox 1");

local Toggle0 = LeftGP:AddToggle("Toggle 0") -- Toggle0.State to read value
Toggle0:OnChanged(function()
    print(Toggle0.State)
end)

local Slider0 = LeftGP:AddSlider("Slider 0", 0, 100, { DefaultValue = 25, Rounding = 0 }); --Slider0.CurrentValue to read value
Slider0:OnChanged(function()
    print(Slider0.Currentalue)
end)


local Toggle1 = RightGP:AddToggle("Toggle 1")
local Slider1 = LeftGP:AddSlider("Slider 1", 0, 100, { DefaultValue = 50, Rounding = 1 }); 

-- Rounding 0: 1
-- Rounding 1: 1.1
-- Rounding 2: 1.11
