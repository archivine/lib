local uis = game:GetService("UserInputService");
local tweenService = game:GetService("TweenService");
local renderStepped = (game:GetService("RunService")).RenderStepped;
local localPlayer = (game:GetService("Players")).LocalPlayer;
local mouse = localPlayer:GetMouse();
local library = {};
local camera = {};
local defaultTweenInfo = TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
function library:tween(object, goal, callback)
	local tween = tweenService:Create(object, defaultTweenInfo, goal);
	tween.Completed:Connect(callback or function()
	end);
	tween:Play();
end;
function library:init()
	local gui = {
		is_closed = false,
		is_con_hovered = true,
		currentTab = false
	};
	do
		gui["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
		gui["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
		gui["2"] = Instance.new("Frame", gui["1"]);
		gui["2"].BorderSizePixel = 0;
		gui["2"].BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		gui["2"].AnchorPoint = Vector2.new(0, 0);
		gui["2"].BackgroundTransparency = 0;
		gui["2"].Size = UDim2.new(0, 620, 0, 400);
		gui["2"].Position = UDim2.new(0, 0, 0, 0);
		gui["2"].Name = "Main";
		gui["2"].Draggable = true;
		gui["3"] = Instance.new("Frame", gui["2"]);
		gui["3"].BorderSizePixel = 0;
		gui["3"].BackgroundColor3 = Color3.fromRGB(46, 46, 46);
		gui["3"].BackgroundTransparency = 0;
		gui["3"].Size = UDim2.new(0, 0, 1, 0);
		gui["3"].Position = UDim2.new(0, 0, 0, 0);
		gui["3"].Name = "Content";
		gui["4"] = Instance.new("UICorner", gui["3"]);
		gui["4"].CornerRadius = UDim.new(0, 6);
		gui["5"] = Instance.new("Frame", gui["3"]);
		gui["5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		gui["5"].BackgroundTransparency = 1;
		gui["5"].Size = UDim2.new(1, 0, 1, 0);
		gui["5"].Name = "MainFrame";
		gui["6"] = Instance.new("UIListLayout", gui["5"]);
		gui["6"].SortOrder = Enum.SortOrder.LayoutOrder;
		gui["7"] = Instance.new("Frame", gui["5"]);
		gui["7"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		gui["7"].BackgroundTransparency = 1;
		gui["7"].Size = UDim2.new(1, 0, 0, 52);
		gui["7"].Name = "TopBar";
		gui["8"] = Instance.new("UIListLayout", gui["7"]);
		gui["8"].FillDirection = Enum.FillDirection.Horizontal;
		gui["8"].SortOrder = Enum.SortOrder.LayoutOrder;
		gui["9"] = Instance.new("Frame", gui["7"]);
		gui["9"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		gui["9"].BackgroundTransparency = 1;
		gui["9"].Size = UDim2.new(0, 0, 1, 0);
		gui.a = Instance.new("TextLabel", gui["9"]);
		gui.a.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		gui.a.TextXAlignment = Enum.TextXAlignment.Left;
		gui.a.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
		gui.a.TextSize = 21;
		gui.a.TextColor3 = Color3.fromRGB(181, 181, 181);
		gui.a.Size = UDim2.new(1, 0, 0, 52);
		gui.a.Text = "";
		gui.a.BackgroundTransparency = 1;
		gui.b = Instance.new("UIPadding", gui.a);
		gui.b.PaddingLeft = UDim.new(0, 36);
		gui.c = Instance.new("Frame", gui["7"]);
		gui.c.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		gui.c.BackgroundTransparency = 1;
		gui.c.Size = UDim2.new(0, 0, 1, 0);
		gui.d = Instance.new("UICorner", gui["2"]);
		gui.d.CornerRadius = UDim.new(0, 6);
		gui.e = Instance.new("Frame", gui["2"]);
		gui.e.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		gui.e.BackgroundTransparency = 1;
		gui.e.Size = UDim2.new(0, 0, 1, 0);
		gui.e.Name = "Body";
		gui.f = Instance.new("TextLabel", gui.e);
		gui.f.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		gui.f.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
		gui.f.TextSize = 23;
		gui.f.TextColor3 = Color3.fromRGB(230, 230, 230);
		gui.f.Size = UDim2.new(1, 0, 0, 52);
		gui.f.Text = "polandhack";
		gui.f.BackgroundTransparency = 1;
		gui["10"] = Instance.new("UIPadding", gui.f);
		gui["11"] = Instance.new("UIListLayout", gui.e);
		gui["11"].SortOrder = Enum.SortOrder.LayoutOrder;
		gui["12"] = Instance.new("Frame", gui.e);
		gui["12"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		gui["12"].BackgroundTransparency = 1;
		gui["12"].Size = UDim2.new(1, 0, 1, -52);
		gui["12"].Name = "BodyContent";
		gui["13"] = Instance.new("UIGridLayout", gui["12"]);
		gui["13"].SortOrder = Enum.SortOrder.LayoutOrder;
		gui["13"].CellSize = UDim2.new(1, 0, 0, 0);
		gui["13"].CellPadding = UDim2.new(0, 0, 0, 12);
	end;
	do
		function gui:hookInput()
			camera.blur = Instance.new("BlurEffect");
			camera.blur.Parent = game.Workspace.Camera;
			uis.InputBegan:Connect(function(input)
				if input.KeyCode == Enum.KeyCode.Insert then
					gui["1"].Enabled = not gui["1"].Enabled;
					if gui["1"].Enabled == true then
						camera.blur.Size = 24;
					else
						camera.blur.Size = 0;
					end;
				end;
				gui.current_tab["8"].MouseEnter:Connect(function()
					gui.is_con_hovered = true;
				end);
				gui.current_tab["8"].MouseLeave:Connect(function()
					gui.is_con_hovered = false;
				end);
				if input.UserInputType == Enum.UserInputType.MouseButton1 and (not gui.is_con_hovered) then
					local ObjPos = Vector2.new(mouse.X - gui["2"].AbsolutePosition.X, mouse.Y - gui["2"].AbsolutePosition.Y);
					while uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						gui["2"].Position = UDim2.new(0, mouse.X - ObjPos.X + gui["2"].Size.X.Offset * gui["2"].AnchorPoint.X, 0, mouse.Y - ObjPos.Y + gui["2"].Size.Y.Offset * gui["2"].AnchorPoint.Y);
						renderStepped:Wait();
					end;
				end;
			end);
		end;
	end;
	do
		function gui:add_section(name)
			local section = {
				name = name,
				tabs = {}
			};
			do
				section["1"] = Instance.new("Frame", gui["12"]);
				section["1"].BorderSizePixel = 0;
				section["1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				section["1"].BackgroundTransparency = 1;
				section["1"].Size = UDim2.new(0, 100, 0, 100);
				section["1"].Name = "Section";
				section["2"] = Instance.new("TextLabel", section["1"]);
				section["2"].BorderSizePixel = 0;
				section["2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				section["2"].TextXAlignment = Enum.TextXAlignment.Left;
				section["2"].FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				section["2"].TextSize = 13;
				section["2"].TextColor3 = Color3.fromRGB(148, 148, 148);
				section["2"].Size = UDim2.new(1, 0, 0, 0);
				section["2"].Text = name:upper();
				section["2"].BackgroundTransparency = 1;
				section["3"] = Instance.new("UIPadding", section["2"]);
				section["3"].PaddingLeft = UDim.new(0, 12);
				section["4"] = Instance.new("UIListLayout", section["1"]);
				section["4"].Padding = UDim.new(0, 6);
				section["4"].SortOrder = Enum.SortOrder.LayoutOrder;
			end;
			do
				function section:add_tab(name, icon_id)
					section.tabs[name] = {
						hover = false,
						active = false
					};
					local tab = section.tabs[name];
					do
						tab["1"] = Instance.new("Frame", section["1"]);
						tab["1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
						tab["1"].BackgroundTransparency = 1;
						tab["1"].Size = UDim2.new(1, 0, 0, -6);
						tab["1"].BorderColor3 = Color3.fromRGB(28, 43, 54);
						tab["1"].Name = "Button";
						tab["2"] = Instance.new("ImageLabel", tab["1"]);
						tab["2"].BorderSizePixel = 0;
						tab["2"].ImageColor3 = Color3.fromRGB(201, 201, 201);
						tab["2"].Image = "http://www.roblox.com/asset/?id=" .. icon_id;
						tab["2"].Size = UDim2.new(0, 20, 1, 0);
						tab["2"].BackgroundTransparency = 1;
						tab["3"] = Instance.new("TextLabel", tab["1"]);
						tab["3"].BackgroundColor3 = Color3.fromRGB(194, 255, 201);
						tab["3"].TextXAlignment = Enum.TextXAlignment.Left;
						tab["3"].FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
						tab["3"].TextSize = 14;
						tab["3"].TextColor3 = Color3.fromRGB(201, 201, 201);
						tab["3"].Size = UDim2.new(1, -20, 1, 0);
						tab["3"].BorderColor3 = Color3.fromRGB(28, 43, 54);
						tab["3"].Text = name;
						tab["3"].BackgroundTransparency = 1;
						tab["4"] = Instance.new("UIPadding", tab["3"]);
						tab["4"].PaddingLeft = UDim.new(0, 12);
						tab["5"] = Instance.new("UIListLayout", tab["1"]);
						tab["5"].FillDirection = Enum.FillDirection.Horizontal;
						tab["5"].SortOrder = Enum.SortOrder.LayoutOrder;
						tab["6"] = Instance.new("UIPadding", tab["1"]);
						tab["6"].PaddingRight = UDim.new(0, 12);
						tab["6"].PaddingLeft = UDim.new(0, 12);
						tab["7"] = Instance.new("Frame", gui["5"]);
						tab["7"].BackgroundColor3 = Color3.fromRGB(148, 213, 255);
						tab["7"].BackgroundTransparency = 1;
						tab["7"].Size = UDim2.new(1, 0, 1, -52);
						tab["7"].Name = "Box";
						tab["7"].Visible = false;
						tab["8"] = Instance.new("ScrollingFrame", tab["7"]);
						tab["8"].Active = false;
						tab["8"].BorderSizePixel = 0;
						tab["8"].ScrollBarImageTransparency = 0;
						tab["8"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
						tab["8"].BackgroundTransparency = 1;
						tab["8"].Size = UDim2.new(1, 0, 1, 0);
						tab["8"].ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0);
						tab["8"].ScrollBarThickness = 6;
						tab["9"] = Instance.new("UIListLayout", tab["8"]);
						tab["9"].Padding = UDim.new(0, 12);
						tab["9"].SortOrder = Enum.SortOrder.LayoutOrder;
						tab["10"] = Instance.new("UIPadding", tab["8"]);
						tab["10"].PaddingTop = UDim.new(0, 12);
						tab["10"].PaddingRight = UDim.new(0, 12);
						tab["10"].PaddingBottom = UDim.new(0, 12);
						tab["10"].PaddingLeft = UDim.new(0, 12);
					end;
					do
						tab["1"].MouseEnter:Connect(function()
							tab.hover = true;
							if tab.active == false then
								library:tween(tab["3"], {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								});
								library:tween(tab["2"], {
									ImageColor3 = Color3.fromRGB(255, 255, 255)
								});
							end;
						end);
						tab["1"].MouseLeave:Connect(function()
							tab.hover = false;
							if tab.active == false then
								library:tween(tab["3"], {
									TextColor3 = Color3.fromRGB(200, 200, 200)
								});
								library:tween(tab["2"], {
									ImageColor3 = Color3.fromRGB(200, 200, 200)
								});
							end;
						end);
						function tab:activate()
							if not tab.active then
								if gui.current_tab ~= nil then
									gui.current_tab:deactivate();
								end;
								tab.active = true;
								gui.a.Text = name;
								library:tween(tab["3"], {
									TextColor3 = Color3.fromRGB(255, 255, 255)
								});
								library:tween(tab["2"], {
									ImageColor3 = Color3.fromRGB(255, 255, 255)
								});
								tab["7"].Visible = true;
								gui.current_tab = tab;
							end;
						end;
						function tab:deactivate()
							if tab.active then
								tab.active = false;
								tab.hover = false;
								library:tween(tab["3"], {
									TextColor3 = Color3.fromRGB(200, 200, 200)
								});
								library:tween(tab["2"], {
									ImageColor3 = Color3.fromRGB(200, 200, 200)
								});
								tab["7"].Visible = false;
							end;
						end;
						if gui.current_tab == nil then
							tab:activate();
						end;
						uis.InputBegan:Connect(function(input, gpe)
							if gpe then
								return;
							end;
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								if tab.hover then
									tab:activate();
								end;
							end;
						end);
					end;
					do
						function tab:add_label(text)
							local label = {};
							label["1"] = Instance.new("Frame", tab["8"]);
							label["1"].BackgroundColor3 = Color3.fromRGB(46, 46, 46);
							label["1"].BackgroundTransparency = 0;
							label["1"].Size = UDim2.new(1, 0, 0, 42);
							label["1"].Name = "Label";
							label["2"] = Instance.new("UICorner", label["1"]);
							label["2"].CornerRadius = UDim.new(0, 6);
							label["3"] = Instance.new("UIStroke", label["1"]);
							label["3"].Color = Color3.fromRGB(94, 94, 94);
							label["4"] = Instance.new("TextLabel", label["1"]);
							label["4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							label["4"].TextXAlignment = Enum.TextXAlignment.Left;
							label["4"].FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
							label["4"].TextSize = 17;
							label["4"].TextColor3 = Color3.fromRGB(224, 224, 224);
							label["4"].Size = UDim2.new(1, 0, 0, 42);
							label["4"].Text = text;
							label["4"].BackgroundTransparency = 1;
							label["5"] = Instance.new("UIPadding", label["4"]);
							label["5"].PaddingLeft = UDim.new(0, 12);
							return label;
						end;
						function tab:add_warning(text)
							local warning = {};
							warning["1"] = Instance.new("Frame", tab["8"]);
							warning["1"].BackgroundColor3 = Color3.fromRGB(223, 184, 44);
							warning["1"].BackgroundTransparency = 0;
							warning["1"].Size = UDim2.new(1, 0, 0, 42);
							warning["1"].Name = "Warning";
							warning["2"] = Instance.new("UICorner", warning["1"]);
							warning["2"].CornerRadius = UDim.new(0, 6);
							warning["3"] = Instance.new("UIStroke", warning["1"]);
							warning["3"].Color = Color3.fromRGB(132, 128, 0);
							warning["4"] = Instance.new("TextLabel", warning["1"]);
							warning["4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							warning["4"].TextXAlignment = Enum.TextXAlignment.Left;
							warning["4"].FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
							warning["4"].TextSize = 17;
							warning["4"].TextColor3 = Color3.fromRGB(224, 224, 224);
							warning["4"].Size = UDim2.new(1, 0, 0, 42);
							warning["4"].Text = text;
							warning["4"].BackgroundTransparency = 1;
							warning["5"] = Instance.new("UIPadding", warning["4"]);
							warning["5"].PaddingLeft = UDim.new(0, 12);
							return warning;
						end;
						function tab:add_info(text)
							local info = {};
							info["1"] = Instance.new("Frame", tab["8"]);
							info["1"].BackgroundColor3 = Color3.fromRGB(19, 128, 115);
							info["1"].BackgroundTransparency = 0;
							info["1"].Size = UDim2.new(1, 0, 0, 42);
							info["1"].Name = "Info";
							info["2"] = Instance.new("UICorner", info["1"]);
							info["2"].CornerRadius = UDim.new(0, 6);
							info["3"] = Instance.new("UIStroke", info["1"]);
							info["3"].Color = Color3.fromRGB(12, 115, 117);
							info["4"] = Instance.new("TextLabel", info["1"]);
							info["4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							info["4"].TextXAlignment = Enum.TextXAlignment.Left;
							info["4"].FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
							info["4"].TextSize = 17;
							info["4"].TextColor3 = Color3.fromRGB(224, 224, 224);
							info["4"].Size = UDim2.new(1, 0, 0, 42);
							info["4"].Text = text;
							info["4"].BackgroundTransparency = 1;
							info["5"] = Instance.new("UIPadding", info["4"]);
							info["5"].PaddingLeft = UDim.new(0, 12);
							return info;
						end;
						function tab:add_toggle(text)
							local toggle = {
								hover = false,
								active = false,
								callback = false
							};
							do
								toggle["1"] = Instance.new("Frame", tab["8"]);
								toggle["1"].BackgroundColor3 = Color3.fromRGB(46, 46, 46);
								toggle["1"].BackgroundTransparency = 0;
								toggle["1"].Size = UDim2.new(1, 0, 0, 42);
								toggle["1"].Name = "Toggle";
								toggle["2"] = Instance.new("UICorner", toggle["1"]);
								toggle["2"].CornerRadius = UDim.new(0, 6);
								toggle["3"] = Instance.new("UIStroke", toggle["1"]);
								toggle["3"].Color = Color3.fromRGB(94, 94, 94);
								toggle["4"] = Instance.new("UIListLayout", toggle["1"]);
								toggle["4"].FillDirection = Enum.FillDirection.Horizontal;
								toggle["4"].VerticalAlignment = Enum.VerticalAlignment.Center;
								toggle["4"].SortOrder = Enum.SortOrder.LayoutOrder;
								toggle["5"] = Instance.new("TextLabel", toggle["1"]);
								toggle["5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
								toggle["5"].TextXAlignment = Enum.TextXAlignment.Left;
								toggle["5"].FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
								toggle["5"].TextSize = 17;
								toggle["5"].TextColor3 = Color3.fromRGB(224, 224, 224);
								toggle["5"].Size = UDim2.new(1, -42, 0, 42);
								toggle["5"].Text = text;
								toggle["5"].BackgroundTransparency = 1;
								toggle["6"] = Instance.new("UIPadding", toggle["5"]);
								toggle["6"].PaddingLeft = UDim.new(0, 12);
								toggle["6"] = Instance.new("ImageLabel", toggle["1"]);
								toggle["6"].BorderSizePixel = 0;
								toggle["6"].ImageColor3 = Color3.fromRGB(163, 165, 165);
								toggle["6"].Image = "http://www.roblox.com/asset/?id=6031068420";
								toggle["6"].Size = UDim2.new(0, 32, 0, 32);
								toggle["6"].BackgroundTransparency = 1;
							end;
							do
								toggle["1"].MouseEnter:Connect(function()
									toggle.hover = true;
									if toggle.active == false then
										library:tween(toggle["6"], {
											ImageColor3 = Color3.fromRGB(200, 200, 200)
										});
									end;
								end);
								toggle["1"].MouseLeave:Connect(function()
									toggle.hover = false;
									if toggle.active == false then
										library:tween(toggle["6"], {
											ImageColor3 = Color3.fromRGB(165, 165, 165)
										});
									end;
								end);
								function toggle:activate()
									if toggle.callback == true then
										toggle:deactivate();
										return;
									end;
									toggle.active = true;
									library:tween(toggle["6"], {
										ImageColor3 = Color3.fromRGB(200, 200, 200)
									});
									toggle["6"].Image = "http://www.roblox.com/asset/?id=6031068421";
									toggle.callback = true;
								end;
								function toggle:deactivate()
									if toggle.active then
										toggle.active = false;
										toggle.hover = false;
										library:tween(toggle["6"], {
											ImageColor3 = Color3.fromRGB(165, 165, 165)
										});
										toggle["6"].Image = "http://www.roblox.com/asset/?id=6031068420";
										toggle.callback = false;
									end;
								end;
								uis.InputBegan:Connect(function(input, gpe)
									if gpe then
										return;
									end;
									if input.UserInputType == Enum.UserInputType.MouseButton1 then
										if toggle.hover then
											toggle:activate();
											print(toggle.callback);
										end;
									end;
								end);
							end;
							return toggle.callback;
						end;
						function tab:add_color_toggle(text)
							local toggle = {
								hover = false,
								active = false,
								callback = false,
								col_popup_active = false,
								selected_color = Color3.fromHSV(1, 1, 1),
								color_data = {
									1,
									1,
									1
								},
								mouse_down = false
							};
							do
								toggle["1"] = Instance.new("Frame", tab["8"]);
								toggle["1"].BackgroundColor3 = Color3.fromRGB(46, 46, 46);
								toggle["1"].BackgroundTransparency = 0;
								toggle["1"].Size = UDim2.new(1, 0, 0, 42);
								toggle["1"].Name = "ColorToggle";
								toggle["2"] = Instance.new("UICorner", toggle["1"]);
								toggle["2"].CornerRadius = UDim.new(0, 6);
								toggle["3"] = Instance.new("UIStroke", toggle["1"]);
								toggle["3"].Color = Color3.fromRGB(94, 94, 94);
								toggle["4"] = Instance.new("UIListLayout", toggle["1"]);
								toggle["4"].FillDirection = Enum.FillDirection.Horizontal;
								toggle["4"].VerticalAlignment = Enum.VerticalAlignment.Center;
								toggle["4"].SortOrder = Enum.SortOrder.LayoutOrder;
								toggle["5"] = Instance.new("TextLabel", toggle["1"]);
								toggle["5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
								toggle["5"].TextXAlignment = Enum.TextXAlignment.Left;
								toggle["5"].FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
								toggle["5"].TextSize = 17;
								toggle["5"].TextColor3 = Color3.fromRGB(224, 224, 224);
								toggle["5"].Size = UDim2.new(1, -42, 0, 42);
								toggle["5"].Text = text;
								toggle["5"].BackgroundTransparency = 1;
								toggle["6"] = Instance.new("UIPadding", toggle["5"]);
								toggle["6"].PaddingLeft = UDim.new(0, 12);
								toggle["6"] = Instance.new("ImageLabel", toggle["1"]);
								toggle["6"].BorderSizePixel = 0;
								toggle["6"].ImageColor3 = Color3.fromRGB(163, 165, 165);
								toggle["6"].Image = "http://www.roblox.com/asset/?id=6031068420";
								toggle["6"].Size = UDim2.new(0, 32, 0, 32);
								toggle["6"].BackgroundTransparency = 1;
								toggle["7"] = Instance.new("Frame", tab["8"]);
								toggle["7"].BorderSizePixel = 0;
								toggle["7"].BackgroundColor3 = Color3.fromRGB(46, 46, 46);
								toggle["7"].BackgroundTransparency = 0;
								toggle["7"].Size = UDim2.new(1, 0, 0, 0);
								toggle["7"].Position = UDim2.new(0, 0, 0, 0);
								toggle["7"].Name = "ColPopup";
								toggle["8"] = Instance.new("ImageLabel", toggle["7"]);
								toggle["8"].ZIndex = 4;
								toggle["8"].BorderSizePixel = 0;
								toggle["8"].SliceCenter = Rect.new(10, 10, 90, 90);
								toggle["8"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
								toggle["8"].Image = "rbxassetid://1433361550";
								toggle["8"].Size = UDim2.new(0, 176, 1, 0);
								toggle["8"].BorderColor3 = Color3.fromRGB(41, 41, 41);
								toggle["8"].Name = "RGB";
								toggle["8"].Visible = false;
								toggle["9"] = Instance.new("Frame", toggle["8"]);
								toggle["9"].ZIndex = 5;
								toggle["9"].BorderSizePixel = 0;
								toggle["9"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
								toggle["9"].AnchorPoint = Vector2.new(0, 0);
								toggle["9"].BackgroundTransparency = 0;
								toggle["9"].Size = UDim2.new(0, 4, 0, 4);
								toggle["9"].BorderColor3 = Color3.fromRGB(0, 0, 0);
								toggle["9"].Position = UDim2.new(0, 0, 1, 0);
								toggle["9"].Name = "Marker";
								toggle["10"] = Instance.new("UICorner", toggle["9"]);
								toggle["11"] = Instance.new("UICorner", toggle["8"]);
								toggle["12"] = Instance.new("UIStroke", toggle["8"]);
								toggle["12"].Color = Color3.fromRGB(94, 94, 94);
								toggle["13"] = Instance.new("UIPadding", toggle["7"]);
								toggle["13"].PaddingTop = UDim.new(0, 12);
								toggle["13"].PaddingRight = UDim.new(0, 12);
								toggle["13"].PaddingBottom = UDim.new(0, 12);
								toggle["13"].PaddingLeft = UDim.new(0, 12);
								toggle["14"] = Instance.new("UIListLayout", toggle["7"]);
								toggle["14"].VerticalAlignment = Enum.VerticalAlignment.Center;
								toggle["14"].FillDirection = Enum.FillDirection.Horizontal;
								toggle["14"].Padding = UDim.new(0, 12);
								toggle["14"].SortOrder = Enum.SortOrder.LayoutOrder;
								toggle["15"] = Instance.new("ImageLabel", toggle["7"]);
								toggle["15"].ZIndex = 4;
								toggle["15"].BorderSizePixel = 0;
								toggle["15"].SliceCenter = Rect.new(10, 10, 90, 90);
								toggle["15"].BackgroundColor3 = Color3.fromRGB(0, 0, 0);
								toggle["15"].AnchorPoint = Vector2.new(0, 0);
								toggle["15"].Image = "rbxassetid://359311684";
								toggle["15"].Size = UDim2.new(0, 18, 1, 0);
								toggle["15"].BorderColor3 = Color3.fromRGB(41, 41, 41);
								toggle["15"].Name = "Value";
								toggle["15"].Position = UDim2.new(0, 0, 0, 0);
								toggle["15"].Visible = false;
								toggle["16"] = Instance.new("Frame", toggle["15"]);
								toggle["16"].ZIndex = 5;
								toggle["16"].BorderSizePixel = 0;
								toggle["16"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
								toggle["16"].AnchorPoint = Vector2.new(0, 0);
								toggle["16"].BackgroundTransparency = 0;
								toggle["16"].Size = UDim2.new(1, 4, 0, 2);
								toggle["16"].BorderColor3 = Color3.fromRGB(0, 0, 0);
								toggle["16"].Position = UDim2.new(0, 0, 0, 0);
								toggle["16"].Name = "Marker";
								toggle["17"] = Instance.new("UICorner", toggle["15"]);
								toggle["17"].CornerRadius = UDim.new(0, 4);
								toggle["18"] = Instance.new("UIStroke", toggle["15"]);
								toggle["18"].Color = Color3.fromRGB(94, 94, 94);
								toggle["19"] = Instance.new("UICorner", toggle["7"]);
								toggle["20"] = Instance.new("LocalScript", toggle["7"]);
								toggle["20"].Name = "Func";
								toggle["21"] = Instance.new("UIStroke", toggle["7"]);
								toggle["21"].Color = Color3.fromRGB(94, 94, 94);
								toggle["21"].Transparency = 1;
							end;
							do
								toggle["1"].MouseEnter:Connect(function()
									toggle.hover = true;
									if toggle.active == false then
										library:tween(toggle["6"], {
											ImageColor3 = Color3.fromRGB(200, 200, 200)
										});
									end;
								end);
								toggle["1"].MouseLeave:Connect(function()
									toggle.hover = false;
									if toggle.active == false then
										library:tween(toggle["6"], {
											ImageColor3 = Color3.fromRGB(165, 165, 165)
										});
									end;
								end);
								function toggle:activate()
									if toggle.callback == true then
										toggle:deactivate();
										return;
									end;
									toggle.active = true;
									library:tween(toggle["6"], {
										ImageColor3 = Color3.fromRGB(200, 200, 200)
									});
									toggle["6"].Image = "http://www.roblox.com/asset/?id=6031068421";
									toggle.callback = true;
								end;
								function toggle:deactivate()
									if toggle.active then
										toggle.active = false;
										toggle.hover = false;
										library:tween(toggle["6"], {
											ImageColor3 = Color3.fromRGB(165, 165, 165)
										});
										toggle["6"].Image = "http://www.roblox.com/asset/?id=6031068420";
										toggle.callback = false;
									end;
								end;
								function toggle:popup()
									if toggle.col_popup_active then
										toggle:depop();
										return;
									end;
									toggle.col_popup_active = true;
									library:tween(toggle["7"], {
										Size = UDim2.new(1, 0, 0, 200)
									});
									toggle["8"].Visible = true;
									toggle["15"].Visible = true;
									library:tween(toggle["21"], {
										Transparency = 0
									});
								end;
								function toggle:depop()
									library:tween(toggle["7"], {
										Size = UDim2.new(1, 0, 0, 0)
									});
									toggle["8"].Visible = false;
									toggle["15"].Visible = false;
									library:tween(toggle["21"], {
										Transparency = 1
									});
									toggle.col_popup_active = false;
								end;
								function toggle:set_color(hue, sat, val)
									toggle.color_data = {
										hue or toggle.color_data[1],
										sat or toggle.color_data[2],
										val or toggle.color_data[3]
									};
									toggle.selected_color = Color3.fromHSV(toggle.color_data[1], toggle.color_data[2], toggle.color_data[3]);
									toggle["15"].ImageColor3 = Color3.fromHSV(toggle.color_data[1], toggle.color_data[2], 1);
									toggle["1"].BackgroundColor3 = toggle.selected_color;
									print(toggle.selected_color);
								end;
								function toggle:in_bounds(frame)
									local x, y = mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y;
									local maxX, maxY = frame.AbsoluteSize.X, frame.AbsoluteSize.Y;
									if x >= 0 and y >= 0 and x <= maxX and y <= maxY then
										return x / maxX, y / maxY;
									end;
								end;
								mouse.Move:connect(function()
									if toggle.mouse_down then
										local x, y = toggle:in_bounds(toggle["8"]);
										if x and y then
											(toggle["8"]:WaitForChild("Marker")).Position = UDim2.new(x, 0, y, 0);
											toggle:set_color(1 - x, 1 - y);
										end;
										local x, y = toggle:in_bounds(toggle["15"]);
										if x and y then
											(toggle["15"]:WaitForChild("Marker")).Position = UDim2.new(0, 0, y, 0);
											toggle:set_color(nil, nil, 1 - y);
										end;
									end;
								end);
								mouse.Button1Down:connect(function()
									toggle.mouse_down = true;
								end);
								mouse.Button1Up:connect(function()
									toggle.mouse_down = false;
								end);
								uis.InputBegan:Connect(function(input, gpe)
									if gpe then
										return;
									end;
									if input.UserInputType == Enum.UserInputType.MouseButton1 then
										if toggle.hover then
											toggle:activate();
											print(toggle.callback);
										end;
									end;
									if input.UserInputType == Enum.UserInputType.MouseButton2 then
										if toggle.hover then
											toggle:popup();
										end;
									end;
								end);
							end;
							return toggle.callback;
						end;
					end;
					return tab;
				end;
			end;
			return section;
		end;
	end;
	gui:hookInput();
	return gui;
end;
return library;
