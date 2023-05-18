local UIS = game:GetService("UserInputService");
local RenderStepped = game:GetService('RunService').RenderStepped;
local LocalPlayer = game:GetService('Players').LocalPlayer;
local Mouse = LocalPlayer:GetMouse();

local Library = {	
};

function Library:CreateWindow(Title, Options)
	
	local Window = {
		DragHover = false,
		CurrentTab = nil,
		AccentColor =  Color3.fromRGB(255, 0, 4),
		Size = UDim2.new(0, 550, 0, 600)
	}
	
	-- Unpack args
	if Options then 
		if Options.AccentColor then 
			Window.AccentColor = Options.AccentColor
		end
		
		if Options.Size then 
			Window.Size = Options.Size
		end
	end
	
	-- Render main window
	do 
		-- StarterGui.ScreenGui
		Window["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
		Window["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

		-- StarterGui.ScreenGui.Frame
		Window["2"] = Instance.new("Frame", Window["1"]);
		Window["2"]["BorderSizePixel"] = 0;
		Window["2"]["BackgroundColor3"] = Window.AccentColor;
		Window["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Window["2"]["Size"] = Window.Size
		Window["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.ScreenGui.Frame.UIStroke
		Window["3"] = Instance.new("UIStroke", Window["2"]);
		Window["3"]["Color"] = Color3.fromRGB(21, 21, 21);

		-- StarterGui.ScreenGui.Frame.Main
		Window["4"] = Instance.new("Frame", Window["2"]);
		Window["4"]["BorderSizePixel"] = 0;
		Window["4"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
		Window["4"]["Size"] = UDim2.new(1, -4, 1, -4);
		Window["4"]["Position"] = UDim2.new(0, 2, 0, 2);
		Window["4"]["Name"] = [[Main]];

		-- StarterGui.ScreenGui.Frame.Main.UIStroke
		Window["5"] = Instance.new("UIStroke", Window["4"]);
		Window["5"]["Color"] = Color3.fromRGB(21, 21, 21);

		-- StarterGui.ScreenGui.Frame.Main.TextLabel
		Window["6"] = Instance.new("TextLabel", Window["4"]);
		Window["6"]["TextWrapped"] = true;
		Window["6"]["TextStrokeTransparency"] = 0;
		Window["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		Window["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Window["6"]["TextSize"] = 14;
		Window["6"]["TextColor3"] = Color3.fromRGB(226, 226, 226);
		Window["6"]["Size"] = UDim2.new(1, 0, 0, 22);
		Window["6"]["Text"] = Title;
		Window["6"]["BackgroundTransparency"] = 1;

		-- StarterGui.ScreenGui.Frame.Main.TextLabel.UIPadding
		Window["7"] = Instance.new("UIPadding", Window["6"]);
		Window["7"]["PaddingLeft"] = UDim.new(0, 6);

		-- StarterGui.ScreenGui.Frame.Main.Body
		Window["8"] = Instance.new("Frame", Window["4"]);
		Window["8"]["BorderSizePixel"] = 0;
		Window["8"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		Window["8"]["Size"] = UDim2.new(1, -12, 1, -32);
		Window["8"]["Position"] = UDim2.new(0, 6, 0, 24);
		Window["8"]["Name"] = [[Body]];

		-- StarterGui.ScreenGui.Frame.Main.Body.UIStroke
		Window["9"] = Instance.new("UIStroke", Window["8"]);
		Window["9"]["Color"] = Color3.fromRGB(80, 80, 80);

		-- StarterGui.ScreenGui.Frame.Main.Body.UIPadding
		Window["10"] = Instance.new("UIPadding", Window["8"]);
		Window["10"]["PaddingTop"] = UDim.new(0, 8);
		Window["10"]["PaddingRight"] = UDim.new(0, 8);
		Window["10"]["PaddingBottom"] = UDim.new(0, 8);
		Window["10"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.ScreenGui.Frame.Main.Body.UIListLayout
		Window["11"] = Instance.new("UIListLayout", Window["8"]);
		Window["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer
		Window["12"] = Instance.new("Frame", Window["8"]);
		Window["12"]["BorderSizePixel"] = 0;
		Window["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Window["12"]["BackgroundTransparency"] = 1;
		Window["12"]["Size"] = UDim2.new(1, 0, 0, 24);
		Window["12"]["Name"] = [[TabsContainer]];

		-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.UIListLayout
		Window["13"] = Instance.new("UIListLayout", Window["12"]);
		Window["13"]["FillDirection"] = Enum.FillDirection.Horizontal;
		Window["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		
	end
	
	-- Functions
	do
		
		function Window:AddTab(Name)
			
			local Tab = {
				Active = false,
				Hover = false
			}
			
			-- Render
			do 
				-- Button
				do 

					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame
					Tab["1"] = Instance.new("Frame", Window["12"]);
					Tab["1"]["ZIndex"] = 2;
					Tab["1"]["BorderSizePixel"] = 0;
					Tab["1"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
					Tab["1"]["Size"] = UDim2.new(0.2, 0, 1, -1);
					Tab["1"]["Position"] = UDim2.new(0, 0, 0.9583333134651184, 0);
					Tab["1"]["Name"] = [[TabFrame]];

					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.TextLabel
					Tab["2"] = Instance.new("TextLabel", Tab["1"]);
					Tab["2"]["TextStrokeTransparency"] = 0;
					Tab["2"]["BorderSizePixel"] = 0;
					Tab["2"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
					Tab["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Tab["2"]["TextSize"] = 14;
					Tab["2"]["Size"] = UDim2.new(1, 0, 1, 0);
					Tab["2"]["TextColor3"] = Color3.fromRGB(179, 179, 179);
					Tab["2"]["BorderColor3"] = Color3.fromRGB(80, 80, 80);
					Tab["2"]["Text"] = Name;

					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.UIStroke
					Tab["3"] = Instance.new("UIStroke", Tab["1"]);
					Tab["3"]["Color"] = Color3.fromRGB(80, 80, 80);
				end
				
				-- Main frame
				do 
					
					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.Content
					Tab["4"] = Instance.new("Frame", Window["8"]);
					Tab["4"]["BorderSizePixel"] = 0;
					Tab["4"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
					Tab["4"]["LayoutOrder"] = 2;
					Tab["4"]["Size"] = UDim2.new(1, 0, 1, -24);
					Tab["4"]["Name"] = [[Content]];
					Tab["4"]["ZIndex"] = 0;
					Tab["4"]["Visible"] = false;

					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.Content.UIStroke
					Tab["5"] = Instance.new("UIStroke", Tab["4"]);
					Tab["5"]["Color"] = Color3.fromRGB(80, 80, 80);

					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.Content.Frame
					Tab["6"] = Instance.new("Frame", Tab["4"]);
					Tab["6"]["BorderSizePixel"] = 0;
					Tab["6"]["BackgroundColor3"] = Color3.fromRGB(33, 33, 33);
					Tab["6"]["BackgroundTransparency"] = 1;
					Tab["6"]["Size"] = UDim2.new(1, 0, 1, 0);
					Tab["6"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
					
					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.Content.Frame.UIGridLayout
					Tab["a"] = Instance.new("UIGridLayout", Tab["6"]);
					Tab["a"]["CellSize"] = UDim2.new(0.5, -4, 1, 0);
					Tab["a"]["CellPadding"] = UDim2.new(0, 8, 0, 0);
					
					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.Content.Frame.UIPadding
					Tab["b"] = Instance.new("UIPadding", Tab["6"]);
					Tab["b"]["PaddingTop"] = UDim.new(0, 8);
					Tab["b"]["PaddingBottom"] = UDim.new(0, 8);
					Tab["b"]["PaddingLeft"] = UDim.new(0, 8);
					Tab["b"]["PaddingRight"] = UDim.new(0, 8);
					
					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.Content.Frame.LeftGroupBoxContainer
					Tab["7"] = Instance.new("Frame", Tab["6"]);
					Tab["7"]["BorderSizePixel"] = 0;
					Tab["7"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
					Tab["7"]["BackgroundTransparency"] = 1;
					Tab["7"]["Size"] = UDim2.new(0, 100, 0, 100);
					Tab["7"]["Name"] = [[LeftGroupBoxContainer]];
					

					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.Content.Frame.LeftGroupBoxContainer.UIListLayout
					Tab["8"] = Instance.new("UIListLayout", Tab["7"]);
					Tab["8"]["Padding"] = UDim.new(0, 10);
					Tab["8"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
					
					
					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.Content.Frame.RightGroupBoxContainer
					Tab["9"] = Instance.new("Frame", Tab["6"]);
					Tab["9"]["BorderSizePixel"] = 0;
					Tab["9"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
					Tab["9"]["BackgroundTransparency"] = 1;
					Tab["9"]["Size"] = UDim2.new(0, 100, 0, 100);
					Tab["9"]["Name"] = [[RightGroupBoxContainer]];
					
					-- StarterGui.ScreenGui.Frame.Main.Body.TabsContainer.TabFrame.Content.Frame.RightGroupBoxContainer.UIListLayout
					Tab["10"] = Instance.new("UIListLayout", Tab["9"]);
					Tab["10"]["Padding"] = UDim.new(0, 10);
					Tab["10"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
					
					
					
				end
							
			end
			
			-- Functions
			do

				-- Hover
				do 
					
					Tab["1"].MouseEnter:Connect(function()

						Tab.Hover = true;

						if Tab.Active == false then
							
							Tab["2"]["BackgroundColor3"] = Color3.fromRGB(40, 40, 40);
					
							Tab["2"]["TextColor3"] = Color3.fromRGB(225, 225, 225);
							
						end

					end)

					Tab["1"].MouseLeave:Connect(function()
						Tab.Hover = false;

						if Tab.Active == false then
							Tab["2"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
					
							Tab["2"]["TextColor3"] = Color3.fromRGB(179, 179, 179);
						end
					end)
					
				end

				--Activation
				do
					function Tab:Activate()

						if not Tab.Active then

							if Window.CurrentTab ~= nil then

								Window.CurrentTab:Deactivate();
							end

							Tab.Active = true;

							Tab["2"]["BackgroundColor3"] = Color3.fromRGB(40, 40, 40);
							Tab["2"]["Size"] = UDim2.new(1, 0, 1, 2);
							Tab["2"]["TextColor3"] = Color3.fromRGB(225, 225, 225);

							Tab["4"]["Visible"] = true;

							Window.CurrentTab = Tab;
						end

					end

					function Tab:Deactivate()
						if Tab.Active then

							Tab.Active = false;
							Tab.Hover = false;
							
							
							Tab["2"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
							Tab["2"]["Size"] = UDim2.new(1, 0, 1, 0);
							Tab["2"]["TextColor3"] = Color3.fromRGB(179, 179, 179);

							Tab["4"]["Visible"] = false;


						end
					end

					if Window.CurrentTab == nil then
						Tab:Activate();
					end

					UIS.InputBegan:Connect(function(input, gpe) 
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then 

							if Tab.Hover then

								Tab:Activate();
								print(Window.CurrentTab)
							end
						end

					end)
				end
				
			end
			
			-- Elems
			do 
				

				function Tab:AddGroupBox(Name, Side)
					
					local Groupbox = {
					}
					
					-- Render
					
					
					
					do 
						-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox
						Groupbox["1"] = Instance.new("Frame", Tab[Side]); -- right = 8 left = 7
						Groupbox["1"]["BackgroundColor3"] = Color3.fromRGB(33, 33, 33);
						Groupbox["1"]["Size"] = UDim2.new(1, 0, 0, 40);
						Groupbox["1"]["Name"] = [[GroupBox]];

						-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.UIListLayout
						Groupbox["2"] = Instance.new("UIListLayout", Groupbox["1"]);
						Groupbox["2"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
						Groupbox["2"]["Padding"] = UDim.new(0, 8);

						-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.UIStroke
						Groupbox["3"] = Instance.new("UIStroke", Groupbox["1"]);
						Groupbox["3"]["Color"] = Color3.fromRGB(80, 80, 80);

						-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.UIPadding
						Groupbox["4"] = Instance.new("UIPadding", Groupbox["1"]);
						Groupbox["4"]["PaddingTop"] = UDim.new(0, 6);
						Groupbox["4"]["PaddingBottom"] = UDim.new(0, 6);
						Groupbox["4"]["PaddingLeft"] = UDim.new(0, 6);
						Groupbox["4"]["PaddingRight"] = UDim.new(0, 6);

						-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.TextLabel
						Groupbox["5"] = Instance.new("TextLabel", Groupbox["1"]);
						Groupbox["5"]["TextStrokeTransparency"] = 0;
						Groupbox["5"]["BorderSizePixel"] = 0;
						Groupbox["5"]["BackgroundTransparency"] = 1;
						Groupbox["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Groupbox["5"]["TextSize"] = 14;
						Groupbox["5"]["Size"] = UDim2.new(1, 0, 0, 12);
						Groupbox["5"]["TextColor3"] = Color3.fromRGB(225, 225, 225);
						Groupbox["5"]["BorderColor3"] = Color3.fromRGB(80, 80, 80);
						Groupbox["5"]["Text"] = Name;
					end
					
					-- Functions
					do 
						function Groupbox:Rescale()
							Groupbox["1"]["Size"] = UDim2.new(1, 0, 0, Groupbox["2"]["AbsoluteContentSize"].Y + 14)
						end
					end
					
					-- Elems
					do 
						
						function Groupbox:AddToggle(Title)
							
							local Toggle = {
								State = false,
								Hover = false
							}
							
							-- Render
							do
								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Checkbox
								Toggle["1"] = Instance.new("Frame", Groupbox["1"]);
								Toggle["1"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
								Toggle["1"]["BackgroundTransparency"] = 1;
								Toggle["1"]["LayoutOrder"] = 2;
								Toggle["1"]["Size"] = UDim2.new(1, 0, 0, 16);
								Toggle["1"]["Name"] = [[Checkbox]];

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Checkbox.Label
								Toggle["2"] = Instance.new("TextLabel", Toggle["1"]);
								Toggle["2"]["TextStrokeTransparency"] = 0;
								Toggle["2"]["BorderSizePixel"] = 0;
								Toggle["2"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
								Toggle["2"]["TextXAlignment"] = Enum.TextXAlignment.Left;
								Toggle["2"]["TextYAlignment"] = Enum.TextYAlignment.Center;
								Toggle["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
								Toggle["2"]["TextSize"] = 14;
								Toggle["2"]["TextColor3"] = Color3.fromRGB(226, 226, 226);
								Toggle["2"]["Size"] = UDim2.new(1, -18, 0, 16);
								Toggle["2"]["Text"] = Title;
								Toggle["2"]["Name"] = [[Label]];
								Toggle["2"]["BackgroundTransparency"] = 1;
								Toggle["2"]["Position"] = UDim2.new(0, 18, 0, 0);

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Checkbox.Check
								Toggle["3"] = Instance.new("Frame", Toggle["1"]);
								Toggle["3"]["BorderSizePixel"] = 0;
								Toggle["3"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
								Toggle["3"]["Size"] = UDim2.new(0, 16, 1, 0);
								Toggle["3"]["Name"] = [[Check]];

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Checkbox.Check.UIStroke
								Toggle["4"] = Instance.new("UIStroke", Toggle["3"]);
								Toggle["4"]["Color"] = Color3.fromRGB(47, 47, 47);

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Checkbox.Label.UIPadding
								Toggle["5"] = Instance.new("UIPadding", Toggle["2"]);
								Toggle["5"]["PaddingLeft"] = UDim.new(0, 6);

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Checkbox.UIListLayout
								Toggle["6"] = Instance.new("UIListLayout", Toggle["1"]);
								Toggle["6"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
								Toggle["6"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
								Toggle["6"]["FillDirection"] = Enum.FillDirection.Horizontal;
								Toggle["6"]["SortOrder"] = Enum.SortOrder.Name;
							end
							
							-- Function 
							
							do 
								Toggle["1"].MouseEnter:Connect(function()
									Toggle.Hover = true;
								end)
								
								Toggle["1"].MouseLeave:Connect(function()
									Toggle.Hover = false;
								end)
								
								function Toggle:Activate()
									
									if Toggle.State then
										Toggle:Deactivate()
										return
									end
									
									Toggle.State = true;
									Toggle["3"]["BackgroundColor3"] = Window.AccentColor;
								end
								
								function Toggle:Deactivate()
									
									Toggle.State = false;
									Toggle["3"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
								end
								
								UIS.InputBegan:Connect(function(Input, GPE) 
									if GPE then return end

									if Input.UserInputType == Enum.UserInputType.MouseButton1 then 

										if Toggle.Hover then

											Toggle:Activate();
											print(Toggle.State)

										end
									end

								end)
								
								
							end
							
							Groupbox:Rescale()
							
							return Toggle.State
							
						end
						
						function Groupbox:AddSlider(Title, MinValue, MaxValue, Options)
                            local Slider = {
								CurrentValue = 0,	
								MaxSize = 0,
                                DefaultValue = 1,
                                Rounding = 0
							};
							
                            -- Unpack args

                            if Options then 
                                if Options.DefaultValue then 
                                    Slider.DefaultValue = Options.DefaultValue
                                end

                                if Options.Rounding then 
                                    Slider.Rounding = Options.Rounding
                                end
                            end
							
							-- Render
							
							do 
								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Slider
								Slider["1"] = Instance.new("Frame", Groupbox["1"]);
								Slider["1"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
								Slider["1"]["BackgroundTransparency"] = 1;
								Slider["1"]["LayoutOrder"] = 2;
								Slider["1"]["Size"] = UDim2.new(1, 0, 0, 36);
								Slider["1"]["Name"] = [[Slider]];

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Slider.Label
								Slider["2"] = Instance.new("TextLabel", Slider["1"]);
								Slider["2"]["TextStrokeTransparency"] = 0;
								Slider["2"]["BorderSizePixel"] = 0;
								Slider["2"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
								Slider["2"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
								Slider["2"]["TextXAlignment"] = Enum.TextXAlignment.Left;
								Slider["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
								Slider["2"]["TextSize"] = 14;
								Slider["2"]["TextColor3"] = Color3.fromRGB(226, 226, 226);
								Slider["2"]["Size"] = UDim2.new(1, 0, 0, 12);
								Slider["2"]["Text"] = Title;
								Slider["2"]["Name"] = [[Label]];
								Slider["2"]["BackgroundTransparency"] = 1;
								Slider["2"]["Position"] = UDim2.new(0, 18, 0, 0);

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Slider.UIListLayout
								Slider["4"] = Instance.new("UIListLayout", Slider["1"]);
								Slider["4"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
								Slider["4"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
								Slider["4"]["Padding"] = UDim.new(0, 6);
								Slider["4"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Slider.Inner
								Slider["5"] = Instance.new("Frame", Slider["1"]);
								Slider["5"]["BorderSizePixel"] = 0;
								Slider["5"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
								Slider["5"]["LayoutOrder"] = 2;
								Slider["5"]["Size"] = UDim2.new(1, 0, 0, 16);
								Slider["5"]["Name"] = [[Inner]];

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Slider.Inner.UIStroke
								Slider["6"] = Instance.new("UIStroke", Slider["5"]);
								Slider["6"]["Color"] = Color3.fromRGB(47, 47, 47);

								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Slider.Inner.Outer
								Slider["7"] = Instance.new("Frame", Slider["5"]);
								Slider["7"]["BorderSizePixel"] = 0;
								Slider["7"]["BackgroundColor3"] = Window.AccentColor;
								Slider["7"]["LayoutOrder"] = 2;
								Slider["7"]["Size"] = UDim2.new(0, 0, 0, 16);
								Slider["7"]["Name"] = [[Outer]];
								
								-- StarterGui.ScreenGui.Frame.Main.Body.Content.Frame.GroupBoxContainer.GroupBox.Slider.Inner.Label
								Slider["8"] = Instance.new("TextLabel", Slider["5"]);
								Slider["8"]["TextStrokeTransparency"] = 0;
								Slider["8"]["BorderSizePixel"] = 0;
								Slider["8"]["TextYAlignment"] = Enum.TextYAlignment.Center;
								Slider["8"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
								Slider["8"]["TextXAlignment"] = Enum.TextXAlignment.Center;
								Slider["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
								Slider["8"]["TextSize"] = 14;
								Slider["8"]["TextColor3"] = Color3.fromRGB(226, 226, 226);
								Slider["8"]["Size"] = UDim2.new(1, 0, 1, 0);
								Slider["8"]["Text"] = Slider.CurrentValue;
								Slider["8"]["Name"] = [[Label]];
								Slider["8"]["BackgroundTransparency"] = 1;
							end
							Slider.MaxSize = Slider["5"]["AbsoluteSize"]["X"]
							
							-- Functions
							
							do 
								function Slider:Map(Value, MinA, MaxA, MinB, MaxB)
									return (1 - ((Value - MinA) / (MaxA - MinA))) * MinB + ((Value - MinA) / (MaxA - MinA)) * MaxB;
								end
								
								function Slider:Update()
									
									local X = math.ceil(Slider:Map(Slider.CurrentValue, MinValue, MaxValue, 0, Slider.MaxSize));
									
									Slider["8"]["Text"] = Slider.CurrentValue;
									Slider["7"]["Size"] = UDim2.new(0, X, 0, 16);
								
								end
								
								function Slider:OnChanged(Func)
									Slider.Changed = Func;
									Func();
								end

                                function Slider:Round(Value)
                                    if Slider.Rounding == 0 then
                                        return math.floor(Value);
                                    end;
                        
                                    local Str = Value .. '';
                                    local Dot = Str:find('%.');
                        
                                    return Dot and tonumber(Str:sub(1, Dot + Slider.Rounding)) or Value;
                                end;
								
								function Slider:GetValueFromXOffset(X)
									return Slider:Round(Slider:Map(X, 0, Slider.MaxSize, MinValue, MaxValue));
								end;

								
								Slider["5"].InputBegan:Connect(function(Input)
									if Input.UserInputType == Enum.UserInputType.MouseButton1 then
										
										local MPos = Mouse.X;
										local GPos = Slider["7"]["Size"]["X"]["Offset"]
										local Diff = MPos - (Slider["7"]["AbsolutePosition"]["X"] + GPos);
										
										while UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
											local nMPos = Mouse.X;
											local nX = math.clamp(GPos + (nMPos - MPos) + Diff, 0, Slider.MaxSize);

											local nValue = Slider:GetValueFromXOffset(nX);
											local OldValue = Slider.CurrentValue;
											Slider.CurrentValue = nValue;

											Slider:Update();

											if nValue ~= OldValue and Slider.Changed then
												Slider.Changed();
											end;

											RenderStepped:Wait();
										end;

									end
									
								end)
								
								Slider.CurrentValue = Slider.DefaultValue;
								Slider:Update();
								
								
							end
							
							Groupbox:Rescale()
							
							return Slider;
						end
						
					end
					
					return Groupbox
					
				end
				
				function Tab:AddLeftGroupBox(Name) 
					return Tab:AddGroupBox(Name, "7");
				end
				
				function Tab:AddRightGroupBox(Name) 
					return Tab:AddGroupBox(Name, "9");
				end
			end
			
			return Tab;
		end
		
		function Window:Hook()
			
			UIS.InputBegan:Connect(function(Input)
				
				
				-- Hide/Open
				if Input.KeyCode == Enum.KeyCode.Insert then Window["1"].Enabled = not Window["1"].Enabled end
				
				-- Drag
				do 
					Window["6"].MouseEnter:Connect(function() 
							Window.DragHover = true;
					end)
					
					Window["6"].MouseLeave:Connect(function() 
						Window.DragHover = false;
					end)
					
					
					if Input.UserInputType == Enum.UserInputType.MouseButton1 and Window.DragHover then

						local ObjPos = Vector2.new(
							Mouse.X - Window["2"].AbsolutePosition.X,
							Mouse.Y - Window["2"].AbsolutePosition.Y
						);


						while UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							Window["2"].Position = UDim2.new(
								0,
								Mouse.X - ObjPos.X + (Window["2"].Size.X.Offset * Window["2"].AnchorPoint.X),
								0,
								Mouse.Y - ObjPos.Y + (Window["2"].Size.Y.Offset * Window["2"].AnchorPoint.Y)
							);

							RenderStepped:Wait();
						end

					end
				end
				
			end)
			
		end
				
	end
	
	Window:Hook()
	return Window
	
end

return Library
