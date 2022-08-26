task.wait(10)

local DrawMaster = require(game:GetService("ReplicatedStorage"):WaitForChild("ViewportCanvas"))
local CanvasTest = function(Canvas)
    local time = 0.05
    for x = 1, 15 do
        for y = 1, 15 do
            Canvas:SetPixel(x, y, Color3.new())
            Canvas:Render()
            task.wait(time)
        end
    end
end
local CreateScreen = function(index, height)
    local SFGUI = Instance.new("SurfaceGui")
    local Frame = Instance.new("Frame")
    local Part = Instance.new("Part")

    SFGUI.Parent = Part
    SFGUI.Face = Enum.NormalId.Left
    SFGUI.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    Frame.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame.Size = UDim2.new(0, 100, 0, 100)
    Frame.Parent = SFGUI
    Part.Anchored = true
    Part.Size = Vector3.new(2, 2, 2)
    Part.CFrame = CFrame.new(0, 5 + (2 * height), 2 * index)
    Part.Parent = workspace
	local Canvas = DrawMaster.new(15, 15)
	Canvas:SetParent(Frame)

    print("Created screen " .. index)
    coroutine.resume(coroutine.create(function()
        while true do
            for i = 1, 15 do
                for j = 1, 15 do
                    Canvas:SetPixel(i, j, Color3.new(1, 1, 1))
                end
            end
            CanvasTest(Canvas)
            for i = 1, 15 do
                for j = 1, 15 do
                    Canvas:SetPixel(i, j, Color3.new(1, 1, 1))
                end
            end
        end
    end))
end

for i2 = 1, 3 do
    for i = 1, 50 do
        CreateScreen(i, i2)
        task.wait(0.1)
    end
end