local API = script.Parent.Parent

return function(string_Address)
    if string_Address == nil or type(string_Address) ~= "string" then return warn("readAddress didn't get a String") end

    local address7 = nil
	local address8 = nil
    local lenght = 0 -- Used for verification.(Mostly used by the register.)

    for raw_number in string_Address:gmatch('%[(%d+)%]') do
        if lenght == 0 then
	
            address7 = "["..raw_number.."]" -- If the raw_address is newly formed then set it up properly with the first number value
            lenght = lenght + 1
        elseif lenght > 0 and lenght < 7 then
            address7 = address7 .. "["..raw_number.."]" -- Otherwise add number to it.
            lenght = lenght + 1
		elseif lenght == 7 then
			address8 = address7 .. "["..raw_number.."]"
			break
        end
    end
	--print(address7, address8)
    return address7, address8 -- Now we return the raw_address value of 123456789 to calling function | Also return its lenght for safety reason.
end