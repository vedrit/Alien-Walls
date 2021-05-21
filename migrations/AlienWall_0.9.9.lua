for _, entity in pairs(global.alienwall) do
	if global.alienwall_gates == nil then
        global.alienwall_gates = {}
    end
    if global.alienwall_walls == nil then
        global.alienwall_walls = {}
    end
	if string.find(entity.name, "Wall") ~= nil then
		table.insert(global.alienwall_walls, entity)
	elseif string.find(entity.name, "Gate") ~= nil then
		table.insert(global.alienwall_gates, entity)
	end
end