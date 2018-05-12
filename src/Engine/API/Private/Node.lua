local API = script.Parent.Parent

local node = {}
--AddressBook/ModelPath/etc, referenced via their address/ModelPath/etc which reference to the master register. Goal is to reduce ammount of loops.
node.addressBook = {} --addressBook["[12][3][5][11][7][8][9]" or "123511789"] = register.StargateX
node.modelPath = {} --modelPath[workspace.Stargate] = register.StargateX
node.networkNode = {} --Hold tables of all networkNode in the stargate network and contain them together, lowering the ammount of object to loop through
node.galaxyNode = {} --Same has networkNode but for the galaxyNode their part of.

return node