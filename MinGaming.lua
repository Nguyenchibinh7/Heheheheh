spawn(function()
     for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
         if v.Name == "Death" or v.Name == "Spawn" then
             v:Destroy()
         end
     end
 end)

spawn(function()
    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
            v.Enabled = false
        end
    end
end)

spawn(function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA('Texture') then
            v.Texture = ''
        elseif v:IsA('BasePart') and v.Material == Enum.Material.Water then
            v.Material = Enum.Material.SmoothPlastic
        end
    end
    
    for _, v in pairs(game.Players.LocalPlayer.PlayerScripts:GetDescendants()) do
        local v641_args = {
            'WaterBlur', 'WaterEffect', 'WaterColorCorrection', 
            'WaterCFrame', 'MirageFog'
        }
        if table.find(v641_args, v.Name) then
            v:Destroy()
        end
    end
end)

if not game:IsLoaded() then game.Loaded:Wait() end
local fask = task

if not LPH_OBFUSCATED then
	LPH_JIT_MAX = (function(...) return ... end)
	LPH_NO_VIRTUALIZE = (function(...) return ... end)
	LPH_NO_UPVALUES = (function(...) return ... end)
end

local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local tween = game:service"TweenService"
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local GuiService = game:GetService("GuiService")
local SoundClick2 = Instance.new("Sound")
SoundClick2.Name = "Sound Effect"
SoundClick2.SoundId = "rbxassetid://3398620867"
SoundClick2.Volume = 1
SoundClick2.Parent = game.Workspace
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local RobloxButton = Enum.ButtonStyle.RobloxButton
ScreenGui.Parent = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules")
ScreenGui.Name = "ChangFai"
ImageButton.Parent = ScreenGui
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 45, 0, 45)
ImageButton.Draggable = true
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BackgroundTransparency = 1
ImageButton.Image = "rbxassetid://111792405768331"
function LoadFunction()    
        ImageButton.MouseEnter:Connect(function()
        TweenService:Create(
            ImageButton,
            TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 80, 0, 80)}
        ):Play()
    end)
    ImageButton.MouseLeave:Connect(function()
        TweenService:Create(
            ImageButton,
            TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 50, 0, 50)}
        ):Play()
    end)
    
    local LoadFocus = false
    
    ImageButton.MouseButton1Down:Connect(function()
        if LoadFocus == false then 
            LoadFocus = false
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Rotation = 180}
            ):Play()
            SoundClick2:Play()
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                {ImageTransparency = 0}
            ):Play()
            wait(.5)
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Rotation = 0}
            ):Play()
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                {ImageTransparency = 0}
            ):Play()
            wait(.5)	
            
        end
    end)
end
    LoadFunction()
    ImageButton.MouseButton1Down:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
    end)
	function Vec(text)
		local Notification = require(game.ReplicatedStorage.Notification)
		local notification = Notification.new(text)
		notification.Duration = 4
		notification:Display()
	end
	local function tablefound(ta, object)
		for i,v in pairs(ta) do
			if v == object then
				return true
			end
		end
		return false
	end

local library = {}
local par = game.CoreGui
_G.ToggleUi = false

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService('RunService')
local camera = workspace.CurrentCamera
local DDX,DDY
local Mouse = game.Players.LocalPlayer:GetMouse()
local BlurFrameL = loadstring(game:HttpGet('https://raw.githubusercontent.com/aresZee7/aresLibrary/main/BlurFrame'))()

function dragify(Frame, object)
	local dragToggle = false
	local dragSpeed = 0.25
	local dragInput = nil
	local dragStart = nil
	local startPos = nil

	function updateInput(input)
		if not dragStart then
			return
		end
		local Delta = input.Position - dragStart
		if _G['ทำให้ UI ไม่ออก ขอบ'] then
			Delta = Vector2.new(math.clamp(startPos.X.Offset + Delta.X, -DDX, DDX), math.clamp(startPos.Y.Offset +  Delta.Y, -DDY, DDY))
			local Position = UDim2.new(startPos.X.Scale, Delta.X, startPos.Y.Scale, Delta.Y)
			TweenService:Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
		else
			Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
		end

	end

	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragToggle = true
			dragStart = input.Position
			startPos = object.Position
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

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
local MainDirectory = "Ares UI"
local AssetsDirectory = "Ares UI\\Assets"
local function CheckDirectory()
	if getgenv then
		if not isfolder(MainDirectory) then
			makefolder(MainDirectory)
		end
		if not isfolder(AssetsDirectory) then
			makefolder(AssetsDirectory)
		end
	end
end
local function GetImage(name, url)
	if getgenv then
		CheckDirectory()

		local path = string.format("%s\\%s.png", AssetsDirectory, name)
		if not isfile(path) then
			local content = game:HttpGet(url)
			writefile(path, content)
		end

		return getcustomasset(path)
	end
end

if par:FindFirstChild('Lux002') then
	par:FindFirstChild('Lux002'):Destroy()
end

