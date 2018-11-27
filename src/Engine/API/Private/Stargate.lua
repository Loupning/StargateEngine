local API = script.Parent.Parent
local node = require(API.Private.Node)
local readAddress = require(API.Private.Address)

local stargate = {}
stargate.__index = stargate

function stargate.new(data, model)
	local self = {}

	self.Id = "Stargate"

	self.Address = data.Address
	self.Network = data.Network
	self.Galaxy = data.Galaxy
	
	self.Type = data.Type
	self.DHDs = {};

	------------------------------
	  ----- States Handler -----
	------------------------------
	
	self.State = {}
	local InternalStateHolder = {}
	local Listeners = {}
	
	function self.State.new(index,default,allowedValue, protected)
		local state = rawget(InternalStateHolder, index)
		if state ~= nil then return end
	    local state = {["value"] = default, ["allowedValue"] = allowedValue} --some state object.
		rawset(InternalStateHolder, index, state)
	end	
	
	function self.State:Set(index, newValue)
		local state, success = rawget(InternalStateHolder, index)
		for i, allowed in pairs(state.allowedValue) do
			if (newValue == allowed) then
				state.value = newValue
				success = true
				break
			end
		end
		if not(success) then warn("Couldn't set State['"..index.."'] newValue['"..tostring(newValue).."'] not allowed.") return end
		--Assume it was a success and fire all callback listeners connection.
		local listener = rawget(Listeners, index)
		for i, listener in pairs(listener) do
			listener()
		end
	end		
	
	function self.State:Listen(index, func)
		local listener = rawget(Listeners, index)
		if listener ~= nil then
			table.insert(listener, func)
		else
			local newListener = {func}
			rawset(Listeners, index, newListener)
		end
	end	
	
	setmetatable(self.State, {
	    __index = (function(this,index)
	        local state = rawget(InternalStateHolder, index)
	        if state ~= nil then
	            local value = state.value
	            return value
	        else
	            return nil
	        end
	    end),
	    __newindex = (function(this, index, value)
	        --we don't actually need to do anything just preventing them from writing data)
	    end)
	})
	
	self.State.new("Enabled", false, {true, false})
	--self.State:Listen("Enabled", self:Wormhole)
	
	------------------------------
	 ----- Connection Event -----
	------------------------------
	
	self.OverrideConnect = nil
	function self:Connect(outInConnection, address) --string "Outgoing" | "Incomming", string "[2]..."
		if self.OverrideConnect ~= nil and type(self.OverrideConnect) == "function" then
			self.OverrideConnect(outInConnection, address)
		return end
		--check if active return
		if self.Enabled == true then return end
		--check if gate does not exist return
		if not(node.addressBook[address]) then return end
		local gate = node.addressBook[address]
		--check if other gate is active return
		if gate.State.Enabled then return end --Hmmmmmmm Need to revisit this part in the future.
		--call other gate connect if outgoing
		if string.lower(outInConnection) == "outgoing" then
			gate:Connect("Incomming", self.Address)
		end
		--set connecting address
		self.connectedTo = address
		--set active
		self.State:Set("Enabled", true)
	end
	
	self.OverrideWormhole = nil
	function self:Wormhole()
		if self.OverrideWormhole ~= nil and type(self.OverrideWormhole) == "function" then
			self.OverrideWormhole()
		return end
		if self.connectedTo == nil then self:Shutdown("Failed") return end
		
	end
	
	function self:Shutdown(method)
		if string.lower(method) == "failed" then
			
		elseif string.lower(method) == "disconnect" then
			
		end
	end
	
	self.Model = model
	
	local address7, address8 = readAddress(data.Address)	
	
	node.addressBook:Add(address7, self) --7 Symbol -- BAD METHOD NEED TO REWORK perhaps I could link all same address within a table.
	node.addressBook:Add(address8, self) --8 Symbol
	node.addressBook:Add(data.Address, self) --9 Symbol
	node.modelPath:Add(model, self)
	--Need to rework the network and galaxy node to be relied between themself and internal.
	node.Network:Add(data.Network, self) -- if network is set but galaxy isn't ignore the networkNode.
	node.Galaxy:Add(data.Galaxy, self)
	
	return setmetatable(self, stargate)
end

function stargate:Destroy()
	--Destroy reference to the gate
	local address7, address8 = readAddress(self.Address)

	node.addressBook:Remove(address7, self)
	node.addressBook:Remove(address8, self)
	node.addressBook:Remove(self.Address, self)
	node.modelPath:Remove(self.Model)
	node.Network:Remove(self.Network, self)
	node.Galaxy:Remove(self.Galaxy, self)
	
	self = nil -- Destroy all the data.
end

return stargate