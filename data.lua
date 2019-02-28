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
		if string.match(spawner.name, "spawner") then
			table.insert(spawner.loot, {item = "alien-biomass", probability = 1, count_min = 9, count_max = 18})
		end
	end
	for _, unit in pairs(data.raw["unit"]) do
		if unit.loot == nil then
			unit.loot = {}
		end
		if string.match(unit.name, "biter") then
			if string.match(unit.name, "small") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 1, count_max = 6})
			elseif string.match(unit.name, "medium") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 4, count_max = 9})
			elseif string.match(unit.name, "large") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 7, count_max = 12})
			elseif string.match(unit.name, "behemoth") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 10, count_max = 15})
			else
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 13, count_max = 18})
			end
		elseif string.match(unit.name, "spitter") then
			if string.match(unit.name, "small") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 1, count_max = 6})
			elseif string.match(unit.name, "medium") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 4, count_max = 9})
			elseif string.match(unit.name, "large") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 7, count_max = 12})
			elseif string.match(unit.name, "behemoth") then
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 10, count_max = 15})
			else
				table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = 13, count_max = 18})
			end
		end
	end
	for _, worm in pairs(data.raw["turret"]) do
		if worm.loot == nil then
			worm.loot = {}
		end
		if string.match(worm.name, "worm") then
			if string.match(worm.name, "small") then
				table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = 3, count_max = 9})
			elseif string.match(worm.name, "medium") then
				table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = 6, count_max = 12})
			elseif string.match(worm.name, "medium") then
				table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = 9, count_max = 15})
			else
				table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = 12, count_max = 18})
			end
		end
	end
end

AddBiomass()