local Lux002 = Instance.new("ScreenGui")
Lux002.Name = "Lux002"
Lux002.Parent = par
Lux002.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function library.Create(options)
	local Shadown = Instance.new("ImageLabel")
	Shadown.Name = "Shadown"
	Shadown.Parent = Lux002
	Shadown.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadown.BackgroundColor3 = Color3.fromRGB(28, 28, 25)
	Shadown.BackgroundTransparency = 1.000
	Shadown.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shadown.Size = UDim2.new(0, options.UISize.X, 0, options.UISize.Y) -- {0, 755},{0, 425} > PC 
	Shadown.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Shadown.ZIndex = 0
	Shadown.Image = "rbxassetid://7912134082"
	Shadown.ImageColor3 = options.UIColor['Shadow'] or Color3.fromRGB(28, 28, 25)
	Shadown.ImageTransparency = 0.300
	Shadown.SliceCenter = Rect.new(95, 95, 205, 205)

	local MainBackground = options.UIColor['MainBackground']
	local Background2 = options.UIColor['Background2']
	local ToggleOC = options.UIColor['ToggleO']
	local TapC = options.UIColor['TapButtonColor']
	local DropDownSelect = options.UIColor['DropDownSelect']
	local TextColorUI = options.UIColor['TextColor']

	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.Parent = Shadown
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
	Main.BackgroundTransparency = 0.300
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)

	local UICorner_24 = Instance.new("UICorner")
	UICorner_24.CornerRadius = UDim.new(0, options.CornerRadius)
	UICorner_24.Parent = Main

	local Loading = Instance.new("Frame")
	local UICorner_25 = Instance.new("UICorner")
	local LoadLogo = Instance.new("ImageLabel")
	local TextLabel_6 = Instance.new("TextLabel")

	Loading.Name = "Loading"
	Loading.Parent = Main
	Loading.AnchorPoint = Vector2.new(0.5, 0.5)
	Loading.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
	Loading.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Loading.BorderSizePixel = 0
	Loading.Position = UDim2.new(0.5, 0, 0.5, 0)
	Loading.Size = UDim2.new(1, 0, 1, 0)
	Loading.ZIndex = 9999
	Loading.Visible = false

	UICorner_25.CornerRadius = UDim.new(0, options.CornerRadius)
	UICorner_25.Parent = Loading

	LoadLogo.Name = "LoadLogo"
	LoadLogo.Parent = Loading
	LoadLogo.AnchorPoint = Vector2.new(0.5, 0.5)
	LoadLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadLogo.BackgroundTransparency = 1.000
	LoadLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadLogo.BorderSizePixel = 0
	LoadLogo.Position = UDim2.new(0.5, 0, 0.5, 0)
	LoadLogo.Size = UDim2.new(0, 70, 0, 70)
	LoadLogo.ZIndex = 2
	if type(options.Logo) == 'string' and not options.Logo:find('rbxassetid://') then
		LoadLogo.Image = "rbxassetid://".. options.Logo
	elseif type(options.Logo) == 'number' then
		LoadLogo.Image = "rbxassetid://".. options.Logo
	else
		LoadLogo.Image = options.Logo
	end

	TextLabel_6.Parent = Loading
	TextLabel_6.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_6.BackgroundTransparency = 1.000
	TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_6.BorderSizePixel = 0
	TextLabel_6.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel_6.Size = UDim2.new(0, 200, 0, 50)
	TextLabel_6.ZIndex = 2
	TextLabel_6.Font = Enum.Font.FredokaOne
	TextLabel_6.Text = "Welcome To Min Gaming Ugly"
	TextLabel_6.TextColor3 = Color3.fromRGB(189, 198, 212)
	TextLabel_6.TextSize = 14.000
	TextLabel_6.TextTransparency = 1.000

	local OP = false
	local function NNNF_fake_script()
		local script = Instance.new('LocalScript', Loading)

		local Type__ = 1
		delay(1, function()
			for i = 1,10 do
				script.Parent.Visible = true
				game:GetService("TweenService"):Create(
				script.Parent.LoadLogo,
				TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				{Rotation = 90 * i}
				):Play()
				if i >= 3 then
					game:GetService("TweenService"):Create(
					script.Parent.LoadLogo,
					TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Position = UDim2.new(0.5, 0, 0.5, -30)}
					):Play()
					delay(1, function()
						game:GetService("TweenService"):Create(
						script.Parent.TextLabel,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
						):Play()
						game:GetService("TweenService"):Create(
						script.Parent.TextLabel,
						TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Position = UDim2.new(0.5, 0, 0.5, 30)}
						):Play()
						if i == 10 then
							OP = true
						end
					end)
				end
				wait(.002)
			end
		end)
		repeat task.wait() until OP == true
		task.delay(1, function()
			game:GetService("TweenService"):Create(
			script.Parent,
			TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 0, 0, 0)}
			):Play()
			game:GetService("TweenService"):Create(
			script.Parent.TextLabel,
			TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
			{TextTransparency = 1}
			):Play()
			game:GetService("TweenService"):Create(
			script.Parent.LoadLogo,
			TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
			{ImageTransparency = 1}
			):Play()
		end)
	end
	coroutine.wrap(NNNF_fake_script)()
	repeat task.wait() until OP == true


	local Top = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	Top.Name = "Top"
	Top.Parent = Main
	Top.Active = true
	Top.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
	Top.BackgroundTransparency = 1.000
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Position = UDim2.new(0, 0, 0.0222222228, 0)
	Top.Size = UDim2.new(1, 0, 0.00999999978, 40)

	UICorner.CornerRadius = UDim.new(0, options.CornerRadius)
	UICorner.Parent = Top

	local frame,object = Top, Shadown
	local BlurFrame2 = BlurFrameL:BlurFrame(Main)
	if DDX == nil then DDX = object.AbsolutePosition.X end
	if DDY == nil then DDY = object.AbsolutePosition.Y end

	dragify(frame, object)

	local Cup = Instance.new("Frame")
	local NameHub = Instance.new("TextLabel")
	local LogoHub = Instance.new("ImageLabel")

	Cup.Name = "Cup"
	Cup.Parent = Top
	Cup.Active = true
	Cup.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
	Cup.BackgroundTransparency = 1.000
	Cup.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Cup.BorderSizePixel = 0
	Cup.Position = UDim2.new(0, 0, 0.467185766, 0)
	Cup.Size = UDim2.new(1, 0, -0.357063383, 40)

	NameHub.Name = "NameHub"
	NameHub.Parent = Top
	NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.BackgroundTransparency = 1.000
	NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NameHub.BorderSizePixel = 0
	NameHub.ClipsDescendants = true
	NameHub.Position = UDim2.new(0.0851851851, 0, 0, 0)
	NameHub.Size = UDim2.new(0.298148155, 0, 0.986308813, 0)
	NameHub.Text = options.Title
	NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.TextSize = 12.000
	NameHub.TextXAlignment = Enum.TextXAlignment.Left
	NameHub.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

	LogoHub.Name = "Logo Hub"
	LogoHub.Parent = Top
	LogoHub.AnchorPoint = Vector2.new(0.5, 0.5)
	LogoHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogoHub.BackgroundTransparency = 1.000
	LogoHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoHub.BorderSizePixel = 0
	LogoHub.Position = UDim2.new(0.053703703, 0, 0.499999881, 0)
	LogoHub.Size = UDim2.new(0, 15, 0, 15)
	if type(options.Logo) == 'string' and not options.Logo:find('rbxassetid://') then
		LogoHub.Image = "rbxassetid://".. options.Logo
	elseif type(options.Logo) == 'number' then
		LogoHub.Image = "rbxassetid://".. options.Logo
	else
		LogoHub.Image = options.Logo
	end

	local MainPage = Instance.new("Frame")
	MainPage.Name = "MainPage"
	MainPage.Parent = Main
	MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainPage.BackgroundTransparency = 4.000
	MainPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainPage.BorderSizePixel = 0
	MainPage.Position = UDim2.new(0.214814797, 0, 0.141666651, 0)
	MainPage.Size = UDim2.new(0.769999981, 0, 0.850000024, 0)

	local Tap = Instance.new("Frame")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIPadding = Instance.new("UIPadding")
	local UIListLayout = Instance.new("UIListLayout")

	Tap.Name = "Tap"
	Tap.Parent = Main
	Tap.AnchorPoint = Vector2.new(0, 0.5)
	Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tap.BackgroundTransparency = 1.000
	Tap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tap.BorderSizePixel = 0
	Tap.Position = UDim2.new(0.0129999798, 0, 0.5625, 0)
	Tap.Size = UDim2.new(0.200000003, 0, 0.834686875, 0)

	ScrollingFrame.Parent = Tap
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.ScrollBarImageTransparency = 0.800000011920929
	ScrollingFrame.ScrollBarThickness = 1

	UIPadding.Parent = ScrollingFrame
	UIPadding.PaddingLeft = UDim.new(0, 5)

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	local OpenUI = true
	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.RightControl then
			if OpenUI then
				OpenUI = false
				Shadown.Visible = false
				for i = 1,2 do
					BlurFrame2[i]:Destroy()
				end
			else
				OpenUI = true
				Shadown.Visible = true
				BlurFrame2 = BlurFrameL:BlurFrame(Main)
			end
		end
	end)

	if _G.ToggleUi then
		local CloseUI = Instance.new("ScreenGui")
		local CloseUIMain = Instance.new("Frame")
		local Logo = Instance.new("ImageLabel")
		local UICorner = Instance.new("UICorner")
		local Use = Instance.new("TextButton")

		CloseUI.Name = "CloseUI"
		CloseUI.Parent = par
		CloseUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		CloseUIMain.Name = "CloseUIMain"
		CloseUIMain.Parent = CloseUI
		CloseUIMain.BackgroundColor3 = MainBackground
		CloseUIMain.BorderColor3 = Color3.new(0, 0, 0)
		CloseUIMain.BorderSizePixel = 0
		CloseUIMain.Position = UDim2.new(0.0319926888, 0, 0.129, 0)
		CloseUIMain.Size = UDim2.new(0, 75, 0, 0)

		CloseUIMain:TweenSize(UDim2.new(0, 75, 0, 51),"Out","Back",3.5,false)

		Logo.Name = "Logo"
		Logo.Parent = CloseUIMain
		Logo.BackgroundColor3 = Color3.new(1, 1, 1)
		Logo.BackgroundTransparency = 1
		Logo.BorderColor3 = Color3.new(0, 0, 0)
		Logo.BorderSizePixel = 0
		Logo.Position = UDim2.new(0.323333323, 0, 0.235294119, 0)
		Logo.Size = UDim2.new(0.349999994, 0, 0.5, 0)
		if type(options.Logo) == 'string' and not options.Logo:find('rbxassetid://') then
			Logo.Image = "rbxassetid://".. options.Logo
		elseif type(options.Logo) == 'number' then
			Logo.Image = "rbxassetid://".. options.Logo
		else
			Logo.Image = options.Logo
		end


		UICorner.Parent = CloseUIMain
		UICorner.CornerRadius = UDim.new(0, 100)

		Use.Name = "Use"
		Use.Parent = CloseUIMain
		Use.BackgroundColor3 = Color3.new(1, 1, 1)
		Use.BackgroundTransparency = 1
		Use.BorderColor3 = Color3.new(0, 0, 0)
		Use.BorderSizePixel = 0
		Use.Size = UDim2.new(1, 0, 1, 0)
		Use.Font = Enum.Font.SourceSans
		Use.Text = ""
		Use.TextColor3 = Color3.new(0, 0, 0)
		Use.TextSize = 14

		Use.MouseButton1Click:Connect(function()
			if OpenUI then
				OpenUI = false
				Shadown.Visible = false
				for i = 1,2 do
					BlurFrame2[i]:Destroy()
				end
			else
				OpenUI = true
				Shadown.Visible = true
				BlurFrame2 = BlurFrameL:BlurFrame(Main)
			end
		end)
	end

	library.TapGroup = {
		Value = false
	}
	library.TapGroup.CreateTap = function(options)
		local TapTitle = options.Title or ""
		local TapIcon = options.Icon or ""

		local ButtonTap = Instance.new("TextButton")
		local UICorner_2 = Instance.new("UICorner")
		local ImageLabel = Instance.new("ImageLabel")
		local TextLabel = Instance.new("TextLabel")

		ButtonTap.Name = "ButtonTap"
		ButtonTap.Parent = ScrollingFrame
		ButtonTap.BackgroundColor3 = Color3.fromRGB(161, 155, 76)
		ButtonTap.BackgroundTransparency = 1.000
		ButtonTap.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ButtonTap.BorderSizePixel = 0
		ButtonTap.Position = UDim2.new(0, 0, 3.58570489e-08, 0)
		ButtonTap.Size = UDim2.new(0.949999988, 0, 0, 29)
		ButtonTap.Font = Enum.Font.SourceSans
		ButtonTap.Text = ""
		ButtonTap.TextColor3 = Color3.fromRGB(0, 0, 0)
		ButtonTap.TextSize = 14.000

		UICorner_2.CornerRadius = UDim.new(0, 5)
		UICorner_2.Parent = ButtonTap

		ImageLabel.Parent = ButtonTap
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Position = UDim2.new(0.172968701, 0, 0.5, 0)
		ImageLabel.Size = UDim2.new(0, 15, 0, 15)
		if type(TapIcon) == 'string' and not TapIcon:find('rbxassetid://') then
			ImageLabel.Image = "rbxassetid://".. TapIcon
		elseif type(TapIcon) == 'number' then
			ImageLabel.Image = "rbxassetid://".. TapIcon
		else
			ImageLabel.Image = TapIcon
		end
		ImageLabel.ImageColor3 = TapC

		TextLabel.Parent = ButtonTap
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Text = TapTitle
		TextLabel.TextColor3 = TapC
		TextLabel.TextSize = 11.000
		TextLabel.TextStrokeTransparency = 0.900
		TextLabel.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

		local Page = Instance.new("Frame")
		local LeftMain = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding_2 = Instance.new("UIPadding")

		Page.Name = "Page"
		Page.Parent = MainPage
		Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Page.BackgroundTransparency = 1.000
		Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Page.BorderSizePixel = 0
		Page.Visible = false
		Page.Size = UDim2.new(1, 0, 1, 0)

		LeftMain.Name = "LeftMain"
		LeftMain.Parent = Page
		LeftMain.Active = true
		LeftMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LeftMain.BackgroundTransparency = 1.000
		LeftMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LeftMain.BorderSizePixel = 0
		LeftMain.Position = UDim2.new(7.19754212e-08, 0, 0, 0)
		LeftMain.Size = UDim2.new(0.473118305, 0, 1, 0)
		LeftMain.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		LeftMain.ScrollBarThickness = 0

		UIListLayout_2.Parent = LeftMain
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

		UIPadding_2.Parent = LeftMain

		local RightMain = Instance.new("ScrollingFrame")
		local UIListLayout_5 = Instance.new("UIListLayout")
		local UIPadding_5 = Instance.new("UIPadding")
		RightMain.Name = "RightMain"
		RightMain.Parent = Page
		RightMain.Active = true
		RightMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		RightMain.BackgroundTransparency = 1.000
		RightMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
		RightMain.BorderSizePixel = 0
		RightMain.Position = UDim2.new(0.489209443, 0, 0, 0)
		RightMain.Size = UDim2.new(0.473118037, 0, 1, 0)
		RightMain.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		RightMain.ScrollBarThickness = 0

		UIListLayout_5.Parent = RightMain
		UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_5.Padding = UDim.new(0, 5)

		UIPadding_5.Parent = RightMain

		UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			LeftMain.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 35)
		end)
		UIListLayout_5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			RightMain.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 35)
		end)

		ButtonTap.MouseButton1Click:Connect(function()
			for _, v in pairs(MainPage:GetChildren()) do
				if v:IsA("Frame") then
					v.Visible = false
				end
			end
			for _, v in pairs(ScrollingFrame:GetChildren()) do
				if v:IsA("TextButton") then
					TweenService:Create(
						v.TextLabel,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{TextColor3 = TapC}
					):Play()
					TweenService:Create(
						v.ImageLabel,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{ImageColor3 = TapC}
					):Play()
				end
			end
			Page.Visible = true
			TweenService:Create(
				TextLabel,
				TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(255, 255, 255)}
			):Play()
			TweenService:Create(
				ImageLabel,
				TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(255, 255, 255)}
			):Play()
			print("Next Tap")
		end)

		delay(1,function() 
			if not library.TapGroup.Value then 
				Page.Visible = true
				library.TapGroup.Value = true 
				TweenService:Create(
					TextLabel,
					TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(255, 255, 255)}
				):Play()
				TweenService:Create(
					ImageLabel,
					TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
					{ImageColor3 = Color3.fromRGB(255, 255, 255)}
				):Play()
			end 
		end)

		local GetType = function(value)
			if value == 1 or value == "Left" then
				return LeftMain
			elseif value == 2 or value == "Right" then
				return RightMain
			else
				return LeftMain
			end
		end

		library.Sections = {}
		library.Sections.CreatePage = function(options)
			local Sections = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local UIListLayout_3 = Instance.new("UIListLayout")
			local UIPadding_3 = Instance.new("UIPadding")

			Sections.Name = "Sections"
			Sections.Parent = GetType(options.Side)
			Sections.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
			Sections.BackgroundTransparency = 0.500
			Sections.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Sections.BorderSizePixel = 0
			Sections.Position = UDim2.new(0, 0, -0.50857532, 0)
			Sections.Size = UDim2.new(1.00000012, 0, 0.562308431, 100)

			UICorner_3.Parent = Sections

			UIListLayout_3.Parent = Sections
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3.Padding = UDim.new(0, 5)

			UIPadding_3.Parent = Sections
			UIPadding_3.PaddingLeft = UDim.new(0, 5)
			UIPadding_3.PaddingTop = UDim.new(0, 5)

			UIListLayout_3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Sections.Size = UDim2.new(1, 0, 0, UIListLayout_3.AbsoluteContentSize.Y + 35)
			end)

			library.FuncMain = {}
			library.FuncMain.CreateLable = function(options)
				local Lable = Instance.new("Frame")
				local UICorner_4 = Instance.new("UICorner")
				local TextLabel_2 = Instance.new("TextLabel")

				Lable.Name = "Lable"
				Lable.Parent = Sections
				Lable.BackgroundColor3 = Background2
				Lable.BackgroundTransparency = 0.600
				Lable.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Lable.BorderSizePixel = 0
				Lable.Size = UDim2.new(0.949999988, 0, 0, 30)

				UICorner_4.CornerRadius = UDim.new(0, 2)
				UICorner_4.Parent = Lable

				TextLabel_2.Parent = Lable
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_2.BorderSizePixel = 0
				TextLabel_2.Position = UDim2.new(0.0441415086, 0, 0, 0)
				TextLabel_2.Size = UDim2.new(0.955858469, 0, 1, 0)
				TextLabel_2.Text = options.Name
				TextLabel_2.TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)
				TextLabel_2.TextSize = 12.000
				TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

				local TextTable = {}
				function TextTable:Set(Value)
					TextLabel_2.Text = Value
				end;function TextTable:SetColor(Color)
					TextLabel_2.TextColor3 = Color or TextColorUI or Color3.fromRGB(255, 255, 255)
				end

				return TextTable
			end
			library.FuncMain.CreateToggle = function(options, Lock)
				local ToggleTable = {}
				local Name = options.Name;wait()
				local default = options.Value
				local Dis = options.Dis
				local callback = options.Callback or function() end
				local ToggleTable = {}
				local Lock = Lock or false

				local Toggle = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local TitleText = Instance.new("TextLabel")
				local TitleDis = Instance.new("TextLabel")
				local ToggleO = Instance.new("Frame")
				local O = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local UICorner_3 = Instance.new("UICorner")
				local TextButton = Instance.new("TextButton")
				local LockToggle = Instance.new("Frame")
				local ToggleLocker = Instance.new("ImageLabel")
				local UICorner_4 = Instance.new("UICorner")

				Toggle.Name = "Toggle"
				Toggle.Parent = Sections
				Toggle.BackgroundColor3 = Background2
				Toggle.BackgroundTransparency = 0.600
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.Size = UDim2.new(0.949999988, 0, 0, 40)

				UICorner.CornerRadius = UDim.new(0, 2)
				UICorner.Parent = Toggle

				TitleText.Name = "TitleText"
				TitleText.Parent = Toggle
				TitleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TitleText.BackgroundTransparency = 1.000
				TitleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TitleText.BorderSizePixel = 0
				TitleText.Position = UDim2.new(0.0441415198, 0, 0, 0)
				TitleText.Size = UDim2.new(0.955858588, 0, 0.374999851, 0)
				TitleText.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				TitleText.Text = Name
				TitleText.TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)
				TitleText.TextSize = 12.000
				TitleText.TextXAlignment = Enum.TextXAlignment.Left

				if Dis ~= nil and Dis ~= "" then
					TitleDis.Name = "TitleDis"
					TitleDis.Parent = Toggle
					TitleDis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TitleDis.BackgroundTransparency = 1.000
					TitleDis.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TitleDis.BorderSizePixel = 0
					TitleDis.ClipsDescendants = true
					TitleDis.Position = UDim2.new(0.0439999998, 0, 0.449999988, 0)
					TitleDis.Size = UDim2.new(0.728003502, 0, 0.5, 0)
					TitleDis.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
					TitleDis.Text = Dis
					TitleDis.TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)
					TitleDis.TextSize = 10.000
					TitleDis.TextWrapped = true
					TitleDis.TextXAlignment = Enum.TextXAlignment.Left
					TitleDis.TextYAlignment = Enum.TextYAlignment.Top
				end
				if Dis == nil or  Dis == "" then
					TitleText.Text = Name
					TitleText.AnchorPoint = Vector2.new(0, 0.5)
					TitleText.Position = UDim2.new(0.0441415198, 0, .5, 0)
					Toggle.Size = UDim2.new(0.949999988, 0, 0, 30)
					print(Name)
				end

				ToggleO.Name = "ToggleO"
				ToggleO.Parent = Toggle
				ToggleO.AnchorPoint = Vector2.new(0.5, 0.5)
				ToggleO.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
				ToggleO.BackgroundTransparency = 0.200
				ToggleO.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ToggleO.BorderSizePixel = 0
				ToggleO.Position = UDim2.new(0.855000019, 0, 0.5, 0)
				ToggleO.Size = UDim2.new(0, 35, 0, 15)

				O.Name = "O"
				O.Parent = ToggleO
				O.AnchorPoint = Vector2.new(0, 0.5)
				O.BackgroundColor3 = Background2
				O.BorderColor3 = Color3.fromRGB(0, 0, 0)
				O.BorderSizePixel = 0
				O.Position = UDim2.new(0.1, 0, 0.5, 0)
				O.Size = UDim2.new(0, 10, 0, 10)

				UICorner_2.CornerRadius = UDim.new(1, 0)
				UICorner_2.Parent = O

				UICorner_3.Parent = ToggleO

				TextButton.Parent = Toggle
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.BorderSizePixel = 0
				TextButton.Size = UDim2.new(1, 0, 1, 0)
				TextButton.Font = Enum.Font.SourceSans
				TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.TextSize = 14.000
				TextButton.TextTransparency = 1.000

				LockToggle.Name = "LockToggle"
				LockToggle.Parent = Toggle
				LockToggle.BackgroundColor3 = Background2
				LockToggle.BackgroundTransparency = 0.500
				LockToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				LockToggle.BorderSizePixel = 0
				LockToggle.Size = UDim2.new(1, 0, 1, 0)
				LockToggle.Visible = false

				ToggleLocker.Name = "ToggleLocker"
				ToggleLocker.Parent = LockToggle
				ToggleLocker.AnchorPoint = Vector2.new(0.5, 0.5)
				ToggleLocker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleLocker.BackgroundTransparency = 1.000
				ToggleLocker.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ToggleLocker.BorderSizePixel = 0
				ToggleLocker.Position = UDim2.new(0.5, 0, 0.5, 0)
				ToggleLocker.Size = UDim2.new(0, 20, 0, 20)
				ToggleLocker.Image = "http://www.roblox.com/asset/?id=6031082533"

				UICorner_4.CornerRadius = UDim.new(0, 2)
				UICorner_4.Parent = LockToggle

				if default == true then
					callback(default)
					TweenService:Create(
						TitleText,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(198, 200, 209)}
					):Play()
					TweenService:Create(
						TitleDis,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(198, 200, 209)}
					):Play()
					TweenService:Create(
						O,
						TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{Position = UDim2.new(0.6, 0, 0.5, 0)}
					):Play()
					TweenService:Create(
						O,
						TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{BackgroundColor3 = Background2}
					):Play()
				end

				TextButton.MouseButton1Click:Connect(function()
					if not Lock then
						if not default then
							default = true
							TweenService:Create(
								TitleText,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(198, 200, 209)}
							):Play()
							TweenService:Create(
								TitleDis,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(198, 200, 209)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{Position = UDim2.new(0.6, 0, 0.5, 0)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = ToggleOC}
							):Play()
						else
							default = false
							TweenService:Create(
								TitleText,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)}
							):Play()
							TweenService:Create(
								TitleDis,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{Position = UDim2.new(0.1, 0, 0.5, 0)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = Background2}
							):Play()
						end 
						callback(default)
					end
				end)

				function ToggleTable:Update(Value)
					if not Lock then
						if not Value then
							default = true
							TweenService:Create(
								TitleText,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(198, 200, 209)}
							):Play()
							TweenService:Create(
								TitleDis,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(198, 200, 209)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{Position = UDim2.new(0.6, 0, 0.5, 0)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(61, 65, 91)}
							):Play()
						else
							default = false
							TweenService:Create(
								TitleText,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)}
							):Play()
							TweenService:Create(
								TitleDis,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{Position = UDim2.new(0.1, 0, 0.5, 0)}
							):Play()
							TweenService:Create(
								O,
								TweenInfo.new(0.9,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = Background2}
							):Play()
						end 
						callback(default)
					end
				end
				function ToggleTable:UnLocker()
					Lock = false
					LockToggle.Visible = false
				end
				function ToggleTable:Locker()
					Lock = true
					LockToggle.Visible = true
				end
				function ToggleTable:UpdateNameText(Value)
					TitleText.Text = Value
				end
				function ToggleTable:UpdateDis(Value)
					TitleDis.Text = Value
				end
				return ToggleTable
			end
			library.FuncMain.CreateButton = function(options)
				local Name = options.Name or "Button";wait()
				local callback = options.Callback or function() end

				local Button = Instance.new("Frame")
				local UICorner_8 = Instance.new("UICorner")
				local TextLabel_3 = Instance.new("TextLabel")
				local TextButton_2 = Instance.new("TextButton")
				local ImageLabel_2 = Instance.new("ImageLabel")

				Button.Name = "Button"
				Button.Parent = Sections
				Button.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0, 0, 0.270586133, 0)
				Button.Size = UDim2.new(0.949999988, 0, 0, 25)

				UICorner_8.CornerRadius = UDim.new(0, 2)
				UICorner_8.Parent = Button

				TextLabel_3.Parent = Button
				TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_3.BackgroundTransparency = 1.000
				TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_3.BorderSizePixel = 0
				TextLabel_3.Position = UDim2.new(0.0439998619, 0, 0, 0)
				TextLabel_3.Size = UDim2.new(0.956000149, 0, 1, 0)
				TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				TextLabel_3.Text = Name
				TextLabel_3.TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)
				TextLabel_3.TextSize = 12.000
				TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

				TextButton_2.Parent = Button
				TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_2.BackgroundTransparency = 1.000
				TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_2.BorderSizePixel = 0
				TextButton_2.Size = UDim2.new(1, 0, 1, 0)
				TextButton_2.Font = Enum.Font.SourceSans
				TextButton_2.Text = ""
				TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_2.TextSize = 14.000

				ImageLabel_2.Parent = Button
				ImageLabel_2.AnchorPoint = Vector2.new(0, 0.5)
				ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel_2.BackgroundTransparency = 1.000
				ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel_2.BorderSizePixel = 0
				ImageLabel_2.Position = UDim2.new(0.868354499, 0, 0.5, 0)
				ImageLabel_2.Size = UDim2.new(0, 15, 0, 15)
				ImageLabel_2.Image = "http://www.roblox.com/asset/?id=6031094687"
				ImageLabel_2.ImageColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)

				TextButton_2.MouseButton1Click:Connect(function()
					TextLabel_3.TextSize = 0
					TweenService:Create(
						TextLabel_3,
						TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
						{TextSize = 12.00}
					):Play()
					callback()
				end)
			end
			library.FuncMain.CreateDropdown = function(options)
				local text = options.Name;wait()
				local default = options.Value or ""
				local list = options.List
				local callback = options.Callback

				local Dropdown = Instance.new("Frame")
				local UICorner_9 = Instance.new("UICorner")
				local Main1 = Instance.new("Frame")
				local TextLabel_4 = Instance.new("TextLabel")
				local ImageButton = Instance.new("ImageButton")
				local ImageLabel_3 = Instance.new("ImageLabel")
				local Main2 = Instance.new("Frame")
				local ScrollingFrame_2 = Instance.new("ScrollingFrame")
				local UIListLayout_4 = Instance.new("UIListLayout")
				local UIPadding_4 = Instance.new("UIPadding")


				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Sections
				Dropdown.BackgroundColor3 = Background2
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.ClipsDescendants = true
				Dropdown.Position = UDim2.new(0, 0, 0.236475766, 0)
				Dropdown.Size = UDim2.new(0.949999988, 0, 0, 30)

				UICorner_9.CornerRadius = UDim.new(0, 2)
				UICorner_9.Parent = Dropdown

				Main1.Name = "Main1"
				Main1.Parent = Dropdown
				Main1.BackgroundColor3 = Background2
				Main1.BackgroundTransparency = 0.600
				Main1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main1.BorderSizePixel = 0
				Main1.Size = UDim2.new(1, 0, 0, 27)

				TextLabel_4.Parent = Main1
				TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.BackgroundTransparency = 1.000
				TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_4.BorderSizePixel = 0
				TextLabel_4.Size = UDim2.new(1, 0, 1, 0)
				TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				TextLabel_4.Text = text.." (".. default ..")"
				TextLabel_4.TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)
				TextLabel_4.TextSize = 11.000

				ImageButton.Parent = Main1
				ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageButton.BackgroundTransparency = 1.000
				ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageButton.BorderSizePixel = 0
				ImageButton.Size = UDim2.new(1, 0, 1, 0)
				ImageButton.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
				ImageButton.ImageTransparency = 1.000

				ImageLabel_3.Parent = Main1
				ImageLabel_3.AnchorPoint = Vector2.new(0, 0.5)
				ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel_3.BackgroundTransparency = 1.000
				ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel_3.BorderSizePixel = 0
				ImageLabel_3.Position = UDim2.new(0.868354499, 0, 0.5, 0)
				ImageLabel_3.Size = UDim2.new(0, 15, 0, 15)
				ImageLabel_3.Image = "http://www.roblox.com/asset/?id=6031094687"
				ImageLabel_3.ImageColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)

				Main2.Name = "Main2"
				Main2.Parent = Dropdown
				Main2.BackgroundColor3 = Background2
				Main2.BackgroundTransparency = 0.600
				Main2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main2.BorderSizePixel = 0
				Main2.Position = UDim2.new(0, 0, 0, 30)
				Main2.Size = UDim2.new(1, 0, 0, 92)

				ScrollingFrame_2.Parent = Main2
				ScrollingFrame_2.Active = true
				ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingFrame_2.BackgroundTransparency = 1.000
				ScrollingFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame_2.BorderSizePixel = 0
				ScrollingFrame_2.Size = UDim2.new(1, 0, 1, 0)
				ScrollingFrame_2.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame_2.ScrollBarThickness = 1

				UIListLayout_4.Parent = ScrollingFrame_2
				UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

				UIPadding_4.Parent = ScrollingFrame_2
				UIPadding_4.PaddingLeft = UDim.new(0, 5)
				UIPadding_4.PaddingTop = UDim.new(0, 5)

				local DropF = {}
				local DropG = true
				function DropF:Clear()
					for i, v in next, ScrollingFrame_2:GetChildren() do
						if v:IsA("Frame") then 
							v:Destroy()
						end
					end
				end

				TextLabel_4.Text = text.." (".. 'nil' ..")"
				function DropF:Add(Text)
					local Button_2 = Instance.new("Frame")
					local UICorner_10 = Instance.new("UICorner")
					local TextButton_3 = Instance.new("TextButton")
					local TextLabel_5 = Instance.new("TextLabel")

					Button_2.Name = "Button"
					Button_2.Parent = ScrollingFrame_2
					Button_2.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
					Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Button_2.BorderSizePixel = 0
					Button_2.Position = UDim2.new(0, 0, 0.270586133, 0)
					Button_2.Size = UDim2.new(0.949999988, 0, 0, 25)

					UICorner_10.CornerRadius = UDim.new(0, 2)
					UICorner_10.Parent = Button_2

					TextButton_3.Parent = Button_2
					TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton_3.BackgroundTransparency = 1.000
					TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextButton_3.BorderSizePixel = 0
					TextButton_3.Size = UDim2.new(1, 0, 1, 0)
					TextButton_3.Font = Enum.Font.SourceSans
					TextButton_3.Text = ""
					TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
					TextButton_3.TextSize = 14.000

					TextLabel_5.Parent = Button_2
					TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.BackgroundTransparency = 1.000
					TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel_5.BorderSizePixel = 0
					TextLabel_5.Size = UDim2.new(1, 0, 1, 0)
					TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
					TextLabel_5.Text = Text
					TextLabel_5.TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)
					TextLabel_5.TextSize = 12.000

					if TextLabel_5.Text == default then
						for i, v in next, ScrollingFrame_2:GetChildren() do
							if v:IsA("Frame") then 
								TweenService:Create(
									v,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)}
								):Play()
								TweenService:Create(
									v.TextLabel,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{TextColor3 = Color3.fromRGB(213, 213, 213)}
								):Play()
							end
						end
						TweenService:Create(
							Button_2,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{BackgroundColor3 = DropDownSelect or Color3.fromRGB(61, 65, 90)}
						):Play()
						TweenService:Create(
							TextLabel_5,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255,255,255)}
						):Play()
						TextLabel_4.Text = text.." (".. Text ..")"
						callback(default)
					end

					TextButton_3.MouseButton1Click:Connect(function()
						for i, v in next, ScrollingFrame_2:GetChildren() do
							if v:IsA("Frame") then 
								TweenService:Create(
									v,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)}
								):Play()
								TweenService:Create(
									v.TextLabel,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{TextColor3 = Color3.fromRGB(213, 213, 213)}
								):Play()
							end
						end
						TweenService:Create(
							Button_2,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{BackgroundColor3 = DropDownSelect or Color3.fromRGB(61, 65, 90)}
						):Play()
						TweenService:Create(
							TextLabel_5,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255,255,255)}
						):Play()
						TextLabel_4.Text = text.." (".. Text ..")"
						callback(Text)
					end)
				end
				UIListLayout_4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y + 35)
				end)

				ImageButton.MouseButton1Click:Connect(function()
					if not DropG then
						DropG = true
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{Size = UDim2.new(0.949999988, 0, 0, 30)}
						):Play()
					else
						DropG = false
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{Size = UDim2.new(0.949999988, 0, 0, 130)}
						):Play()
					end
				end)

				for _, v in next,list do
					DropF:Add(v)
				end

				return DropF
			end
			library.FuncMain.CreateMultiDropdown = function(options)
				local text = options.Name;wait()
				local default = options.Value or {""}
				local list = options.List
				local callback = options.Callback

				local Dropdown = Instance.new("Frame")
				local UICorner_9 = Instance.new("UICorner")
				local Main1 = Instance.new("Frame")
				local TextLabel_4 = Instance.new("TextLabel")
				local ImageButton = Instance.new("ImageButton")
				local ImageLabel_3 = Instance.new("ImageLabel")
				local Main2 = Instance.new("Frame")
				local ScrollingFrame_2 = Instance.new("ScrollingFrame")
				local UIListLayout_4 = Instance.new("UIListLayout")
				local UIPadding_4 = Instance.new("UIPadding")
				local DropFF = default

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Sections
				Dropdown.BackgroundColor3 = Background2
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.ClipsDescendants = true
				Dropdown.Position = UDim2.new(0, 0, 0.236475766, 0)
				Dropdown.Size = UDim2.new(0.949999988, 0, 0, 30)

				UICorner_9.CornerRadius = UDim.new(0, 2)
				UICorner_9.Parent = Dropdown

				Main1.Name = "Main1"
				Main1.Parent = Dropdown
				Main1.BackgroundColor3 = Background2
				Main1.BackgroundTransparency = 0.600
				Main1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main1.BorderSizePixel = 0
				Main1.Size = UDim2.new(1, 0, 0, 27)

				TextLabel_4.Parent = Main1
				TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.BackgroundTransparency = 1.000
				TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_4.BorderSizePixel = 0
				TextLabel_4.Size = UDim2.new(1, 0, 1, 0)
				TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				TextLabel_4.TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)
				TextLabel_4.TextSize = 11.000

				local function UpdateTextLabel()
					local maxDisplayCount = 3
					local textLabel_7_text = text .. " ("
					if #DropFF > maxDisplayCount then
						textLabel_7_text = textLabel_7_text .. table.concat(DropFF, ", ", 1, maxDisplayCount) .. ", ..."
					else
						textLabel_7_text = textLabel_7_text .. table.concat(DropFF, ", ")
					end
					textLabel_7_text = textLabel_7_text .. ")"
					TextLabel_4.Text = textLabel_7_text
				end;UpdateTextLabel()

				ImageButton.Parent = Main1
				ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageButton.BackgroundTransparency = 1.000
				ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageButton.BorderSizePixel = 0
				ImageButton.Size = UDim2.new(1, 0, 1, 0)
				ImageButton.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
				ImageButton.ImageTransparency = 1.000

				ImageLabel_3.Parent = Main1
				ImageLabel_3.AnchorPoint = Vector2.new(0, 0.5)
				ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel_3.BackgroundTransparency = 1.000
				ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel_3.BorderSizePixel = 0
				ImageLabel_3.Position = UDim2.new(0.868354499, 0, 0.5, 0)
				ImageLabel_3.Size = UDim2.new(0, 15, 0, 15)
				ImageLabel_3.Image = "http://www.roblox.com/asset/?id=6031094687"
				ImageLabel_3.ImageColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)

				Main2.Name = "Main2"
				Main2.Parent = Dropdown
				Main2.BackgroundColor3 = Background2
				Main2.BackgroundTransparency = 0.600
				Main2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main2.BorderSizePixel = 0
				Main2.Position = UDim2.new(0, 0, 0, 30)
				Main2.Size = UDim2.new(1, 0, 0, 92)

				ScrollingFrame_2.Parent = Main2
				ScrollingFrame_2.Active = true
				ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingFrame_2.BackgroundTransparency = 1.000
				ScrollingFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame_2.BorderSizePixel = 0
				ScrollingFrame_2.Size = UDim2.new(1, 0, 1, 0)
				ScrollingFrame_2.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame_2.ScrollBarThickness = 1

				UIListLayout_4.Parent = ScrollingFrame_2
				UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

				UIPadding_4.Parent = ScrollingFrame_2
				UIPadding_4.PaddingLeft = UDim.new(0, 5)
				UIPadding_4.PaddingTop = UDim.new(0, 5)

				local DropF = {}
				local DropG = true
				function DropF:Clear()
					for i, v in next, ScrollingFrame_2:GetChildren() do
						if v:IsA("Frame") then 
							v:Destroy()
						end
					end
				end

				TextLabel_4.Text = text.." (".. 'nil' ..")"
				function DropF:Add(Text)
					local Button_2 = Instance.new("Frame")
					local UICorner_10 = Instance.new("UICorner")
					local TextButton_3 = Instance.new("TextButton")
					local TextLabel_5 = Instance.new("TextLabel")

					Button_2.Name = "Button"
					Button_2.Parent = ScrollingFrame_2
					Button_2.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
					Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Button_2.BorderSizePixel = 0
					Button_2.Position = UDim2.new(0, 0, 0.270586133, 0)
					Button_2.Size = UDim2.new(0.949999988, 0, 0, 25)

					UICorner_10.CornerRadius = UDim.new(0, 2)
					UICorner_10.Parent = Button_2

					TextButton_3.Parent = Button_2
					TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton_3.BackgroundTransparency = 1.000
					TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextButton_3.BorderSizePixel = 0
					TextButton_3.Size = UDim2.new(1, 0, 1, 0)
					TextButton_3.Font = Enum.Font.SourceSans
					TextButton_3.Text = ""
					TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
					TextButton_3.TextSize = 14.000

					TextLabel_5.Parent = Button_2
					TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.BackgroundTransparency = 1.000
					TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel_5.BorderSizePixel = 0
					TextLabel_5.Size = UDim2.new(1, 0, 1, 0)
					TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
					TextLabel_5.Text = Text
					TextLabel_5.TextColor3 = TextColorUI or Color3.fromRGB(255, 255, 255)
					TextLabel_5.TextSize = 12.000

					if table.find(DropFF, TextLabel_5.Text) then
						for i, v in next, ScrollingFrame_2:GetChildren() do
							if v:IsA("Frame") then 
								TweenService:Create(
									v,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)}
								):Play()
								TweenService:Create(
									v.TextLabel,
									TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
									{TextColor3 = Color3.fromRGB(213, 213, 213)}
								):Play()
							end
						end
						TweenService:Create(
							Button_2,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{BackgroundColor3 = DropDownSelect or Color3.fromRGB(61, 65, 90)}
						):Play()
						TweenService:Create(
							TextLabel_5,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255,255,255)}
						):Play()
						TextLabel_4.Text = text.." (".. Text ..")"
						callback(default)
					end

					TextButton_3.MouseButton1Click:Connect(function()
						if not table.find(DropFF, Text) then
							table.insert(DropFF, Text)
							callback(DropFF, Text)
							UpdateTextLabel()

							TweenService:Create(
								Button_2,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = DropDownSelect or Color3.fromRGB(61, 65, 90)}
							):Play()
							TweenService:Create(
								TextLabel_5,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
						else
							TweenService:Create(
								Button_2,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)}
							):Play()
							TweenService:Create(
								TextLabel_5,
								TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(213, 213, 213)}
							):Play()
							for i2, v2 in ipairs(DropFF) do
								if v2 == Text then
									table.remove(DropFF, i2)
									callback(DropFF, Text)
									UpdateTextLabel()
									break
								end
							end
						end
					end)
				end
				UIListLayout_4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y + 35)
				end)

				ImageButton.MouseButton1Click:Connect(function()
					if not DropG then
						DropG = true
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{Size = UDim2.new(0.949999988, 0, 0, 30)}
						):Play()
					else
						DropG = false
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
							{Size = UDim2.new(0.949999988, 0, 0, 130)}
						):Play()
					end
				end)

				for _, v in next,list do
					DropF:Add(v)
				end

				callback(DropFF)
				return DropF
			end
			function library.FuncMain.CreateColorpicker(options)
				local Colorpicker = Instance.new("Frame")
				local UICorner_11 = Instance.new("UICorner")
				local ColorpickerTitel = Instance.new("TextLabel")
				local NowColor = Instance.new("Frame")
				local UICorner_12 = Instance.new("UICorner")
				local ColorSelection = Instance.new("Frame")
				local Color = Instance.new("ImageLabel")
				local ColorSelection_2 = Instance.new("ImageLabel")
				local Hue = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner_13 = Instance.new("UICorner")
				local HueSelection = Instance.new("ImageLabel")
				local UICorner_14 = Instance.new("UICorner")
				local ColorpickerButton = Instance.new("TextButton")

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = Sections
				Colorpicker.BackgroundColor3 = Background2
				Colorpicker.BackgroundTransparency = 0.600
				Colorpicker.BorderColor3 = Color3.fromRGB(153, 153, 153)
				Colorpicker.BorderSizePixel = 0
				Colorpicker.Position = UDim2.new(0, 0, 0.553602278, 0)
				Colorpicker.Size = UDim2.new(0.950000107, 0, 0.00862091407, 27)
				Colorpicker.ZIndex = 2

				UICorner_11.CornerRadius = UDim.new(0, 2)
				UICorner_11.Parent = Colorpicker

				ColorpickerTitel.Name = "ColorpickerTitel"
				ColorpickerTitel.Parent = Colorpicker
				ColorpickerTitel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitel.BackgroundTransparency = 1.000
				ColorpickerTitel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ColorpickerTitel.BorderSizePixel = 0
				ColorpickerTitel.Position = UDim2.new(0.0294061638, 0, 0, 0)
				ColorpickerTitel.Size = UDim2.new(0.808290184, 0, 1, 0)
				ColorpickerTitel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				ColorpickerTitel.Text = options.Title
				ColorpickerTitel.TextColor3 = TextColorUI
				ColorpickerTitel.TextSize = 12.000
				ColorpickerTitel.TextXAlignment = Enum.TextXAlignment.Left

				NowColor.Name = "NowColor"
				NowColor.Parent = Colorpicker
				NowColor.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
				NowColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
				NowColor.BorderSizePixel = 0
				NowColor.Position = UDim2.new(0.779999971, 0, 0.159999996, 0)
				NowColor.Size = UDim2.new(0, 31, 0, 16)

				UICorner_12.CornerRadius = UDim.new(0, 2)
				UICorner_12.Parent = NowColor

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Colorpicker
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
				ColorSelection.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ColorSelection.BorderSizePixel = 0
				ColorSelection.Position = UDim2.new(0.50000006, 0, 1.67629671, 0)
				ColorSelection.Size = UDim2.new(0, 137, 0, 106)
				ColorSelection.Visible = false
				ColorSelection.ZIndex = 2

				Color.Name = "Color"
				Color.Parent = ColorSelection
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
				Color.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Color.BorderSizePixel = 0
				Color.Position = UDim2.new(0.0656934306, 0, 0.148202568, 0)
				Color.Size = UDim2.new(0, 77, 0, 79)
				Color.ZIndex = 3
				Color.Image = "rbxassetid://4155801252"

				ColorSelection_2.Name = "ColorSelection"
				ColorSelection_2.Parent = Color
				ColorSelection_2.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection_2.BackgroundTransparency = 1.000
				ColorSelection_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ColorSelection_2.BorderSizePixel = 0
				ColorSelection_2.Size = UDim2.new(0, 10, 0, 10)
				ColorSelection_2.ZIndex = 3
				ColorSelection_2.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection_2.ScaleType = Enum.ScaleType.Fit

				Hue.Name = "Hue"
				Hue.Parent = ColorSelection
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Hue.BorderSizePixel = 0
				Hue.Position = UDim2.new(0.686131358, 0, 0.142243013, 0)
				Hue.Size = UDim2.new(0, 15, 0, 80)
				Hue.ZIndex = 2

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.19, Color3.fromRGB(255, 247, 0)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(34, 255, 0)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(0, 255, 247)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.89, Color3.fromRGB(238, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
				UIGradient.Rotation = 270
				UIGradient.Parent = Hue

				UICorner_13.CornerRadius = UDim.new(0, 2)
				UICorner_13.Parent = Hue

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.BorderColor3 = Color3.fromRGB(0, 0, 0)
				HueSelection.BorderSizePixel = 0
				HueSelection.Position = UDim2.new(0.5, 0, 0.762499988, 0)
				HueSelection.Size = UDim2.new(0, 10, 0, 10)
				HueSelection.ZIndex = 3
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

				UICorner_14.CornerRadius = UDim.new(0, 5)
				UICorner_14.Parent = ColorSelection

				ColorpickerButton.Name = "ColorpickerButton"
				ColorpickerButton.Parent = Colorpicker
				ColorpickerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerButton.BackgroundTransparency = 1.000
				ColorpickerButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ColorpickerButton.BorderSizePixel = 0
				ColorpickerButton.Size = UDim2.new(1, 0, 1, 0)
				ColorpickerButton.Font = Enum.Font.SourceSans
				ColorpickerButton.Text = ""
				ColorpickerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				ColorpickerButton.TextSize = 14.000

				local HHHHH = false
				local OldToggleColor = Color3.fromRGB(0, 0, 0)
				local OldColor = Color3.fromRGB(0, 0, 0)
				local OldColorSelectionPosition = nil
				local OldHueSelectionPosition = nil
				local ColorH, ColorS, ColorV = 1, 1, 1
				local RainbowColorPicker = false
				local ColorPickerInput = nil
				local ColorInput = nil
				local HueInput = nil
				local RunService = game:GetService("RunService")

				local function UpdateColorPicker(nope)
					NowColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
					pcall(options.Callback, NowColor.BackgroundColor3)
				end

				ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
				ColorS = (math.clamp(ColorSelection_2.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
				ColorV = 1 - (math.clamp(ColorSelection_2.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

				NowColor.BackgroundColor3 = options.Preset
				Color.BackgroundColor3 = options.Preset
				pcall(options.Callback, NowColor.BackgroundColor3)

				ColorpickerButton.MouseButton1Click:Connect(function()
					ColorSelection.Visible = not HHHHH
					HHHHH = not HHHHH
				end)

				Color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput = RunService.RenderStepped:Connect(function()
							local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
							ColorSelection_2.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = ColorX
							ColorV = 1 - ColorY

							UpdateColorPicker(true)
						end)
					end
				end)

				Color.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)

				Hue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end

						HueInput = RunService.RenderStepped:Connect(function()
							local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
							HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
							ColorH = 1 - HueY

							UpdateColorPicker(true)
						end)
					end
				end)

				Hue.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)
			end

			function library.FuncMain.CreateInput(options)
				local Name = options.Name;wait()
				local default = options.Value or ''
				local Placeholder = options.Placeholder
				local callback = options.Callback

				local Input = Instance.new("Frame")
				local UICorner_15 = Instance.new("UICorner")
				local Main_2 = Instance.new("Frame")
				local TextBox = Instance.new("TextBox")
				local UICorner_16 = Instance.new("UICorner")
				local InputTitle = Instance.new("TextLabel")

				Input.Name = "Input"
				Input.Parent = Sections
				Input.BackgroundColor3 = Background2
				Input.BackgroundTransparency = 0.600
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.ClipsDescendants = true
				Input.Position = UDim2.new(0, 0, 0.638990283, 0)
				Input.Size = UDim2.new(0.950000107, 0, 0.0111752702, 35)

				UICorner_15.CornerRadius = UDim.new(0, 2)
				UICorner_15.Parent = Input

				Main_2.Name = "Main"
				Main_2.Parent = Input
				Main_2.BackgroundColor3 = Background2
				Main_2.BackgroundTransparency = 0.600
				Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Main_2.BorderSizePixel = 0
				Main_2.ClipsDescendants = true
				Main_2.Size = UDim2.new(1, 0, 1, 0)

				TextBox.Parent = Main_2
				TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
				TextBox.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0.5, 0, 0.699999988, 0)
				TextBox.Size = UDim2.new(0.800000012, 0, 0.459695935, 0)
				TextBox.Font = Enum.Font.SourceSansBold
				TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
				TextBox.PlaceholderText = Placeholder
				TextBox.Text = default
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 12.000

				UICorner_16.CornerRadius = UDim.new(0, 2)
				UICorner_16.Parent = Main_2

				InputTitle.Name = "InputTitle"
				InputTitle.Parent = Main_2
				InputTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				InputTitle.BackgroundTransparency = 1.000
				InputTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				InputTitle.BorderSizePixel = 0
				InputTitle.Position = UDim2.new(0.0292273257, 0, 0.107466936, 0)
				InputTitle.Size = UDim2.new(0.949801564, 0, 0.340152115, 0)
				InputTitle.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				InputTitle.Text = Name
				InputTitle.TextColor3 = TextColorUI
				InputTitle.TextSize = 10.000
				InputTitle.TextXAlignment = Enum.TextXAlignment.Left

				TextBox.FocusLost:Connect(function(ep)
					if #TextBox.Text > 0 then
						callback(TextBox.Text)
						TextBox.Text = TextBox.Text
					end
				end)
				callback(default)
			end
			function library.FuncMain.CreateSlider(options)
				local text = options.Name;wait()
				local callback = options.Format or function() end

				local Slider = Instance.new("Frame")
				local UICorner_17 = Instance.new("UICorner")
				local ButtonText = Instance.new("TextLabel")
				local TextBox_2 = Instance.new("TextBox")
				local UICorner_18 = Instance.new("UICorner")
				local ValueFrame2 = Instance.new("Frame")
				local UICorner_19 = Instance.new("UICorner")
				local ValueFrame = Instance.new("Frame")
				local UICorner_20 = Instance.new("UICorner")
				local Frame = Instance.new("Frame")
				local UICorner_21 = Instance.new("UICorner")

				Slider.Name = "Slider"
				Slider.Parent = Sections
				Slider.BackgroundColor3 = Background2
				Slider.BackgroundTransparency = 0.600
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0.745725453, 0)
				Slider.Size = UDim2.new(0.950000107, 0, 0.00989808794, 31)

				UICorner_17.CornerRadius = UDim.new(0, 2)
				UICorner_17.Parent = Slider

				ButtonText.Name = "ButtonText"
				ButtonText.Parent = Slider
				ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonText.BackgroundTransparency = 1.000
				ButtonText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ButtonText.BorderSizePixel = 0
				ButtonText.Position = UDim2.new(0.0462909453, 0, 0.191856131, 0)
				ButtonText.Size = UDim2.new(0, 148, 0, 9)
				ButtonText.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				ButtonText.Text = text
				ButtonText.TextColor3 = TextColorUI
				ButtonText.TextSize = 12.000
				ButtonText.TextXAlignment = Enum.TextXAlignment.Left

				TextBox_2.Parent = Slider
				TextBox_2.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
				TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox_2.BorderSizePixel = 0
				TextBox_2.Position = UDim2.new(0.747350395, 0, 0.175377965, 0)
				TextBox_2.Size = UDim2.new(0, 36, 0, 10)
				TextBox_2.Font = Enum.Font.Ubuntu
				TextBox_2.Text = "70"
				TextBox_2.TextColor3 = TextColorUI
				TextBox_2.TextSize = 9.000

				UICorner_18.CornerRadius = UDim.new(0, 2)
				UICorner_18.Parent = TextBox_2

				ValueFrame2.Name = "ValueFrame2"
				ValueFrame2.Parent = Slider
				ValueFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueFrame2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				ValueFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueFrame2.BorderSizePixel = 0
				ValueFrame2.Position = UDim2.new(0.5, 0, 0.800000012, 0)
				ValueFrame2.Size = UDim2.new(0.949999988, 0, 0, 2)

				UICorner_19.CornerRadius = UDim.new(0, 5)
				UICorner_19.Parent = ValueFrame2

				ValueFrame.Name = "ValueFrame"
				ValueFrame.Parent = ValueFrame2
				ValueFrame.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
				ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueFrame.BorderSizePixel = 0
				ValueFrame.Size = UDim2.new(0.827310622, 0, 1, 0)

				UICorner_20.CornerRadius = UDim.new(0, 5)
				UICorner_20.Parent = ValueFrame

				Frame.Parent = ValueFrame
				Frame.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame.BackgroundColor3 = MainBackground or Color3.fromRGB(28, 28, 25)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(1, 0, 0, 0)
				Frame.Size = UDim2.new(0, 10, 0, 10)

				UICorner_21.CornerRadius = UDim.new(1, 8)
				UICorner_21.Parent = Frame

				ValueFrame:TweenSize(UDim2.new((options.Value or 0) / options.Max, 0, 1, 0), "Out", "Back", 0.2, true)
				callback(options.Value)
				TextBox_2.Text = options.Value
				TextBox_2.FocusLost:Connect(function()
					if TextBox_2.Text == "" then
						TextBox_2.Text = options.Value
					end
					if  tonumber(TextBox_2.Text) > options.Max then
						TextBox_2.Text  = options.Max
					end;if  tonumber(TextBox_2.Text) <= options.Min then
						TextBox_2.Text  = options.Min
					end

					ValueFrame:TweenSize(UDim2.new((TextBox_2.Text or 0) / options.Max, 0, 1, 0), "Out", "Back", 0.2, true)
					TextBox_2.Text = tostring(TextBox_2.Text)
					pcall(callback, tonumber(TextBox_2.Text))
				end)
				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							1,
							0
						)

					ValueFrame:TweenSize(pos1, "Out", "Sine", 0.2, true)
					local value = math.floor(((pos.X.Scale * options.Max) / options.Max) * (options.Max - options.Min) + options.Min)
					TextBox_2.Text = tonumber(value)
					callback(tonumber(value))
				end
				local dragging = false
				Frame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				Frame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
						end
					end
				)

				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)
			end
			function library.FuncMain.CreateImage(options)
				local TableImg = {}
				local Image = Instance.new("Frame")
				local UICorner_22 = Instance.new("UICorner")
				local ImageIcon = Instance.new("ImageLabel")
				local Title = Instance.new("TextLabel")
				local NameIcon = Instance.new("TextLabel")

				Image.Name = "Image"
				Image.Parent = Sections
				Image.BackgroundColor3 = Background2
				Image.BackgroundTransparency = 0.600
				Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Image.BorderSizePixel = 0
				Image.ClipsDescendants = true
				Image.Position = UDim2.new(0, 0, 0.311646491, 0)
				Image.Size = UDim2.new(0.950000107, 0, 0.152440205, 27)

				UICorner_22.CornerRadius = UDim.new(0, 2)
				UICorner_22.Parent = Image

				ImageIcon.Name = "ImageIcon"
				ImageIcon.Parent = Image
				ImageIcon.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageIcon.BackgroundTransparency = 1.000
				ImageIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageIcon.BorderSizePixel = 0
				ImageIcon.Position = UDim2.new(0.493066698, 0, 0.5, 0)
				ImageIcon.Size = UDim2.new(0, 50, 0, 50)
				ImageIcon.Image = "rbxassetid://"

				if options.AIP then
					local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
					local length = 20
					local randomString = ""

					math.randomseed(os.time())

					local charTable = {}
					for c in chars:gmatch "." do
						table.insert(charTable, c)
					end

					for i = 1, length do
						randomString = randomString .. charTable[math.random(1, #charTable)]
					end
					ImageIcon.Image = GetImage("Image".. randomString, options.Image)
				else
					ImageIcon.Image = "rbxassetid://".. options.Image
				end

				Title.Name = "Title"
				Title.Parent = Image
				Title.AnchorPoint = Vector2.new(0.5, 0.5)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(0.5, 0, 0.100000001, 0)
				Title.Size = UDim2.new(1, 0, 0.151999995, 0)
				Title.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				Title.Text = options.Title
				Title.TextColor3 = Color3.fromRGB(185, 185, 185)
				Title.TextSize = 12.000
				Title.TextWrapped = true

				NameIcon.Name = "NameIcon"
				NameIcon.Parent = Image
				NameIcon.AnchorPoint = Vector2.new(0.5, 0.5)
				NameIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NameIcon.BackgroundTransparency = 1.000
				NameIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				NameIcon.BorderSizePixel = 0
				NameIcon.Position = UDim2.new(0.5, 0, 0.899999976, 0)
				NameIcon.Size = UDim2.new(1, 0, 0.151999995, 0)
				NameIcon.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				NameIcon.Text = options.Dis
				NameIcon.TextColor3 = Color3.fromRGB(185, 185, 185)
				NameIcon.TextSize = 12.000
				NameIcon.TextWrapped = true

				function TableImg:UpdateImage(Value)
					if options.AIP then
						local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
						local length = 20
						local randomString = ""

						math.randomseed(os.time())

						local charTable = {}
						for c in chars:gmatch "." do
							table.insert(charTable, c)
						end

						for i = 1, length do
							randomString = randomString .. charTable[math.random(1, #charTable)]
						end
						ImageIcon.Image = GetImage("Image".. randomString, Value)
					else
						ImageIcon.Image = "rbxassetid://".. Value
					end
				end
				function TableImg:UpdateTitle(Value)
					Title.Text = Value
				end
				function TableImg:UpdateDis(Value)
					NameIcon.Text = Value
				end
				return TableImg
			end
			return library.FuncMain
		end
		return library.Sections
	end
	return library.TapGroup
end



-- Dark Blue Theme
local Windown = library.Create({
	Title = "Min Gaming", Logo = 111792405768331,
	CornerRadius = 2, UISize = {
		X = 700,
		Y = 400
	},UIColor = {
        ['Shadow'] = Color3.fromRGB(28, 28, 25),
        ['MainBackground'] = Color3.fromRGB(28, 28, 25),
        ['Background2'] = Color3.fromRGB(56, 60, 83),
        ['ToggleO'] = Color3.fromRGB(61, 65, 91),
        ['TapButtonColor'] = Color3.fromRGB(113, 117, 136),
        ['DropDownSelect'] = Color3.fromRGB(61, 65, 90),
        ['TextColor'] = Color3.fromRGB(255, 255, 255)
    }
})




if game.PlaceId == 2753915549 then
        World1 = true
    elseif game.PlaceId == 4442272183 then
        World2 = true
    elseif game.PlaceId == 7449423635 then
        World3 = true
    end
	
	function CheckQuest() 
        MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
        if World1 then
            if MyLevel == 1 or MyLevel <= 9 then
                Mon = "Bandit"
                LevelQuest = 1
                NameQuest = "BanditQuest1"
                NameMon = "Bandit"
                CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
                CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
            elseif MyLevel == 10 or MyLevel <= 14 then
                Mon = "Monkey"
                LevelQuest = 1
                NameQuest = "JungleQuest"
                NameMon = "Monkey"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
            elseif MyLevel == 15 or MyLevel <= 29 then
                Mon = "Gorilla"
                LevelQuest = 2
                NameQuest = "JungleQuest"
                NameMon = "Gorilla"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
            elseif MyLevel == 30 or MyLevel <= 39 then
                Mon = "Pirate"
                LevelQuest = 1
                NameQuest = "BuggyQuest1"
                NameMon = "Pirate"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
            elseif MyLevel == 40 or MyLevel <= 59 then
                Mon = "Brute"
                LevelQuest = 2
                NameQuest = "BuggyQuest1"
                NameMon = "Brute"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
            elseif MyLevel == 60 or MyLevel <= 74 then
                Mon = "Desert Bandit"
                LevelQuest = 1
                NameQuest = "DesertQuest"
                NameMon = "Desert Bandit"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
                CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
            elseif MyLevel == 75 or MyLevel <= 89 then
                Mon = "Desert Officer"
                LevelQuest = 2
                NameQuest = "DesertQuest"
                NameMon = "Desert Officer"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
                CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
            elseif MyLevel == 90 or MyLevel <= 99 then
                Mon = "Snow Bandit"
                LevelQuest = 1
                NameQuest = "SnowQuest"
                NameMon = "Snow Bandit"
                CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
            elseif MyLevel == 100 or MyLevel <= 119 then
                Mon = "Snowman"
                LevelQuest = 2
                NameQuest = "SnowQuest"
                NameMon = "Snowman"
                CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
            elseif MyLevel == 120 or MyLevel <= 149 then
                Mon = "Chief Petty Officer"
                LevelQuest = 1
                NameQuest = "MarineQuest2"
                NameMon = "Chief Petty Officer"
                CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
            elseif MyLevel == 150 or MyLevel <= 174 then
                Mon = "Sky Bandit"
                LevelQuest = 1
                NameQuest = "SkyQuest"
                NameMon = "Sky Bandit"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
            elseif MyLevel == 175 or MyLevel <= 189 then
                Mon = "Dark Master"
                LevelQuest = 2
                NameQuest = "SkyQuest"
                NameMon = "Dark Master"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
            elseif MyLevel == 190 or MyLevel <= 209 then
                Mon = "Prisoner"
                LevelQuest = 1
                NameQuest = "PrisonerQuest"
                NameMon = "Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
            elseif MyLevel == 210 or MyLevel <= 249 then
                Mon = "Dangerous Prisoner"
                LevelQuest = 2
                NameQuest = "PrisonerQuest"
                NameMon = "Dangerous Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
            elseif MyLevel == 250 or MyLevel <= 274 then
                Mon = "Toga Warrior"
                LevelQuest = 1
                NameQuest = "ColosseumQuest"
                NameMon = "Toga Warrior"
                CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
                CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
            elseif MyLevel == 275 or MyLevel <= 299 then
                Mon = "Gladiator"
                LevelQuest = 2
                NameQuest = "ColosseumQuest"
                NameMon = "Gladiator"
                CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
                CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
            elseif MyLevel == 300 or MyLevel <= 324 then
                Mon = "Military Soldier"
                LevelQuest = 1
                NameQuest = "MagmaQuest"
                NameMon = "Military Soldier"
                CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
                CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
            elseif MyLevel == 325 or MyLevel <= 374 then
                Mon = "Military Spy"
                LevelQuest = 2
                NameQuest = "MagmaQuest"
                NameMon = "Military Spy"
                CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
                CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
            elseif MyLevel == 375 or MyLevel <= 399 then
                Mon = "Fishman Warrior"
                LevelQuest = 1
                NameQuest = "FishmanQuest"
                NameMon = "Fishman Warrior"
                CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif MyLevel == 400 or MyLevel <= 449 then
                Mon = "Fishman Commando"
                LevelQuest = 2
                NameQuest = "FishmanQuest"
                NameMon = "Fishman Commando"
                CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif MyLevel == 450 or MyLevel <= 474 then
                Mon = "God's Guard"
                LevelQuest = 1
                NameQuest = "SkyExp1Quest"
                NameMon = "God's Guard"
                CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
                CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                end
            elseif MyLevel == 475 or MyLevel <= 524 then
                Mon = "Shanda"
                LevelQuest = 2
                NameQuest = "SkyExp1Quest"
                NameMon = "Shanda"
                CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
                CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                end
            elseif MyLevel == 525 or MyLevel <= 549 then
                Mon = "Royal Squad"
                LevelQuest = 1
                NameQuest = "SkyExp2Quest"
                NameMon = "Royal Squad"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
            elseif MyLevel == 550 or MyLevel <= 624 then
                Mon = "Royal Soldier"
                LevelQuest = 2
                NameQuest = "SkyExp2Quest"
                NameMon = "Royal Soldier"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
            elseif MyLevel == 625 or MyLevel <= 649 then
                Mon = "Galley Pirate"
                LevelQuest = 1
                NameQuest = "FountainQuest"
                NameMon = "Galley Pirate"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
            elseif MyLevel >= 650 then
                Mon = "Galley Captain"
                LevelQuest = 2
                NameQuest = "FountainQuest"
                NameMon = "Galley Captain"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
            end
        elseif World2 then
            if MyLevel == 700 or MyLevel <= 724 then
                Mon = "Raider"
                LevelQuest = 1
                NameQuest = "Area1Quest"
                NameMon = "Raider"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
				CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
            elseif MyLevel == 725 or MyLevel <= 774 then
                Mon = "Mercenary"
                LevelQuest = 2
                NameQuest = "Area1Quest"
                NameMon = "Mercenary"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
                CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
            elseif MyLevel == 775 or MyLevel <= 799 then
                Mon = "Swan Pirate"
                LevelQuest = 1
                NameQuest = "Area2Quest"
                NameMon = "Swan Pirate"
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
                CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
            elseif MyLevel == 800 or MyLevel <= 874 then
                Mon = "Factory Staff"
                NameQuest = "Area2Quest"
                LevelQuest = 2
                NameMon = "Factory Staff"
                CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
                CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
            elseif MyLevel == 875 or MyLevel <= 899 then
                Mon = "Marine Lieutenant"
                LevelQuest = 1
                NameQuest = "MarineQuest3"
                NameMon = "Marine Lieutenant"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
            elseif MyLevel == 900 or MyLevel <= 949 then
                Mon = "Marine Captain"
                LevelQuest = 2
                NameQuest = "MarineQuest3"
                NameMon = "Marine Captain"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
            elseif MyLevel == 950 or MyLevel <= 974 then
                Mon = "Zombie"
                LevelQuest = 1
                NameQuest = "ZombieQuest"
                NameMon = "Zombie"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
            elseif MyLevel == 975 or MyLevel <= 999 then
                Mon = "Vampire"
                LevelQuest = 2
                NameQuest = "ZombieQuest"
                NameMon = "Vampire"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
            elseif MyLevel == 1000 or MyLevel <= 1049 then
                Mon = "Snow Trooper"
                LevelQuest = 1
                NameQuest = "SnowMountainQuest"
                NameMon = "Snow Trooper"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
            elseif MyLevel == 1050 or MyLevel <= 1099 then
                Mon = "Winter Warrior"
                LevelQuest = 2
                NameQuest = "SnowMountainQuest"
                NameMon = "Winter Warrior"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
            elseif MyLevel == 1100 or MyLevel <= 1124 then
                Mon = "Lab Subordinate"
                LevelQuest = 1
                NameQuest = "IceSideQuest"
                NameMon = "Lab Subordinate"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
            elseif MyLevel == 1125 or MyLevel <= 1174 then
                Mon = "Horned Warrior"
                LevelQuest = 2
                NameQuest = "IceSideQuest"
                NameMon = "Horned Warrior"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
            elseif MyLevel == 1175 or MyLevel <= 1199 then
                Mon = "Magma Ninja"
                LevelQuest = 1
                NameQuest = "FireSideQuest"
                NameMon = "Magma Ninja"
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
            elseif MyLevel == 1200 or MyLevel <= 1249 then
                Mon = "Lava Pirate"
                LevelQuest = 2
                NameQuest = "FireSideQuest"
                NameMon = "Lava Pirate"
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
            elseif MyLevel == 1250 or MyLevel <= 1274 then
                Mon = "Ship Deckhand"
                LevelQuest = 1
                NameQuest = "ShipQuest1"
                NameMon = "Ship Deckhand"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
                CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)    
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif MyLevel == 1275 or MyLevel <= 1299 then
                Mon = "Ship Engineer"
                LevelQuest = 2
                NameQuest = "ShipQuest1"
                NameMon = "Ship Engineer"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
                CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end             
            elseif MyLevel == 1300 or MyLevel <= 1324 then
                Mon = "Ship Steward"
                LevelQuest = 1
                NameQuest = "ShipQuest2"
                NameMon = "Ship Steward"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
                CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)      
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif MyLevel == 1325 or MyLevel <= 1349 then
                Mon = "Ship Officer"
                LevelQuest = 2
                NameQuest = "ShipQuest2"
                NameMon = "Ship Officer"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
                CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif MyLevel == 1350 or MyLevel <= 1374 then
                Mon = "Arctic Warrior"
                LevelQuest = 1
                NameQuest = "FrostQuest"
                NameMon = "Arctic Warrior"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
                end
            elseif MyLevel == 1375 or MyLevel <= 1424 then
                Mon = "Snow Lurker"
                LevelQuest = 2
                NameQuest = "FrostQuest"
                NameMon = "Snow Lurker"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
            elseif MyLevel == 1425 or MyLevel <= 1449 then
                Mon = "Sea Soldier"
                LevelQuest = 1
                NameQuest = "ForgottenQuest"
                NameMon = "Sea Soldier"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
            elseif MyLevel >= 1450 then
                Mon = "Water Fighter"
                LevelQuest = 2
                NameQuest = "ForgottenQuest"
                NameMon = "Water Fighter"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
            end
        elseif World3 then
            if MyLevel == 1500 or MyLevel <= 1524 then
                Mon = "Pirate Millionaire"
                LevelQuest = 1
                NameQuest = "PiratePortQuest"
                NameMon = "Pirate Millionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
            elseif MyLevel == 1525 or MyLevel <= 1574 then
                Mon = "Pistol Billionaire"
                LevelQuest = 2
                NameQuest = "PiratePortQuest"
                NameMon = "Pistol Billionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
            elseif MyLevel == 1575 or MyLevel <= 1599 then
                Mon = "Dragon Crew Warrior"
                LevelQuest = 1
                NameQuest = "AmazonQuest"
                NameMon = "Dragon Crew Warrior"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
            elseif MyLevel == 1600 or MyLevel <= 1624 then 
                Mon = "Dragon Crew Archer"
                NameQuest = "AmazonQuest"
                LevelQuest = 2
                NameMon = "Dragon Crew Archer"
                CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
                CFrameMon = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125)
            elseif MyLevel == 1625 or MyLevel <= 1649 then
                Mon = "Female Islander"
                NameQuest = "AmazonQuest2"
                LevelQuest = 1
                NameMon = "Female Islander"
                CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
                CFrameMon = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312)
            elseif MyLevel == 1650 or MyLevel <= 1699 then 
                Mon = "Giant Islander"
                NameQuest = "AmazonQuest2"
                LevelQuest = 2
                NameMon = "Giant Islander"
                CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
                CFrameMon = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508)
            elseif MyLevel == 1700 or MyLevel <= 1724 then
                Mon = "Marine Commodore"
                LevelQuest = 1
                NameQuest = "MarineTreeIsland"
                NameMon = "Marine Commodore"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
            elseif MyLevel == 1725 or MyLevel <= 1774 then
                Mon = "Marine Rear Admiral"
                NameMon = "Marine Rear Admiral"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 2
                CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
                CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
            elseif MyLevel == 1775 or MyLevel <= 1799 then
                Mon = "Fishman Raider"
                LevelQuest = 1
                NameQuest = "DeepForestIsland3"
                NameMon = "Fishman Raider"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
                CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
            elseif MyLevel == 1800 or MyLevel <= 1824 then
                Mon = "Fishman Captain"
                LevelQuest = 2
                NameQuest = "DeepForestIsland3"
                NameMon = "Fishman Captain"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
                CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
            elseif MyLevel == 1825 or MyLevel <= 1849 then
                Mon = "Forest Pirate"
                LevelQuest = 1
                NameQuest = "DeepForestIsland"
                NameMon = "Forest Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
            elseif MyLevel == 1850 or MyLevel <= 1899 then
                Mon = "Mythological Pirate"
                LevelQuest = 2
                NameQuest = "DeepForestIsland"
                NameMon = "Mythological Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
                CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
            elseif MyLevel == 1900 or MyLevel <= 1924 then
                Mon = "Jungle Pirate"
                LevelQuest = 1
                NameQuest = "DeepForestIsland2"
                NameMon = "Jungle Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
            elseif MyLevel == 1925 or MyLevel <= 1974 then
                Mon = "Musketeer Pirate"
                LevelQuest = 2
                NameQuest = "DeepForestIsland2"
                NameMon = "Musketeer Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
            elseif MyLevel == 1975 or MyLevel <= 1999 then
                Mon = "Reborn Skeleton"
                LevelQuest = 1
                NameQuest = "HauntedQuest1"
                NameMon = "Reborn Skeleton"
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
            elseif MyLevel == 2000 or MyLevel <= 2024 then
                Mon = "Living Zombie"
                LevelQuest = 2
                NameQuest = "HauntedQuest1"
                NameMon = "Living Zombie"
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
            elseif MyLevel == 2025 or MyLevel <= 2049 then
                Mon = "Demonic Soul"
                LevelQuest = 1
                NameQuest = "HauntedQuest2"
                NameMon = "Demonic Soul"
                CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
                CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
            elseif MyLevel == 2050 or MyLevel <= 2074 then
                Mon = "Posessed Mummy"
                LevelQuest = 2
                NameQuest = "HauntedQuest2"
                NameMon = "Posessed Mummy"
                CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
            elseif MyLevel == 2075 or MyLevel <= 2099 then
                Mon = "Peanut Scout"
                LevelQuest = 1
                NameQuest = "NutsIslandQuest"
                NameMon = "Peanut Scout"
                CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
            elseif MyLevel == 2100 or MyLevel <= 2124 then
                Mon = "Peanut President"
                LevelQuest = 2
                NameQuest = "NutsIslandQuest"
                NameMon = "Peanut President"
                CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
            elseif MyLevel == 2125 or MyLevel <= 2149 then
                Mon = "Ice Cream Chef"
                LevelQuest = 1
                NameQuest = "IceCreamIslandQuest"
                NameMon = "Ice Cream Chef"
                CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
            elseif MyLevel == 2150 or MyLevel <= 2199 then
                Mon = "Ice Cream Commander"
                LevelQuest = 2
                NameQuest = "IceCreamIslandQuest"
                NameMon = "Ice Cream Commander"
                CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
            elseif MyLevel == 2200 or MyLevel <= 2224 then
                Mon = "Cookie Crafter"
                LevelQuest = 1
                NameQuest = "CakeQuest1"
                NameMon = "Cookie Crafter"
                CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
                CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
            elseif MyLevel == 2225 or MyLevel <= 2249 then
                Mon = "Cake Guard"
                LevelQuest = 2
                NameQuest = "CakeQuest1"
                NameMon = "Cake Guard"
                CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
                CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
            elseif MyLevel == 2250 or MyLevel <= 2274 then
                Mon = "Baking Staff"
                LevelQuest = 1
                NameQuest = "CakeQuest2"
                NameMon = "Baking Staff"
                CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
                CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
            elseif MyLevel == 2275 or MyLevel <= 2299 then
                Mon = "Head Baker"
                LevelQuest = 2
                NameQuest = "CakeQuest2"
                NameMon = "Head Baker"
                CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
                CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
            elseif MyLevel == 2300 or MyLevel <= 2324 then
                Mon = "Cocoa Warrior"
                LevelQuest = 1
                NameQuest = "ChocQuest1"
                NameMon = "Cocoa Warrior"
                CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
                CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
            elseif MyLevel == 2325 or MyLevel <= 2349 then
                Mon = "Chocolate Bar Battler"
                LevelQuest = 2
                NameQuest = "ChocQuest1"
                NameMon = "Chocolate Bar Battler"
                CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
                CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
            elseif MyLevel == 2350 or MyLevel <= 2374 then
                Mon = "Sweet Thief"
                LevelQuest = 1
                NameQuest = "ChocQuest2"
                NameMon = "Sweet Thief"
                CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
                CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
            elseif MyLevel == 2375 or MyLevel <= 2399 then
                Mon = "Candy Rebel"
                LevelQuest = 2
                NameQuest = "ChocQuest2"
                NameMon = "Candy Rebel"
                CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
                CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
            elseif MyLevel == 2400 or MyLevel <= 2424 then
                Mon = "Candy Pirate"
                LevelQuest = 1
                NameQuest = "CandyQuest1"
                NameMon = "Candy Pirate"
                CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
                CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
            elseif MyLevel == 2425 or MyLevel <= 2449 then
                Mon = "Snow Demon"
                LevelQuest = 2
                NameQuest = "CandyQuest1"
                NameMon = "Snow Demon"
                CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
                CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)
            elseif MyLevel == 2450 or MyLevel <= 2474 then
                Mon = "Isle Outlaw"
                LevelQuest = 1
                NameQuest = "TikiQuest1"
                NameMon = "Isle Outlaw"
                CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
                CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
            elseif MyLevel == 2475 or MyLevel <= 2499 then
                Mon = "Island Boy"
                LevelQuest = 2
                NameQuest = "TikiQuest1"
                NameMon = "Island Boy"
                CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
                CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
            elseif MyLevel == 2500 or MyLevel <= 2524 then
                Mon = "Sun-kissed Warrior"
                LevelQuest = 1
                NameQuest = "TikiQuest2"
                NameMon = "kissed"
                CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
                CFrameMon = CFrame.new(-16349.8779296875, 92.0808334350586, 1123.4169921875)
            elseif MyLevel >= 2525 then
                Mon = "Isle Champion"
                LevelQuest = 2
                NameQuest = "TikiQuest2"
                NameMon = "Isle Champion"
                CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
                CFrameMon = CFrame.new(-17003, 175, 1050)
            end
        end
    end
    
	
