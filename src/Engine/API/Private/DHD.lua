local API = script.Parent.Parent
local searchFor = require(API.Public.Search)

local dhd = {}
dhd.__index = dhd

local RemoteEvent = game.ReplicatedStorage.Stargate_Network.RemoteEvent
local RemoteFunction = game.ReplicatedStorage.Stargate_Network.RemoteFunction

--Allow for a dynamic DHD system where Gui DHD can register within here too.
function dhd.new(data, model)
	local self = {}

	self.Id = "DHD"

	if data ~= nil then
		self.Type = data.Type
		self.DialType = data.DialType
	end
	self.Model = model



	return setmetatable(self, dhd)
end

function dhd:Destroy()
	--do other stuff needed.
	self = nil -- Destroy all the data.
end

return dhd