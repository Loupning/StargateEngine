local API = script.Parent.Parent

local node = {}
--AddressBook/ModelPath/etc, referenced via their address/ModelPath/etc which reference to the master register. Goal is to reduce ammount of loops.
node.rawRegistery = {} --Contain all the
node.addressBook = {} --addressBook["[12][3][5][11][7][8][9]" or "123511789"] = register.StargateX
node.modelPath = {} --modelPath[workspace.Stargate] = register.StargateX
node.Network = {} --Hold tables of all networkNode in the stargate network and contain them together, lowering the ammount of object to loop through
node.Galaxy = {} --Same has networkNode but for the galaxyNode their part of.

--Add nodes

function node.addressBook:Add(node, data)
    if self[node] then
        if type(self[node]) == "table" then
            table.insert(self[node], node)
            self[node][node] = data
        elseif type(self[node]) == "string" then --Transform an exisiting node into a group of table.
            local oldNode = self[node]
            self[node] = {oldNode, node = data}
        end
    else
        self[node] = data
    end
end

function node.modelPath:Add(node, data)
    if self[node] then
        if type(self[node]) == "table" then
            table.insert(self[node], node)
            self[node][node] = data
        elseif type(self[node]) == "string" then --Transform an exisiting node into a group of table.
            local oldNode = self[node]
            self[node] = {oldNode, node = data}
        end
    else
        self[node] = data
    end
end

function node.Network:Add(node, data)
    if self[node] then
        if type(self[node]) == "table" then
            table.insert(self[node], node)
            self[node][node] = data
        elseif type(self[node]) == "string" then --Transform an exisiting node into a group of table.
            local oldNode = self[node]
            self[node] = {oldNode, node = data}
        end
    else
        self[node] = data
    end
end

function node.Galaxy:Add(node, data)
    if self[node] then
        if type(self[node]) == "table" then
            table.insert(self[node], node)
            self[node][node] = data
        elseif type(self[node]) == "string" then --Transform an exisiting node into a group of table.
            local oldNode = self[node]
            self[node] = {oldNode, node = data}
        end
    else
        self[node] = data
    end
end

-- Remove nodes

function node.addressBook:Remove(node, data)
    print(self[node], data)
    if self[node] then
        if type(self[node]) == "table" then
            for i, node in pairs(self[node]) do
                if node == data then
                    print(i, self[node])
                end
            end
        elseif self[node] == data then
            print(#self[node], self[node])
        end
    end
end

function node.modelPath:Remove(node)

end

function node.Network:Remove(node)

end

function node.Galaxy:Remove(node)

end

return node