local API = script.Parent.Parent
local node = require(API.Private.Node)

return function(by, input, ...)
	if string.lower(by) == "address" then
		if node.addressBook[input] then
			return node.addressBook[input]
		--elseif type(addressBook[input]) == "table" then
			
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
	end
	return false
end