function CheckBossQuest()
    if _G.SelectBoss == "Saber Expert" then
        MsBoss = "Saber Expert"
        NameBoss = "Saber Expert"
        CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
    elseif _G.SelectBoss == "The Saw" then
        MsBoss = "The Saw"
        NameBoss = "The Saw"
        CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
    elseif _G.SelectBoss == "Greybeard" then
        MsBoss = "Greybeard"
        NameBoss = "Greybeard"
        CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
    elseif _G.SelectBoss == "The Gorilla King" then
        MsBoss = "The Gorilla King"
        NameBoss = "The Gorilla King"
        NameQuestBoss = "JungleQuest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
        CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
    elseif _G.SelectBoss == "Bobby" then
        MsBoss = "Bobby"
        NameBoss = "Bobby"
        NameQuestBoss = "BuggyQuest1"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
        CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
    elseif _G.SelectBoss == "Yeti" then
        MsBoss = "Yeti"
        NameBoss = "Yeti"
        NameQuestBoss = "SnowQuest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
        CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
    elseif _G.SelectBoss == "Mob Leader" then
        MsBoss = "Mob Leader"
        NameBoss = "Mob Leader"
        CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
    elseif _G.SelectBoss == "Vice Admiral" then
        MsBoss = "Vice Admiral"
        NameBoss = "Vice Admiral"
        NameQuestBoss = "MarineQuest2"
        LevelQuestBoss = 2
        CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
        CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
    elseif _G.SelectBoss == "Warden" then
        MsBoss = "Warden"
        NameBoss = "Warden"
        NameQuestBoss = "ImpelQuest"
        LevelQuestBoss = 1
        CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
        CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
    elseif _G.SelectBoss == "Chief Warden" then
        MsBoss = "Chief Warden"
        NameBoss = "Chief Warden"
        NameQuestBoss = "ImpelQuest"
        LevelQuestBoss = 2
        CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
        CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
    elseif _G.SelectBoss == "Swan" then
        MsBoss = "Swan"
        NameBoss = "Swan"
        NameQuestBoss = "ImpelQuest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
        CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
    elseif _G.SelectBoss == "Magma Admiral" then
        MsBoss = "Magma Admiral"
        NameBoss = "Magma Admiral"
        NameQuestBoss = "MagmaQuest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
        CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
    elseif _G.SelectBoss == "Fishman Lord" then
        MsBoss = "Fishman Lord"
        NameBoss = "Fishman Lord"
        NameQuestBoss = "FishmanQuest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
        CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
    elseif _G.SelectBoss == "Wysper" then
        MsBoss = "Wysper"
        NameBoss = "Wysper"
        NameQuestBoss = "SkyExp1Quest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
        CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
    elseif _G.SelectBoss == "Thunder God" then
        MsBoss = "Thunder God"
        NameBoss = "Thunder God"
        NameQuestBoss = "SkyExp2Quest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
        CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
    elseif _G.SelectBoss == "Cyborg" then
        MsBoss = "Cyborg"
        NameBoss = "Cyborg"
        NameQuestBoss = "FountainQuest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
        CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
    -- New World
    elseif _G.SelectBoss == "Diamond" then
        MsBoss = "Diamond"
        NameBoss = "Diamond"
        NameQuestBoss = "Area1Quest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
        CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
    elseif _G.SelectBoss == "Jeremy" then
        MsBoss = "Jeremy"
        NameBoss = "Jeremy"
        NameQuestBoss = "Area2Quest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
        CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
    elseif _G.SelectBoss == "Fajita" then
        MsBoss = "Fajita"
        NameBoss = "Fajita"
        NameQuestBoss = "MarineQuest3"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
        CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
    elseif _G.SelectBoss == "Don Swan" then
        MsBoss = "Don Swan"
        NameBoss = "Don Swan"
        CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
    elseif _G.SelectBoss == "Smoke Admiral" then
        MsBoss = "Smoke Admiral"
        NameBoss = "Smoke Admiral"
        NameQuestBoss = "IceSideQuest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
        CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
    elseif _G.SelectBoss == "Cursed Captain" then
        MsBoss = "Cursed Captain"
        NameBoss = "Cursed Captain"
        CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
    elseif _G.SelectBoss == "Darkbeard" then
        MsBoss = "Darkbeard"
        NameBoss = "Darkbeard"
        CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
    elseif _G.SelectBoss == "Order" then
        MsBoss = "Order"
        NameBoss = "Order"
        CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
    elseif _G.SelectBoss == "Awakened Ice Admiral" then
        MsBoss = "Awakened Ice Admiral"
        NameBoss = "Awakened Ice Admiral"
        NameQuestBoss = "FrostQuest"
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
        CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
    elseif _G.SelectBoss == "Tide Keeper" then
        MsBoss = "Tide Keeper"
         NameBoss = "Tide Keeper"
        NameQuestBoss = "ForgottenQuest"             
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
        CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
    -- Thire World
    elseif _G.SelectBoss == "Stone" then
        MsBoss = "Stone"
        NameBoss = "Stone"
        NameQuestBoss = "PiratePortQuest"             
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-290, 44, 5577)
        CFrameBoss = CFrame.new(-1085, 40, 6779)
    elseif _G.SelectBoss == "Island Empress" then
        MsBoss = "Island Empress"
         NameBoss = "Island Empress"
        NameQuestBoss = "AmazonQuest2"             
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(5443, 602, 752)
        CFrameBoss = CFrame.new(5659, 602, 244)
    elseif _G.SelectBoss == "Kilo Admiral" then
        MsBoss = "Kilo Admiral"
        NameBoss = "Kilo Admiral"
        NameQuestBoss = "MarineTreeIsland"             
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(2178, 29, -6737)
        CFrameBoss =CFrame.new(2846, 433, -7100)
    elseif _G.SelectBoss == "Captain Elephant" then
        MsBoss = "Captain Elephant"
        NameBoss = "Captain Elephant"
        NameQuestBoss = "DeepForestIsland"             
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-13232, 333, -7631)
        CFrameBoss = CFrame.new(-13221, 325, -8405)
    elseif _G.SelectBoss == "Beautiful Pirate" then
        MsBoss = "Beautiful Pirate"
        NameBoss = "Beautiful Pirate"
        NameQuestBoss = "DeepForestIsland2"             
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-12686, 391, -9902)
        CFrameBoss = CFrame.new(5182, 23, -20)
    elseif _G.SelectBoss == "Cake Queen" then
        MsBoss = "Cake Queen"
        NameBoss = "Cake Queen"
        NameQuestBoss = "IceCreamIslandQuest"             
        LevelQuestBoss = 3
        CFrameQuestBoss = CFrame.new(-716, 382, -11010)
        CFrameBoss = CFrame.new(-821, 66, -10965)
    elseif _G.SelectBoss == "rip_indra True Form" then
        MsBoss = "rip_indra True Form"
        NameBoss = "rip_indra True Form"
        CFrameBoss = CFrame.new(-5359, 424, -2735)
    elseif _G.SelectBoss == "Longma" then
        MsBoss = "Longma"
        NameBoss = "Longma"
        CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
    elseif _G.SelectBoss == "Soul Reaper" then
        MsBoss = "Soul Reaper"
        NameBoss = "Soul Reaper"
        CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
    end
end

    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport() 
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end       

    function UpdateIslandESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then 
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(7, 236, 240)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end
    
    function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	for i,v in pairs(game:GetService'Players':GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Character.Head)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(0,255,0)
						else
							name.TextColor3 = Color3.new(255,0,0)
						end
					else
						v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
					end
				else
					if v.Character.Head:FindFirstChild('NameEsp'..Number) then
						v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateChestChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v.Name,"Chest") then
				if ChestESP then
					if string.find(v.Name,"Chest") then
						if not v:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = Enum.Font.GothamSemibold
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							if v.Name == "Chest1" then
								name.TextColor3 = Color3.fromRGB(109, 109, 109)
								name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest2" then
								name.TextColor3 = Color3.fromRGB(173, 158, 21)
								name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest3" then
								name.TextColor3 = Color3.fromRGB(85, 255, 255)
								name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
						else
							v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
						end
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
						v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateDevilChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v.Name, "Fruit") then   
					if not v.Handle:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Handle)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					else
						v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					end
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end
		end)
	end
end
function UpdateFlowerChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if v.Name == "Flower2" or v.Name == "Flower1" then
				if FlowerESP then 
					if not v:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 0, 0)
						if v.Name == "Flower1" then 
							name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(0, 0, 255)
						end
						if v.Name == "Flower2" then
							name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(255, 0, 0)
						end
					else
						v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
					v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end   
		end)
	end
end
function UpdateRealFruitChams() 
	for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 0, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 174, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(251, 255, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
end

function UpdateIslandESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then 
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(7, 236, 240)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end
    
    function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	for i,v in pairs(game:GetService'Players':GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Character.Head)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(0,255,0)
						else
							name.TextColor3 = Color3.new(255,0,0)
						end
					else
						v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
					end
				else
					if v.Character.Head:FindFirstChild('NameEsp'..Number) then
						v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateChestChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v.Name,"Chest") then
				if ChestESP then
					if string.find(v.Name,"Chest") then
						if not v:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = Enum.Font.GothamSemibold
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							if v.Name == "Chest1" then
								name.TextColor3 = Color3.fromRGB(109, 109, 109)
								name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest2" then
								name.TextColor3 = Color3.fromRGB(173, 158, 21)
								name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest3" then
								name.TextColor3 = Color3.fromRGB(85, 255, 255)
								name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
						else
							v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
						end
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
						v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateDevilChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v.Name, "Fruit") then   
					if not v.Handle:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Handle)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					else
						v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					end
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end
		end)
	end
end
function UpdateFlowerChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if v.Name == "Flower2" or v.Name == "Flower1" then
				if FlowerESP then 
					if not v:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 0, 0)
						if v.Name == "Flower1" then 
							name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(0, 0, 255)
						end
						if v.Name == "Flower2" then
							name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(255, 0, 0)
						end
					else
						v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
					v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end   
		end)
	end
end
function UpdateRealFruitChams() 
	for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 0, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 174, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(251, 255, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
end

spawn(function()
    while wait() do
        pcall(function()
            if MobESP then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild('HumanoidRootPart') then
                        if not v:FindFirstChild("MobEap") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "MobEap"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                            TextLabel.Text.Size = 35
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        v.MobEap.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                    end
                end
            else
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("MobEap") then
                        v.MobEap:Destroy()
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if SeaESP then
                for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v:FindFirstChild('HumanoidRootPart') then
                        if not v:FindFirstChild("Seaesps") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "Seaesps"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                            TextLabel.Text.Size = 35
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        v.Seaesps.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                    end
                end
            else
                for i,v in pairs (game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v:FindFirstChild("Seaesps") then
                        v.Seaesps:Destroy()
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if NpcESP then
                for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    if v:FindFirstChild('HumanoidRootPart') then
                        if not v:FindFirstChild("NpcEspes") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "NpcEspes"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                            TextLabel.Text.Size = 35
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        v.NpcEspes.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                    end
                end
            else
                for i,v in pairs (game:GetService("Workspace").NPCs:GetChildren()) do
                    if v:FindFirstChild("NpcEspes") then
                        v.NpcEspes:Destroy()
                    end
                end
            end
        end)
    end
end)

function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateIslandMirageESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if MirageIslandESP then 
                if v.Name == "Mirage Island" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end


function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateAfdESP() 
    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if AfdESP then 
                if v.Name == "Advanced Fruit Dealer" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function UpdateAuraESP() 
    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if AuraESP then 
                if v.Name == "Master of Enhancement" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function UpdateLSDESP() 
    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if LADESP then 
                if v.Name == "Legendary Sword Dealer" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function UpdateGeaESP() 
    for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
        pcall(function()
            if GearESP then 
                if v.Name == "MeshPart" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end
    

    
    function InfAb()
        if InfAbility then
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                local inf = Instance.new("ParticleEmitter")
                inf.Acceleration = Vector3.new(0,0,0)
                inf.Archivable = true
                inf.Drag = 20
                inf.EmissionDirection = Enum.NormalId.Top
                inf.Enabled = true
                inf.Lifetime = NumberRange.new(0,0)
                inf.LightInfluence = 0
                inf.LockedToPart = true
                inf.Name = "Agility"
                inf.Rate = 500
                local numberKeypoints2 = {
                    NumberSequenceKeypoint.new(0, 0);
                    NumberSequenceKeypoint.new(1, 4); 
                }
                inf.Size = NumberSequence.new(numberKeypoints2)
                inf.RotSpeed = NumberRange.new(9999, 99999)
                inf.Rotation = NumberRange.new(0, 0)
                inf.Speed = NumberRange.new(30, 30)
                inf.SpreadAngle = Vector2.new(0,0,0,0)
                inf.Texture = ""
                inf.VelocityInheritance = 0
                inf.ZOffset = 2
                inf.Transparency = NumberSequence.new(0)
                inf.Color = ColorSequence.new(Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0))
                inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            end
        else
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
            end
        end
    end
    
    local LocalPlayer = game:GetService'Players'.LocalPlayer
    local originalstam = LocalPlayer.Character.Energy.Value
    function infinitestam()
        LocalPlayer.Character.Energy.Changed:connect(function()
            if InfiniteEnergy then
                LocalPlayer.Character.Energy.Value = originalstam
            end 
        end)
    end
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if InfiniteEnergy then
                    wait(0.1)
                    originalstam = LocalPlayer.Character.Energy.Value
                    infinitestam()
                end
            end
        end)
    end)
    
    function NoDodgeCool()
        if nododgecool then
            for i,v in next, getgc() do
                if game:GetService("Players").LocalPlayer.Character.Dodge then
                    if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Dodge then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(v2) == "0.1" then
                            repeat wait(.1)
                                setupvalue(v,i2,0)
                            until not nododgecool
                            end
                        end
                    end
                end
            end
        end
    end
    
    function fly()
        local mouse=game:GetService("Players").LocalPlayer:GetMouse''
        localplayer=game:GetService("Players").LocalPlayer
        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        local speedSET=25
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                    wait()
                    localplayer.Character.Humanoid.PlatformStand=true
                    local new=gyro.CFrame - gyro.CFrame.p + pos.position
                    if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=1
                    end
                    if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+speedSET
                    end
                    if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+speedSET
                    end
                    if speed>speedSET then
                    speed=speedSET
                    end
                    pos.position=new.p
                    if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                    elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                    else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
            until not Fly
            if gyro then 
                    gyro:Destroy() 
            end
            if pos then 
                    pos:Destroy() 
            end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=0
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then 
                    flying=false e1:disconnect() e2:disconnect() return 
            end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start()
    end
    
    
    function Click()
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    
    function AutoHaki()
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
    
    function UnEquipWeapon(Weapon)
        if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
            game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        end
    end
    
    function EquipWeapon(ToolSe)
        if not game.Players.LocalPlayer.Character:FindFirstChild(ToolSe) then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end
    
    spawn(function()
		for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
			pcall(function()
				if v.Name == ("CurvedRing") or v.Name == ("SlashHit") or v.Name == ("SwordSlash") or v.Name == ("SlashTail") or v.Name == ("Sounds") then
					v:Destroy()
				end
			end)
		end
    end)
    
    function GetCountMaterials(matname)
	for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
		if type(v) == "table" then
			if v.Type == "Material" then
				if v.Name == matname then
					return v.Count
				end
			end
		end
	end
	return 0
end

function GetWeaponInventory(Weaponname)
	for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
		if type(v) == "table" then
			if v.Type == "Sword" then
				if v.Name == Weaponname then
					return true
				end
			end
		end
	end
	return false
end
    
        
function EquipWeaponSword()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end

    function GetDistance(target)
        return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end
    
    function BTP(p)
    	pcall(function()
	    	if (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1500 and not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
				repeat wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
					wait(.05)
					game.Players.LocalPlayer.Character.Head:Destroy()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
				until (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
			end
		end)
	end


function TelePPlayer(P)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
end
    
function TP(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/TweenSpeed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end

function TP1(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/TweenSpeed, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        if Distance <= 250 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end
    


function topos(p)
	task.spawn(function()
		pcall(function()
			if game:GetService("Players").LocalPlayer:DistanceFromCharacter(p.Position) <= 200 then 
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = p
				if game.Players.LocalPlayer.Character:FindFirstChild("Root") then
					game.Players.LocalPlayer.Character:FindFirstChild("Root"):Destroy();
					wait()
					topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
					wait()
					if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
					end
				end;
				if game.Players.LocalPlayer.Character:FindFirstChild("Root") then
					game.Players.LocalPlayer.Character:FindFirstChild("Root"):Remove();
				end;
			elseif not game.Players.LocalPlayer.Character:FindFirstChild("Root")then 
				local K = Instance.new("Part",game.Players.LocalPlayer.Character)
				K.Size = Vector3.new(1,0.5,1)
				K.Name = "Root"
				K.Anchored = true
				K.Transparency = 1
				K.CanCollide = false
				K.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0)
			end
			local r = game:GetService("Players").LocalPlayer
			local U = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
			local z = game:service("TweenService")
			local B = TweenInfo.new((p.Position-game.Players.LocalPlayer.Character.Root.Position).Magnitude/TweenSpeed,Enum.EasingStyle.Linear)
			local S,g = pcall(function()
				local q = z:Create(game.Players.LocalPlayer.Character.Root,B,{CFrame = p})
				q:Play()
			end)
			if _G.StopTween == true then
            q:Cancel()
            _G.Clip = false
        end
			if not S then 
				return g
			end
			game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			if S and game.Players.LocalPlayer.Character:FindFirstChild("Root") then 
				pcall(function()
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 50 then 
						task.spawn(function()
							pcall(function()
								if (game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 200 then 
									game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
								else 
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.Root.CFrame
								end
							end)
						end)
					elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 25 and(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 40 then 
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
					elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 25 then 
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
					end
				end)
			end
		end)
	end)    
end
task.spawn(function()
	while task.wait() do 
		pcall(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.Root.CFrame;
			if (game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1 then
				game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
			end
		end)
	end
end)



    


    function fastpos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        Speed = 1000
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
    end

    function slowpos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        Speed = 150
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
    end

    -- or (game:GetService("Workspace").Enemies:FindFirstChild("Shark") and _G.AutoKillShark) or (game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") and _G.AutoTerrorshark) or (game:GetService("Workspace").Enemies:FindFirstChild("Piranha") and _G.AutoKillPiranha) or (game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") and _G.AutoKillFishCrew)
    
    local stopboat = {}
function TPB(pos, boat)
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((boat.CFrame.Position - pos.Position).Magnitude/BoatSpeed, Enum.EasingStyle.Linear)
	tween = tween_s:Create(boat, info, {CFrame = pos})

    if (boat.CFrame.Position - pos.Position).Magnitude <= 25 then
        tween:Cancel()
    else
        tween:Play()
    end


	function stopboat:Stop()
		tween:Cancel()
	end

	return stopboat
end

function TPP(CFgo)
	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/TweenSpeed, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end


    
    
spawn(function()
    while wait(.1) do
		if Type == 1 then
			Pos = CFrame.new(0,PosY,-5)
		elseif Type == 2 then
			Pos = CFrame.new(5,PosY,0)
		elseif Type == 3 then
			Pos = CFrame.new(0,PosY,5)	
		elseif Type == 4 then
			Pos = CFrame.new(-5,PosY,0)
        end
        end
    end)

spawn(function()
    while wait() do
        Type = 1
        wait()
        Type = 2
        wait()
        Type = 3
        wait()
        Type = 4
        wait()
        Type = 5
        wait()
    end
end)


    -- spawn(function()
    --     while wait() do
    --         if (_G.AutoSeaBest and CheckSeaBeast()) then
    --             Pos = CFrame.new(math.random(-600, 600), math.random(0, 300), math.random(-600, 600))
    --         end
    --     end
    -- end)

    

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or FarmBoss or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.RaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or _G.Namfon or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate or Open_Color_Haki or _G.AutoTerrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member == true or _G.AutoFarmAllBoss or _G.TeleportKitsune or _G.RelzFishBoat or _G.CollectAzure or _G.AutoDarkCoat or _G.RelzPirateGrandBrigade or _G.RelzPirateBrigade then
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        local Noclip = Instance.new("BodyVelocity")
                        Noclip.Name = "BodyClip"
                        Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        Noclip.MaxForce = Vector3.new(100000,100000,100000)
                        Noclip.Velocity = Vector3.new(0,0,0)
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NoClip or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.AutoKai or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.RaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or _G.Namfon or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.TPB or _G.Farmfast or _G.AutoRace or _G.RaidPirate or Open_Color_Haki or _G.AutoTerrorshark or FarmShark or _G.farmpiranya or _G.SailBoat or _G.AutoFarmChest or _G.ChestBypass or _G.Fish_Crew_Member == true or _G.AutoFarmAllBoss or _G.TeleportKitsune or _G.RelzFishBoat or _G.CollectAzure or _G.AutoDarkCoat or _G.RelzPirateGrandBrigade or _G.RelzPirateBrigade then
                    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
    
   
    function InstancePos(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
    
    function TP3(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
    
    -- spawn(function()
    --     while wait() do
    --         if _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFactory or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NoClip or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.d or _G.Autowaden or _G.Autogay or _G.AutoObservationHakiV2 or _G.AutoFarmMaterial or _G.AutoFarmNearest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoRaidPirate or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or _G.AttackDummy or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Farmfast or _G.RaidPirate or _G.AutoTerrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member == true then
    --             pcall(function()
    --                 game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
    --             end)
    --         end    
    --     end
    -- end)
    
    spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoClick or Fastattack then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
   end)

    function StopTween(target)
        if not target then
            _G.StopTween = true
            wait()
            topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
            _G.StopTween = false
            _G.Clip = false
        end
        if game.Players.LocalPlayer.Character:FindFirstChild('Highlight') then
    		game.Players.LocalPlayer.Character:FindFirstChild('Highlight'):Destroy()
        end
    end
    
    spawn(function()
        pcall(function()
            while wait() do
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then 
                            SelectWeaponGun = v.Name
                        end
                    end
                end
            end
        end)
    end)
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)

local Tap1 = Windown.CreateTap({
	Title = "Chung",
	Icon = 15169955786
})

local Page1 = Tap1.CreatePage({
	Side = "Left",
})

local Page2 = Tap1.CreatePage({
	Side = "Right",
})

local Tap2 = Windown.CreateTap({
	Title = "Vật Phẩm",
	Icon = 10709769841
})

local Page3 = Tap2.CreatePage({
	Side = "Left",
})

local Page4 = Tap2.CreatePage({
	Side = "Right",
})

local Tap3 = Windown.CreateTap({
	Title = "Sự kiện biển",
	Icon = 10709761530
})

local Page5 = Tap3.CreatePage({
	Side = "Left",
})

local Page6 = Tap3.CreatePage({
	Side = "Right",
})

local Tap4 = Windown.CreateTap({
	Title = "Chỉ số",
	Icon = 10709770317
})

local Page7 = Tap4.CreatePage({
	Side = "Left",
})

local Page8 = Tap4.CreatePage({
	Side = "Right",
})

local Tap5 = Windown.CreateTap({
	Title = "Người chơi",
	Icon = 10734975486
})

local Page9 = Tap5.CreatePage({
	Side = "Left",
})

local Page10 = Tap5.CreatePage({
	Side = "Right",
})

local Tap6 = Windown.CreateTap({
	Title = "Tập kích",
	Icon = 10723345749
})

local Page11 = Tap6.CreatePage({
	Side = "Left",
})

local Page12 = Tap6.CreatePage({
	Side = "Right",
})

local Tap7 = Windown.CreateTap({
	Title = "Cửa hàng",
	Icon = 10734952479
})

local Page13 = Tap7.CreatePage({
	Side = "Left",
})

local Page14 = Tap7.CreatePage({
	Side = "Right",
})

local Tap8 = Windown.CreateTap({
	Title = "Linh tinh",
	Icon = 10723424838
})

local Page15 = Tap8.CreatePage({
	Side = "Left",
})

local Page16 = Tap8.CreatePage({
	Side = "Right",
})


Page1.CreateLable({
	Name = "trong phần cày chính nè"
})

    
local Time = Page1.CreateLable({
	Name = "Thời gian"
})


function UpdateTime()
local GameTime = math.floor(workspace.DistributedGameTime+0.5)
local Hour = math.floor(GameTime/(60^2))%24
local Minute = math.floor(GameTime/(60^1))%60
local Second = math.floor(GameTime/(60^0))%60
Time:Set("[GameTime] : Hours : "..Hour.." Min : "..Minute.." Sec : "..Second)
end

spawn(function()
while task.wait() do
pcall(function()
UpdateTime()
end)
end
end)


Page1.CreateLable({
	Name = "cài đặt cày"
})

Page1.CreateDropdown({
	Name = "Select Tool",
	Value = "Melee",
	List = {"Melee","Sword","Fruit","Gun"},
	Callback = function(v)
	    _G.SelectWeapon = v
		print(v)
	end,
})
_G.SelectWeapon = "Melee" 


task.spawn(function()
	while wait() do
		pcall(function()
			if _G.SelectWeapon == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Gun" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Gun" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			end
		end)
	end
    end)
    
    Page1.CreateDropdown({
	Name = "Farm Mode",
	Value = "Quest",
	List = {"Quest", "No Quest"},
	Callback = function(v)
	FarmMode = v
		print(v)
	end,
})

FarmMode = "Quest"

   
Page1.CreateLable({
	Name = "Cày các thứ"
})
   
   
    Page1.CreateToggle({
	Name = "tự động cày cấp",
	Dis = "",
	Value = false,
	Callback = function(v)
	    _G.AutoFarm = v
	    StopTween(_G.AutoFarm)
		print(v)
	end,
})


Page1.CreateToggle({
	Name = "tự động đánh quái ở đảo của bạn",
	Dis = "",
	Value = false,
	Callback = function(v)
	    _G.AutoFarmNearest = v
	    StopTween(_G.AutoFarmNearest)
		print(v)
	end,
})


    spawn(function()
        while wait() do
            if FarmMode == "Quest" and _G.AutoFarm then
                pcall(function()
                    CheckQuest()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then
						BTP(CFrameQuest)
						elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 1500 then
						topos(CFrameQuest)
						end
					else
						topos(CFrameQuest)
					end
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 5 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            repeat task.wait(_G.FastAttackDelay)
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()                                            
                                                PosMon = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                                StartBring = true
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                                AttackNoCD()
                                            until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            StartBring = false
                                        end
                                    end
                                end
                            end
                        else
                            topos(CFrameMon)
                            UnEquipWeapon(_G.SelectWeapon)
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            end
                        end
                    end
                end)
            end
        end
    end)
    



        spawn(function()
            while wait() do
                if _G.AutoFarmNearest then
                    pcall(function()
                        for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if v.Name then
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                                    repeat wait(_G.FastAttackDelay)
                                    StartBring = true
                                    AttackNoCD()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    v.HumanoidRootPart.Size = Vector3.new(1,1,1)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid.JumpPower = 0
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    PosMon = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.AutoFarmNearest or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
                                    StartBring = false
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
    
    spawn(function()
        while wait() do
            if FarmMode == "No Quest" and _G.AutoFarm then
                pcall(function()
                CheckQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Mon then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        StartMagnet = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        MonFarm = v.Name
                                        AttackNoCD()
                                    until not  _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                                    StartMagnet = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude > 1500 then
			        BTP(CFrameMon)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude < 1500 then
				    topos(CFrameMon)
					end
				else
				    topos(CFrameMon)
	    		end
                    UnEquipWeapon(_G.SelectWeapon)
                        if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)

if World1 then
    Page1.CreateToggle({
	Name = "Cày nhanh chủ yếu từ lv1 đến lv300",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Farmfast = v
	    StopTween(_G.Farmfast)
		print(v)
	end,
})
    
    spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast and World1 then
					if game.Players.LocalPlayer.Data.Level.Value >= 10 then
					    _G.AutoFarm = false
					    _G.Farmfast = true
					end
				end
			end
		end)
	end)
	
    spawn(function()
        while wait() do
            if _G.Farmfast and World1 then
                pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 10 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Shanda" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                    until not _G.Farmfast or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                    topos(CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531))
                                    UnEquipWeapon(_G.SelectWeapon)
                                end
                            end
                        end
                    
                    end
                end)
            end
        end
    end)
	
	spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast and World1 then
					if game.Players.LocalPlayer.Data.Level.Value >= 75 then
						_G.AutoFarm = true
						_G.Farmfast = false
					end
				end
			end
		end)
	end)
end
   
    

Page1.CreateLable({
	Name = "Mastery"
})

Page1.CreateDropdown({
	Name = "Mastery Mode",
	Value = "Quest",
	List = {"Quest", "Near"},
	Callback = function(v)
	SelectedMasteryMode = v
		print(v)
	end,
})

Page1.CreateToggle({
	Name = "tự động cày thông thạo trái ác quỷ",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoFarmFruitMastery = v
	    StopTween(_G.AutoFarmFruitMastery)
		print(v)
	end,
})


   Page1.CreateToggle({
	Name = "tự động cày thông thạo súng",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoFarmGunMastery = v
	    StopTween(_G.AutoFarmGunMastery)
		print(v)
	end,
})


    
    
if World1 then
	tableMon = {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
elseif World2 then
	tableMon = {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
elseif World3 then
	tableMon = {"Pirate Millionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy","Peanut Scout","Peanut President","Ice Cream Chef","Ice Cream Commander","Cookie Crafter","Cake Guard","Baking Staff","Head Baker","Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel","Candy Pirate","Snow Demon","Isle Outlaw","Island Boy","Sun-kissed Warrior","Isle Champion"}
end


Page1.CreateLable({
	Name = "Đánh quái theo lựa chọn"
})


    Page1.CreateDropdown({
	Name = "Chọn quái để đánh",
	Value = "tableMon",
	List = tableMon,
	Callback = function(v)
	_G.SelectMob = v
		print(v)
	end,
})
    
    Page1.CreateToggle({
	Name = "tự động đánh quái đã chọn",
	Dis = "",
	Value = false,
	Callback = function(v)
	    _G.AutoFarmMob = v
	    StopTween(_G.AutoFarmMob)
		print(v)
	end,
})

    spawn(function()
        while wait() do
            if _G.AutoFarmMob then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectMob) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == _G.SelectMob then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                    until not _G.AutoFarmMob or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                        if string.find(v.Name, _G.SelectMob) then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
                                topos(v.CFrame * CFrame.new(5,10,2))
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

    Page1.CreateLable({
	Name = "Đánh boss"
})

local Boss = {}

for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if string.find(v.Name, "Boss") then
        if v.Name == "Ice Admiral" then
            else
            table.insert(Boss, v.Name)
        end
    end
end

local bossCheck = {}
local bossNames = { "The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader", "Vice Admiral", "Warden", "Chief Warden", "Swan", "Saber Expert", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Greybeard", "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Order", "Darkbeard", "Cursed Captain", "Stone", "Island Empress", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Longma", "Cake Queen", "Soul Reaper", "Rip_Indra", "Cake Prince", "Dough King" }


if World1 or World2 or World3 then
    for _, bossName in pairs(bossNames) do
        if game:GetService("ReplicatedStorage"):FindFirstChild(bossName) then
            table.insert(bossCheck, bossName)
        end
    end
end

for _, name in pairs(Boss) do
    table.insert(bossCheck, name)
end


local BossName = Page1.CreateDropdown({
	Name = "chọn boss để đánh",
	Value = "tableBoss",
	List = bossCheck,
	Callback = function(v)
	_G.SelectBoss = v
		print(v)
	end,
})

Page1.CreateButton({
	Name = "reset tên các boss ở trong sever",
	Callback = function()
		BossName:Clear()
        wait(0.1)
        for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if (v.Name == "rip_indra" or v.Name == "Ice Admiral")
                        or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg")
                        or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard")
                        or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
                BossName:Add(v.Name)
            end
        end
	end,
})

    Page1.CreateToggle({
	Name = "đánh boss đã chọn",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoFarmBoss = v
	    StopTween(_G.AutoFarmBoss)
		print(v)
	end,
})

Page1.CreateToggle({
	Name = "có nhận nhiệm vụ boss đó không",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoQuestBoss = v
		print(v)
	end,
})

    spawn(function()
        while wait() do
            if _G.AutoFarmBoss and not _G.AutoQuestBoss then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == _G.SelectBoss then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameBoss.Position).Magnitude > 1500 then
			        BTP(CFrameBoss)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameBoss.Position).Magnitude < 1500 then
				    topos(CFrameBoss)
					end
				else
				    topos(CFrameBoss)
				end
                        if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                        end
                    end
                end)
            end
        end
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoFarmBoss and _G.AutoQuestBoss then
                pcall(function()
                    CheckBossQuest()
                    local QuestBoss = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestBoss, NameBoss) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuestBoss.Position).Magnitude > 1500 then
						BTP(CFrameQuestBoss)
						elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuestBoss.Position).Magnitude < 1500 then
						topos(CFrameQuestBoss)
						end
					else
						topos(CFrameQuestBoss)
					end
                    if (CFrameQuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then                            
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, LevelQuestBoss)
					end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == _G.SelectBoss then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
                                            repeat task.wait(_G.FastAttackDelay)
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()                                            
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                                AttackNoCD()
                                            until not _G.AutoFarmBoss or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            topos(CFrameBoss)
                            if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                             topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(15,10,2))
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Page1.CreateToggle({
	Name = "đánh tất cả boss trong sever",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoFarmAllBoss = v
	    StopTween(_G.AutoFarmAllBoss)
		print(v)
	end,
})

    
    spawn(function()
        while wait() do
            if _G.AutoFarmAllBoss then
                pcall(function()
                    for i,boss in pairs(bossNames) do
                    if game:GetService("Workspace").Enemies:FindFirstChild(boss) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == boss then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.AutoFarmAllBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild(boss) then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(boss).HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                        end
                    end
                    end
                end)
            end
        end
    end)
