local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Snapdragon Hub",
   LoadingTitle = "Welcome to Snapdragon",
   LoadingSubtitle = "by NightDevil",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Snapdragon Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key | Snapdragon Hub",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      FileName = "YoutubeHubKey1", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/vQTQCCeW"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "You executed the script",
   Content = "Thanks for using my script",
   Duration = 5,
   Image = 13047715178,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump Toggle",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="Infinite Jump"; Text="Infinite Jump Activated!"; Duration=5;})

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local Input = MainTab:CreateInput({
    Name = "Walkspeed",
    PlaceholderText = "1-500",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text)
    end,
 })
 
 local Input = MainTab:CreateInput({
     Name = "JumpPower",
     PlaceholderText = "1-350",
     RemoveTextAfterFocusLost = true,
     Callback = function(Text)
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Text)
    end,
 })

local Dropdown = MainTab:CreateDropdown({
   Name = "Select Area",
   Options = {"Spawn","Bank Inside","Criminal Base"},
   CurrentOption = {"Spawn"},
   MultipleOptions = false,
   Flag = "dropdownarea", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
        print(Option)
   end,
})

local OtherSection = MainTab:CreateSection("Other")

local Toggle = MainTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        print("TEST ESP")
   end,
})

local TPTab = Window:CreateTab("Teleports", nil) -- Title, Image

local Button1 = TPTab:CreateButton({
   Name = "Spawn",
   Callback = function()
        --Teleport1
   end,
})

local Button2 = TPTab:CreateButton({
   Name = "Bank Inside",
   Callback = function()
        --Teleport2
   end,
})

local Button3 = TPTab:CreateButton({
   Name = "Criminal Base",
   Callback = function()
        --Teleport3
   end,
})

local MiscTab = Window:CreateTab("🎲 Misc", nil) -- Title, Image

local Button4 = MiscTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        print("Infinite Yield Executed!")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button5 = MiscTab:CreateButton({
    Name = "Destroy",
    Callback = function()
        print("Gui Destroyed!")
        Rayfield:Destroy()
   end,     
})

local Toggle = MiscTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "ToggleESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      print("ESP Enabled!")
      loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/WRD%20ESP.txt"))()
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})

local Toggle = MiscTab:CreateToggle({
    Name = "Chams",
    CurrentValue = false,
    Flag = "ToggleChams",
    Callback = function (donee)
        print("Chams Enabled!")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KuroAkumu/Test/main/ChamsTest"))
        wait(2)
        print(donee)
   end,
})
