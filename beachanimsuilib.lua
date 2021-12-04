local LibraryItself = {}

function LibraryItself:Create(parent, click)
	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
		dragToggle = nil
		local dragSpeed = 0
		dragInput = nil
		dragStart = nil
		local dragPos = nil
		function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	
	local function RippleEffect(object)
		spawn(function()
			local TweenService = game:GetService("TweenService")


			local LocalPlayer = game:GetService("Players").LocalPlayer
			local Mouse = LocalPlayer:GetMouse()
			local Ripple = Instance.new("ImageLabel")

			Ripple.Name = "Ripple"
			Ripple.Parent = object
			Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Ripple.BackgroundTransparency = 1.000
			Ripple.ZIndex = 8
			Ripple.Image = "rbxassetid://2708891598"
			Ripple.ImageTransparency = 0.800
			Ripple.ScaleType = Enum.ScaleType.Fit

			Ripple.Position = UDim2.new((Mouse.X - Ripple.AbsolutePosition.X) / object.AbsoluteSize.X, 0, (Mouse.Y - Ripple.AbsolutePosition.Y) / object.AbsoluteSize.Y, 0)
			game:GetService("TweenService"):Create(Ripple, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}):Play()

			wait(0.2)
			TweenService:Create(Ripple, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()

			wait(1)
			Ripple:Destroy()
		end)
	end
	
	local funclick = click or false
	local ScreenGui = Instance.new("ScreenGui")
	local TopBar = Instance.new("Frame")
	local container = Instance.new("Frame")
	local tabcontainer = Instance.new("Frame")
	local title = Instance.new("TextLabel")
	local X = Instance.new("TextButton")
	local minus = Instance.new("TextButton")
	local tabbuttonholder = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local ButtonClick = Instance.new("Sound", TopBar)
	dragify(TopBar)
	if funclick == true then
		ButtonClick.SoundId = "rbxassetid://7802172696"
	else
		ButtonClick.SoundId = "rbxassetid://0"
	end
	ScreenGui.Parent = parent or game.Players.LocalPlayer:WaitForChild("PlayerGui")
	TopBar.Name = "TopBar"
	TopBar.Parent = ScreenGui
	TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0.315332681, 0, 0.278752446, 0)
	TopBar.Size = UDim2.new(0, 479, 0, 20)
	container.Name = "container"
	container.ClipsDescendants = true
	container.Parent = TopBar
	container.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	container.BorderSizePixel = 0
	container.Position = UDim2.new(0, 0, 1, 0)
	container.Size = UDim2.new(0, 479, 0, 172)
	tabcontainer.Name = "tabcontainer"
	tabcontainer.Parent = container
	tabcontainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	tabcontainer.BorderSizePixel = 0
	tabcontainer.Position = UDim2.new(0.212943628, 0, 0.0406976752, 0)
	tabcontainer.Size = UDim2.new(0, 369, 0, 156)
	tabcontainer.ClipsDescendants = true
	title.Name = "title"
	title.Parent = TopBar
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.Position = UDim2.new(0.0146137783, 0, 0, 0)
	title.Size = UDim2.new(0, 124, 0, 20)
	title.Font = Enum.Font.Gotham
	title.Text = "Beach Animations"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 12.000
	title.TextXAlignment = Enum.TextXAlignment.Left
	X.Name = "X"
	X.Parent = TopBar
	X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	X.BackgroundTransparency = 1.000
	X.Position = UDim2.new(0.951983273, 0, 0, 0)
	X.Size = UDim2.new(0, 23, 0, 20)
	X.Font = Enum.Font.Gotham
	X.Text = "X"
	X.ClipsDescendants = true
	X.TextColor3 = Color3.fromRGB(255, 255, 255)
	X.TextSize = 12.000
	X.MouseButton1Down:Connect(function()
		ScreenGui:Remove()
		RippleEffect(X)
	end)
	local mini = false
	minus.Name = "minus"
	minus.ClipsDescendants = true
	minus.Parent = TopBar
	minus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	minus.BackgroundTransparency = 1.000
	minus.Position = UDim2.new(0.903966546, 0, 0, 0)
	minus.Size = UDim2.new(0, 23, 0, 20)
	minus.Font = Enum.Font.Gotham
	minus.Text = "_"
	minus.TextColor3 = Color3.fromRGB(255, 255, 255)
	minus.TextSize = 12.000
	minus.MouseButton1Down:Connect(function()
		RippleEffect(minus)
		if mini == false then
			game:GetService("TweenService"):Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,479,0,0)}):Play()
			--container:TweenSize(UDim2.new(0,479,0,0))
			mini = true
		elseif mini == true then
			game:GetService("TweenService"):Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,479,0,172)}):Play()
			--container:TweenSize(UDim2.new(0,479,0,172))
			mini = false
		end
	end)
	tabbuttonholder.Name = "tabbuttonholder"
	tabbuttonholder.Parent = container
	tabbuttonholder.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	tabbuttonholder.BorderSizePixel = 0
	tabbuttonholder.Position = UDim2.new(0.0146137783, 0, 0.0406976752, 0)
	tabbuttonholder.Size = UDim2.new(0, 87, 0, 156)
	tabbuttonholder.BottomImage = ""
	tabbuttonholder.CanvasSize = UDim2.new(0, 0, 2, 0)
	tabbuttonholder.ScrollBarThickness = 0
	tabbuttonholder.TopImage = ""


	UIListLayout.Parent = tabbuttonholder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	

	

	local funnylib2 = {}
	
	function funnylib2:DefaultTab(name)
		for i,v in pairs(tabcontainer:GetChildren()) do
			if v.Name == name then
				v:TweenPosition(UDim2.new(0,0,0,0))
			end
		end
	end
	
	function funnylib2:Tab(name)
		local lib = {}
		local tabbutton = Instance.new("TextButton")
		local tab1 = Instance.new("ScrollingFrame")
		tab1.Name = name
		tab1.Parent = tabcontainer
		tab1.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		tab1.BackgroundTransparency = 1.000
		tab1.BorderSizePixel = 0
		tab1.Selectable = false
		tab1.Size = UDim2.new(0, 369, 0, 156)
		tab1.BottomImage = ""
		tab1.CanvasSize = UDim2.new(0, 0, 3, 0)
		tab1.ScrollBarThickness = 0
		tab1.TopImage = ""
		tab1.Position = UDim2.new(0,0,1,0)
		local UIGridLayout = Instance.new("UIGridLayout")
		local UIPadding = Instance.new("UIPadding")
		UIGridLayout.Parent = tab1
		UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout.CellSize = UDim2.new(0, 86, 0, 28)

		UIPadding.Parent = tab1
		UIPadding.PaddingBottom = UDim.new(0, 5)
		UIPadding.PaddingLeft = UDim.new(0, 5)
		UIPadding.PaddingRight = UDim.new(0, 5)
		UIPadding.PaddingTop = UDim.new(0, 5)
		
		tabbutton.Name = name
		tabbutton.Parent = tabbuttonholder
		tabbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabbutton.BackgroundTransparency = 1.000
		tabbutton.Size = UDim2.new(0, 87, 0, 22)
		tabbutton.Font = Enum.Font.Gotham
		tabbutton.Text = name
		tabbutton.ClipsDescendants = true
		tabbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
		tabbutton.TextSize = 12.000
		tabbutton.MouseButton1Down:Connect(function()
			RippleEffect(tabbutton)
			ButtonClick:Play()
			for i,v in pairs(tabcontainer:GetChildren()) do
				--v:TweenPosition(UDim2.new(0,0,1,0))
				game:GetService("TweenService"):Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0,0,1,0)}):Play()

			end
			wait(0.4)
			game:GetService("TweenService"):Create(tab1, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0,0,0,0)}):Play()
			--tab1:TweenPosition(UDim2.new(0,0,0,0))
		end)
		--local anotherlib = {}
		function lib:Button(text, callback)
			callback = callback or function() end
			local button = Instance.new("TextButton")

			button.Name = text
			button.Parent = tab1
			button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			button.BorderSizePixel = 0
			button.Size = UDim2.new(0, 86, 0, 28)
			button.AutoButtonColor = false
			button.Font = Enum.Font.Gotham
			button.Text = "  "..text
			button.ClipsDescendants = true
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.TextSize = 12.000
			button.TextXAlignment = Enum.TextXAlignment.Left
			button.MouseButton1Down:Connect(function()
				pcall(callback)
				RippleEffect(button)
				ButtonClick:Play()
			end)
		end
		return lib;
	end
	return funnylib2;
end
return LibraryItself;