if World3 then
    Page1.CreateLable({
	Name = "boss bí ẩn"
})
    
    spawn(function()
        pcall(function()
            while wait() do
                EliteProgress:Set("Elite Progress : "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
            end
        end)
    end)
    
  EliteProgress = Page1.CreateLable({
	Name = "Elite Progress"
})

Elite_Hunter_Status = Page1.CreateLable({
	Name = "Status"
})

	spawn(function()
		while wait() do
			pcall(function()
				if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
					Elite_Hunter_Status:Set("Status : Elite Spawn!")	
				else
					Elite_Hunter_Status:Set("Status : Elite Not Spawn")	
				end
			end)
		end
	end)

    Page1.CreateToggle({
	Name = "tự động đánh boss bí ẩn",
	Dis = "",
	Value = false,
	Callback = function(v)
	    _G.AutoElitehunter = v
	    StopTween(_G.AutoElitehunter)
		print(v)
	end,
})

    
    local Elite = CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188)
    
    spawn(function()
        while wait() do
            if _G.AutoElitehunter and World3 then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Elite.Position).Magnitude > 1500 then
						BTP(Elite)
						elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Elite.Position).Magnitude < 1500 then
						topos(Elite)
						end
					else
						topos(Elite)
					end
                    if (Vector3.new(-5418.892578125, 313.74130249023, -2826.2260742188)-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if string.find(QuestTitle,"Diablo") or string.find(QuestTitle,"Deandre") or string.find(QuestTitle,"Urban") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat task.wait(_G.FastAttackDelay)
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                AttackNoCD()
                                                -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            until _G.AutoElitehunter == false or v.Humanoid.Health <= 0 or not v.Parent
                                        end
                                    end
                                end
                            else
                                if BypassTP then
                                   if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                       BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                   elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                       BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                   elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                       BTP(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                   end
                               else
                                   if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                       topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                   elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                       topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                   elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                       topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2,20,2))         
                                   end
                                end
                            end                    
                        end
                    end
                end)
            end
        end
    end)

    Page1.CreateLable({
	Name = "bone farm"
})

    Page1.CreateDropdown({
	Name = "chọn chế độ",
	Value = "No Quest",
	List = {"No Quest","Quest","MasteryFruit"},
	Callback = function(v)
	BoneFMode = v
		print(v)
	end,
})
BoneFMode = "No Quest"

Page1.CreateToggle({
	Name = "tự động cày xương",
	Dis = "",
	Value = false,
	Callback = function(v)
	    _G.Auto_Bone = v
	    StopTween(_G.Auto_Bone)
		print(v)
	end,
})
    
       local BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
        spawn(function()
            while wait() do 
                if BoneFMode == "No Quest" and _G.Auto_Bone and World3 then
                    pcall(function()
                        if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                            StartBring = false
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                   if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                       repeat task.wait(_G.FastAttackDelay)
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false 
                                            StartBring = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            AttackNoCD()
                                        until not _G.Auto_Bone or not v.Parent or v.Humanoid.Health <= 0
                                        StartBring = false
                                    end
                                end
                            end
                        else
                        if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude > 1500 then
                        BTP(BonePos)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude < 1500 then
                        topos(BonePos)
                        end
                        else
                        topos(BonePos)
                        end
                            UnEquipWeapon(_G.SelectWeapon)
                            topos(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375))
                        end
                    end)
                end
            end
        end)    
        
        local BoneQuestPos = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    
        spawn(function()
            while wait() do
                if  BoneFMode == "Quest" and _G.Auto_Bone and World3  then
                    pcall(function()
                        local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                        if not string.find(QuestTitle, "Demonic Soul") then
                            StartBring = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            StartBring = false
                            if BypassTP then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude > 1500 then
                            BTP(BoneQuestPos)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude < 1500 then
                            topos(BoneQuestPos)
                            end
                        else
                            topos(BoneQuestPos)
                        end
                        if (BoneQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then    
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","HauntedQuest2",1)
                            end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                                repeat task.wait(_G.FastAttackDelay)
                                                    EquipWeapon(_G.SelectWeapon)
                                                    AutoHaki()                                            
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    MonFarm = v.Name
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                    StartBring = true
                                                    AttackNoCD()
                                                until not _G.Auto_Bone or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                                StartBring = false
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
        
        spawn(function()
            while wait() do
                if BoneFMode == "MasteryFruit" and _G.Auto_Bone and World3 then
                    pcall(function()
                        local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                        if not string.find(QuestTitle, "Demonic Soul") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            if BypassTP then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude > 1500 then
                            BTP(BoneQuestPos)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude < 1500 then
                            topos(BoneQuestPos)
                            end
                        else
                            topos(BoneQuestPos)
                        end
                        if (BoneQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then                            
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","HauntedQuest2",1)
                        end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                                HealthMs = v.Humanoid.MaxHealth * _G.Kill_At/100
                                                repeat task.wait()
                                                    if v.Humanoid.Health <= HealthMs then
                                                        EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                        TP1(v.HumanoidRootPart.CFrame * CFrame.new(0,15,0))
                                                        UseSkill = true
                                                        Skillaimbot = true
                                                    else
                                                        UseSkill = false 
                                                        Skillaimbot = false
                                                        EquipWeapon(_G.SelectWeapon)
                                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                                    end
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    AimBotSkillPosition = PosMon.Position
                                                    MonFarm = v.Name
                                                    StartBring = true
                                                    AutoHaki()
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                    NormalAttack()
                                                until not _G.Auto_Bone or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                                StartBring = false
                                                Skillaimbot = false
                                                UseSkill = false
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
    
Page1.CreateToggle({
	Name = "tự động random xương",
	Dis = "",
	Value = false,
	Callback = function(v)
	    _G.Auto_Random_Bone = v
		print(v)
	end,
})
        
        spawn(function()
            pcall(function()
                while wait(.1) do
                    if _G.Auto_Random_Bone then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                    end
                end
            end)
        end)
        
Page1.CreateToggle({
	Name = "tự động cầu nguyện",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Pray = v
	    StopTween(_G.Pray)
		print(v)
	end,
})
        
        spawn(function()
            pcall(function()
                while wait(.1) do
                    if _G.Pray then    
                        TP1(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",1)
                    end
                end
            end)
        end)
        
Page1.CreateToggle({
	Name = "tự động thử vận may",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Trylux = v
	    StopTween(_G.Trylux)
		print(v)
	end,
})

        
        spawn(function()
            pcall(function()
                while wait(.1) do
                    if _G.Trylux then    
                        TP1(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2)
                    end
                end
            end)
        end)
        end
    
Page1.CreateLable({
	Name = "Chest Farm"
})
    
Page1.CreateToggle({
	Name = "nhặt rương loại bay",
	Dis = "",
	Value = false,
	Callback = function(v)
	    _G.AutoFarmChest = v
	    StopTween(_G.AutoFarmChest)
		print(v)
	end,
})

 
 _G.MagnitudeAdd = 0
spawn(function()
	while wait() do 
		if _G.AutoFarmChest then
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
				if v.Name:find("Chest") then
					if game:GetService("Workspace"):FindFirstChild(v.Name) then
						if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000+_G.MagnitudeAdd then
							repeat wait()
								if game:GetService("Workspace"):FindFirstChild(v.Name) then
									topos(v.CFrame)
								end
								if (v.CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1 then
								EquipWeapon(_G.SelectWeapon)
								wait(.5)
								game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
								end
							until AutoFarmChest == false or not v.Parent
							topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
							_G.MagnitudeAdd = _G.MagnitudeAdd+1500
							break
						end
					end
				end
			end
		end
	end
end)

Page1.CreateToggle({
	Name = "nhặt rương loại dịch chuyển",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.ChestBypass = v
	    StopTween(_G.ChestBypass)
		print(v)
	end,
})

Page1.CreateToggle({
	Name = "dừng khi có item",
	Dis = "Stop When Found God's Chalice",
	Value = false,
	Callback = function(v)
	    _G.StopItemsChest = v
		print(v)
	end,
})


spawn(function()
    while wait() do
        pcall(function()
            if _G.StopItemsChest then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
                    _G.ChestBypass = false
                    topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
            end
        end)
    end
end)
spawn(function()
    while wait(10) do
        pcall(function()
            if _G.ChestBypass then
                    game.Players.LocalPlayer.Character.Head:Destroy()
            end
        end)
    end
end)

Page1.CreateToggle({
	Name = "nhặt rương trên đảo kì bí",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoChestMirage = v
	    StopTween(_G.AutoChestMirage)
		print(v)
	end,
})

 
--ByOakkXHub
_G.MagnitudeAdd = 0
spawn(function()
	while wait() do 
		if _G.AutoChestMirage then
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
				if v.Name:find("FragChest") then
					if game:GetService("Workspace"):FindFirstChild(v.Name) then
						if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000+_G.MagnitudeAdd then
							repeat wait()
								if game:GetService("Workspace"):FindFirstChild(v.Name) then
									topos(v.CFrame)
								end
							until _G.AutoChestMirage == false or not v.Parent
							topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
							_G.MagnitudeAdd = _G.MagnitudeAdd+1500
							break
						end
					end
				end
			end
		end
	end
end)


_G.MagnitudeAdd = 0
spawn(function()
	while wait() do 
		if _G.ChestBypass then
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
				if v.Name:find("Chest") then
					if game:GetService("Workspace"):FindFirstChild(v.Name) then
						if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000+_G.MagnitudeAdd then
							repeat wait()
								if game:GetService("Workspace"):FindFirstChild(v.Name) then
									TP3(v.CFrame)
								end
							until AutoFarmChest == false or not v.Parent
							topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
							_G.MagnitudeAdd = _G.MagnitudeAdd+1500
							break
						end
					end
				end
			end
		end
	end
end)


if World3 then
Page1.CreateLable({
	Name = "Bột farm"
})
	
MobKilled = Page1.CreateLable({
	Name = "มอปคิวอีดี"
})
    
    spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41)) - 500)
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),40,41)) - 500)
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),41,41)) - 500)
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                    MobKilled:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                    MobKilled:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                    MobKilled:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39))
                else
                    MobKilled:Set("Boss Is Spawning")
                end
            end)
        end
    end)
    
Page1.CreateToggle({
	Name = "tự động farm katakuri v1",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoDoughtBoss = v
	    StopTween(_G.AutoDoughtBoss)
		print(v)
	end,
})
    
    local CakePos = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
    spawn(function()
        while wait() do
            if _G.AutoDoughtBoss then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Prince" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else                               
                            if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                repeat task.wait(_G.FastAttackDelay)
                                                    AutoHaki()
                                                    StartBring = true
                                                    EquipWeapon(_G.SelectWeapon)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false 
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    MonFarm = v.Name
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    AttackNoCD()
                                                until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") 
                                                StartBring = false
                                            end
                                        end
                                    end
                                else
                                if BypassTP then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude > 1500 then
						        BTP(CakePos)
						        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude < 1500 then
						        topos(CakePos)
						        end
					            else
						        topos(CakePos)
					            end
                                    UnEquipWeapon(_G.SelectWeapon)
                                    topos(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
      
                        MagnetDought = false
                                    UnEquipWeapon(_G.SelectWeapon)
                                    topos(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375) * Check)
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                        else
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff") then
                                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                            else
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker") then
                                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                                end
                                            end
                                        end
                                    end                       
                                end
                            else
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                                    topos(game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)    
    
    Page1.CreateToggle({
	Name = "tự động triệu hồi",
	Dis = "Auto Spwan",
	Value = true,
	Callback = function(v)
	_G.AutoSpawnCP = v
		print(v)
	end,
})



    
    spawn(function() 
    while wait(5) do
    if _G.AutoSpawnCP and game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",true)
    end
    end
    end) 
    
    
   
Page1.CreateToggle({
	Name = "tự động farm katakuri v2",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Autodoughking = v
	    StopTween(_G.Autodoughking)
		print(v)
	end,
})

    
    spawn(function()
        while wait() do
            if  _G.Autodoughking and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Dough King" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Autodoughking or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end
    
    -- local Client = game.Players.LocalPlayer
    -- local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
    -- local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
    -- spawn(function()
    --     while task.wait() do
    --         pcall(function()
    --             if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end
    --             if not shared.cpc then shared.cpc = STOP.play end
    --                 STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
    --                 local Hits = STOPRL.getBladeHits(b,c,d)
    --                 if Hits then
    --                     if _G.FastAttack or not _G.FastAttack then
    --                         STOP.play = function() end
    --                         a:Play(0.01,0.01,0.01)
    --                         func(Hits)
    --                         STOP.play = shared.cpc
    --                         wait(a.length * 0.5)
    --                         a:Stop()
    --                     else
    --                         a:Play()
    --                     end
    --                 end
    --             end
    --         end)
    --     end
    -- end)
    
Page2.CreateLable({
	Name = "Settings"
})

Page2.CreateSlider({
	Name = "Khoảng cách farm",
	Max = 50,
	Min = 1,	
	Value = 20,
	Format = function(v)
	PosY = v
		print(v)
	end,
})

Page2.CreateToggle({
	Name = "gôm quái",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.BringMonster = v
		print(v)
	end,
})

Page2.CreateDropdown({
	Name = "chọn gôm quái",
	Value = "Normal",
	List = {"Low", "Normal", "High"},
	Callback = function(v)
	_G.BringMode = v
		print(v)
	end,
})
_G.BringMode = "Normal"

spawn(function()
    while wait(.1) do
        if _G.BringMode then
            pcall(function()
                if _G.BringMode == "Low" then
                    _G.BringMode = 250
                elseif _G.BringMode == "Normal" then
                    _G.BringMode = 400
                elseif _G.BringMode == "High" then
                    _G.BringMode = 463
                end
            end)
        end
    end
end)
    
Page2.CreateToggle({
	Name = "đánh nhanh",
	Dis = "",
	Value = true,
	Callback = function(v)
	Fast_Attack = v
	DamageAura = v
		print(v)
	end,
})

NoAttackAnimation = true
local DmgAttack = game:GetService("ReplicatedStorage").Assets.GUI:WaitForChild("DamageCounter")
local PC = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local RL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
local oldRL = RL.wrapAttackAnimationAsync
RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
	if not NoAttackAnimation then
		return oldRL(a,b,c,60,func)
	end

	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i,v in pairs(Characters) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
			table.insert(Hits,Human.RootPart)
		end
	end
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i,v in pairs(Enemies) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
			table.insert(Hits,Human.RootPart)
		end
	end
	a:Play(0.01,0.01,0.01)
	pcall(func,Hits)
end

getAllBladeHits = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i,v in pairs(Enemies) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end)

getAllBladeHitsPlayers = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i,v in pairs(Characters) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end)

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigEven = game:GetService("ReplicatedStorage").RigControllerEvent
local AttackAnim = Instance.new("Animation")
local AttackCoolDown = 0
local cooldowntickFire = 0
local MaxFire = 1000
local FireCooldown = 0.01
local FireL = 0
local bladehit = {}

CancelCoolDown = LPH_JIT_MAX(function()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		AttackCoolDown = tick() + (FireCooldown or 0.01) + ((FireL/MaxFire)*0.3)
		RigEven.FireServer(RigEven,"weaponChange",ac.currentWeaponModel.Name)
		FireL = FireL + 1
		fask.delay((FireCooldown or 0.01) + ((FireL+0.3/MaxFire)*0.3),function()
			FireL = FireL - 1
		end)
	end
end)

AttackFunction = LPH_JIT_MAX(function(typef)
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		local bladehit = {}
		if typef == 1 then
			bladehit = getAllBladeHits(60)
		elseif typef == 2 then
			bladehit = getAllBladeHitsPlayers(65)
		else
			for i2,v2 in pairs(getAllBladeHits(55)) do
				table.insert(bladehit,v2)
			end
			for i3,v3 in pairs(getAllBladeHitsPlayers(55)) do
				table.insert(bladehit,v3)
			end
		end
		if #bladehit > 0 then
			pcall(fask.spawn,ac.attack,ac)
			if tick() > AttackCoolDown then
				CancelCoolDown()
			end
			if tick() - cooldowntickFire > 0.1 then
				ac.timeToNextAttack = 0
				ac.hitboxMagnitude = 60
				pcall(fask.spawn,ac.attack,ac)
				cooldowntickFire = tick()
			end
			local AMI3 = ac.anims.basic[3]
			local AMI2 = ac.anims.basic[2]
			local REALID = AMI3 or AMI2
			AttackAnim.AnimationId = REALID
			local StartP = ac.humanoid:LoadAnimation(AttackAnim)
			StartP:Play(0.01,0.01,0.01)
			RigEven.FireServer(RigEven,"hit",bladehit,AMI3 and 3 or 2,"")
			fask.delay(0.01,function()
				StartP:Stop()
			end)
		end
	end
end)

function CheckStun()
	if game:GetService('Players').LocalPlayer.Character:FindFirstChild("Stun") then
		return game:GetService('Players').LocalPlayer.Character.Stun.Value ~= 0
	end
	return false
end

LPH_JIT_MAX(function()
	spawn(function()
		while game:GetService("RunService").Stepped:Wait() do
			local ac = CombatFrameworkR.activeController
			if ac and ac.equipped and not CheckStun() then
				if NeedAttacking and Fast_Attack then
					fask.spawn(function()
						pcall(fask.spawn,AttackFunction,1)
					end)
				elseif DamageAura then
					fask.spawn(function()
						pcall(fask.spawn,AttackFunction,3)
					end)
				elseif UsefastattackPlayers and Fast_Attack then
					fask.spawn(function()
						pcall(fask.spawn,AttackFunction,2)
					end)
				elseif NeedAttacking and Fast_Attack == false then
					if ac.hitboxMagnitude ~= 55 then
						ac.hitboxMagnitude = 55
					end
					pcall(fask.spawn,ac.attack,ac)
				end
			end
		end
	end)
end)()
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    
inmyselfss = LPH_JIT_MAX(function(name)
    local player = game:GetService("Players").LocalPlayer
    local tool = player.Backpack:FindFirstChild(name) or player.Character:FindFirstChild(name)
    if tool then
        return tool
    end
    for _, v in pairs(player.Character:GetChildren()) do
        if v:IsA("Tool") and v.Name == name then
            return v
        end
    end
    return nil
end)

fask.spawn(function()
    if hookfunction and not islclosure(hookfunction) then
        workspace:WaitForChild("_WorldOrigin").ChildAdded:Connect(function(v)
            if v.Name == 'DamageCounter' then
                v.Enabled = false
            end
        end)
        hookfunction(require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule")).ChangeDisplayedNPC, function() end)
        task.spawn(function()
            local success, result
            repeat
                success, result = pcall(function()
                    for _, v in pairs(getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2].activeController.data) do
                        if typeof(v) == 'function' then
                            hookfunction(v, function() end)
                        end
                    end
                end)
                task.wait(1.5)
            until success
        end)
        
        abc = true

        task.spawn(function()
            local player = game.Players.LocalPlayer
            local particle = require(player.PlayerScripts.CombatFramework.Particle)
            local rigLib = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
            shared.orl = shared.orl or rigLib.wrapAttackAnimationAsync
            shared.cpc = shared.cpc or particle.play
            if abc then
                pcall(function()
                    rigLib.wrapAttackAnimationAsync = function(d, e, f, g, h)
                        local hits = rigLib.getBladeHits(e, f, g)
                        if hits then
                            particle.play = function() end
                            d:Play(0.1, 0.1, 0.1)
                            h(hits)
                            particle.play = shared.cpc
                            wait(0.5)
                            d:Stop()
                        end
                    end
                end)
            end
        end)
        
        --[[
        task.delay(math.random(30, 60), function()
            for _, v2 in pairs(game.ReplicatedStorage.Effect.Container:GetDescendants()) do
                pcall(function()
                    if v2.ClassName == 'ModuleScript' and typeof(require(v2)) == 'function' then
                        hookfunction(require(v2), function() end)
                    end
                end)
            end
        end)
        ]]
    end
end)
Page2.CreateDropdown({
    Name = "chọn tốc độ đánh(ko chọn = fast banana)",
    Value = "Xeter Attack",
    List = {"Normal Attack", "Fast Attack", "Super Attack", "Xeter Attack"},
    Callback = function(v)
        FireCooldown = v
        print(v)
    end,
})

spawn(function()
    while wait() do
        if FireCooldown then
            pcall(function()
                if FireCooldown == "Normal Attack" then
                    FireCooldown = 0.1
                elseif FireCooldown == "Fast Attack" then
                    FireCooldown = 0.07
                elseif FireCooldown == "Super Attack" then
                    FireCooldown = 0.04
                elseif FireCooldown == "Xeter Attack" then
                    FireCooldown = 0.02
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if FireCooldown then
            pcall(function()
                if FireCooldown == "Normal Attack" then
                    FireCooldown = 0.1
                elseif FireCooldown == "Fast Attack" then
                    FireCooldown = 0.07
                elseif FireCooldown == "Super Attack" then
                    FireCooldown = 0.04
                elseif FireCooldown == "Xeter Attack" then
                    FireCooldown = 0.02
                end
            end)
        end
    end
end)


Page2.CreateToggle({
	Name = "xóa thông báo",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.HideNotification = v
		print(v)
	end,
})

spawn(function()
	while wait() do
		if _G.HideNotification then
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
		else
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
		end
	end
end)


Page2.CreateToggle({
	Name = "xóa bỏ văn bản",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.KobenHeegeen = v
		print(v)
	end,
})


spawn(function()
	while wait() do
		if _G.KobenHeegeen then
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
		else
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
		end
	end
end)


Page2.CreateToggle({
	Name = "màn hình đen",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.StartBlackScreen = v
		print(v)
	end,
})

spawn(function()
	while wait() do
		if _G.StartBlackScreen then
			game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(500, 0, 500, 500)
		else
			game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(1, 0, 500, 500)
		end
	end
end)
   
Page2.CreateToggle({
	Name = "màn hình trắng",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.WhiteScreen = v
		print(v)
	end,
})

if _G.WhiteScreen == true then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
elseif _G.WhiteScreen == false then
    game:GetService("RunService"):Set3dRenderingEnabled(true)
end

-- spawn(function()
--     for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
--         if v.Name == "Death" or v.Name == "Spawn" then
--             v:Destroy()
--         end
--     end
-- end)
    
Page2.CreateSlider({
	Name = "tốc độ bay",
	Max = 1000,
	Min = 1,	
	Value = 400,
	Format = function(v)
	    TweenSpeed = v
		print(v)
	end,
})

Page2.CreateLable({
	Name = "Mastery Set"
})
    
    
	
Page2.CreateToggle({
	Name = "kỹ năng Z",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillZ = v
		print(v)
	end,
}) 

Page2.CreateToggle({
	Name = "kỹ năng X",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillX = v
		print(v)
	end,
}) 

Page2.CreateToggle({
	Name = "kỹ năng C",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillC = v
		print(v)
	end,
}) 

Page2.CreateToggle({
	Name = "kỹ năng V",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillV = v
		print(v)
	end,
}) 

Page2.CreateToggle({
	Name = "kỹ năng F",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillF = v
		print(v)
	end,
}) 




Page2.CreateSlider({
	Name = "phần trăm máu",
	Max = 100,
	Min = 1,	
	Value = 25,
	Format = function(v)
	    _G.Kill_At = v
		print(v)
	end,
})
    
   
    Page2.CreateLable({
	Name = "Other"
})

   Page2.CreateToggle({
	Name = "dịch chuyển bypass",
	Dis = "",
	Value = false,
	Callback = function(v)
	BypassTP = v
		print(v)
	end,
})

Page2.CreateToggle({
	Name = "đăt điểm hồi sinh",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Set = v
		print(v)
	end,
})

spawn(function()
    while wait(.1) do
        if _G.Set then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end)
        end
    end
end)




Page2.CreateLable({
	Name = "Hold Skill"
})

Page2.CreateSlider({
	Name = "giữ kỹ năng Z",
	Max = 5,
	Min = 0,	
	Value = 1,
	Format = function(v)
	    _G.HoldSKillZ = v
		print(v)
	end,
})

Page2.CreateSlider({
	Name = "giữ kỹ năng X",
	Max = 5,
	Min = 0,	
	Value = 1,
	Format = function(v)
	    _G.HoldSKillX = v
		print(v)
	end,
})

   
Page2.CreateSlider({
	Name = "giữ kỹ năng C",
	Max = 5,
	Min = 0,	
	Value = 1,
	Format = function(v)
	    _G.HoldSKillC = v
		print(v)
	end,
})
    
Page2.CreateSlider({
	Name = "giữ kỹ năng V",
	Max = 5,
	Min = 0,	
	Value = 1,
	Format = function(v)
	    _G.HoldSKillV = v
		print(v)
	end,
})

Page2.CreateSlider({
	Name = "giữ kỹ năng F",
	Max = 5,
	Min = 0,	
	Value = 1,
	Format = function(v)
	    _G.HoldSKillF = v
		print(v)
	end,
})

    


if World1 or World2 then
    Page3.CreateLable({
	Name = "World"
})
end
    if World1 then
Page3.CreateToggle({
	Name = "tự động biển thứ hai",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoSecondSea = v
	    StopTween(_G.AutoSecondSea)
		print(v)
	end,
})

    
        spawn(function()
            while wait() do 
                if _G.AutoSecondSea then
                    pcall(function()
                        local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
                        if MyLevel >= 700 and World1 then
                            if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                                local CFrame1 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                                repeat topos(CFrame1) wait() until (CFrame1.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                                wait(0.5)
                                EquipWeapon("Key")
                                repeat topos(CFrame.new(1347.7124, 37.3751602, -1325.6488)) wait() until (Vector3.new(1347.7124, 37.3751602, -1325.6488)-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false
                                wait(0.5)
                            else
                                if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Ice Admiral" then
                                                if not v.Humanoid.Health <= 0 then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        OldCFrameSecond = v.HumanoidRootPart.CFrame
                                                        repeat task.wait(_G.FastAttackDelay)
                                                            AutoHaki()
                                                            EquipWeapon(_G.SelectWeapon)
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.Humanoid.WalkSpeed = 0
                                                            v.Head.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                            v.HumanoidRootPart.CFrame = OldCFrameSecond
                                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                                            AttackNoCD()
                                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                                        until not _G.AutoSecondSea or not v.Parent or v.Humanoid.Health <= 0
                                                    end
                                                else 
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                                end
                                            end
                                        end
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end

    if World2 then

Page3.CreateToggle({
	Name = "tự động biển thứ ba",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoThirdSea = v
	    StopTween(_G.AutoThirdSea)
		print(v)
	end,
})

    
        spawn(function()
            while wait() do
                if _G.AutoThirdSea then
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then
                            _G.AutoFarm = false
                            if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "General") == 0 then
                                topos(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
                                if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                                end
                                wait(1.8)
                                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "rip_indra" then
                                            OldCFrameThird = v.HumanoidRootPart.CFrame
                                            repeat task.wait(_G.FastAttackDelay)
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CFrame = OldCFrameThird
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                AttackNoCD()
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                                -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            until _G.AutoThirdSea == false or v.Humanoid.Health <= 0 or not v.Parent
                                        end
                                    end
                                elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                                    topos(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
    
    if World2 then
    
Page3.CreateToggle({
	Name = "tự động farm nhà máy",
	Dis = "Auto Factory",
	Value = false,
	Callback = function(v)
	_G.AutoFactory = v
	    StopTween(_G.AutoFactory)
		print(v)
	end,
})

        
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.AutoFactory then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Core" and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()         
                                        EquipWeapon(_G.SelectWeapon)           
                                        topos(CFrame.new(448.46756, 199.356781, -441.389252))                                  
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until v.Humanoid.Health <= 0 or _G.AutoFactory == false
                                end
                            end
                        else
                            topos(CFrame.new(448.46756, 199.356781, -441.389252))
                        end
                    end
                end)
            end
        end)
    elseif World3 then
    spawn(function()
        pcall(function()
            while wait() do
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
                    Mirragecheck:Set('✅ Mirage Island is Spawning')
                else
                    Mirragecheck:Set('❌ Mirage Island Not Spawn') 
                 end
            end
        end)
    end)

Page4.CreateLable({
	Name = "Mirage island"
})
Mirragecheck = Page4.CreateLable({
	Name = "Check Mirage"
})

Page4.CreateToggle({
	Name = "bay đến đảo bí ẩn",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoMysticIsland = v
	    StopTween(_G.AutoMysticIsland)
		print(v)
	end,
})
    
        spawn(function()
            pcall(function()
                while wait() do
                    if _G.AutoMysticIsland then
                        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                            topos(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z))
                        end
                    end
                end
            end)
        end)
        
Page4.CreateToggle({
	Name = "bay đến ông bán fruit",
	Dis = "Find Advanced Fruit Dealer",
	Value = false,
	Callback = function(v)
	_G.Miragenpc = v
	    StopTween(_G.Miragenpc)
		print(v)
	end,
})

Page4.CreateToggle({
	Name = "bay đến bánh răng",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.TweenMGear = v
	StopTween(_G.TweenMGear)
		print(v)
	end,
})

spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
                SetCheeask:Set('✅: Kitsunen Spwan')
            else
                SetCheeask:Set('❌: Kitsunen Not Found')
            end
        end
    end)
end)

Page4.CreateLable({
	Name = "Kitsune island"
})

SetCheeask = Page4.CreateLable({
	Name = "Kitsune Umm."
})


Page4.CreateToggle({
	Name = "bay đến đảo kitsune",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.TeleportKitsune = v
	    StopTween(_G.TeleportKitsune)
		print(v)
	end,
})
        
        spawn(function()
            while wait() do
                if _G.TeleportKitsune then
                    if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                        topos(game.Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * CFrame.new(0,0,10))
                    end
                end
            end
        end)
        
Page4.CreateToggle({
	Name = "nhặt lửa linh hồn",
	Dis = "Collect Azure Ember",
	Value = false,
	Callback = function(v)
	_G.CollectAzure = v
	    StopTween(_G.CollectAzure)
		print(v)
	end,
})
        
        spawn(function()
            while wait() do
                if _G.CollectAzure then
                    pcall(function()
                        if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                            fastpos(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                        end
                    end)
                end
            end
        end)

Page4.CreateSlider({
	Name = "đặt linh hồn",
	Max = 30,
	Min = 10,	
	Value = 20,
	Format = function(v)
	_G.SetToTradeAureEmber = v
		print(v)
	end,
})

Page4.CreateToggle({
	Name = "trade linh hồn",
	Dis = "Auto Trade Shrine",
	Value = false,
	Callback = function(v)
	_G.TradeAureEmber = v
		print(v)
	end,
})


        spawn(function()
            while wait() do
                if _G.TradeAureEmber then
                    pcall(function()
                        if GetCountMaterials("Azure Ember") >= _G.SetToTradeAureEmber then
                            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KitsuneStatuePray")
                        end
                    end)
                end
            end
        end)

spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Miragenpc then    
                    TweenNpc()
                end
            end
        end)
    end)


                function TweenNpc()
                    repeat
                        wait()
                    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                        AllNPCS = getnilinstances()
                        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                            table.insert(AllNPCS, v)
                        end
                        for r, v in pairs(AllNPCS) do
                            if v.Name == "Advanced Fruit Dealer" then
                                topos(v.HumanoidRootPart.CFrame)
                                end
                            end
                        end
                    end
                    



spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenMGear then
				if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
					for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
						if v:IsA("MeshPart")then 
                            if v.Material ==  Enum.Material.Neon then  
                                topos(v.CFrame)
                            end
                        end
					end
				end
			end
        end
    end)
end)


end  -- END OF WORLD CHECK

Page3.CreateLable({
	Name = "Fighting Style"
})
    
Page3.CreateToggle({
	Name = "tự động super human",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoSuperhuman = v
		print(v)
	end,
})
    
    spawn(function()
        pcall(function()
            while wait() do 
                if _G.AutoSuperhuman then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 150000 then
                        UnEquipWeapon("Combat")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end   
                    if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                        _G.SelectWeapon = "Superhuman"
                    end  
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                            _G.SelectWeapon = "Black Leg"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                            _G.SelectWeapon = "Electro"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                            _G.SelectWeapon = "Fishman Karate"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                            _G.SelectWeapon = "Dragon Claw"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end 
                    end
                end
            end
        end)
    end)
    
Page3.CreateToggle({
	Name = "tự động death step",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoDeathStep = v
		print(v)
	end,
})
    
    spawn(function()
        while wait() do wait()
            if _G.AutoDeathStep then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        _G.SelectWeapon = "Death Step"
                    end  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        _G.SelectWeapon = "Death Step"
                    end  
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
                        _G.SelectWeapon = "Black Leg"
                    end 
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                end
            end
        end
    end)
    
Page3.CreateToggle({
	Name = "tự động shark man karrate",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoDeathStep = v
		print(v)
	end,
})
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoSharkman then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
                            topos(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                        else 
                            Ms = "Tide Keeper"
                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then   
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then    
                                        OldCFrameShark = v.HumanoidRootPart.CFrame
                                        repeat task.wait(_G.FastAttackDelay)
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.Head.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            v.HumanoidRootPart.CFrame = OldCFrameShark
                                            topos(v.HumanoidRootPart.CFrame*CFrame.new(2,20,2))
                                            AttackNoCD()
                                            -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSharkman == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                                    end
                                end
                            else
                                topos(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202))
                                wait(3)
                            end
                        end
                    else 
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    end
                end
            end
        end)
    end)

Page3.CreateToggle({
	Name = "tự động electeic claw",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoElectricClaw = v
		print(v)
	end,
})

    
    spawn(function()
        pcall(function()
            while wait() do 
                if _G.AutoElectricClaw then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electric Claw") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            _G.SelectWeapon = "Electric Claw"
                        end  
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            _G.SelectWeapon = "Electric Claw"
                        end  
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then
                            _G.SelectWeapon = "Electro"
                        end 
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                    end
                end
                if _G.AutoElectricClaw then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                            if _G.AutoFarm == false then
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                                wait(2)
                                repeat task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            elseif _G.AutoFarm == true then
                                _G.AutoFarm = false
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                                wait(2)
                                repeat task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                _G.SelectWeapon = "Electric Claw"
                                wait(.1)
                                _G.AutoFarm = true
                            end
                        end
                    end
                end
            end
        end)
    end)

Page3.CreateToggle({
	Name = "tự động dragon talon",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoDragonTalon = v
		print(v)
	end,
})

    
    spawn(function()
        while wait() do
            if _G.AutoDragonTalon then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        _G.SelectWeapon = "Dragon Talon"
                    end  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        _G.SelectWeapon = "Dragon Talon"
                    end  
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 then
                        _G.SelectWeapon = "Dragon Claw"
                    end 
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                end
            end
        end
    end)

Page3.CreateToggle({
	Name = "tự động god human",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Auto_God_Human = v
		print(v)
	end,
})

spawn(function()
    while task.wait() do
		if _G.Auto_God_Human then
			pcall(function()
				if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Character:FindFirstChild("Superhuman").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
						end
					else
						Alert:create("Not Have Superhuman")
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
						end
					else
						Alert:create("Not Have Death Step")
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
						end
					else
						Alert:create("Not Have Sharkman Karate")
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
						end
					else
						Alert:create("Not Have Electric Claw")
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon").Level.Value >= 400 then
							if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true), "Bring") then
								Alert:create("Not Have Enough Material")
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
							end
						end
					else
						Alert:create("Not Have Dragon Talon")
					end
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
				end
			end)
		end
	end
end)

Page3.CreateLable({
	Name = "Material"
})

if World2 then
Page3.CreateToggle({
	Name = "tự động farm chất phóng xạ",
	Dis = "",
	Value = false,
	Callback = function(v)
	Radioactive = v
	StopTween(Radioactive)
		print(v)
	end,
})


local MaterialsPos1 = CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312)
    spawn(function()
        while wait() do
            if Radioactive and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Factory Staff") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Factory Staff" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                    until not Radioactive or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos1.Position).Magnitude > 1500 then
			        BTP(MaterialsPos1)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos1.Position).Magnitude < 1500 then
				    topos(MaterialsPos1)
					end
				else
				    topos(MaterialsPos1)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Factory Staff") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Factory Staff").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end
  
if World2 then  
Page3.CreateToggle({
	Name = "tự động farm giọt Huyền Bí",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Makori_gay = v
	StopTween(_G.Makori_gay)
		print(v)
	end,
})


local MaterialsPos2 = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
spawn(function()
        while wait() do
            if _G.Makori_gay and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Water Fighter" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.Makori_gay or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos2.Position).Magnitude > 1500 then
			        BTP(MaterialsPos2)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos2.Position).Magnitude < 1500 then
				    topos(MaterialsPos2)
					end
				else
				    topos(MaterialsPos2)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Water Fighter") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Water Fighter").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end
    
if World1 or World2 then
Page3.CreateToggle({
	Name = "tự động farm quặng magma",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Umm = v
	StopTween(_G.Umm)
		print(v)
	end,
})


local MaterialsPos3 = CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875)
spawn(function()
        while wait() do
            if _G.Umm and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Military Spy") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Military Spy" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.Umm or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos3.Position).Magnitude > 1500 then
			        BTP(MaterialsPos3)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos3.Position).Magnitude < 1500 then
				    topos(MaterialsPos3)
					end
				else
				    topos(MaterialsPos3)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Military Spy") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Military Spy").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
   
local MaterialsPos4 = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375)
spawn(function()
        while wait() do
            if _G.Umm and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Lava Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.Umm or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos4.Position).Magnitude > 1500 then
			        BTP(MaterialsPos4)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos4.Position).Magnitude < 1500 then
				    topos(MaterialsPos4)
					end
				else
				    topos(MaterialsPos4)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Lava Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end
    
if World1 then  
Page3.CreateToggle({
	Name = "tự động farm đôi cánh thiên thần",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Auto_Wing = v
	StopTween(_G.Auto_Wing)
		print(v)
	end,
})

local MaterialsPos5 = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375)
spawn(function()
        while wait() do
            if _G.Auto_Wing and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Royal Soldier") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Royal Soldier" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.Auto_Wing or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos5.Position).Magnitude > 1500 then
			        BTP(MaterialsPos5)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos5.Position).Magnitude < 1500 then
				    topos(MaterialsPos5)
					end
				else
				    topos(MaterialsPos5)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Royal Soldier") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Royal Soldier").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end

if World1 or World2 or World3 then   
Page3.CreateToggle({
	Name = "tự động farm da thú",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Leather = v
	StopTween(_G.Leather)
		print(v)
	end,
})

local MaterialsPos6 = CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625)
spawn(function()
        while wait() do
            if _G.Leather and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.Leather or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos6.Position).Magnitude > 1500 then
			        BTP(MaterialsPos6)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos6.Position).Magnitude < 1500 then
				    topos(MaterialsPos6)
					end
				else
				    topos(MaterialsPos6)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
    
    local MaterialsPos7 = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
    spawn(function()
        while wait() do
            if _G.Leather and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Marine Captain") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Marine Captain" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.Leather or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos7.Position).Magnitude > 1500 then
			        BTP(MaterialsPos7)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos7.Position).Magnitude < 1500 then
				    topos(MaterialsPos7)
					end
				else
				    topos(MaterialsPos7)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Marine Captain") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Marine Captain").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
    
    local MaterialsPos8 = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
    spawn(function()
        while wait() do
            if _G.Leather and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Jungle Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Jungle Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.Leather or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos8.Position).Magnitude > 1500 then
			        BTP(MaterialsPos8)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos8.Position).Magnitude < 1500 then
				    topos(MaterialsPos8)
					end
				else
				    topos(MaterialsPos8)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Jungle Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Jungle Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
 end
  
if World2 then    
Page3.CreateToggle({
	Name = "tự động farm vật chất kì dị",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoEctoplasm = v
	StopTween(_G.AutoEctoplasm)
		print(v)
	end,
})

Page3.CreateToggle({
	Name = "tự động farm phế liệu",
	Dis = "",
	Value = false,
	Callback = function(v)
	Scrap = v
	StopTween(Scrap)
		print(v)
	end,
})


local MaterialsPos9 = CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125)
spawn(function()
        while wait() do
            if Scrap and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Brute") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Brute" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not Scrap or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos9.Position).Magnitude > 1500 then
			        BTP(MaterialsPos9)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos9.Position).Magnitude < 1500 then
				    topos(MaterialsPos9)
					end
				else
				    topos(MaterialsPos9)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Brute") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Brute").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
    
    local MaterialsPos10 = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125)
    spawn(function()
        while wait() do
            if Scrap and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Mercenary") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Mercenary" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not Scrap or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos10.Position).Magnitude > 1500 then
			        BTP(MaterialsPos10)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos10.Position).Magnitude < 1500 then
				    topos(MaterialsPos10)
					end
				else
				    topos(MaterialsPos10)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Mercenary") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mercenary").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
    
    local MaterialsPos11 = CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875)
    spawn(function()
        while wait() do
            if Scrap and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Pirate Millionaire") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Pirate Millionaire" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not Scrap or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos11.Position).Magnitude > 1500 then
			        BTP(MaterialsPos11)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos11.Position).Magnitude < 1500 then
				    topos(MaterialsPos11)
					end
				else
				    topos(MaterialsPos11)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Pirate Millionaire") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Pirate Millionaire").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end
    
if World3 then  
Page3.CreateToggle({
	Name = "tự động farm bột cacao",
	Dis = "",
	Value = false,
	Callback = function(v)
	Cocoafarm = v
	StopTween(Cocoafarm)
		print(v)
	end,
})


local MaterialsPos12 = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375)
spawn(function()
        while wait() do
            if Cocoafarm and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Chocolate Bar Battler" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not Cocoafarm or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos12.Position).Magnitude > 1500 then
			        BTP(MaterialsPos12)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos12.Position).Magnitude < 1500 then
				    topos(MaterialsPos12)
					end
				else
				    topos(MaterialsPos12)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Chocolate Bar Battler") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Chocolate Bar Battler").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end
 
if World3 then  
Page3.CreateToggle({
	Name = "tự động farm vãy rồng",
	Dis = "",
	Value = false,
	Callback = function(v)
	Dragon_Scale = v
	StopTween(Dragon_Scale)
		print(v)
	end,
})   

local MaterialsPos13 = CFrame.new(5824.06982421875, 51.38640213012695, -1106.694580078125)
spawn(function()
        while wait() do
            if Dragon_Scale and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Dragon Crew Warrior" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not Dragon_Scale or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos13.Position).Magnitude > 1500 then
			        BTP(MaterialsPos13)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos13.Position).Magnitude < 1500 then
				    topos(MaterialsPos13)
					end
				else
				    topos(MaterialsPos13)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(5824.06982421875, 51.38640213012695, -1106.694580078125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end
  
if World3 then    
Page3.CreateToggle({
	Name = "tự động farm thuốc súng",
	Dis = "",
	Value = false,
	Callback = function(v)
	Gunpowder = v
	StopTween(Gunpowder)
		print(v)
	end,
})   


local MaterialsPos14 = CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875)
spawn(function()
        while wait() do
            if Gunpowder and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Pistol Billionaire") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Pistol Billionaire" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not Gunpowder or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos14.Position).Magnitude > 1500 then
			        BTP(MaterialsPos14)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos14.Position).Magnitude < 1500 then
				    topos(MaterialsPos14)
					end
				else
				    topos(MaterialsPos14)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Pistol Billionaire") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Pistol Billionaire").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end
 
if World3 then  
Page3.CreateToggle({
	Name = "tự động farm đuôi cá",
	Dis = "",
	Value = false,
	Callback = function(v)
	Fish = v
	StopTween(Fish)
		print(v)
	end,
})      

local MaterialsPos15 = CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875)
spawn(function()
        while wait() do
            if Fish and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Fishman Captain") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Fishman Captain" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not Fish or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos15.Position).Magnitude > 1500 then
			        BTP(MaterialsPos15)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos15.Position).Magnitude < 1500 then
				    topos(MaterialsPos15)
					end
				else
				    topos(MaterialsPos15)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Captain") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Captain").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end
    
if World3 then  
Page3.CreateToggle({
	Name = "tự động farm ngà nhỏ",
	Dis = "",
	Value = false,
	Callback = function(v)
	MiniHee = v
	StopTween(MiniHee)
		print(v)
	end,
})      

local MaterialsPos16 = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125)
spawn(function()
        while wait() do
            if MiniHee and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Mythological Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not MiniHee or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos16.Position).Magnitude > 1500 then
			        BTP(MaterialsPos16)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos16.Position).Magnitude < 1500 then
				    topos(MaterialsPos16)
					end
				else
				    topos(MaterialsPos16)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Mythological Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mythological Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end

    spawn(function()
        while wait() do
            if _G.AutoFarmFruitMastery and SelectedMasteryMode == "Quest" then
                pcall(function()
                    CheckQuest()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        repeat wait()
                            topos(CFrameQuest)
                        until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoFarmFruitMastery
                        if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            HealthMs = v.Humanoid.MaxHealth * _G.Kill_At/100
                                            repeat task.wait()
                                                if v.Humanoid.Health <= HealthMs then
                                                    EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                    UseSkill = true
                                                    Skillaimbot = true
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
                                                else           
                                                    UseSkill = false 
                                                    Skillaimbot = false
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                end
                                                AimBotSkillPosition = v.HumanoidRootPart.Position
                                                MonFarm = v.Name
                                                PosMon = v.HumanoidRootPart.CFrame
                                                AutoHaki()
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                StartBring = true
                                                NormalAttack()
                                            until not _G.AutoFarmFruitMastery or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            StartBring = false
                                            UseSkill = false
                                            Skillaimbot = false
                                        end
                                    end
                                end
                            end
                        else
                            topos(CFrameMon)
                            UnEquipWeapon(_G.SelectWeapon)
                        end
                    end
                end)
            end
        end
    end)

    function NormalAttack()
        if not _G.NormalAttack then
            local a3 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
            local a4 = debug.getupvalues(a3)[2]
            local a5 = require(game.ReplicatedStorage.Util.CameraShaker)
            a5:Stop()
            a4.activeController.attacking = false
            a4.activeController.timeToNextAttack = 0
            a4.activeController.hitboxMagnitude = 180
            game:GetService "VirtualUser":CaptureController()
            game:GetService "VirtualUser":Button1Down(Vector2.new(1280, 672))
        end
    end



spawn(function()
        while wait() do
            if _G.AutoFarmFruitMastery and SelectedMasteryMode == "Near" then
                pcall(function()
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name then
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                                        HealthMs = v.Humanoid.MaxHealth * _G.Kill_At/100
                                            repeat task.wait()
                                                if v.Humanoid.Health <= HealthMs then
                                                    EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                    UseSkill = true
                                                    Skillaimbot = true
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
                                                else           
                                                    UseSkill = false 
                                                    Skillaimbot = false
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                end
                                                AimBotSkillPosition = v.HumanoidRootPart.Position
                                                MonFarm = v.Name
                                                PosMon = v.HumanoidRootPart.CFrame
                                                AutoHaki()
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                StartBring = true
                                                NormalAttack()
                                            until not _G.AutoFarmFruitMastery or v.Humanoid.Health <= 0 or not v.Parent 
                                            StartBring = false
                                            UseSkill = false
                                            Skillaimbot = false                                       
                                end
                            end
                            UnEquipWeapon(_G.SelectWeapon)
                        end
                    end
                end)
            end
        end
    end)
    
    -- spawn(function()
    --     while wait() do
    --         if SelectedMasteryMode == "Nearest" and _G.AutoFarmFruitMastery then
    --             pcall(function()
    --                 for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
    --                     if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
    --                         if
    --                             (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000
    --                          then
    --                             repeat wait()
    --                                 if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Kill_At / 100 then
    --                                     UseSkill = true
    --                                 else
    --                                     UseSkill = false
    --                                     AutoHaki()
    --                                     StartBring = true
    --                                     EquipWeapon(_G.SelectWeapon)
    --                                     TP1(v.HumanoidRootPart.CFrame * pos)
    --                                     v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
    --                                     v.HumanoidRootPart.Transparency = 1
    --                                     v.Humanoid.JumpPower = 0
    --                                     v.Humanoid.WalkSpeed = 0
    --                                     v.HumanoidRootPart.CanCollide = false
    --                                     PosMon = v.HumanoidRootPart.CFrame
    --                                     MonFarm = v.Name
    --                                     NormalAttack()
    --                                 end
    --                             until not _G.AutoFarmFruitMastery or not SelectedMasteryMode == "Nearest" or
    --                                 not v.Parent or
    --                                 v.Humanoid.Health == 0 or
    --                                 not SelectedMasteryMode == "Nearest"
    --                             StartBring = false
    --                             UseSkill = false
    --                         end
    --                     end
    --                 end            
    --             end)
    --         end
    --     end
    -- end)
    

    
 
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if UseSkill or UseGunSkill or _G.SeaSkill then
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    for _, Notif in pairs(v:GetChildren()) do
                        if string.find(Notif.Text,"Skill locked!") then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end)
end)
    
    

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoFarmGunMastery and SelectedMasteryMode == "Quest" then
                    CheckQuest()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        topos(CFrameQuest)
                        if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            pcall(function()
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            repeat task.wait()
                                                HealthMin = v.Humanoid.MaxHealth * _G.Kill_At/100
                                                ShootPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -15, 0)
                                                if v.Humanoid.Health <= HealthMin then
                                                    EquipWeapon(SelectWeaponGun)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
                                                    game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild(""):InvokeServer("TAP", Vector3.new(ShootPosition.Position))
                                                    UseGunSkill = true
                                                    Skillaimbot = true
                                                    local args = {
                                                        [1] = v.HumanoidRootPart.Position,
                                                        [2] = v.HumanoidRootPart
                                                    }
                                                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                                else
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    UseGunSkill = false
                                                    Skillaimbot = false
                                                end
                                                NormalAttack()
                                                AutoHaki()
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.Head.CanCollide = false
                                                AimBotSkillPosition = v.HumanoidRootPart.Position
                                                StartBring = true 
                                                PosMon = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                            until v.Humanoid.Health <= 0 or _G.AutoFarmGunMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            UseGunSkill = false
                                            Skillaimbot = false
                                            StartBring = false
                                        end
                                    end
                                end
                            end)
                        else
                           TP1(CFrameMon)
                           UnEquipWeapon(_G.SelectWeapon)
                        end 
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoFarmGunMastery and SelectedMasteryMode == "Near" then
                            pcall(function()
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name then
                                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                                            repeat task.wait()
                                                HealthMin = v.Humanoid.MaxHealth * _G.Kill_At/100
                                                ShootPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -15, 0)
                                                if v.Humanoid.Health <= HealthMin then
                                                    EquipWeapon(SelectWeaponGun)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
                                                    game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild(""):InvokeServer("TAP", Vector3.new(ShootPosition.Position))
                                                    UseGunSkill = true
                                                    Skillaimbot = true
                                                    local args = {
                                                        [1] = v.HumanoidRootPart.Position,
                                                        [2] = v.HumanoidRootPart
                                                    }
                                                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                                else
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    UseGunSkill = false
                                                    Skillaimbot = false
                                                end
                                                NormalAttack()
                                                AutoHaki()
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.Head.CanCollide = false
                                                AimBotSkillPosition = v.HumanoidRootPart.Position
                                                StartBring = true 
                                                PosMon = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                            until v.Humanoid.Health <= 0 or _G.AutoFarmGunMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            UseGunSkill = false
                                            Skillaimbot = false
                                            StartBring = false
                                        end
                                    end
                                end
                            end)
                           UnEquipWeapon(_G.SelectWeapon)
                end
            end
        end)
    end)
    

    
Page4.CreateLable({
	Name = "Misc Item"
})
 if World3 then   
Page4.CreateToggle({
	Name = "tự động lấy kiếm buddy",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoBudySword = v
	StopTween(_G.AutoBudySword)
		print(v)
	end,
})      
    
    
    local BigMomPos = CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875)
    spawn(function()
        while wait() do
            if _G.AutoBudySword and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Queen" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.AutoBudySword or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BigMomPos.Position).Magnitude > 1500 then
			        BTP(BigMomPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BigMomPos.Position).Magnitude < 1500 then
				    topos(BigMomPos)
					end
				else
				    topos(BigMomPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                     
                        end
                    end
                end)
            end
        end
    end)
end

    
    
    -- local FM = M:Label('Third World')
    
  if World2 or World3  then
