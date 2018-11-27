--Stargate Engine Revision3: Invictus
--Version: Sau
--By: Loupning

--Networking object
local RemoteEvent = Instance.new("RemoteEvent", game.ReplicatedStorage.Stargate_Network)
local RemoteFunction = Instance.new("RemoteFunction", game.ReplicatedStorage.Stargate_Network)
--Master Registery of Stargates, hold all information of any gate.
local API = script.Parent.API
local stargate, dhd, node = require(API.Private.Stargate), require(API.Private.DHD), require(API.Private.Node)

local CollectionService = game:GetService("CollectionService")

local gateAddedSignal = CollectionService:GetInstanceAddedSignal("~$Stargate")
local gateRemovedSignal = CollectionService:GetInstanceRemovedSignal("~$Stargate")

local dhdAddedSignal = CollectionService:GetInstanceAddedSignal("~$DHD")
local dhdRemovedSignal = CollectionService:GetInstanceRemovedSignal("~$DHD")

----Stargate----

local function onGateAdded(gate)
	local data = require(gate.Data) -- Load the gate's configuration.
	node.rawRegistery[gate] = stargate.new(data, gate)
end

local function onGateRemoved(gate)
	if node.rawRegistery[gate] then
		node.rawRegistery[gate]:Destroy()
		node.rawRegistery[gate] = nil
	end
end

----DHD----

local function onDhdAdded(dhd)
	local data = require(dhd.Data) -- Load the gate's configuration.
	node.rawRegistery[dhd] = dhd.new(data)
end

local function onDhdRemoved(dhd)
	if node.rawRegistery[dhd] then
		node.rawRegistery[dhd]:Destroy()
		node.rawRegistery[dhd] = nil
	end
end

--Loop throught existing instance of Stargate & DHD and register them on startup.
for _, stargate in pairs(CollectionService:GetTagged("~$Stargate")) do
	onGateAdded(stargate)
end

for _, dhd in pairs(CollectionService:GetTagged("~$DHD")) do
	onDhdAdded(dhd)
end

gateAddedSignal:Connect(onGateAdded)
gateRemovedSignal:Connect(onGateRemoved)

dhdAddedSignal:Connect(onDhdAdded)
dhdRemovedSignal:Connect(onDhdRemoved)

_G.searchFor = require(API.Public.Search)