
function hit_effects.wall(entity)
	if global.damaged_list == nil then
		global.damaged_list = {}
	end
    table.insert(global.damaged_list, entity)
end

return hit_effects