Page4.CreateToggle({
	Name = "tự động lấy soul guitar",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoNevaSoulGuitar = v
	StopTween(_G.AutoNevaSoulGuitar)
		print(v)
	end,
})    
end



  task.spawn(function()
	while wait() do
		pcall(function()
			if GetWeaponInventory("Soul Guitar") == false then
				if _G.AutoNevaSoulGuitar then
					if GetCountMaterials("Bones") >= 500 and GetCountMaterials("Ectoplasm") >= 250 and GetCountMaterials("Dark Fragment") >= 1 then
						if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
							if game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
								local Remotes = game.ReplicatedStorage:WaitForChild("Remotes");
								local __CommF = Remotes:WaitForChild("CommF_");
								local GuitarProgress = __CommF:InvokeServer("GuitarPuzzleProgress", "Check");
								if not GuitarProgress then 
									local gravestoneEvent = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent", 2);
									if gravestoneEvent == true then
										__CommF:InvokeServer("gravestoneEvent", 2, true);
									else 
										if _G.AutoNevaSoulGuitarHop then
											Hop()
										end
									end;
								end
								if GuitarProgress then 
									local Swamp = GuitarProgress.Swamp;
									local Gravestones = GuitarProgress.Gravestones;
									local Ghost = GuitarProgress.Ghost;
									local Trophies = GuitarProgress.Trophies;
									local Pipes = GuitarProgress.Pipes;
									local CraftedOnce = GuitarProgress.CraftedOnce;
									if Swamp and Gravestones and Ghost and Trophies and Pipes then 
										_G.AutoNevaSoulGuitar = false
									end
									if not Swamp then 
										repeat wait() 
											topos(CFrame.new(-10141.462890625, 138.6524658203125, 5935.06298828125) * CFrame.new(0,30,0))
										until game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(-10141.462890625, 138.6524658203125, 5935.06298828125)) <= 100
										for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
											if v.Name == "Living Zombie" then
												if v:FindFirstChild('Humanoid') then 
													if v:FindFirstChild('HumanoidRootPart') then 
														if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then 
															repeat wait() 
																AutoHaki()
                                                                EquipWeapon(_G.SelectWeapon)
                                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                v.Humanoid.JumpPower = 0
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.HumanoidRootPart.CanCollide = false
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                MonFarm = v.Name
                                                               AttackNoCD()
															until not v.Parent or v.Humanoid.Health <= 0 or not  v:FindFirstChild('HumanoidRootPart') or not v:FindFirstChild('Humanoid') or not _G.AutoNevaSoulGuitar
															StartSoulGuitarMagnt = false
														end
													end
												end
											end
										end   
									end
									wait(1)
									if Swamp and not Gravestones then 
										__CommF:InvokeServer("GuitarPuzzleProgress", "Gravestones");
									end
									wait(1)
									if Swamp and  Gravestones and not Ghost then 
										__CommF:InvokeServer("GuitarPuzzleProgress", "Ghost");
									end 
									wait(1)
									if  Swamp and  Gravestones and Ghost and not Trophies then 
										__CommF:InvokeServer("GuitarPuzzleProgress", "Trophies");
									end
									wait(1)
									if  Swamp and  Gravestones and Ghost and Trophies and not Pipes then 
										__CommF:InvokeServer("GuitarPuzzleProgress", "Pipes");
									end
								end
							else
								if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Error") then
									print("Go to Grave")
									toTarget(CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125))
								elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Nothing") then
									print("Wait Next Night")
								else
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2,true)
								end
							end
						else
							topos(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
						end
					else
						if GetCountMaterials("Ectoplasm") <= 250 then
							if World2 then
								if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer" then
											if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
												repeat task.wait(_G.FastAttackDelay)
													AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    StartBring = true
                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    v.HumanoidRootPart.Transparency = 1
                                                    v.Humanoid.JumpPower = 0
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.CanCollide = false
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    MonFarm = v.Name
                                                    AttackNoCD()
												until not _G.AutoNevaSoulGuitar or not v.Parent or v.Humanoid.Health <= 0
												StartBring = false
											end
										end
									end
								else
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
							end
						elseif GetCountMaterials("Dark Fragment") <= 1 then
							if World2 then
								if game.ReplicatedStorage:FindFirstChild("Darkbeard") or game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard") then
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										if v.Name == "Darkbeard" and v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
											repeat task.wait(_G.FastAttackDelay)
												AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                 v.HumanoidRootPart.Transparency = 1
                                                 v.Humanoid.JumpPower = 0
                                                 v.Humanoid.WalkSpeed = 0
                                                 v.HumanoidRootPart.CanCollide = false
                                                 AttackNoCD()
											until _G.AutoNevaSoulGuitar or v.Humanoid.Health <= 0
										end
									end
								else
									topos(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
							end
						elseif GetCountMaterials("Bones") <= 500 then
							if World3 then
								if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
											if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
												repeat task.wait(_G.FastAttackDelay)
												AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                StartBring = true
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                 v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                 v.HumanoidRootPart.Transparency = 1
                                                 v.Humanoid.JumpPower = 0
                                                 v.Humanoid.WalkSpeed = 0
                                                 v.HumanoidRootPart.CanCollide = false
                                                 PosMon = v.HumanoidRootPart.CFrame
                                                 MonFarm = v.Name
                                                 AttackNoCD()
												until not _G.AutoNevaSoulGuitar or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
												StartBring = false
											end
										end
									end
								else
									topos(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
							end
						end
					end
				end
			end
		end)
	end
end)



spawn(function()
    while wait() do
        if _G.AutoFarmBossHallow then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if string.find(v.Name , "Soul Reaper") then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                AutoHaki()
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                topos(v.HumanoidRootPart.CFrame*Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                v.HumanoidRootPart.Transparency = 1
                                -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                            until v.Humanoid.Health <= 0 or _G.AutoFarmBossHallow == false
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                    repeat topos(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8                        
                    EquipWeapon("Hallow Essence")
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                   
                    end
                end
            end)
        end
    end
end)
if World2 then
Page4.CreateToggle({
	Name = "tự động lấy kiếm rengoku",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoRengoku = v
	StopTween(_G.AutoRengoku)
		print(v)
	end,
})      
end
if World3 then
Page4.CreateToggle({
	Name = "tự động lấy kiếm hallow scythe",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoFarmBossHallow = v
	StopTween(_G.AutoFarmBossHallow)
		print(v)
	end,
}) 
end
if World1 then
Page4.CreateToggle({
	Name = "tự động lấy kiếm warden",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Autowaden = v
	StopTween(_G.Autowaden)
		print(v)
	end,
}) 
end

if World3 then
Page4.CreateToggle({
	Name = "tự động lấy cursed dual katana",
	Dis = "",
	Value = false,
	Callback = function(v)
	Auto_Cursed_Dual_Katana = v
	StopTween(Auto_Cursed_Dual_Katana)
		print(v)
	if Auto_Cursed_Dual_Katana == false then
Auto_Quest_Yama_1 = false
Auto_Quest_Yama_2 = false
Auto_Quest_Yama_3 = false
Auto_Quest_Tushita_1 = false
Auto_Quest_Tushita_2 = false
Auto_Quest_Tushita_3 = false
end
	end,
}) 



Page4.CreateToggle({
	Name = "tự động lấy kiếm yama",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoYama = v
		print(v)
	end,
}) 
end


spawn(function()
    while wait() do
        if _G.AutoYama then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                repeat wait(.1)
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
            end
        end
    end
end)




        
    spawn(function()
        while wait() do
            pcall(function()
                if Auto_Cursed_Dual_Katana then
                    if GetCountMaterials("Alucard Fragment") == 0 then
                        Auto_Quest_Yama_1 = true
                        Auto_Quest_Yama_2 = false
                        Auto_Quest_Yama_3 = false
                        Auto_Quest_Tushita_1 = false
                        Auto_Quest_Tushita_2 = false
                        Auto_Quest_Tushita_3 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
                    elseif GetCountMaterials("Alucard Fragment") == 1 then
                        Auto_Quest_Yama_1 = false
                        Auto_Quest_Yama_2 = true
                        Auto_Quest_Yama_3 = false
                        Auto_Quest_Tushita_1 = false
                        Auto_Quest_Tushita_2 = false
                        Auto_Quest_Tushita_3 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
                    elseif GetCountMaterials("Alucard Fragment") == 2 then
                        Auto_Quest_Yama_1 = false
                        Auto_Quest_Yama_2 = false
                        Auto_Quest_Yama_3 = true
                        Auto_Quest_Tushita_1 = false
                        Auto_Quest_Tushita_2 = false
                        Auto_Quest_Tushita_3 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
                    elseif GetCountMaterials("Alucard Fragment") == 3 then
                        Auto_Quest_Yama_1 = false
                        Auto_Quest_Yama_2 = false
                        Auto_Quest_Yama_3 = false
                        Auto_Quest_Tushita_1 = true
                        Auto_Quest_Tushita_2 = false
                        Auto_Quest_Tushita_3 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs["Luxury Boat Dealer"],"Check")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs["Luxury Boat Dealer"])
                    elseif GetCountMaterials("Alucard Fragment") == 4 then
                        Auto_Quest_Yama_1 = false
                        Auto_Quest_Yama_2 = false
                        Auto_Quest_Yama_3 = false
                        Auto_Quest_Tushita_1 = false
                        Auto_Quest_Tushita_2 = true
                        Auto_Quest_Tushita_3 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
                    elseif GetCountMaterials("Alucard Fragment") == 5 then
                        Auto_Quest_Yama_1 = false
                        Auto_Quest_Yama_2 = false
                        Auto_Quest_Yama_3 = false
                        Auto_Quest_Tushita_1 = false
                        Auto_Quest_Tushita_2 = false
                        Auto_Quest_Tushita_3 = true
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
                    elseif GetCountMaterials("Alucard Fragment") == 6 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss") then
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = false
                            Auto_Quest_Yama_3 = false
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = false
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Cursed Skeleton Boss" or v.Name == "Cursed Skeleton" then
                                        if v.Humanoid.Health > 0 then
                                            EquipWeaponSword()
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid.JumpPower = 0
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            --v.Humanoid:ChangeState(11)
                                            --v.Humanoid:ChangeState(14)
                                            PosMon = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                            Click()
                                        end
                                    end
                                end
                            end
                        else
                            if (CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                                wait(1)
                                topos(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                topos(CFrame.new(-12253.5419921875, 598.8999633789062, -6546.8388671875))
                            else
                                topos(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
                            end   
                        end
                    end
                end
            end)
        end
    end)

    spawn(function()
        while wait() do
            if Auto_Quest_Yama_1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Forest Pirate" then
                                repeat wait()
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-2))
                                until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_1 == false
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
                            end
                        end
                    else
                        topos(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
                    end
                end)
            end
        end
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if Auto_Quest_Yama_2 then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HazeESP") then
                            v.HazeESP.Size = UDim2.new(50,50,50,50)
                            v.HazeESP.MaxDistance = math.huge
                        end
                    end
                    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                        if v:FindFirstChild("HazeESP") then
                            v.HazeESP.Size = UDim2.new(50,50,50,50)
                            v.HazeESP.MaxDistance = math.huge
                        end
                    end
                end
            end)
        end
    end)

    spawn(function()
        while wait() do
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if Auto_Quest_Yama_2 and v:FindFirstChild("HazeESP") and (v.HumanoidRootPart.Position - PosMonsEsp.Position).magnitude <= 300 then
                        v.HumanoidRootPart.CFrame = PosMonsEsp
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                        if not v.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                            local vc = Instance.new("BodyVelocity", v.HumanoidRootPart)
                            vc.MaxForce = Vector3.new(1, 1, 1) * math.huge
                            vc.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end)
        end
    end)

    spawn(function()
        while wait() do
            if Auto_Quest_Yama_2 then 
                pcall(function() 
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HazeESP") then
                            repeat task.wait(_G.FastAttackDelay)
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid.JumpPower = 0
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    StartBring = true
                                    PosMon = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                    AttackNoCD()      
                            until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_2 == false or not v.Parent or v.Humanoid.Health <= 0 or not v:FindFirstChild("HazeESP")
                            StartBring = false
                        else
                            for x,y in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                                if y:FindFirstChild("HazeESP") then
                                    if (y.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then
                                        topos(y.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                    else
                                        topos(y.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    spawn(function()
        while wait() do
            if Auto_Quest_Yama_3 then
                pcall(function()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then         
                        topos(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
                    elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                        repeat task.wait(_G.FastAttackDelay)
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Hell's Messenger") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Cursed Skeleton" or v.Name == "Cursed Skeleton" or v.Name == "Hell's Messenger" then
                                        if v.Humanoid.Health > 0 then
                                            repeat task.wait(_G.FastAttackDelay)
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                StartBring = true
                                                PosMon = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                                AttackNoCD()
                                            until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Yama_3 == false
                                            StartBring = false
                                        end
                                    end
                                end
                            else
                                wait(5)
                                topos(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)        
                                topos(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)     
                                topos(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)     
                                topos(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
                            end
                        until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_3 == false or GetCountMaterials("Alucard Fragment") == 3
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Soul Reaper" then
                                        if v.Humanoid.Health > 0 then
                                            repeat wait()
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-2))
                                            until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_3 == false or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                                        end
                                    end
                                end
                            else
                                topos(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
                            end
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                        end
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Tushita_1 then
                BTP(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
                wait(5)
                BTP(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
                wait(5)
                BTP(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))    
            end
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Tushita_2 then
                pcall(function()
                    if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if Auto_Quest_Tushita_2 and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid.JumpPower = 0
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        AttackNoCD()
                                    until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Tushita_2 == false
                                    StartBring = false
                                end
                            end
                        end
                    else
                        topos(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            if Auto_Quest_Tushita_3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Cake Queen" then
                                    if v.Humanoid.Health > 0 then
                                        repeat task.wait(_G.FastAttackDelay)
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid.JumpPower = 0
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            AttackNoCD()
                                        until Auto_Cursed_Dual_Katana == false or Auto_Quest_Tushita_3 == false or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
                                    end
                                end
                            end
                        else
                            topos(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
                        end
                    elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                        repeat task.wait(_G.FastAttackDelay)
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven's Guardian") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Cursed Skeleton" or v.Name == "Cursed Skeleton" or v.Name == "Heaven's Guardian" then
                                        if v.Humanoid.Health > 0 then
                                            repeat wait()
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                StartBring = true
                                                PosMon = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                                AttackNoCD()
                                            until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Tushita_3 == false
                                            StartBring = false
                                        end
                                    end
                                end
                            else
                                wait(5)
                                topos(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)        
                                topos(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)     
                                topos(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)     
                                topos(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
                            end
                        until not Auto_Cursed_Dual_Katana or not Auto_Quest_Tushita_3 or GetMaterial("Alucard Fragment") == 6
                    end
                end)
            end
        end
    end)


    
if World3 then
Page4.CreateToggle({
	Name = "tự động lấy kiếm tushita",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Autotushita = v
	StopTween(_G.Autotushita)
		print(v)
	end,
}) 

    
    spawn(function()
        while wait() do
            if  _G.Autotushita and World3 then
                pcall(function()
                        if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") then
                            ripIndraSpawn = true
                        elseif game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                            longmaSpawn = true
                        end

                        if not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                            repeat wait(1)
                            Alert:create("Rip Indra Not Spawn")
                            until not _G.Autotushita or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")
                        elseif not game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                            repeat wait(1)
                            Alert:create("Longma Not Spawn")
                            until not _G.Autotushita or game:GetService("Workspace").Enemies:FindFirstChild("Longma")
                        end
                    if ripIndraSpawn and longmaSpawn then
                    topos(CFrame.new(5154.85303, 141.812225, 913.080933, 0.138356507, 5.17637666e-08, 0.990382493, 4.59496796e-08, 1, -5.86856146e-08, -0.990382493, 5.36272928e-08, 0.138356507))
                    if (CFrame.new(5154.85303, 141.812225, 913.080933, 0.138356507, 5.17637666e-08, 0.990382493, 4.59496796e-08, 1, -5.86856146e-08, -0.990382493, 5.36272928e-08, 0.138356507).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude < 2 then
                        wait(2)
                    Torch = true
                    end
                    end
                    local Torch1CFrame = game:GetService("Workspace").Map["Turtle"].QuestTorches.Torch1.Particles.CFrame
                    local Torch2CFrame = game:GetService("Workspace").Map["Turtle"].QuestTorches.Torch2.Particles.CFrame
                    local Torch3CFrame = game:GetService("Workspace").Map["Turtle"].QuestTorches.Torch3.Particles.CFrame
                    local Torch4CFrame = game:GetService("Workspace").Map["Turtle"].QuestTorches.Torch4.Particles.CFrame
                    local Torch5CFrame = game:GetService("Workspace").Map["Turtle"].QuestTorches.Torch5.Particles.CFrame
                    if Torch then
                        topos(Torch1CFrame)
                        if (Torch1CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude < 2 then
                            wait(1)
                            Torch1 = true
                        end

                        if Torch1 then
                        topos(Torch2CFrame)
                        if (Torch2CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude < 2 then
                            wait(1)
                            Torch2 = true
                        end
                        end

                        if Torch2 then
                        topos(Torch3CFrame)
                        if (Torch3CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude < 2 then
                            wait(1)
                            Torch3 = true
                        end
                        end

                        if Torch3 then
                        topos(Torch4CFrame)
                        if (Torch4CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude < 2 then
                            wait(1)
                            Torch4 = true
                        end
                        end

                        if Torch4 then
                        topos(Torch5CFrame)
                        if (Torch5CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude < 2 then
                            wait(1)
                            Torch5 = true
                        end
                        end

                        if Torch5 then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Longma" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                            -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                        until not  _G.Autotushita or not v.Parent or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Tushita") or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)



Page4.CreateToggle({
	Name = "tự động lấy kiếm cavander",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoCarvender = v
	StopTween(_G.AutoCarvender)
		print(v)
	end,
}) 

  
    
 
    
    local CavandisPos = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875)
    spawn(function()
        while wait() do
            if  _G.AutoCarvender and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Beautiful Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.AutoCarvender or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude > 1500 then
			        BTP(CavandisPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude < 1500 then
				    topos(CavandisPos)
					end
				else
				    topos(CavandisPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
end

if World3 then
Page4.CreateToggle({
	Name = "tự động lấy kiếm twin hook",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoTwinHook = v
	StopTween(_G.AutoTwinHook)
		print(v)
	end,
}) 

local ElephantPos = CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625)
    spawn(function()
        while wait() do
            if  _G.AutoTwinHook and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Captain Elephant" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        --sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.AutoTwinHook or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ElephantPos.Position).Magnitude > 1500 then
			        BTP(ElephantPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ElephantPos.Position).Magnitude < 1500 then
				    topos(ElephantPos)
					end
				else
				    topos(ElephantPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.AutoTwinHook_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end


if World2 then
Page4.CreateToggle({
	Name = "tự động kill Râu đen",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoDarkCoat = v
	StopTween(_G.AutoDarkCoat)
		print(v)
	end,
}) 
spawn(function()
        while wait() do
            if  _G.AutoDarkCoat and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Darkbeard" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.AutoDarkCoat or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.AutoDarkCoatHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end
if World1 or World2 then 
    Page5.CreateLable({
	Name = "Sea event In Sea 3"
})
end

if World3 then 
    Page5.CreateLable({
	Name = "Sea"
})

    local ListSeaBoat = {
        "Guardian",
        "PirateGrandBrigade",
        "MarineGrandBrigade",
        "PirateBrigade",
        "MarineBrigade",
        "PirateSloop",
        "MarineSloop",
        "BeastHunter",
    }

    local ListSeaZone = {
        "Zone 1",
        "Zone 2",
        "Zone 3",
        "Zone 4",
        "Zone 5",
        "Zone 6"
    }

_G.SelectedBoat = "Guardian"
Page5.CreateDropdown({
	Name = "chọn thuyền",
	Value = "Guardian",
	List = ListSeaBoat,
	Callback = function(v)
	_G.SelectedBoat = v
		print(v)
	end,
})
_G.SelectedZone = "Zone 5"
Page5.CreateDropdown({
	Name = "chọn biển",
	Value = "Zone 5",
	List = ListSeaZone,
	Callback = function(v)
	_G.SelectedZone = v
		print(v)
	end,
})

Page5.CreateSlider({
	Name = "Tốc độ thuyền",
	Max = 350,
	Min = 1,	
	Value = 325,
	Format = function(v)
	    BoatSpeed = v
		print(v)
	end,
})


    spawn(function()
        pcall(function()
            while wait() do
                if _G.SelectedZone == "Zone 1" then
                    CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143, 0.120013528, 0.00690158736, 0.99274826, -0.0574118942, 0.998350561, -2.36509201e-10, -0.991110802, -0.0569955558, 0.120211802)
                elseif _G.SelectedZone == "Zone 2" then
                    CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032, 0.307457417, 0.019647358, 0.951358974, -0.0637726262, 0.997964442, -4.15334017e-10, -0.949422479, -0.0606706589, 0.308084518)
                elseif _G.SelectedZone == "Zone 3" then
                    CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774, 0.37637493, 0.0150483791, 0.926345229, -0.0399504974, 0.999201655, 2.70896673e-11, -0.925605655, -0.0370079502, 0.376675636)
                elseif _G.SelectedZone == "Zone 4" then
                    CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012, 0.0935864747, -0.00122954219, 0.995610416, 0.0624034069, 0.998040259, -0.00463332096, -0.993653536, 0.062563099, 0.0934797972)
                elseif _G.SelectedZone == "Zone 5" then
                    CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023, -0.188895494, -0.00704088295, 0.981971979, -0.0372481011, 0.999306023, -1.39882339e-09, -0.981290519, -0.0365765914, -0.189026669)
                elseif _G.SelectedZone == "Zone 6" then
                    CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372)
                end
            end
        end)
    end)

Page5.CreateToggle({
	Name = "mua thuyền và zone",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.SailBoat = v
	StopTween(_G.SailBoat)
	    stopboat:Stop()
		print(v)
	end,
}) 


function CheckBoat()
    for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
        if v.Name == _G.SelectedBoat then
            for _, child in pairs(v:GetChildren()) do
                if child.Name == "MyBoatEsp" then
                    return v
                end
            end
        end
    end
    return false
end

    function CheckSeaBeast()
        if game:GetService("Workspace"):FindFirstChild("SeaBeasts") then
            for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") or v.Health.Value < 0 then
                    return true
                end
            end
        end
        return false
    end

function AddEsp(Name, Parent)
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")

    BillboardGui.Parent = Parent
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.Name = Name
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1) 
                    game:GetService('TweenService'):Create(
                        TextLabel,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        TextLabel,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 155, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        TextLabel,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        TextLabel,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        TextLabel,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        TextLabel,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 155, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        TextLabel,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        TextLabel,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 155)}
                    ):Play() 
                    wait(.5)
                end)
            end
        end)
    TextLabel.TextSize = 15
    TextLabel.Text = ""
end
    
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.SailBoat then
                        if not CheckBoat() then
                            local BuyBoatCFrame = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781)
                            if (BuyBoatCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                                BTP(BuyBoatCFrame)
                            else
                                buyb = TPP(BuyBoatCFrame)
                            end
                            if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                if buyb then buyb:Stop() end
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
                                for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                    if v.Name == _G.SelectedBoat then
                                        if (v.VehicleSeat.CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                            AddEsp('MyBoatEsp', v)
                                        end
                                    end
                                end
                            end
                        elseif CheckBoat() then
                            for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                if v.Name == _G.SelectedBoat then
                                    if v:FindFirstChild("MyBoatEsp") then
                                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                                        if ((game:GetService("Workspace").Enemies:FindFirstChild("Shark") and _G.AutoKillShark) or (game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") and _G.AutoTerrorshark) or (game:GetService("Workspace").Enemies:FindFirstChild("Piranha") and _G.AutoKillPiranha) or (game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") and _G.AutoKillFishCrew) or (workspace.Enemies:FindFirstChild("FishBoat") and _G.RelzFishBoat) or (workspace.Enemies:FindFirstChild("PirateBrigade") and _G.RelzPirateBrigade) or (workspace.Enemies:FindFirstChild("PirateGrandBrigade") and _G.RelzPirateGrandBrigade) or (CheckSeaBeast() and _G.AutoSeaBest)) then
                                            if stoppos then stoppos:Stop() end
                                        else
                                            local stoppos = TPP(v.VehicleSeat.CFrame * CFrame.new(0,1,0))
                                        end
                                    else
                                        repeat wait()
                                            local stopboat = TPB(CFrameSelectedZone, v.VehicleSeat)
                                        until ((game:GetService("Workspace").Enemies:FindFirstChild("Shark") and _G.AutoKillShark) or (game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") and _G.AutoTerrorshark) or (game:GetService("Workspace").Enemies:FindFirstChild("Piranha") and _G.AutoKillPiranha) or (game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") and _G.AutoKillFishCrew) or (workspace.Enemies:FindFirstChild("FishBoat") and _G.RelzFishBoat) or (workspace.Enemies:FindFirstChild("PirateBrigade") and _G.RelzPirateBrigade) or (workspace.Enemies:FindFirstChild("PirateGrandBrigade") and _G.RelzPirateGrandBrigade) or (CheckSeaBeast() and _G.AutoSeaBest)) or game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false or _G.SailBoat == false
                                        if stopboat then stopboat:Stop() end
                                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                                        wait(0.1)
                                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                                    end
                                    end
                                end
                            end
                        end
                end
            end)
        end
    end)

            spawn(function()
                pcall(function()
                    while wait() do
                        if _G.SailBoat then
                            if ((game:GetService("Workspace").Enemies:FindFirstChild("Shark") and _G.AutoKillShark) or (game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") and _G.AutoTerrorshark) or (game:GetService("Workspace").Enemies:FindFirstChild("Piranha") and _G.AutoKillPiranha) or (game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") and _G.AutoKillFishCrew) or (game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") or workspace.Enemies:FindFirstChild("PirateBrigade") or workspace.Enemies:FindFirstChild("PirateGrandBrigade") and _G.RelzFishBoat) or (CheckSeaBeast() and _G.AutoSeaBest)) then
                                if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                                    wait(0.1)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                                end
                            end
                        end
                    end
                end)
            end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.SailBoat then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") and _G.AutoKillFishCrew then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                                if v.Name == "Fish Crew Member" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        _G.SeaSkill = false
                                    until not _G.AutoKillFishCrew or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                    end
                                end
                            end
                        end
                    elseif workspace.Enemies:FindFirstChild("FishBoat") and _G.RelzFishBoat then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if workspace.Enemies:FindFirstChild("FishBoat") then
                                repeat task.wait()
                                    local BoatCFrame1 = v.VehicleSeat.CFrame
                                    if (BoatCFrame1.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                        _G.SeaSkill = true
                                    else
                                        _G.SeaSkill = false
                                    end
                                    topos(BoatCFrame1 * CFrame.new(0, 20, -20))
                                    Skillaimbot = true
                                    AimBotSkillPosition = v.VehicleSeat.Position
                                until not v.Parent or not v:FindFirstChild("Health") or v.Health.Value <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") or not v:FindFirstChild("VehicleSeat") or not _G.RelzFishBoat
                                Skillaimbot = false
                                _G.SeaSkill = false
                            end
                        end
                    elseif workspace.Enemies:FindFirstChild("PirateBrigade") and _G.RelzPirateBrigade then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if workspace.Enemies:FindFirstChild("PirateBrigade") then
                                repeat task.wait()
                                    local BoatCFrame2 = v.VehicleSeat.CFrame
                                    if (BoatCFrame2.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                        _G.SeaSkill = true
                                    else
                                        _G.SeaSkill = false
                                    end
                                    topos(BoatCFrame2 * CFrame.new(0, 20, -20))
                                    Skillaimbot = true
                                    AimBotSkillPosition = v.VehicleSeat.Position
                                until not v.Parent or not v:FindFirstChild("Health") or v.Health.Value <= 0 or not workspace.Enemies:FindFirstChild("PirateBrigade") or not v:FindFirstChild("VehicleSeat") or not _G.RelzFishBoat
                                Skillaimbot = false
                                _G.SeaSkill = false
                            end
                        end                        
                    elseif workspace.Enemies:FindFirstChild("PirateGrandBrigade") and _G.RelzPirateGrandBrigade then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if workspace.Enemies:FindFirstChild("PirateGrandBrigade") then
                                repeat task.wait()
                                    local BoatCFrame3 = v.VehicleSeat.CFrame
                                    if (BoatCFrame3.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                        _G.SeaSkill = true
                                    else
                                        _G.SeaSkill = false
                                    end
                                    topos(BoatCFrame3 * CFrame.new(0, 20, -20))
                                    Skillaimbot = true
                                    AimBotSkillPosition = v.VehicleSeat.Position
                                until not v.Parent or not v:FindFirstChild("Health") or v.Health.Value <= 0 or not workspace.Enemies:FindFirstChild("PirateGrandBrigade") or not v:FindFirstChild("VehicleSeat") or not _G.RelzFishBoat
                                Skillaimbot = false
                                _G.SeaSkill = false
                            end
                        end
                    elseif CheckSeaBeast() and _G.AutoSeaBest then
                        if game:GetService("Workspace"):FindFirstChild("SeaBeasts") then
                            for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                                if CheckSeaBeast() then
                                repeat wait()
                                    CFrameSeaBeast = v.HumanoidRootPart.CFrame
                                    if (CFrameSeaBeast.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 550 then
                                        _G.SeaSkill = true
                                    else
                                        _G.SeaSkill = false
                                    end
                                    Skillaimbot = true
                                    AimBotSkillPosition = v.HumanoidRootPart.Position
                                    topos(CFrameSeaBeast * CFrame.new(0,500,0))
                                until not _G.AutoSeaBest or CheckSeaBeast() == false or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Health.Value <= 0 or not v.Parent
                                Skillaimbot = false
                                _G.SeaSkill = false
                                else
                                Skillaimbot = false
                                _G.SeaSkill = false
                                end
                            end
                        end
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") and _G.AutoTerrorshark then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                                if v.Name == "Terrorshark" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait(_G.FastAttackDelay)
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            AttackNoCD()
                                            _G.SeaSkill = false
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 60, 0))
                                        until not  _G.AutoTerrorshark or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Piranha") and _G.AutoKillPiranha then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                                if v.Name == "Piranha" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        _G.SeaSkill = false
                                    until not _G.AutoKillPiranha or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Shark") and _G.AutoKillShark then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                                if v.Name == "Shark" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        _G.SeaSkill = false
                                    until not _G.AutoKillShark or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    else
                        Skillaimbot = false
                        _G.SeaSkill = false
                        UnEquipWeapon(_G.SelectWeapon)
                    end
                end
            end)
        end
    end)
    

Page5.CreateToggle({
	Name = "tự động kill Shark",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoKillShark = v
	StopTween(_G.AutoKillShark)
		print(v)
	end,
}) 

Page5.CreateToggle({
	Name = "tự động kill Piranha",
	Dis =  "",
	Value = false,
	Callback = function(v)
	_G.AutoKillPiranha = v
	StopTween(_G.AutoKillPiranha)
		print(v)
	end,
}) 


    -- spawn(function()
    --     while wait() do
    --         pcall(function()
    --             if _G.AutoKillShark and  World3 then
    --                 for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    --                     if v.Name == "Shark" then
    --                         if (v.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 500 then
    --                         if game:GetService("Workspace").Enemies:FindFirstChild(v.Name) then
    --                         if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    --                             repeat task.wait(_G.FastAttackDelay)
    --                                 AutoHaki()
    --                                 EquipWeapon(_G.SelectWeapon)
    --                                 v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    --                                 v.HumanoidRootPart.CanCollide = false
    --                                 topos(v.HumanoidRootPart.CFrame * Pos)
    --                                 AttackNoCD()
                                    -- sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
    --                             until not _G.AutoKillShark or not v.Parent or v.Humanoid.Health <= 0
    --                         end
    --                         end
    --                         end
    --                     end
    --                 end
    --             end
    --         end)
    --     end
    -- end)

    -- spawn(function()
    --     while wait() do
    --         pcall(function()
    --             if _G.AutoKillPiranha and World3 then
    --                 for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    --                     if v.Name == "Piranha" then
    --                         if (v.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 500 then
    --                         if game:GetService("Workspace").Enemies:FindFirstChild(v.Name) then
    --                         if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    --                             repeat task.wait(_G.FastAttackDelay)
    --                                 AutoHaki()
    --                                 EquipWeapon(_G.SelectWeapon)
    --                                 v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    --                                 v.HumanoidRootPart.CanCollide = false
    --                                 topos(v.HumanoidRootPart.CFrame * Pos)
    --                                 AttackNoCD()
    --                             until not _G.AutoKillPiranha or not v.Parent or v.Humanoid.Health <= 0
    --                         end
    --                         end
    --                         end
    --                     end
    --                 end
    --             end
    --         end)
    --     end
    -- end)

    -- spawn(function()
    --     while wait() do
    --         pcall(function()
    --             if _G.AutoKillFishCrew and  World3 then
    --                 for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    --                     if v.Name == "Fish Crew Member" then
    --                         if (v.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 500 then
    --                         if game:GetService("Workspace").Enemies:FindFirstChild(v.Name) then
    --                         if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    --                             repeat task.wait(_G.FastAttackDelay)
    --                                 AutoHaki()
    --                                 EquipWeapon(_G.SelectWeapon)
    --                                 v.HumanoidRootPart.CanCollide = false
    --                                 v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    --                                 topos(v.HumanoidRootPart.CFrame * Pos)
    --                                 AttackNoCD()
    --                                 StartBring = true
    --                                 MonFarm = v.Name
    --                                 PosMon = v.HumanoidRootPart.CFrame
    --                             until not _G.AutoKillFishCrew or not v.Parent or v.Humanoid.Health <= 0
    --                         end
    --                         end
    --                         end
    --                     end
    --                 end
    --             end
    --         end)
    --     end
    -- end)
    
    -- spawn(function()
    --     while wait() do
    --         if  _G.AutoTerrorshark and World3 then
    --             pcall(function()
    --                 if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
    --                     for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    --                         if v.Name == "Terrorshark" then
    --                             if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    --                                 repeat task.wait(_G.FastAttackDelay)
    --                                     AutoHaki()
    --                                     EquipWeapon(_G.SelectWeapon)
    --                                     v.HumanoidRootPart.CanCollide = false
    --                                     v.Humanoid.WalkSpeed = 0
    --                                     v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    --                                     AttackNoCD()
    --                                     if game.Players.LocalPlayer.Character.Humanoid.Health < 2000 then
    --                                         fastpos(v.HumanoidRootPart.CFrame * CFrame.new(0, 300, 0))
    --                                         wait(10)
    --                                     else
    --                                         topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 55, 0))
    --                                     end
    --                                     TerrorSharkpos = v.HumanoidRootPart.CFrame
    --                                 until not  _G.AutoTerrorshark or not v.Parent or v.Humanoid.Health <= 0
    --                             end
    --                         end
    --                     end
    --                 end
    --             end)
    --         end
    --     end
    -- end)

    -- spawn(function()
    --     while wait() do
    --         pcall(function()
    --             if _G.AutoTerrorshark then
    --                 if (game:GetService("Workspace").Enemies["Terrorshark"].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 150 then
    --                     repeat wait()
    --                     AttackNoCD()
    --                     until not _G.AutoTerrorshark
    --                 end
    --             end
    --         end)
    --     end
    -- end)

    
Page5.CreateToggle({
	Name = "tự động kill ghost ship",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.RelzFishBoat = v
	StopTween(_G.RelzFishBoat)
	if not _G.RelzFishBoat then
        _G.SeaSkill = false
        Skillaimbot = false
    end
		print(v)
	end,
}) 
    
    Page5.CreateToggle({
	Name = "tự động kill pirate brigade",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.RelzPirateBrigade = v
	StopTween(_G.RelzPirateBrigade)
	if not _G.RelzPirateBrigade then
        _G.SeaSkill = false
        Skillaimbot = false
    end
		print(v)
	end,
}) 

Page5.CreateToggle({
	Name = "tự động kill pirate grand brigade",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.RelzPirateGrandBrigade = v
	StopTween(_G.RelzPirateGrandBrigade)
	if not _G.RelzPirateGrandBrigade then
        _G.SeaSkill = false
        Skillaimbot = false
    end
		print(v)
	end,
}) 

Page5.CreateToggle({
	Name = "tự động kill fish crew members",
	Dis =  "",
	Value = false,
	Callback = function(v)
	_G.AutoKillFishCrew = v
	StopTween(_G.AutoKillFishCrew)
		print(v)
	end,
}) 

    

    -- spawn(function()
    --         while wait() do
    --             pcall(function()
    --                     if _G.RelzFishBoat then
    --                         for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    --                         if game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") then
    --                             repeat task.wait()
    --                                 CFrameFishBoat = v.Engine.CFrame * CFrame.new(0, 10, 0)
    --                                 if (v.Engine.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
    --                                     _G.SeaSkill = true
    --                                 else
    --                                     _G.SeaSkill = false
    --                                 end
    --                                 topos(CFrameFishBoat)
    --                                 Skillaimbot = true
    --                                 AimBotSkillPosition = v.Engine.Position
    --                             until not v.Parent or v.Health.Value < 0 or not game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") or not v:FindFirstChild("Engine") or not _G.RelzFishBoat
    --                             Skillaimbot = false
    --                             _G.SeaSkill = false
    --                         end
    --                     end
    --                 end
    --             end)
    --         end
    --     end)

Page5.CreateToggle({
	Name = "tự động kill terrorshark",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoTerrorshark = v
	StopTween(_G.AutoTerrorshark)
		print(v)
	end,
}) 

Page5.CreateToggle({
	Name = "tự động kill seabeast",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoSeaBest = v
	StopTween(_G.AutoSeaBest)
		print(v)
	end,
}) 
        if not _G.AutoSeaBest then
            _G.SeaSkill = false
            Skillaimbot = false
        end


    
        
        -- spawn(function()
        --     while wait() do
        --         if _G.AutoSeaBest then
        --                 pcall(function()
        --                 if game:GetService("Workspace"):FindFirstChild("SeaBeasts") then
        --                     for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
        --                         if CheckSeaBeast() then
        --                         repeat wait()
        --                             CFrameSeaBeast = v.HumanoidRootPart.CFrame * CFrame.new(0,400,0)
        --                             if (CFrameSeaBeast.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 50 then
        --                                 _G.SeaSkill = true
        --                             else
        --                                 _G.SeaSkill = false
        --                             end
        --                             Skillaimbot = true
        --                             AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position
        --                             topos(CFrameSeaBeast)
        --                         until not _G.AutoSeaBest or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health < 0 or not v.Parent
        --                         Skillaimbot = false
        --                         _G.SeaSkill = false
        --                         end
        --                     end
        --                 end
        --                 end)
        --             end
        --         end
        --     end)
end

Page5.CreateLable({
	Name = "Khả năng"
})
Page5.CreateSlider({
	Name = "Sáng lên",
	Max = 50,
	Min = 1,	
	Value = 20,
	Format = function(v)
	    BrightValue = v
		print(v)
	end,
})

        
Page5.CreateButton({
	Name = "thiết lập độ sáng",
	Callback = function()
		game:GetService("Lighting").Brightness = BrightValue
	end,
})

Page5.CreateToggle({
	Name = "tăng tốc độ",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.IncreaseBoatSpeed = v
		print(v)
	end,
}) 
        

            spawn(function()
                while wait() do 
                    pcall(function()
                        local vehicleSeats = {}
                        for i, v in pairs(game.Workspace.Boats:GetDescendants()) do
                            if v:IsA("VehicleSeat") then
                                table.insert(vehicleSeats, v)
                            end
                        end
                        if _G.IncreaseBoatSpeed then
                            for _, v in pairs(vehicleSeats) do
                                v.MaxSpeed = 350
                            end
                        else
                            for _, v in pairs(vehicleSeats) do
                                v.MaxSpeed = 150
                            end
                        end
                    end)
                end
            end)
 if World3 then       
Page5.CreateToggle({
	Name = "xuyên đá",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.NoClipRock = v
		print(v)
	end,
}) 
         
            spawn(function()
                while wait() do
                    pcall(function()
                    for i, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                        for _, v in pairs(game:GetService("Workspace").Boats[boat.Name]:GetDescendants()) do
                            if v:IsA("BasePart") then
                                if _G.NoClipRock or _G.SailBoat then
                                    v.CanCollide = false
                                else
                                    v.CanCollide = true
                                end
                            end
                        end
                    end
                    end)
                end
            end)
        
Page5.CreateToggle({
	Name = "tự động lái về phía trước",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoPressW = v
		print(v)
	end,
}) 
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoPressW then
                            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"W",false,game)
                        end
                        end
                    end)
                end
            end)

            DoneSkillGun = false
            DoneSkillSword = false
            DoneSkillFruit = false
            DoneSkillMelee = false
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.SeaSkill then
                            if _G.UseSeaFruitSkill and DoneSkillFruit == false then
                                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Blox Fruit" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                        end
                                    end
                                end
                            if _G.SkillFruitZ then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                wait(_G.HoldSKillC)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                            end
            
                            if _G.SkillFruitX then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                            wait(_G.HoldSKillC)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                            end
                            
                            if _G.SkillFruitC then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                            wait(_G.HoldSKillC)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                            end
            
                            if _G.SkillFruitV then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                            wait(_G.HoldSKillC)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                            end
            
                            if _G.SkillFruitF then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "F", false, game)
                            wait(_G.HoldSKillC)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "F", false, game)
                            end

                            DoneSkillFruit = true
                            end
            
                            if _G.UseSeaMeleeSkill and DoneSkillMelee == false then 
                                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Melee" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                        end
                                    end
                                end
                                if _G.SkillMeleeZ then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                
                                if _G.SkillMeleeX then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end
                                
                                if _G.SkillMeleeC then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                                end
                
                                if _G.SkillMeleeV then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                                end

                                DoneSkillMelee = true
                            end

                            if _G.UseSeaSwordSkill and DoneSkillSword == false then 
                                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Sword" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                        end
                                    end
                                end
                                if _G.SkillSwordZ then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                
                                if _G.SkillSwordX then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end

                                DoneSkillSword = true
                            end

                            if _G.UseSeaGunSkill and DoneSkillGun == false then 
                                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Gun" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                        end
                                    end
                                end
                                if _G.SkillGunZ then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                wait(.1)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                
                                if _G.SkillGunX then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                wait(.1)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end

                                DoneSkillGun = true
                            end
            
                            DoneSkillGun = false
                            DoneSkillSword = false
                            DoneSkillFruit = false
                            DoneSkillMelee = false
                        end
                    end)
                end
            end)

Page6.CreateLable({
	Name = "Setting"
})

Page6.CreateToggle({
	Name = "sử dụng skill fruit",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.UseSeaFruitSkill = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "Sử dụng skill melee",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.UseSeaMeleeSkill = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "sử dụng skill sword",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.UseSeaSwordSkill = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "sử dụng skill Gun",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.UseSeaGunSkill = v
		print(v)
	end,
}) 


    Page6.CreateLable({
	Name = "kỹ năng Fruit"
})

Page6.CreateToggle({
	Name = "kỹ năng Z",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillFruitZ = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "kỹ năng X",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillFruitX = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "kỹ năng C",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillFruitC = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "kỹ năng V",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillFruitV = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "kỹ năng F",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillFruitF = v
		print(v)
	end,
}) 

    Page6.CreateLable({
	Name = "kỹ năng Melee"
})

Page6.CreateToggle({
	Name = "kỹ năng Z",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillMeleeZ = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "kỹ năng X",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillMeleeX = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "kỹ năng C",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillMeleeC = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "kỹ năng V",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillMeleeV = v
		print(v)
	end,
}) 



Page6.CreateLable({
	Name = "kỹ năng Sword"
})

Page6.CreateToggle({
	Name = "kỹ năng Z",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillSwordZ = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "kỹ năng X",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillSwordX = v
		print(v)
	end,
}) 

Page6.CreateLable({
	Name = "kỹ năng Gun"
})

Page6.CreateToggle({
	Name = "kỹ năng Z",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillGunZ = v
		print(v)
	end,
}) 

Page6.CreateToggle({
	Name = "kỹ năng X",
	Dis = "",
	Value = true,
	Callback = function(v)
	_G.SkillGunX = v
		print(v)
	end,
}) 
end

    
    


        
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod()
	local args = {...}
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot then
					args[2] = AimBotSkillPosition
					return old(unpack(args))
				end
			end
		end
	end
	return old(...)
end)

spawn(function()
    while wait() do
        pcall(function()
            if UseSkill then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Kill_At / 100 then
                if _G.SkillZ then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(_G.HoldSKillZ)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if _G.SkillX then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(_G.HoldSKillX)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
                if _G.SkillC then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                    wait(_G.HoldSKillC)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                end
                if _G.SkillV then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    wait(_G.HoldSKillV)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
                if _G.SkillF then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "F", false, game)
                    wait(_G.HoldSKillF)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "F", false, game)
                end
            end
            end
            end
        end)
    end
end)


spawn(function()
    while wait() do
        pcall(function()
            if UseGunSkill then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Kill_At / 100 then
                if _G.SkillZ then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(0.5)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if _G.SkillX then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(0.5)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
            end
            end
            end
        end)
    end
end)

        
if World2 then
Page4.CreateToggle({
	Name = "Tự động lấy đinh ba rồng",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Auto_Dragon_Trident = v
	StopTween(_G.Auto_Dragon_Trident)
		print(v)
	end,
}) 
    
    local TridentPos = CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125)
    spawn(function()
        while wait() do
            if  _G.Auto_Dragon_Trident and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Tide Keeper" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Auto_Dragon_Trident or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude > 1500 then
			        BTP(TridentPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude < 1500 then
				    topos(TridentPos)
					end
				else
				    topos(TridentPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                       
                        end
                    end
                end)
            end
        end
    end)
end
    
    
    local NamfonPos = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562)
    spawn(function()
        while wait() do
            if  _G.Autowaden and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Chief Warden" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Autowaden or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude > 1500 then
			        BTP(TridentPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude < 1500 then
				    topos(TridentPos)
					end
				else
				    topos(TridentPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                       
                        end
                    end
                end)
            end
        end
    end)
    
    
    local GayMakPos = CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375)
    spawn(function()
        while wait() do
            if  _G.Autogay and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Greybeard") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Greybeard" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Autogay or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - GayMakPos.Position).Magnitude > 1500 then
			        BTP(GayMakPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - GayMakPos.Position).Magnitude < 1500 then
				    topos(GayMakPos)
					end
				else
				    topos(GayMakPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                       
                        end
                    end
                end)
            end
        end
    end)
    
if World1 then
Page4.CreateToggle({
	Name = "Tự động lấy Pole v1",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Autopole = v
	StopTween(_G.Autopole)
		print(v)
	end,
}) 
Page4.CreateToggle({
	Name = "Tự động lấy Cưa cá mập",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Autosaw = v
	StopTween(_G.Autosaw)
		print(v)
	end,
}) 
Page4.CreateToggle({
	Name = "Tự động kill râu trắng",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Autogay = v
	StopTween(_G.Autogay)
		print(v)
	end,
}) 
   
end
    
     
local PolePos = CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625)
    spawn(function()
        while wait() do
            if  _G.Autopole and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Thunder God" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Autopole or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PolePos.Position).Magnitude > 1500 then
			        BTP(PolePos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PolePos.Position).Magnitude < 1500 then
				    topos(PolePos)
					end
				else
				    topos(TridentPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end)
            end
        end
    end)
if World2 then
Page4.CreateToggle({
	Name = "tự động lấy kính swan",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoFarmSwanGlasses = v
	StopTween(_G.AutoFarmSwanGlasses)
		print(v)
	end,
}) 


    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoFarmSwanGlasses then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Don Swan" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    pcall(function()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    end)
                                until _G.AutoFarmSwanGlasses == false or v.Humanoid.Health <= 0
                            end
                        end
                    else 
                        repeat task.wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320801, 905.48291015625)) 
                        until (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 or _G.AutoFarmSwanGlasses == false
                    end
                end
            end
        end)
    end)
end
    
    
    local SharkPos = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094)
    spawn(function()
        while wait() do
            if  _G.Autosaw and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "The Saw" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Autosaw or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SharkPos.Position).Magnitude > 1500 then
			        BTP(SharkPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SharkPos.Position).Magnitude < 1500 then
				    topos(SharkPos)
					end
				else
				    topos(SharkPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2,40,2))
                       
                        end
                    end
                end)
            end
        end
    end)
    
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if (_G.AutoFarmSwanGlasses and _G.AutoFarmSwanGlasses_Hop) and World2 and not game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") and not game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                    Hop()
                end
            end
        end)
    end)
    

Page4.CreateLable({
	Name = "Observation"
})

