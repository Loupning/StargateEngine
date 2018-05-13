local API = script.Parent.Parent
local node = require(API.Private.Node)

return function(by, input, ...)
	if string.lower(by) == "address" then
		if type(addressBook[input]) == "table" then
			
		elseif node.addressBook[input] then
			return node.addressBook[input]
		end
	elseif string.lower(by) == "model" then
		if node.modelPath[input] then
			return node.modelPath[input]
		end
	elseif string.lower(by) == "network" then
		if node.networkNode[input] then
			return node.networkNode[input]
		end
	elseif string.lower(by) == "galaxy" then
		if node.galaxyNode[input] then
			return node.galaxyNode[input]
		end
	elseif string.lower(by) == "distance" then -- loop through the gates, find the closest gate possible. Goal: true closest gate.
		local distanceAppart = ...
		local closest = {} -- store reference of the closest gate.
		local dist = {} -- store the distance value to reference the closest gate
		
		for _, gate in pairs(node.modelPath) do
			local distance = (gate.Model.PrimaryPart.Position - input.Position).magnitude
			if distance < distanceAppart then
				table.insert(dist, distance)
				closest[distance] = gate
			end
		end
		
		table.sort(dist)
		return closest[dist[1]] -- Return the true closest gate.
	--Return a table of all existing and known registered Stargate within the Framework.
	elseif string.lower(by) == "allGate" then
		local allGate = {}
		for _, gate in pairs(node.rawRegistery) do
			if gate.Id then if gate.Id == "Stargate" then table.insert(allGate, gate) end
		end
		return allGate
	elseif string.lower(by) == "allDHD" then
		local allDHD = {}
		for _, dhd in pairs(node.rawRegistery) do
			if dhd.Id then if dhd.Id == "DHD" then table.insert(allDHD, dhd) end
		end
		return allDHD
	end
	return false
end