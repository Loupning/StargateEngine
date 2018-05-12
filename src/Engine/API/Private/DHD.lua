local API = script.Parent.Parent

local dhd = {}
dhd.__index = dhd

function dhd.new(data, model)
	local self = {}
	self.Config = data
	self.Model = model

	return setmetatable(self, dhd)
end

function dhd:Destroy()
	--do other stuff needed.
	self = nil -- Destroy all the data.
end

return dhd