ObservationRange = Page4.CreateLable({
	Name = "Observation"
})
    
    spawn(function()
        while wait() do
            pcall(function()
                ObservationRange:Set("Observation Range : "..math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
            end)
        end
    end)
    
Page4.CreateToggle({
	Name = "tự động farm haki",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoObservation = v
	StopTween(_G.AutoObservation)
		print(v)
	end,
}) 

Page4.CreateToggle({
	Name = "tự động nâng haki V2",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoObservationv2 = v
	StopTween(_G.AutoObservationv2)
		print(v)
	end,
}) 

    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoObservation then
                    repeat task.wait()
                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            game:GetService('VirtualUser'):CaptureController()
                            game:GetService('VirtualUser'):SetKeyDown('0x65')
                            wait(2)
                            game:GetService('VirtualUser'):SetKeyUp('0x65')
                        end
                    until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.AutoObservation
                end
            end)
        end
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoObservation then
                    if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 5000 then
                        Alert:create("You Have Max Points")
                        wait(2)
                    else
                        if World2 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until _G.AutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)+
                                            wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until _G.AutoObservation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                            end
                        elseif World1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until _G.AutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until _G.AutoObservation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                            end
                        elseif World3 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until _G.AutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until _G.AutoObservation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                            end
                        end
                    end
                end
            end
        end)
    end)

if World1 then
Page4.CreateToggle({
	Name = "tự động lấy Saber",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Auto_Saber = v
	StopTween(_G.Auto_Saber)
		print(v)
	end,
}) 

			

			
 spawn(function()
        while task.wait() do
            if _G.Auto_Saber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
                pcall(function()
                    if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                            if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                                wait(1)
                            else
                                topos(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                            end
                        else
                            if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                                    EquipWeapon("Torch")
                                    topos(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                                  else
                                  topos(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
                                end
                            else
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                                    wait(0.5)
                                    EquipWeapon("Cup")
                                    wait(0.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                                    wait(0)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                                else
                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
										topos(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559)) 
                                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                if v.Name == "Mob Leader" then
                                                   if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        repeat task.wait(_G.FastAttackDelay)
                                                        AutoHaki()
                                                        EquipWeapon(_G.SelectWeapon)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.Humanoid.WalkSpeed = 0
                                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                                        AttackNoCD()
                                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                                        until v.Humanoid.Health <= 0 or not _G.Auto_Saber
                                                     end
                                                end
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * Farm_Mode)
                                                end
                                            end
                                        end
                                     end
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                        wait(0.5)
                                        EquipWeapon("Relic")
                                        wait(0.5)
                                        topos(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == "Saber Expert" then
                                        repeat task.wait(_G.FastAttackDelay)
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid.JumpPower = 0
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            StartBring = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                            AttackNoCD()
                                        until v.Humanoid.Health <= 0 or not _G.Auto_Saber
                                        StartBring = true
                                        if v.Humanoid.Health <= 0 then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end
    
Page3.CreateLable({
	Name = "Other"
})

if World3 then
Page3.CreateToggle({
	Name = "tự động đánh hải tặc",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.RaidPirate = v
	StopTween(_G.RaidPirate)
		print(v)
	end,
}) 


spawn(function()
    while wait() do
        if _G.RaidPirate then
            pcall(function()
                local Frame3 = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
                if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.RaidPirate and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                                repeat task.wait(_G.FastAttackDelay)
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCD()
                                until v.Humanoid.Health <= 0 or not v.Parent or not _G.RaidPirate
                            end
                        end
                    end
                else
                    UnEquipWeapon(_G.SelectWeapon)
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Frame3.Position).Magnitude > 1500 then
			        BTP(Frame3)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Frame3.Position).Magnitude < 1500 then
				    topos(Frame3)
					end
                    end
                end
            end)
        end
    end
    end)
end

if World2 then
Page3.CreateToggle({
	Name = "tự động nâng tộc v2",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Auto_EvoRace = v
	StopTween(_G.Auto_EvoRace)
		print(v)
	end,
}) 

spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_EvoRace then
                    if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                            topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                            if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.3)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                            pcall(function()
                                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                    topos(game:GetService("Workspace").Flower1.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                    topos(game:GetService("Workspace").Flower2.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Zombie" then
                                                repeat task.wait(_G.FastAttackDelay)
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    AttackNoCD()
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    MonFarm = v.Name
                                                    StartBring = true
                                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_EvoRace == false
                                                StartBring = false
                                            end
                                        end
                                    else
                                        topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                    end
                                end
                            end)
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                        end
                    end
                end
            end
        end)
    end)
end
 if World3 then   
Page3.CreateToggle({
	Name = "tự động đánh người nộm",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Namfon = v
	StopTween(_G.Namfon)
		print(v)
	end,
}) 

        
        local GGPos = CFrame.new(3757.732421875, 91.99540710449219, 253.65066528320312)
        spawn(function()
            while wait() do
                if _G.Namfon and World3 then
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Training Dummy") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Training Dummy") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Training Dummy") then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Training Dummy") or game:GetService("Workspace").Enemies:FindFirstChild("Training Dummy") or game:GetService("Workspace").Enemies:FindFirstChild("Training Dummy") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Training Dummy" or v.Name == "Training Dummy" or v.Name == "Training Dummy" then
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                repeat wait(_G.FastAttackDelay)
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    Fastattack = true
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    AttackNoCD()
                                                until _G.Namfon == false or v.Humanoid.Health <= 0 or not v.Parent
                                                Fastattack = false
                                            end
                                        end
                                    end
                                else
                                if BypassTP then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - GGPos.Position).Magnitude > 1500 then
                                BTP(GGPos)
                                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - GGPos.Position).Magnitude < 1500 then
                                topos(GGPos)
                                end
                            else
                                topos(GGPos)
                            end
                                    topos(CFrame.new(3757.732421875, 91.99540710449219, 253.65066528320312))
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy").HumanoidRootPart.CFrame * MethodFarm)
                                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy").HumanoidRootPart.CFrame * MethodFarm)
                                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy").HumanoidRootPart.CFrame * MethodFarm)
                                    end
                                end                    
                            end
                        else
                            if _G.AutoArenaTrainerHop and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ArenaTrainer") == "I don't have anything for you right now. Come back later." then
                                hop()
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ArenaTrainer")
                            end
                        end
                    end)
                end
            end
        end)
    end
if World3 then
Page3.CreateToggle({
	Name = "tự động đánh Admin Boss",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoDarkDagger = v
	StopTween(_G.AutoDarkDagger)
		print(v)
	end,
})     
        
            
        local AdminPos = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
        spawn(function()
            pcall(function()
                while wait() do
                    if _G.AutoDarkDagger then
                        if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == ("rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait(_G.FastAttackDelay)
                                        pcall(function()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            AttackNoCD()
                                        end)
                                    until _G.AutoDarkDagger == false or v.Humanoid.Health <= 0
                                end
                            end
                        else
                        if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - AdminPos.Position).Magnitude > 1500 then
                        BTP(AdminPos)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - AdminPos.Position).Magnitude < 1500 then
                        topos(AdminPos)
                        end
                    else
                        topos(AdminPos)
                    end
                            UnEquipWeapon(_G.SelectWeapon)
                            topos(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                        end
                    end
                end
            end)
        end)
        
Page3.CreateToggle({
	Name = "tự động bật haki màu",
	Dis = "",
	Value = false,
	Callback = function(v)
	Open_Color_Haki = v
	StopTween(Open_Color_Haki)
		print(v)
	end,
}) 

    
    spawn(function()
        while wait(.3) do
            pcall(function()
                if Open_Color_Haki then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
                    wait(0.5)
                    repeat topos(CFrame.new(-5420.16602, 1084.9657, -2666.8208)) wait() 
                    until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                    wait(0.5)
                    repeat topos(CFrame.new(-5414.41357, 309.865753, -2212.45776)) wait() 
                    until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 10
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
                    wait(0.5)
                    repeat topos(CFrame.new(-4971.47559, 331.565765, -3720.02954)) wait() 
                    until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10
                    wait(0.5)
                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280,600))
                    wait(3)
                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280,600))
                end
            end) 
        end
    end)
    
Page3.CreateToggle({
	Name = "tự động lấy mũ lính ngự lâm",
	Dis = "Musketeer",
	Value = false,
	Callback = function(v)
	_G.AutoMusketeerHat = v
	StopTween(_G.AutoMusketeerHat)
		print(v)
	end,
}) 

    
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoMusketeerHat then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Forest Pirate" then
                                        repeat task.wait(_G.FastAttackDelay)
                                            pcall(function()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                AttackNoCD()
                                                PosMon = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                                StartBring = true
                                            end)
                                        until _G.AutoMusketeerHat == false or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        StartBring = false
                                    end
                                end
                            else
                                StartBring = false
                                topos(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                            end
                        else
                            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                            if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Captain Elephant" then
                                        OldCFrameElephant = v.HumanoidRootPart.CFrame
                                        repeat task.wait(_G.FastAttackDelay)
                                            pcall(function()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.CFrame = OldCFrameElephant
                                                ATtackNoCD()
                                                -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            end)
                                        until _G.AutoMusketeerHat == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    end
                                end
                            else
                                topos(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                            end
                        else
                            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                            if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
                        topos(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
                    end
                end
            end
        end)
    end)
    
Page3.CreateToggle({
	Name = "tự động lấy haki cầu vồng",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Auto_Rainbow_Haki = v
	StopTween(_G.Auto_Rainbow_Haki)
		print(v)
	end,
}) 

    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_Rainbow_Haki then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Stone" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait(_G.FastAttackDelay)
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        AttackNoCD()
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Island Empress" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait(_G.FastAttackDelay)
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        AttackNoCD()
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, -0, -0.994878292, -0, 1, -0, 0.994878292, 0, -0.101080291))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Kilo Admiral" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait(_G.FastAttackDelay)
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        AttackNoCD()
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Captain Elephant" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait(_G.FastAttackDelay)
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        AttackNoCD()
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08, 0.714521289))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Beautiful Pirate" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait(_G.FastAttackDelay)
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        AttackNoCD()
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
                        end
                    else
                        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    end
                end
            end
        end)
    end)
end
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoObservationv2 then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 3 then
                        _G.AutoMusketeerHat = false
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and  game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
                            repeat 
                                topos(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
                                wait() 
                            until not _G.AutoObservationv2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                            repeat 
                                topos(CFrame.new(-10920.125, 624.20275878906, -10266.995117188)) 
                                wait() 
                            until not _G.AutoObservationv2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
                        else
                            for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                                if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
                                    v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10)
                                    wait()
                                    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
                                    wait()
                                end
                            end   
                        end
                    else
                        _G.AutoMusketeerHat = true
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoRengoku then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                        EquipWeapon("Hidden Key")
                        topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v.Humanoid.Health > 0 then
                                repeat task.wait(_G.FastAttackDelay)
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    PosMon = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCD()
                                    StartBring = true
                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
                                StartBring = false
                            end
                        end
                    else
                        StartBring = false
                        topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoEctoplasm then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer" then
                                repeat task.wait(_G.FastAttackDelay)
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    if string.find(v.Name,"Ship") then
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        StartBring = true
                                    else
                                        StartBring = false
                                        topos(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
                                    end
                                until _G.AutoEctoplasm == false or not v.Parent or v.Humanoid.Health <= 0
                                StartBring = false
                            end
                        end
                    else
                        local Distance = (Vector3.new(911.35827636719, 125.95812988281, 33159.5390625) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Distance > 18000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                        topos(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
                    end
                end
            end
        end)
    end)
if World2 then
Page3.CreateToggle({
	Name = "tự động làm nhiệm vụ Bartlio",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoBartilo = v
	StopTween(_G.AutoBartilo)
		print(v)
	end,
}) 

    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoBartilo then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                            if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
                                Ms = "Swan Pirate"
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then
                                        pcall(function()
                                            repeat task.wait(_G.FastAttackDelay)
                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.Transparency = 1
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * Pos)													
                                                PosMon =  v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                                AttackNoCD()
                                                StartBring = true
                                            until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            StartBring = false
                                        end)
                                    end
                                end
                            else
                                repeat topos(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)).Magnitude <= 10
                            end
                        else
                            repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                        end 
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
                            Ms = "Jeremy"
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Ms then
                                    OldCFrameBartlio = v.HumanoidRootPart.CFrame
                                    repeat task.wait(_G.FastAttackDelay)
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()
                                        v.HumanoidRootPart.Transparency = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameBartlio
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                            wait(1)
                            repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                            wait(2)
                        else
                            repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                        repeat topos(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
                    end
                end 
            end
        end)
    end)
end
if World3 then
Page3.CreateToggle({
	Name = "tự động thấp đuốt",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoHolyTorch = v
	StopTween(_G.AutoHolyTorch)
		print(v)
	end,
}) 

    
    spawn(function()
    while wait(.5) do
        pcall(function()
            if _G.AutoHolyTorch then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
                    repeat wait(.2)
                        EquipWeapon("Holy Torch")
                        topos(CFrame.new(-10752.4434, 415.261749, -9367.43848, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    until (Vector3.new(-10752.4434, 415.261749, -9367.43848)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    repeat wait(.2)
                        EquipWeapon("Holy Torch")
                        topos(CFrame.new(-11671.6289, 333.78125, -9474.31934, 0.300932229, 0, -0.953645527, 0, 1, 0, 0.953645527, 0, 0.300932229))
                    until (Vector3.new(-11671.6289, 333.78125, -9474.31934)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    repeat wait(.2)
                        EquipWeapon("Holy Torch")
                        topos(CFrame.new(-12133.1406, 521.507446, -10654.292, 0.80428642, 0, -0.594241858, 0, 1, 0, 0.594241858, 0, 0.80428642))
                    until (Vector3.new(-12133.1406, 521.507446, -10654.292)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    repeat wait(.2)
                        EquipWeapon("Holy Torch")
                        topos(CFrame.new(-13336.127, 484.521179, -6985.31689, 0.853732228, 0, -0.520712316, 0, 1, 0, 0.520712316, 0, 0.853732228))
                    until (Vector3.new(-13336.127, 484.521179, -6985.31689)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    EquipWeapon("Holy Torch")
                    repeat wait(.2)
                        topos(CFrame.new(-13487.623, 336.436188, -7924.53857, -0.982848108, 0, 0.184417039, 0, 1, 0, -0.184417039, 0, -0.982848108))
                    until (Vector3.new(-13487.623, 336.436188, -7924.53857)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    Com()
                    wait(20)
                end
            end
        end)
    end
end)
end

spawn(function()
	while task.wait() do
		pcall(function()
            CheckQuest()
			for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.BringMonster then
					if StartBring and v.Name == MonFarm or v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if v.Name == "Factory Staff" then
							if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 250 then
								v.Head.CanCollide = false
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
								v.HumanoidRootPart.CFrame = PosMon
								if v.Humanoid:FindFirstChild("Animator") then
									v.Humanoid.Animator:Destroy()
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
							end
						elseif v.Name == MonFarm or v.Name == Mon then
							if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= _G.BringMode then
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                v.HumanoidRootPart.CFrame = PosMon
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						end
					end
				end
			end
		end)
	end
end)


function InMyNetWork(object)
	if isnetworkowner then
		return isnetworkowner(object)
	else
		if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then 
			return true
		end
		return false
	end
end
    
Page8.CreateLable({
	Name = "thống kê chỉ số"
})

Pointstat = Page8.CreateLable({
	Name = "điểm"
})

    
    spawn(function()
        while wait() do
            pcall(function()
                Pointstat:Set("Stat Points : "..tostring(game:GetService("Players")["LocalPlayer"].Data.Points.Value))
            end)
        end
    end)
    
    Page7.CreateMultiDropdown({
	Name = "chọn chỉ số để nâng",
	Value = {"Melee"},
	List = {"Melee","Defense","Sword","Gun","Demon Fruit"},
	Callback = function(v)
	STlis = v
		print(v)
	end,
})

spawn(function()
		while wait() do
			pcall(function()
				if _G.Auto_Stats then
				if game.Players.localPlayer.Data.Points.Value >= PointStats then
					for _,g in next, STlis do
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint",tostring(g),PointStats)
						end
					end
				end
			end)
		end
	end)
	
Page7.CreateToggle({
	Name = "tự động thống kê",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Auto_Stats = v
		print(v)
	end,
}) 
       


Page7.CreateSlider({
	Name = "điểm nâng",
	Max = 100,
	Min = 1,	
	Value = 1,
	Format = function(v)
	PointStats = v
		print(v)
	end,
})




Melee = Page8.CreateLable({
	Name = "Điểm cận chiến"
})
Defense = Page8.CreateLable({
	Name = "Điểm phòng thủ"
})
Sword = Page8.CreateLable({
	Name = "Điểm kiếm"
})
Gun = Page8.CreateLable({
	Name = "Điểm súng"
})
Fruit = Page8.CreateLable({
	Name = "Điểm fruit"
})


    spawn(function()
        while wait() do
            pcall(function()
                Melee:Set("Melee : "..game.Players.localPlayer.Data.Stats.Melee.Level.Value)
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                Defense:Set("Defense : "..game.Players.localPlayer.Data.Stats.Defense.Level.Value)
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                Sword:Set("Sword : "..game.Players.localPlayer.Data.Stats.Sword.Level.Value)
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                Gun:Set("Gun : "..game.Players.localPlayer.Data.Stats.Gun.Level.Value)
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                Fruit:Set("Fruit : "..game.Players.localPlayer.Data.Stats["Demon Fruit"].Level.Value)
            end)
        end
    end)

	
    
if World1 or World2 then
Page10.CreateLable({
	Name = "Đi tới Biển Thứ Ba"
})
end

    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_EvoRace then
                    if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                            topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                            if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.3)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                            pcall(function()
                                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                    topos(game:GetService("Workspace").Flower1.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                    topos(game:GetService("Workspace").Flower2.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Zombie" then
                                                repeat task.wait(_G.FastAttackDelay)
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    AttackNoCD()
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    MonFarm = v.Name
                                                    StartBring = true
                                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_EvoRace == false
                                                StartBring = false
                                            end
                                        end
                                    else
                                        topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                    end
                                end
                            end)
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                        end
                    end
                end
            end
        end)
    end)

if World3 then
Page10.CreateLable({
	Name = "Race V4"
})

Page10.CreateButton({
	Name = "dịch chuyển đến đỉnh cây",
	Callback = function()
		TP1(CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625))
	end,
})

Page10.CreateButton({
	Name = "Dịch chuyển đến đền thờ",
	Callback = function()
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
	end,
})

Page10.CreateButton({
	Name = "dịch chuyển cần gạt",
	Callback = function()
		TP1(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
	end,
})

Page10.CreateButton({
	Name = "dịch chuyển đến Ancient One",
	Callback = function()
		TP1(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
	end,
})

Page10.CreateButton({
	Name = "di chuyển đến đồng hồ",
	Callback = function()
		game:GetService("Workspace").Map["Temple of Time"].DoNotEnter:Remove()
        game:GetService("Workspace").Map["Temple of Time"].ClockRoomExit:Remove()
	end,
})


Page10.CreateToggle({
	Name = "Tự động mua Gear",
	Dis = "Buy Gear",
	Value = false,
	Callback = function(v)
	_G.Auto_Farm_Bone4 = v
		print(v)
	end,
}) 

spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_Farm_Bone4 then
    local args = {
    [1] = true
}

local args = {
    [1] = "UpgradeRace",
    [2] = "Buy"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
            end
end 
end)  
end)

Page10.CreateToggle({
	Name = "tự động nhìn mặt trăng",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoDooHee = v
		print(v)
	end,
}) 

Page10.CreateToggle({
	Name = "tự động kích hoạt tộc v3",
	Dis = "Oper Rece",
	Value = false,
	Callback = function(v)
	_G.AutoAgility = v
		print(v)
	end,
}) 

spawn(function()
    while wait() do
		pcall(function()
			if _G.AutoDooHee then
			    wait()
				local moonDir = game.Lighting:GetMoonDirection()
                local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
			end
		end)
    end
end)
Page10.CreateToggle({
	Name = "tự động farm trial tộc",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoRace = v
	StardFarm = v
	StopTween(_G.AutoRace)
		print(v)
	end,
}) 

spawn(function()
		pcall(function()
			while wait() do
				if _G.AutoRace then
					if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
					    StardFarm = false
					    topos(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
					end
				end
			end
		end)
	end)
    spawn(function()
        while wait() do 
            if StardFarm and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief") or game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" or v.Name == "Sweet Thief" or v.Name == "Candy Rebel" then
                               if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                   repeat task.wait(_G.FastAttackDelay)
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartBring = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCD()
                                    until not StardFarm or not v.Parent or v.Humanoid.Health <= 0
                                    StartBring = false
                                end
                            end
                        end
                    else
						topos(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
                    end
                end)
            end
        end
    end)
    spawn(function()
		pcall(function()
			while wait() do
				if _G.AutoRace then
					if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
					    StardFarm = true
					end
				end
			end
		end)
	end)
spawn(function()
    while wait() do
		pcall(function()
			if _G.AutoRace then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
			end
		end)
    end
end)

Page10.CreateButton({
	Name = "dịch đến cổng tộc cyborg",
	Callback = function()
		TP1(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
	end,
})

Page10.CreateButton({
	Name = "dịch đến cổng tộc Fish",
	Callback = function()
		TP1(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
	end,
})
 
 Page10.CreateButton({
	Name = "dịch đến cổng tộc Ghoul",
	Callback = function()
		TP1(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
	end,
})

Page10.CreateButton({
	Name = "dịch đến cổng tộc Human",
	Callback = function()
		TP1(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
	end,
})

Page10.CreateButton({
	Name = "dịch đến cổng tộc Mink",
	Callback = function()
		TP1(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
	end,
})

Page10.CreateButton({
	Name = "dịch đến cổng tộc Sky",
	Callback = function()
		TP1(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
	end,
})
  
Page10.CreateLable({
	Name = "tự động trial"
})

Page10.CreateButton({
	Name = "tự động mua gear",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer('UpgradeRace','Buy')
	end,
})


Page10.CreateToggle({
	Name = "tự động kill người chơi trial[error]",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoKillTial = v
	StopTween(_G.AutoKillTial)
		print(v)
	end,
}) 

Page10.CreateToggle({
	Name = "tự động hoàn thành ải tộc",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoQuestRace = v
	StopTween(_G.AutoQuestRace)
		print(v)
	end,
}) 

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
				if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									-- sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
					for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
						if v.Name ==  "snowisland_Cylinder.081" then
							topos(v.CFrame* CFrame.new(0,0,0))
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
					for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
						if v.Name ==  "HumanoidRootPart" then
							topos(v.CFrame* CFrame.new(0,300,0))
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
					
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
					topos(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
					for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
						if v.Name == "StartPoint" then
							topos(v.CFrame* CFrame.new(0,10,0))
					  	end
				   	end
				end
			end
        end
    end)
end)
  
Page10.CreateButton({
	Name = "tự động hoàn thành ải Angel",
	Callback = function()
		TP1(game.Workspace.Map.SkyTrial.Model.FinishPart.CFrame)
	end,
})

Page10.CreateButton({
	Name = "tự động hoàn thành ải Rabbit",
	Callback = function()
		TP1(game:GetService("Workspace").Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-5,0))
	end,
})

Page10.CreateButton({
	Name = "tự động hoàn thành ải Cyborg",
	Callback = function()
		TP1(CFrame.new(0,300,0))
	end,
})
end
    
spawn(function()
    while wait() do 
        pcall(function()
            if _G.AutoKillTial then
                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                        if v.Humanoid.Health > 0 then
                            repeat wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                NameTarget = v.Name
                                topos(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,5))
                                v.HumanoidRootPart.CanCollide = false
                                UseskillKill = true
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                AttackNoCD()
                            until not _G.AutoKillTial or not v.Parent or v.Humanoid.Health <= 0 
                            UseskillKill = false
                        end
                    end
                end
            end
        end)
    end
end)

    spawn(function()
    while wait() do
		pcall(function()
			if UseskillKill then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
			end
		end)
    end
    end)

Page9.CreateLable({
	Name = "Chiến đấu"
})

plyserv = Page9.CreateLable({
	Name = "Người chơi"
})

	

    

    spawn(function()
        while wait() do
            pcall(function()
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if i == 12 then
                        plyserv:Set("Players :".." "..i.." ".."/".." ".."12".." ".."(Max)")
                    elseif i == 1 then
                        plyserv:Set("Player :".." "..i.." ".."/".." ".."12")
                    else
                        plyserv:Set("Players :".." "..i.." ".."/".." ".."12")
                    end
                end
            end)
        end
    end)
    
    Playerslist = {}
    
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(Playerslist,v.Name)
    end
    
SelectedPly = Page9.CreateDropdown({
	Name = "Chọn người chơi",
	Value = "Playerslist",
	List = Playerslist,
	Callback = function(v)
	    _G.SelectPly = v
		print(v)
	end,
})

Page9.CreateButton({
	Name = "làm mới người chơi",
	Callback = function()
		Playerslist = {}
        SelectedPly:Clear()
        for i,v in pairs(game:GetService("Players"):GetChildren()) do  
            SelectedPly:Add(v.Name)
        end
	end,
})

Page9.CreateToggle({
	Name = "xem người chơi",
	Dis = "",
	Value = false,
	Callback = function(v)
	SpectatePlys = v
        local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
        local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
        repeat wait(.1)
            game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
        until SpectatePlys == false 
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
		print(v)
	end,
}) 
    
Page9.CreateToggle({
	Name = "di chuyển đến người chơi",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.TeleportPly = value
        pcall(function()
            if _G.TeleportPly then
                repeat topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame) wait() until _G.TeleportPly == false
            end
            StopTween(_G.TeleportPly)
        end)
		print(v)
	end,
}) 
Page9.CreateToggle({
	Name = "tự động đánh người chơi bypass",
	Dis = "",
	Value = false,
	Callback = function(v)
	DMDHub = v
                                    if DMDHub == false then
                                        game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                    end
                                    while DMDHub do task.wait()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
                                        game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    end
		print(v)
	end,
}) 

                                    
Page9.CreateToggle({
	Name = "tự động đánh người chơi",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Auto_Kill_Ply = v
	StopTween(_G.Auto_Kill_Ply)
		print(v)
	end,
}) 

    
    spawn(function()
        while wait() do
            if _G.Auto_Kill_Ply then
                pcall(function()
                    if _G.SelectPly ~= nil then 
                        if game.Players:FindFirstChild(_G.SelectPly) then
                            if game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CanCollide = false
                                    topos(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0))
                                    spawn(function()
                                        pcall(function()
                                            if _G.SelectWeapon == SelectWeaponGun then
                                                local args = {
                                                    [1] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position,
                                                    [2] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart
                                                }
                                                game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                            else
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                            end
                                        end)
                                    end)
                                until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not game.Players:FindFirstChild(_G.SelectPly) or not _G.Auto_Kill_Ply
                            end
                        end
                    end
                end)
            end
        end
    end)
   
Page9.CreateLable({
	Name = "Mang thuyền"
})

BoatsName = {}

for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do  
  table.insert(BoatsName ,v.Name)
end 


Boats = Page9.CreateDropdown({
	Name = "chọn thuyền",
	Value = "Boat  ",
	List = BoatsName,
	Callback = function(v)
	    _G.ELkY = v
		print(v)
	end,
})


Page9.CreateButton({
	Name = "làm mới lại thuyền",
	Callback = function()
		BoatsName = {}
        Boats:Clear()
        for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do  
            Boats:Add(v.Name)
        end
	end,
})

Page9.CreateButton({
	Name = "mua thuyền",
	Callback = function()
		game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Boats[_G.ELkY].VehicleSeat.CFrame
	end,
})

Page9.CreateLable({
	Name = "nhận nhiệm vụ"
})

Page9.CreateButton({
	Name = "nhận nhiệm vụ người chơi",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
	end,
})

Page9.CreateToggle({
	Name = "tự động săn người chơi",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoPlayerHunter = v
	StopTween(_G.AutoPlayerHunter)
		print(v)
	end,
}) 

	spawn(function()
		game:GetService("RunService").Heartbeat:connect(function()
			pcall(function()
				if _G.AutoPlayerHunter then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
					end
				end
			end)
		end)
	end)

	   spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoPlayerHunter then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)

	spawn(function()
		while wait() do
			if _G.AutoPlayerHunter then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
				else
					for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
							repeat wait()
								AutoHaki()
								EquipWeapon(_G.SelectWeapon)
								Useskill = true
								topos(v.HumanoidRootPart.CFrame * CFrame.new(1,7,3))								
								v.HumanoidRootPart.Size = Vector3.new(60,60,60)
								game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
							until _G.AutoPlayerHunter == false or v.Humanoid.Health <= 0
							Useskill = false
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						end
					end
				end
			end
		end
	end)
	

    
Page9.CreateLable({
	Name = "ghim tâm"
})
     
    spawn(function()
        while wait() do
            pcall(function()
                local MaxDistance = math.huge
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                        local Distance = v:DistanceFromCharacter(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)
                        if Distance < MaxDistance then
                            MaxDistance = Distance
                            PlayerSelectAimbot = v.Name
                        end
                    end
                end
            end)
        end
    end)

Page9.CreateToggle({
	Name = "ghim tâm súng",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Aimbot_Gun = v
		print(v)
	end,
}) 

    
    spawn(function()
        while task.wait() do
            if _G.Aimbot_Gun and game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponGun) then
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].Cooldown.Value = 0
                    local args = {
                        [1] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart.Position,
                        [2] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart
                    }
                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                    game:GetService'VirtualUser':CaptureController()
                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                end)
            end
        end
    end)

Page9.CreateToggle({
	Name = "mục tiêu gần nhất",
	Dis = "",
	Value = false,
	Callback = function(v)
	AimSkillNearest = v
		print(v)
	end,
}) 


spawn(function()
	while wait(.1) do
		pcall(function()
			local MaxDistance = math.huge
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					local Distance = v:DistanceFromCharacter(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
					if Distance < MaxDistance then
						MaxDistance = Distance
						TargetPlayerAim = v.Name
					end
				end
			end
		end)
	end
end)

spawn(function()
	pcall(function()
		game:GetService("RunService").RenderStepped:connect(function()
			if AimSkillNearest and TargetPlayerAim ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
				local args = {
					[1] = game:GetService("Players"):FindFirstChild(TargetPlayerAim).Character.HumanoidRootPart.Position
				}
				game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
			end
		end)
	end)
end)

Page9.CreateToggle({
	Name = "Ghim tâm Skill",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Aimbot_Skill = v
		print(v)
	end,
}) 
    
    spawn(function()
        pcall(function()
            while task.wait() do
                if _G.Aimbot_Skill and PlayerSelectAimbot ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
                    local args = {
                        [1] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart.Position
                    }
                    
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name).RemoteEvent:FireServer(unpack(args))
                end
            end
        end)
    end)
    
Page9.CreateToggle({
	Name = "Bật PvP",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.EnabledPvP = v
		print(v)
	end,
}) 
    
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.EnabledPvP then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)
    
Page9.CreateToggle({
	Name = "chế độ an toàn",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Safe_Mode = v
	StopTween(_G.Safe_Mode)
		print(v)
	end,
}) 

    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Safe_Mode then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,200,0)
                end
            end
        end)
    end)

Page9.CreateButton({
	Name = "phục hồi",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
		wait()
	end,
})
    
Page11.CreateLable({
	Name = "tập kích"
})

TimeRaid = Page11.CreateLable({
	Name = "Siêu đột kích"
})

Island = Page11.CreateLable({
	Name = "Cuộc đột kích bổ sung"
})
    
    spawn(function()
        pcall(function()
            while wait() do
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    TimeRaid:Set(game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Text)
                else
                    TimeRaid:Set("Wait For Dungeon")
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 5') then
    Island:Set('๐๏ธ Island 5')
    elseif game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 4') then
      Island:Set('๐๏ธ Island 4')
      elseif game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 3') then
      Island:Set('๐๏ธ Island 3')
      elseif game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 2') then
      Island:Set('๐๏ธ Island 2')
      elseif game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 1') then
      Island:Set('๐๏ธ Island 1')
      else
      Island:Set("Start Dungeon") 
      end
            end
        end)
end)

    
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Auto_Dungeon then
                local RaidPos = CFrame.new(0,25,0)
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                        if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*RaidPos)
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*RaidPos)
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*RaidPos)
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*RaidPos)
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*RaidPos)
                        end
                    end
                end
            end
        end)
    end)
    
    
spawn(function()
        pcall(function() 
            while wait() do
                if _G.Kill_Aura then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                pcall(function()
                                    repeat wait()
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                        v.Humanoid.Health = 0
                                        v.HumanoidRootPart.CanCollide = false
                                    until not _G.Kill_Aura or not v.Parent or v.Humanoid.Health <= 0
                                end)
                            end
                        end
                    end
                end
            end
        end)
    end)

    

    _G.SelectChip = selectraids or ""
	Raidslist = {}
	RaidsModule = require(game.ReplicatedStorage.Raids)
	for i,v in pairs(RaidsModule.raids) do
		table.insert(Raidslist,v)
	end
	for i,v in pairs(RaidsModule.advancedRaids) do
		table.insert(Raidslist,v)
	end
	
Page11.CreateDropdown({
	Name = "chọn chip raid",
	Value = "Raidslist",
	List = Raidslist,
	Callback = function(v)
	    _G.SelectChip = v
		print(v)
	end,
})
    
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoBuyChip then
                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                        end
                    end
                end
            end
        end)
    end)

Page11.CreateToggle({
	Name = "mua chip bắt đầu raid giết quái qua đảo",
	Dis = "",
	Value = false,
	Callback = function(v)
    	_G.Auto_StartRaid = v
        _G.Kill_Aura = v
        _G.AutoBuyChip = v
        _G.Auto_Dungeon = v
        _G.Awaken = v
        StopTween(_G.Auto_Dungeon)
		print(v)
	end,
}) 

    
Page11.CreateLable({
	Name = "Thủ công"
})

Page11.CreateToggle({
	Name = "bắt đầu vào raid",
	Dis = "",
	Value = false,
	Callback = function(v)
    	_G.Auto_StartRaid = v
		print(v)
	end,
}) 

Page11.CreateToggle({
	Name = "tự động giết quái",
	Dis = "",
	Value = false,
	Callback = function(v)
    	_G.Kill_Aura = v
		print(v)
	end,
}) 

Page11.CreateToggle({
	Name = "tự động mua chip",
	Dis = "",
	Value = false,
	Callback = function(v)
    	_G.AutoBuyChip = v
		print(v)
	end,
}) 

Page11.CreateToggle({
	Name = "tự động qua đảo",
	Dis = "Next Island",
	Value = false,
	Callback = function(v)
    	_G.Auto_Dungeon = v
        StopTween(_G.Auto_Dungeon)
		print(v)
	end,
}) 

Page11.CreateToggle({
	Name = "tự động thức tỉnh",
	Dis = "",
	Value = false,
	Callback = function(v)
    	_G.Awaken = v
		print(v)
	end,
}) 


    spawn(function()
        while wait() do
            if _G.Awaken then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
                end)
            end
        end
    end)

    
Page11.CreateSlider({
	Name = "Giá Trái ác quỷ",
	Max = 1000000,
	Min = 1,	
	Value = 1000000,
	Format = function(v)
	    _G.UnstoreFruitPrice = v
		print(v)
	end,
})

