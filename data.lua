require('prototypes.structures.entity')
require('prototypes.structures.item')
require('prototypes.structures.recipe')
require('prototypes.technologies')
require('prototypes.item-groups')
require('prototypes.items.alien-mats')
function AddBiomass()
	for _, spawner in pairs(data.raw["unit-spawner"]) do
		if spawner.loot == nil then
			spawner.loot = {}
		end
		if string.match(spawner.name, "spawner") or string.match(spawner.name, "nest") then
			table.insert(spawner.loot, {item = "alien-biomass", probability = 1, count_min = 7, count_max = 10})
		end
	end
	for _, unit in pairs(data.raw["unit"]) do
		if unit.loot == nil then
			unit.loot = {}
		end
		if string.match(unit.name, "biter") then
			if string.match(unit.name, "small") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 1, count_max = 4})
			elseif string.match(unit.name, "medium") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 3, count_max = 6})
			elseif string.match(unit.name, "large") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 5, count_max = 8})
			elseif string.match(unit.name, "behemoth") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 7, count_max = 10})
			else
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 9, count_max = 12})
			end
		elseif string.match(unit.name, "spitter") then
			if string.match(unit.name, "small") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 1, count_max = 4})
			elseif string.match(unit.name, "medium") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 3, count_max = 6})
			elseif string.match(unit.name, "large") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 5, count_max = 8})
			elseif string.match(unit.name, "behemoth") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 7, count_max = 10})
			else
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 9, count_max = 12})
			end
		end
	end
	for _, worm in pairs(data.raw["turret"]) do
		if worm.loot == nil then
			worm.loot = {}
		end
		if string.match(worm.name, "worm") then
			if string.match(worm.name, "small") then
				table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = 3, count_max = 6})
			elseif string.match(worm.name, "medium") then
				table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = 5, count_max = 8})
			elseif string.match(worm.name, "medium") then
				table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = 7, count_max = 10})
			else
				table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = 9, count_max = 12})
			end
		end
	end
end

AddBiomass()