--Stargate Engine Revision3: Invictus
--Version: Sau
--By: Loupning

--Master Registery of Stargates, hold all information of any gate.
local API = script.Parent.API
local stargate, dhd, node = require(API.Private.Stargate), require(API.Private.DHD), require(API.Private.Node)
--Networking object
local RemoteEvent = Instance.new("RemoteEvent", game.ReplicatedStorage.Stargate_Network)
local RemoteFunction = Instance.new("RemoteFunction", game.ReplicatedStorage.Stargate_Network)

local CollectionService = game:GetService("CollectionService")

------------------------------
------ CoreFunction ------
------------------------------
--change the function to instead return an unalternated string of 7, 8 address lenght for the addressBook.


--[[local function registerAddress(address, gate)
	
end]]


------------------------------
  ----- Core Registery -----
------------------------------

local registery = {}

local gateAddedSignal = CollectionService:GetInstanceAddedSignal("~$Stargate")
local gateRemovedSignal = CollectionService:GetInstanceRemovedSignal("~$Stargate")

local dhdAddedSignal = CollectionService:GetInstanceAddedSignal("~$DHD")
local dhdRemovedSignal = CollectionService:GetInstanceRemovedSignal("~$DHD")

----Stargate----

local function onGateAdded(gate)
	local data = require(gate.Data) -- Load the gate's configuration.
	registery[gate] = stargate.new(data, gate)
end

local function onGateRemoved(gate)
	if registery[gate] then
		registery[gate]:Destroy()
		registery[gate] = nil
	end
end

----DHD----

local function onDhdAdded(dhd)
	local data = require(dhd.Data) -- Load the gate's configuration.
	registery[dhd] = dhd.new(data)
end

local function onDhdRemoved(dhd)
	if registery[dhd] then
		registery[dhd]:Destroy()
		registery[dhd] = nil
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