Page11.CreateToggle({
	Name = "tự động bỏ trái cây",
	Dis = "",
	Value = false,
	Callback = function(v)
    	_G.UnstoreBadFruit = v
		print(v)
	end,
}) 


    function GetFruitsInfo()
        for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if string.find(v.Name, "Fruit") then
                return true
            end
        end
        for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if string.find(v.Name, "Fruit") then
                return true
            end
        end
        return false
    end

    spawn(function()
        while wait() do
            pcall(function()
                if _G.UnstoreBadFruit then
                    fruit = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
                    for i,v in pairs(fruit) do
                        if v["Price"] < _G.UnstoreFruitPrice then
                            if not GetFruitsInfo() then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",v["Name"])
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait(.1) do
            pcall(function()
                if _G.Auto_StartRaid then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                            if World2 then
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                            elseif World3 then
                                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    
    if World2 then
Page11.CreateButton({
	Name = "dịch chuyển đến phòng raid",
	Callback = function()
		TP1(CFrame.new(-6438.73535, 250.645355, -4501.50684))
	end,
})
    elseif World3 then
Page11.CreateButton({
	Name = "dịch chuyển đến phòng raid",
	Callback = function()
		TP1(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
	end,
})
    end

Page11.CreateLable({
	Name = "Law Raid"
})

Page11.CreateToggle({
	Name = "mua chip kill law",
	Dis = "",
	Value = false,
	Callback = function(v)
    	_G.autoLawRaid = v
        StopTween(_G.autoLawRaid)
		print(v)
	end,
}) 


    spawn(
    function()
        pcall(
            function()
                while wait() do
                    if _G.autoLawRaid then
                        if
                            not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and
                                not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") and
                                not game:GetService("Workspace").Enemies:FindFirstChild("Order") and
                                not game:GetService("ReplicatedStorage"):FindFirstChild("Order")
                         then
                            wait(0.3)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "BlackbeardReward",
                                "Microchip",
                                "1"
                            )
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "BlackbeardReward",
                                "Microchip",
                                "2"
                            )
                        end
                    end
                end
            end
        )
    end
)
spawn(
    function()
        pcall(
            function()
                while wait(0.4) do
                    if _G.autoLawRaid then
                        if
                            not game:GetService("Workspace").Enemies:FindFirstChild("Order") and
                                not game:GetService("ReplicatedStorage"):FindFirstChild("Order")
                         then
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip")
                             then
                                fireclickdetector(
                                    game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector
                                )
                            end
                        end
                        if
                            game:GetService("ReplicatedStorage"):FindFirstChild("Order") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Order")
                         then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                                for h, i in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if i.Name == "Order" then
                                        repeat task.wait(_G.FastAttackDelay)
                                            AttackNoCD()
                                            FastAttack = true
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            TP1(i.HumanoidRootPart.CFrame * pos)
                                            i.HumanoidRootPart.CanCollide = false
                                            i.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
                                        until not i.Parent or i.Humanoid.Health <= 0 or Auto_Law == false
                                    end
                                end
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                                topos(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                            end
                        end
                    end
                end
            end
        )
    end
)      


Page12.CreateLable({
	Name = "Teleport"
})

Page12.CreateButton({
	Name = "đi đến sea 1",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
	end,
})

Page12.CreateButton({
	Name = "đi đến sea 2",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
	end,
})

Page12.CreateButton({
	Name = "đi đến sea 3",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
	end,
})
    
    
Page12.CreateLable({
	Name = "Island"
})

if World1 then
        Island = {
            "nil",
            "WindMill",
            "Marine",
            "Middle Town",
            "Jungle",
            "Pirate Village",
            "Desert",
            "Snow Island",
            "MarineFord",
            "Colosseum",
            "Sky Island 1",
            "Sky Island 2",
            "Sky Island 3",
            "Prison",
            "Magma Village",
            "Under Water Island",
            "Fountain City",
            "Shank Room",
            "Mob Island"
            }
    elseif World2 then  
        Island = {
            "nil",
            "The Cafe",
            "Frist Spot",
            "Dark Area",
            "Flamingo Mansion",
            "Flamingo Room",
            "Green Zone",
            "Factory",
            "Colossuim",
            "Zombie Island",
            "Two Snow Mountain",
            "Punk Hazard",
            "Cursed Ship",
            "Ice Castle",
            "Forgotten Island",
            "Ussop Island",
            "Mini Sky Island"
            }
    else
        Island = {
            "nil",
            "Mansion",
            "Port Town",
            "Great Tree",
            "Castle On The Sea",
            "MiniSky", 
            "Hydra Island",
            "Floating Turtle",
            "Haunted Castle",
            "Ice Cream Island",
            "Peanut Island",
            "Cake Island",
            "Candy Island",
            "Tiki Outpost"
            }	
    end
    
Page12.CreateDropdown({
	Name = "chọn đảo",
	Value = "nil",
	List = Island,
	Callback = function(v)
	    _G.SelectIsland = v
		print(v)
	end,
})

Page12.CreateToggle({
	Name = "bay qua đảo",
	Dis = "",
	Value = false,
	Callback = function(v)
    _G.TeleportIsland = v
        if _G.TeleportIsland == true then
            repeat wait()
                if _G.SelectIsland == "WindMill" then
                    topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                elseif _G.SelectIsland == "Marine" then
                    topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                elseif _G.SelectIsland == "Middle Town" then
                    topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                elseif _G.SelectIsland == "Jungle" then
                    topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                elseif _G.SelectIsland == "Pirate Village" then
                    topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                elseif _G.SelectIsland == "Desert" then
                    topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                elseif _G.SelectIsland == "Snow Island" then
                    topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                elseif _G.SelectIsland == "MarineFord" then
                    topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                elseif _G.SelectIsland == "Colosseum" then
                    topos( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                elseif _G.SelectIsland == "Sky Island 1" then
                    topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                elseif _G.SelectIsland == "Sky Island 2" then  
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                elseif _G.SelectIsland == "Sky Island 3" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                elseif _G.SelectIsland == "Prison" then
                    topos( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                elseif _G.SelectIsland == "Magma Village" then
                    topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                elseif _G.SelectIsland == "Under Water Island" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif _G.SelectIsland == "Fountain City" then
                    topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                elseif _G.SelectIsland == "Shank Room" then
                    topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                elseif _G.SelectIsland == "Mob Island" then
                    topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                elseif _G.SelectIsland == "The Cafe" then
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                elseif _G.SelectIsland == "Frist Spot" then
                    topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                elseif _G.SelectIsland == "Dark Area" then
                    topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                elseif _G.SelectIsland == "Flamingo Mansion" then
                    topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                elseif _G.SelectIsland == "Flamingo Room" then
                    topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                elseif _G.SelectIsland == "Green Zone" then
                    topos( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                elseif _G.SelectIsland == "Factory" then
                    topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                elseif _G.SelectIsland == "Colossuim" then
                    topos( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                elseif _G.SelectIsland == "Zombie Island" then
                    topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                elseif _G.SelectIsland == "Two Snow Mountain" then
                    topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                elseif _G.SelectIsland == "Punk Hazard" then
                    topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                elseif _G.SelectIsland == "Cursed Ship" then
                    topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                elseif _G.SelectIsland == "Ice Castle" then
                    topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                elseif _G.SelectIsland == "Forgotten Island" then
                    topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                elseif _G.SelectIsland == "Ussop Island" then
                    topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                elseif _G.SelectIsland == "Mini Sky Island" then
                    topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                elseif _G.SelectIsland == "Great Tree" then
                    topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                elseif _G.SelectIsland == "Castle On The Sea" then
                    topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
                elseif _G.SelectIsland == "MiniSky" then
                    topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                elseif _G.SelectIsland == "Port Town" then
                    topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
                elseif _G.SelectIsland == "Hydra Island" then
                    topos(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
                elseif _G.SelectIsland == "Floating Turtle" then
                    topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                elseif _G.SelectIsland == "Mansion" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                elseif _G.SelectIsland == "Haunted Castle" then
                    topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
                elseif _G.SelectIsland == "Ice Cream Island" then
                    topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
                elseif _G.SelectIsland == "Peanut Island" then
                    topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                elseif _G.SelectIsland == "Cake Island" then
                    topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                elseif _G.SelectIsland == "Cocoa Island" then
                    topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
                elseif _G.SelectIsland == "Candy Island" then
                    topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
                elseif _G.SelectIsland == "Tiki Outpost" then
                    topos(CFrame.new(-16218.6826, 9.08636189, 445.618408, -0.0610186495, 1.10512588e-09, -0.99813664, -1.83458475e-08, 1, 2.22871765e-09, 0.99813664, 1.84476558e-08, -0.0610186495))
                end
            until not _G.TeleportIsland
        end
        StopTween(_G.TeleportIsland)
		print(v)
	end,
}) 

Page13.CreateLable({
	Name = "Legendary Sword"
})

Page13.CreateToggle({
	Name = "tự động mua kiếm huyền thoại",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoBuyLegendarySword = v
		print(v)
	end,
})
    
    spawn(function()
        while wait() do
            if _G.AutoBuyLegendarySword then
                pcall(function()
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "1"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "3"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
             
                end)
            end 
        end
    end)

Page13.CreateLable({
	Name = "Haki Color"
})

Page13.CreateToggle({
	Name = "tự động mua haki huyền thoại",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoBuyEnchancementColour = v
		print(v)
	end,
})

    
    
    spawn(function()
        while wait() do
            if _G.AutoBuyEnchancementColour then
                local args = {
                    [1] = "ColorsDealer",
                    [2] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end 
    end)

Page13.CreateLable({
	Name = "Abilities"
})

Page13.CreateButton({
	Name = "mua Geppo [$10,000]",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
	end,
})

Page13.CreateButton({
	Name = "mua Buso Haki [ $25,000 ]",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
	end,
})

Page13.CreateButton({
	Name = "mua Soru [ $25,000 ]",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
	end,
})

Page13.CreateButton({
	Name = "mua Observation Haki [ $750,000 ]",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
	end,
})

Page13.CreateLable({
	Name = "Fighting Style"
})

Page13.CreateButton({
	Name = "mua Black Leg",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
	end,
})

Page13.CreateButton({
	Name = "mua Electro",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
	end,
})

Page13.CreateButton({
	Name = "mua water kung fu",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
	end,
})

Page13.CreateButton({
	Name = "mua Dragon Claw",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
	end,
})
    
Page13.CreateButton({
	Name = "mua Super Human",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
	end,
})

Page13.CreateButton({
	Name = "mua Death Step",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
	end,
})

Page13.CreateButton({
	Name = "mua Shark Man Karate",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
	end,
})

Page13.CreateButton({
	Name = "mua Electric Claw",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
	end,
})

Page13.CreateButton({
	Name = "mua Dragon Talon",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
	end,
})

Page13.CreateButton({
	Name = "mua God Human",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
	end,
})

Page13.CreateButton({
	Name = "mua Sanguine Art",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
	end,
})


Page13.CreateLable({
	Name = "Sword"
})

Page13.CreateButton({
	Name = "mua cutlass",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
	end,
})

Page13.CreateButton({
	Name = "mua katana",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
	end,
})

Page13.CreateButton({
	Name = "mua Iron mace",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
	end,
})

Page13.CreateButton({
	Name = "mua dual katana",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
	end,
})

Page13.CreateButton({
	Name = "mua tiple katana",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
	end,
})

Page13.CreateButton({
	Name = "mua pipe",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
	end,
})

Page13.CreateButton({
	Name = "mua dual-headed blade",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
	end,
})

Page13.CreateButton({
	Name = "mua bisento",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
	end,
})

Page13.CreateButton({
	Name = "mua soul cane",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
	end,
})

Page13.CreateButton({
	Name = "mua pole v.2",
	Callback = function()
		game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
	end,
})

Page13.CreateLable({
	Name = "Gun"
})

Page13.CreateButton({
	Name = "mua slingshot",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
	end,
})

Page13.CreateButton({
	Name = "mua musket",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
	end,
})

Page13.CreateButton({
	Name = "mua flintlock",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
	end,
})

Page13.CreateButton({
	Name = "mua eefined slingshot",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
	end,
})
    
Page13.CreateButton({
	Name = "mua refined flintlock",
	Callback = function()
		local args = {
			[1] = "BuyItem",
			[2] = "Refined Flintlock"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end,
})

Page13.CreateButton({
	Name = "mua cannot",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
	end,
})

Page13.CreateButton({
	Name = "mua kabucha",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
	end,
})
    
    
    ------------Stat------------------
    
Page13.CreateLable({
	Name = "Stats"
})

Page13.CreateButton({
	Name = "reset chỉ số[2,500F]",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
	end,
})

Page13.CreateButton({
	Name = "random tộc [3.000F]",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
	end,
})

    --------------Accessories-----------------




	
Page14.CreateLable({
	Name = "Fruits"
})

Page14.CreateToggle({
	Name = "tự động quay trái",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Random_Auto = v
		print(v)
	end,
})

    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Random_Auto then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
                end 
            end
        end)
    end)
   
Page14.CreateButton({
	Name = " tự động quay trái",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
	end,
})

Page14.CreateButton({
	Name = "mở shop bán trái",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
	end,
})
    
    local RarityFruits = {
        ["Common"] = {
            "Rocket Fruit",
            "Spin Fruit",
            "Chop Fruit",
            "Spring Fruit",
            "Bomb Fruit",
            "Smoke Fruit",
            "Spike Fruit"
        },
        ["Uncommon"] = {
            "Flame Fruit",
            "Falcon Fruit",
            "Ice Fruit",
            "Sand Fruit",
            "Diamond Fruit",
            "Dark Fruit"
        },
        ["Rare"] = {
            "Light Fruit",
            "Rubber Fruit",
            "Barrier Fruit",
            "Ghost Fruit",
            "Magma Fruit"
        },
        ["Legendary"] = {
            "Quake Fruit",
            "Budha Fruit",
            "Love Fruit",
            "Spider Fruit",
            "Sound Fruit",
            "Phoenix Fruit",
            "Portal Fruit",
            "Rumble Fruit",
            "Pain Fruit",
            "Blizzard Fruit",
        },
        ["Mythical"] = {
            "Gravity Fruit",
            "Mammoth Fruit",
            "T-Rex Fruit",
            "Dough Fruit",
            "Shadow Fruit",
            "Venom Fruit",
            "Control Fruit",
            "Spirit Fruit",
            "Dragon Fruit",
            "Leopard Fruit",
            "Kitsune Fruit",
        }
    }

local ResultUnstoreFruits = {}

    local SelectRarityFruits = {
        "Common - Mythical",
        "Uncommon - Mythical",
        "Rare - Mythical",
        "Legendary - Mythical",
        "Mythical"
    }

Page14.CreateDropdown({
	Name = "chọn trái để mua",
	Value = "Common - Mythical",
	List = SelectRarityFruits,
	Callback = function(v)
	SetRarityFruits = v
		print(v)
	end,
})
SetRarityFruits = "Common - Mythical"
    function CheckFruits()
        for i, v in pairs(RarityFruits) do
            if SetRarityFruits == "Common - Mythical" then
                if i == "Common" or i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Mythical" then
                    for _, fruit in ipairs(v) do
                        table.insert(ResultStoreFruits, fruit)
                    end
                end
            elseif SetRarityFruits == "Uncommon - Mythical" then
                if i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Mythical" then
                    for _, fruit in ipairs(v) do
                        table.insert(ResultStoreFruits, fruit)
                    end
                end
            elseif SetRarityFruits == "Rare - Mythical" then
                if i == "Rare" or i == "Legendary" or i == "Mythical" then
                    for _, fruit in ipairs(v) do
                        table.insert(ResultStoreFruits, fruit)
                    end
                end
            elseif SetRarityFruits == "Legendary - Mythical" then
                if i == "Legendary" or i == "Mythical" then
                    for _, fruit in ipairs(v) do
                        table.insert(ResultStoreFruits, fruit)
                    end
                end
            elseif SetRarityFruits == "Mythical" then
                if i == "Mythical" then
                    for _, fruit in ipairs(v) do
                        table.insert(ResultStoreFruits, fruit)
                    end
                end
            end
        end  
    end
    
Page14.CreateToggle({
	Name = "tự động cất trái",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoStoreFruit = v
		print(v)
	end,
})



    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoStoreFruit then
                    for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name, "Fruit") then
                            ResultStoreFruits = {}
                            CheckFruits()
                            for z, Res in pairs(ResultStoreFruits) do
                            if v.Name == Res then
                                local NameFruit = v.Name
                                local FirstNameFruit = string.gsub(v.Name, " Fruit", "")
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameFruit) then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",FirstNameFruit.."-"..FirstNameFruit,game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameFruit))
                                end
                            end
                            end
                        end
                    end
                end
            end)
        end
    end)

Page14.CreateToggle({
	Name = "thông báo trái xuất hiện",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.FruitCheck = v
		print(v)
	end,
})

    
    spawn(function()
        while wait(2) do
            if _G.FruitCheck then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        Alert:create("Fruit : "..v.Name)
                    end
                end
            end
        end
    end)

Page14.CreateToggle({
	Name = "lụm trái loại dịch chuyển",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Grabfruit = v
		print(v)
	end,
})

        spawn(function()
			while wait(.1) do
				if _G.Grabfruit then
					for i,v in pairs(game.Workspace:GetChildren()) do
						if string.find(v.Name, "Fruit") then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
						end
					end
				end
           end
        end)
    
Page14.CreateToggle({
	Name = "lụm trái loại bay",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.Tweenfruit = v
	StopTween(_G.Tweenfruit)
		print(v)
	end,
})

    spawn(function()
			while wait(.1) do
				if _G.Tweenfruit then
					for i,v in pairs(game.Workspace:GetChildren()) do
						if string.find(v.Name, "Fruit") then
							topos(v.Handle.CFrame)
						end
					end
				end
    end
    end)

Page14.CreateButton({
	Name = "lụm trái loại garp",
	Callback = function()
		for i,v in pairs(game.Workspace:GetChildren()) do
            if v:IsA("Tool") then
                v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end	
	end,
})
    
Page14.CreateLable({
	Name = "Visual"
})

Page14.CreateButton({
	Name = "trái ác quỷ fake",
	Callback = function()
		for h, i in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
                i.Parent = game.Workspace.Map
                i:MoveTo(
                    game.Players.LocalPlayer.Character.PrimaryPart.Position +
                        Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))
                )
                if i.Fruit:FindFirstChild("AnimationController") then
                    i.Fruit:FindFirstChild("AnimationController"):LoadAnimation(i.Fruit:FindFirstChild("Idle")):Play()
                end
                i.Handle.Touched:Connect(
                    function(cR)
                        if cR.Parent == game.Players.LocalPlayer.Character then
                            i.Parent = game.Players.LocalPlayer.Backpack
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(i)
                        end
                    end
                )
            end
	end,
})

	
Page15.CreateLable({
	Name = "Misc"
})
    
Page15.CreateButton({
	Name = "mở shop trái",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
	end,
})

Page15.CreateButton({
	Name = "mở bản haki",
	Callback = function()
		game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
	end,
})

Page15.CreateButton({
	Name = "mở bản danh hiệu",
	Callback = function()
		local args = {
            [1] = "getTitles"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
	end,
})

Page15.CreateButton({
	Name = "mở hàng tồn kho",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
        wait(1)
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Visible = true
	end,
})

Page15.CreateButton({
	Name = "mở hàng tồn kho trái cây",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
	end,
})

    
    
    
      
Page15.CreateLable({
	Name = "Team"
})

Page15.CreateButton({
	Name = "Tham gia đội hải tặc",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
	end,
})

Page15.CreateButton({
	Name = "Tham gia đội hải quân",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines") 
	end,
})
    
    
Page15.CreateLable({
	Name = "Highlight"
})

Page15.CreateToggle({
	Name = "ẩn chat",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.chat = v
    if _G.chat == true then
local StarterGui = game:GetService('StarterGui')
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)    
elseif _G.chat == false then
local StarterGui = game:GetService('StarterGui')
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)    
end
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "ẩn bảng xếp hạng",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.leaderboard = v
    if _G.leaderboard == true then
local StarterGui = game:GetService('StarterGui')
game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)   
elseif _G.leaderboard == false then
local StarterGui = game:GetService('StarterGui')
game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)   
end
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "chế độ nổi bật",
	Dis = "",
	Value = false,
	Callback = function(v)
	if v == true then
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = false
        else
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = true
        end
		print(v)
	end,
})

Page15.CreateButton({
	Name = "dừng bay",
	Callback = function()
		topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		TP1(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        _G.Clip = false
	end,
})

	
Page15.CreateLable({
	Name = "Codes"
})
    
    local x2Code = {
        "KITTGAMING",
        "ENYU_IS_PRO",
        "FUDD10",
        "BIGNEWS",
        "THEGREATACE",
        "SUB2GAMERROBOT_EXP1",
        "STRAWHATMAIME",
        "SUB2OFFICIALNOOBIE",
        "SUB2NOOBMASTER123",
        "SUB2DAIGROCK",
        "AXIORE",
        "TANTAIGAMIMG",
        "STRAWHATMAINE",
        "JCWK",
        "FUDD10_V2",
        "SUB2FER999",
        "MAGICBIS",
        "TY_FOR_WATCHING",
        "STARCODEHEO"
    }
    
Page15.CreateButton({
	Name = "nhập tất cả code",
	Callback = function()
		function RedeemCode(value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
        end
        for i,v in pairs(x2Code) do
            RedeemCode(v)
        end
	end,
})


Page15.CreateDropdown({
	Name = "NOOB_REFUND",
	Value = "1",
	List = {"NOOB_REFUND","SUB2GAMERROBOT_RESET1","Sub2UncleKizaru"},
	Callback = function(v)
	_G.CodeSelect = v
		print(v)
	end,
})

Page15.CreateButton({
	Name = "nhập tất cả code",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(_G.CodeSelect)
	end,
})

Page15.CreateLable({
	Name = "Graphic"
})

Page15.CreateButton({
	Name = "nhập tất cả code",
	Callback = function()
		local decalsyeeted = true 
        local g = game
        local w = g.Workspace
        local l = g.Lighting
        local t = w.Terrain
        settings().Rendering.QualityLevel = "Level01"
        for i, v in pairs(g:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
                v.Enabled = false
            end
        end
	end,
})

Page15.CreateButton({
	Name = "xoá sương mù",
	Callback = function()
		game:GetService("Lighting").LightingLayers:Destroy()
    	game:GetService("Lighting").Sky:Destroy()
    	game.Lighting.FogEnd = 9e9
	end,
})

Page15.CreateButton({
	Name = "xoá dung nham",
	Callback = function()
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Lava" then   
				v:Destroy()
			end
		end
		for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
			if v.Name == "Lava" then   
				v:Destroy()
			end
		end
	end,
})


	
    

Page15.CreateLable({
	Name = "Esp"
})

Page15.CreateToggle({
	Name = "định vị người chơi",
	Dis = "",
	Value = false,
	Callback = function(v)
	ESPPlayer = v
	UpdatePlayerChams()
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "định vị rương",
	Dis = "",
	Value = false,
	Callback = function(v)
	ChestESP = v
	UpdateChestChams() 
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "định vị rương",
	Dis = "",
	Value = false,
	Callback = function(v)
	ChestESP = v
	UpdateChestChams() 
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "định vị trái",
	Dis = "",
	Value = false,
	Callback = function(v)
	DevilFruitESP = v
        while DevilFruitESP do wait()
            UpdateDevilChams() 
        end
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "định vị trái real",
	Dis = "",
	Value = false,
	Callback = function(v)
	RealFruitESP = a
	UpdateRealFruitChams()     
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "định vị hoa",
	Dis = "",
	Value = false,
	Callback = function(v)
	RealFruitESP = a
	UpdateRealFruitChams()     
		print(v)
	end,
})
    
    spawn(function()
	    while wait(2) do
		    if FlowerESP then
			    UpdateFlowerChams() 
		    end
		    if DevilFruitESP then
			    UpdateDevilChams() 
		    end
		    if ChestESP then
			    UpdateChestChams() 
		    end
		    if ESPPlayer then
			    UpdatePlayerChams()
		    end
		    if RealFruitESP then
			    UpdateRealFruitChams()
		    end
	    end
    end)

Page15.CreateToggle({
	Name = "định vị đảo",
	Dis = "",
	Value = false,
	Callback = function(v)
	IslandESP = v
        while IslandESP do wait()
            UpdateIslandESP() 
        end
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "định vị Npc",
	Dis = "",
	Value = false,
	Callback = function(v)
	NpcESP = v
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "định vị vua biển",
	Dis = "",
	Value = false,
	Callback = function(v)
	SeaESP = v
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "định vị quái",
	Dis = "",
	Value = false,
	Callback = function(v)
	MobESP = v
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "định vị đảo bí ẩn",
	Dis = "",
	Value = false,
	Callback = function(v)
	MirageIslandESP = v
        while MirageIslandESP do wait()
            UpdateIslandMirageESP()
        end
		print(v)
	end,
})

Page15.CreateLable({
	Name = "Abilities"
})

Page15.CreateToggle({
	Name = "không có né tránh",
	Dis = "",
	Value = false,
	Callback = function(v)
	nododgecool = v
        NoDodgeCool()
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "Năng lượng vô hạn",
	Dis = "",
	Value = false,
	Callback = function(v)
	InfiniteEnergy = v
        originalstam = LocalPlayer.Character.Energy.Value
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "bật tộc v3",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoAgility = v
		print(v)
	end,
})

Page15.CreateToggle({
	Name = "bật tộc v4",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.AutoActiveRaceV4 = v
		print(v)
	end,
})


    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoActiveRaceV4 then
                    if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoAgility then
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                end
            end
        end)
    end)

Page15.CreateToggle({
	Name = "tự động sử dụng đánh thức",
	Dis = "",
	Value = false,
	Callback = function(v)
	InfAbility = v
        if v == false then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
		print(v)
	end,
})

    spawn(function()
        while wait() do
            if InfAbility then
                InfAb()
            end
        end
    end)
    
Page15.CreateToggle({
	Name = "thông tin geppo",
	Dis = "",
	Value = false,
	Callback = function(v)
	getgenv().InfGeppo = v
		print(v)
	end,
})

    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().InfGeppo then
                    for i,v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Geppo then
                            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Geppo then
                                for i2,v2 in next, getupvalues(v) do
                                    if tostring(i2) == "9" then
                                        repeat wait(.1)
                                            setupvalue(v,i2,0)
                                        until not getgenv().InfGeppo or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0 
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

Page15.CreateToggle({
	Name = "thông tin soru",
	Dis = "",
	Value = false,
	Callback = function(v)
	getgenv().InfSoru = v
		print(v)
	end,
})
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().InfSoru and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil  then
                    for i,v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Soru then
                            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Soru then
                                for i2,v2 in next, getupvalues(v) do
                                    if typeof(v2) == "table" then
                                        repeat wait(0.1)
                                            v2.LastUse = 0
                                        until not getgenv().InfSoru or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

Page15.CreateToggle({
	Name = "đi trên biển",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.WalkWater = v
		print(v)
	end,
})

    
    spawn(function()
			while task.wait() do
				pcall(function()
					if _G.WalkWater then
						game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
					else
						game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
					end
				end)
			end
		end)

Page15.CreateToggle({
	Name = "xuyên tường",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.NoClip = v
		print(v)
	end,
})

    
    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.NoClip then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") or v:IsA("Part") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)

 Page16.CreateLable({
	Name = "Server"
})

    task.spawn(function()
        while task.wait() do
            pcall(function()
                if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
                    FM:Set("๐• Full Moon 100%")
                elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
                    FM:Set("๐– Full Moon 75%")
                elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
                    FM:Set("๐— Full Moon 50%")
                elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
                    FM:Set("๐ Full Moon 25%")
                elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
                    FM:Set("๐ Full Moon 15%")
                else
                    FM:Set("Wait For Moon")
                end
            end)
        end
    end)

        spawn(function()
            pcall(function()
                while wait() do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
        MirageStatus:Set('๐๏ธ Mirage Island is Spawning')
        else
        MirageStatus:Set('๐๏ธ Mirage Island Not Spawn') 
        end
          
        if game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
        KitsuneStatus:Set('โฉ๏ธ Kitsune Island is Spawning')
        else
        KitsuneStatus:Set('โฉ๏ธ Kitsune Island Not Spawn') 
        end

        for i,v in pairs(game.Workspace:GetChildren()) do
        if string.find(v.Name, "Fruit") then
        FindFruit:Set('๐ Find '..v.Name)
        else
        FindFruit:Set('๐ Nothing') 
        end
        end
                end
            end)
        end)

        spawn(function()
            while wait(5) do
                pcall(function()
                if _G.AutoBuyLegendarySword or _G.AutoBuyEnchancementColour then
                        if GetLegendarySwordDealer() then
                            SwordDealer:Set('โ”๏ธ Legendary Sword Dealer is Spawning')
                        else
                            SwordDealer:Set('โ”๏ธ Legendary Sword Dealer Not Spawn') 
                        end
                
                        if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("ColorsDealer", "1") then
                            HakiDealer:Set('๐ข Haki Dealer is Spawning')
                        else
                            HakiDealer:Set('๐”ด Haki Dealer Not Spawn') 
                            end
                        end
                end)
            end
        end)

        function GetLegendarySwordDealer()
            if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("ColorsDealer", "1") or game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("ColorsDealer", "2") or game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("ColorsDealer", "3") then
                return true
            end
            return false
        end
    
Page15.CreateToggle({
	Name = "xuyên tường",
	Dis = "",
	Value = false,
	Callback = function(v)
	_G.NoClip = v
		print(v)
	end,
})


Page16.CreateButton({
	Name = "vào lại server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end,
})

Page16.CreateButton({
	Name = "đổi server",
	Callback = function()
	while wait() do
		local module = loadstring(game:HttpGet"https://roblox.relzscript.xyz/Hop.lua")()
        module:Teleport(game.PlaceId, "Singapore")
    end
	end,
})

    

    spawn(function()
        while wait() do
            pcall(function()
                JobAiDee:Set("Server Job ID : "..game.JobId)
            end)
        end
    end)
    
JobAiDee = Page16.CreateLable({
	Name = "Job Id"
})

Page16.CreateButton({
	Name = "sao chép Job Id",
	Callback = function()
	setclipboard(tostring(game.JobId))
	end,
})

Page16.CreateInput({
	Name = "Enter Job Id",
	Placeholder = "Hi",
	Value = "...",
	Callback = function(v)
	    _G.Job = v
		print(v)
	end,
})

Page16.CreateButton({
	Name = "vô server",
	Callback = function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
	end,
})

Page16.CreateLable({
	Name = "Status"
})

FM = Page16.CreateLable({
	Name = "Moon"
})

SetCheeask = Page16.CreateLable({
	Name = "Kitsune Statu"
})

SwordDealer = Page16.CreateLable({
	Name = "Sword"
})

HakiDealer = Page16.CreateLable({
	Name = "Sword"
})

FindFruit = Page16.CreateLable({
	Name = "Devil Fruit"
})
------------------------------------------------------------------------------------------------------------------------------------
local players = game:GetService("Players")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Min Gaming";
    Text = "Loading Done!";
    Icon = "rbxthumb://type=Asset&id=111792405768331&w=150&h=150";
    Duration = 10
})

spawn(function()
    while wait() do
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Name == "red_game43" or v.Name == "rip_indra" or v.Name == "Axiore" or v.Name == "Polkster" or v.Name == "wenlocktoad" or v.Name == "Daigrock" or v.Name == "toilamvidamme" or v.Name == "oofficialnoobie" or v.Name == "Uzoth" or v.Name == "Azarth" or v.Name == "arlthmetic" or v.Name == "Death_King" or v.Name == "Lunoven" or v.Name == "TheGreateAced" or v.Name == "rip_fud" or v.Name == "drip_mama" or v.Name == "layandikit12" or v.Name == "Hingoi" then
            Hop()
            end
        end
    end
end)

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()

new = {}
function FastAttackConnectorFunction()
    repeat wait() until game:IsLoaded()
    repeat task.wait() until game.ReplicatedStorage
    repeat task.wait() until game.Players
    repeat task.wait() until game.Players.LocalPlayer
    repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
    local CombatFrameworkR = getupvalues(CombatFramework)[2]
    local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
    local RigControllerR = getupvalues(RigController)[2]
    local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
    local cooldownfastattack = tick()
    
    ReturnFunctions = {}
    function CurrentWeapon()
        local ac = CombatFrameworkR.activeController
        local ret = ac.blades[1]
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        pcall(
            function()
                while ret.Parent ~= game.Players.LocalPlayer.Character do
                    ret = ret.Parent
                end
            end
        )
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        return ret
    end
    function AttackFunctgggggion()
        if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
            return nil
        end
        local ac = CombatFrameworkR.activeController
        ac.hitboxMagnitude = 55
        if ac and ac.equipped then
            for indexincrement = 1, 1 do
                local bladehit =require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},60)
                if #bladehit > 0 then
                    local AcAttack8 = debug.getupvalue(ac.attack, 5)
                    local AcAttack9 = debug.getupvalue(ac.attack, 6)
                    local AcAttack7 = debug.getupvalue(ac.attack, 4)
                    local AcAttack10 = debug.getupvalue(ac.attack, 7)
                    local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
                    local NumberAc13 = AcAttack7 * 798405
                    (function()
                        NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
                        AcAttack8 = math.floor(NumberAc12 / AcAttack9)
                        AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
                    end)()
                    AcAttack10 = AcAttack10 + 1
                    debug.setupvalue(ac.attack, 5, AcAttack8)
                    debug.setupvalue(ac.attack, 6, AcAttack9)
                    debug.setupvalue(ac.attack, 4, AcAttack7)
                    debug.setupvalue(ac.attack, 7, AcAttack10)
                    for k, v in pairs(ac.animator.anims.basic) do
                        v:Play(0.01,0.01,0.01)
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                            "weaponChange",
                            tostring(CurrentWeapon())
                        )
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                    end
                end
            end
        end
    end
    CountAttack = 0  
    TickCountAttack = tick()
    spawn(function()
        local MT = getrawmetatable(game)
        local OldNameCall = MT.__namecall
        setreadonly(MT, false)
        MT.__namecall = newcclosure(function(self, ...)
            local Method = getnamecallmethod()
            local Args = {...}
            if Method == 'FireServer' and self.Name == "RigControllerEvent" and  Args[1] == "hit"  then
                CountAttack = CountAttack + 1 
                TickCountAttack = tick()
            end
            return OldNameCall(self, unpack(Args))
        end)
    end)
    function ReturnFunctions:GetCount()
        return CountAttack
    end
    function ReturnFunctions:Attack(k)
        UFFF = k 
    end
    FastAttackSettings = {
        ["CDAAT"] = 80,
        ["TimeWait"] = 10
    }
    spawn(function()
        local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
        CameraShakerR:Stop()
    end)
    function ReturnFunctions:InputValue(CDAAT,TimeWait)
        FastAttackSettings["CDAAT"] = CDAAT
        FastAttackSettings["TimeWait"] = TimeWait
    end
    function ReturnFunctions:InputSetting(tbbb)
        conchosetting = tbbb
    end
    function atack()
        pcall(function()
            AttackFunctgggggion()
        end)
    end
    ToiCanOxi = 0
    conchosetting = {}
    function ReturnFunctions:GetMethod()
        MethodAttack = "Slow"
        if CountAttack < FastAttackSettings["CDAAT"] then 
            MethodAttack = "Fast"
        end 
        return MethodAttack
    end
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    if conchosetting and type(conchosetting) == "table" then 
                        if conchosetting and conchosetting["Mastery Farm"] then 
                            ToiCanOxi = 2 
                            atack()
                            if conchosetting["DelayAttack"] and type(conchosetting["DelayAttack"]) == "number" and conchosetting["DelayAttack"] >= 0.1 then 
                                wait(conchosetting["DelayAttack"])
                            else
                                conchosetting["DelayAttack"] = 0.2 
                                wait(conchosetting["DelayAttack"])
                            end
                        elseif CountAttack < FastAttackSettings["CDAAT"] then 
                            ToiCanOxi = ToiCanOxi +1
                            atack()
                        elseif CountAttack >= FastAttackSettings["CDAAT"] then 
                            ToiCanOxi = ToiCanOxi +1
                            atack()
                            if conchosetting["DelayAttack"] and type(conchosetting["DelayAttack"]) == "number" and conchosetting["DelayAttack"] >= 0.1 then 
                                wait(conchosetting["DelayAttack"]*2)
                            else
                                conchosetting["DelayAttack"] = 0.2 
                                wait(conchosetting["DelayAttack"]*2)
                            end
                        end
                    end
                end)
            end
        end
    end) 
    spawn(function()
        while task.wait() do 
            pcall(function() 
                if tick()-TickCountAttack >= FastAttackSettings["TimeWait"] then 
                    CountAttack = 0 
                end
            end)
        end
    end)
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    local Fastflux = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]
                    Fastflux.activeController.hitboxMagnitude = 55
                    Fastflux.activeController.timeToNextAttack = 0
                    Fastflux.activeController.attacking = false
                    Fastflux.activeController.increment = 3
                    Fastflux.activeController.blocking = false
                    Fastflux.activeController.timeToNextBlock = 0
                    Fastflux.activeController:attack()
                    task.wait(0.2)
                end)
            end
        end
    end)
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    local Fastflux = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]
                    Fastflux.activeController.hitboxMagnitude = 55
                    Fastflux.activeController.timeToNextAttack = 0
                    Fastflux.activeController.attacking = false
                    Fastflux.activeController.increment = 3
                    Fastflux.activeController.blocking = false
                    Fastflux.activeController.timeToNextBlock = 0
                    a = math.random(1,5)
                    if a > 1 then 
                        game:GetService "VirtualUser":CaptureController()
                        game:GetService "VirtualUser":Button1Down(Vector2.new(50, 50))
                    end
                    task.wait(0.2)
                end)
            end
        end
    end)
    spawn(function()
        while wait() do 
            if UFFF then
                pcall(function() 
                    if CountAttack >= FastAttackSettings["CDAAT"] then 
                        TickFastAttackF = tick()
                        repeat wait() until tick()-TickFastAttackF >= FastAttackSettings["TimeWait"]
                        CountAttack = 0
                    end    
                end)  
            end
        end
    end)
    return ReturnFunctions
end
return FastAttackConnectorFunction()