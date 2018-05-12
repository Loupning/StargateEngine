local Module = {}

local RunService = game:GetService("RunService")

local glyph = {
    Atlas = 540226059; -- Atlas ImageID
    Offset = { -- Offset Position
        ['1'] = Vector2.new(0, 0); ['2'] = Vector2.new(256, 256); ['3'] = Vector2.new(640, 256); ['4'] = Vector2.new(896, 256); ['5'] = Vector2.new(896, 384);
        ['6'] = Vector2.new(0, 512); ['7'] = Vector2.new(128, 512); ['8'] = Vector2.new(0, 640); ['9'] = Vector2.new(128, 640); ['10'] = Vector2.new(128, 0);
        ['11'] = Vector2.new(0, 128); ['12'] = Vector2.new(128, 128); ['13'] = Vector2.new(256, 0); ['14'] = Vector2.new(256, 128); ['15'] = Vector2.new(384, 0);
        ['16'] = Vector2.new(384, 128); ['17'] = Vector2.new(0, 256); ['18'] = Vector2.new(0, 348); ['19'] = Vector2.new(128, 256); ['20'] = Vector2.new(128, 384);
        ['21'] = Vector2.new(256, 384); ['22'] = Vector2.new(384, 256); ['23'] = Vector2.new(384, 384); ['24'] = Vector2.new(512, 0); ['25'] = Vector2.new(640, 0);
        ['26'] = Vector2.new(512, 128); ['27'] = Vector2.new(768, 0); ['28'] = Vector2.new(640, 128); ['29'] = Vector2.new(512, 256); ['30'] = Vector2.new(512, 384);
        ['31'] = Vector2.new(768, 128); ['32'] = Vector2.new(896, 0); ['33'] = Vector2.new(896, 128); ['34'] = Vector2.new(768, 256); ['35'] = Vector2.new(640, 384);
        ['36'] = Vector2.new(768, 384);
    };
    Size = Vector2.new(128, 128); -- Size of the Image
    Color3 = Color3.new(1,1,1); -- Allow to alternate the color.
}

Module.Style = {
    Gate = {
        chevColor = {[true] = BrickColor.new("Toothpaste"), [false] = BrickColor.new("Sand blue")};
        lightColor = {[true] = BrickColor.new("Toothpaste"), [false] = BrickColor.new("Sand blue")};
        symbolColor = {[true] = BrickColor.new("Teal"), [false] = BrickColor.new("Sand blue")};

        chevMaterial = {[true] = "Neon", [false] = "Ice"};
        lightMaterial = {[true] = "Neon", [false] = "Ice"};
        symbolMaterial = {[true] = "Neon", [false] = "Sand"};

		chevTrans = {[true] = 0, [false] = 0};
		lightTrans = {[true] = 0, [false] = 0};
		symbolTrans = {[true] = 0, [false] = 0};

        new_ehTex = {}, -- EventHorizon Texture animation[Opening/Closing State].
        ehTex = {}, -- EventHorizon Texture animation[Active State].
        ehUnstableOverlay = {}, -- EventHorizon Texture animation[Unstable State].
        glyphAtlas = glyph
    };
    DHD = {
        btnColor = {[true] = BrickColor.new("Toothpaste"), [false] = BrickColor.new("Sand blue")},
        activatorColor = {[true] = BrickColor.new("Really Black"), [false] = BrickColor.new("Really red")},

        btnMaterial = {[true] = "Ice", [false] = "Marble"},
        activatorMaterial = {[true] = "Ice", [false] = "Marble"},

        glyphAtlas = glyph
    };
}

--[[function Module:DialAnimation()
    local center = workspace.Part1
    local ring = workspace.Part2

    local t0 = tick()
    local length = 4
    local connection;
    connection = RunService.RenderStepped:connect(function()
        local t1 = tick()
        local unit = (t1 - t0) / length
        if unit >= 1 then
            unit = 1
            connection:disconnect()
            connection= nil
        end

        ring.CFrame = center.CFrame * CFrame.Angles(0, 0, math.rad(90) * unit)
    end)
end]]

return Module
