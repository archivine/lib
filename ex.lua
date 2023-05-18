local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/archivine/lib/main/release.lua"))()
 
local Window = Library:CreateWindow("sheizehax", {AccentColor = Color3.fromRGB(255, 255, 255)});

local MainTab = Window:AddTab("Tab 0")

local LeftGP = MainTab:AddLeftGroupBox("Groupbox 0");
local Toggle0 = LeftGP:AddToggle("Toggle 0")
local Slider0 = LeftGP:AddSlider("Slider 0", 0, 100, 25);


local RightGP = MainTab:AddRightGroupBox("Groupbox 1");
local Toggle1 = RightGP:AddToggle("Toggle 1")
local Slider1 = RightGP:AddSlider("Slider 1", 0, 100, 50);
