--// Anoma ESP — key gate
local KEY = "@/ Anoma"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AnomaKeyGate"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 6)
Corner.Parent = Frame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(40, 40, 40)
Stroke.Thickness = 1
Stroke.Parent = Frame

local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size = UDim2.new(1, -20, 0, 28)
TitleLbl.Position = UDim2.new(0, 10, 0, 6)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Text = "@/Anoma ESP"
TitleLbl.Font = Enum.Font.GothamBold
TitleLbl.TextSize = 15
TitleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.Parent = Frame

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(1, -20, 0, 34)
Input.Position = UDim2.new(0, 10, 0, 42)
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.BorderSizePixel = 0
Input.PlaceholderText = "enter key"
Input.PlaceholderColor3 = Color3.fromRGB(130, 130, 130)
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.Font = Enum.Font.GothamBold
Input.TextSize = 12
Input.ClearTextOnFocus = false
Input.Parent = Frame

local InCorner = Instance.new("UICorner")
InCorner.CornerRadius = UDim.new(0, 4)
InCorner.Parent = Input

local Submit = Instance.new("TextButton")
Submit.Size = UDim2.new(1, -20, 0, 34)
Submit.Position = UDim2.new(0, 10, 0, 86)
Submit.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Submit.BorderSizePixel = 0
Submit.Text = "submit"
Submit.Font = Enum.Font.GothamBold
Submit.TextSize = 12
Submit.TextColor3 = Color3.fromRGB(230, 230, 230)
Submit.AutoButtonColor = false
Submit.Parent = Frame

local SbCorner = Instance.new("UICorner")
SbCorner.CornerRadius = UDim.new(0, 4)
SbCorner.Parent = Submit

Submit.MouseEnter:Connect(function()
    Submit.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
end)
Submit.MouseLeave:Connect(function()
    Submit.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
end)

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -20, 0, 14)
Status.Position = UDim2.new(0, 10, 1, -18)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.Font = Enum.Font.Gotham
Status.TextSize = 10
Status.TextColor3 = Color3.fromRGB(255, 80, 80)
Status.Parent = Frame

Submit.MouseButton1Click:Connect(function()
    if Input.Text == KEY then
        Status.TextColor3 = Color3.fromRGB(60, 220, 100)
        Status.Text = "Enjoy - @/ Anoma"
        task.wait(0.6)
        local ok, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/jadevaldavana-lab/anoma-ESP/refs/heads/main/anoma-ESP.lua"))()
        end)
        if ok then
            ScreenGui:Destroy()
        else
            Status.TextColor3 = Color3.fromRGB(255, 80, 80)
            Status.Text = "Load failed"
            warn(err)
        end
    else
        Status.TextColor3 = Color3.fromRGB(255, 80, 80)
        Status.Text = "Invalid key"
        Input.Text = ""
    end
end)
