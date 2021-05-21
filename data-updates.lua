require("util")
require("variable")

local wallTiers = {}
local gateTiers = {}
local items = {}

function AddBiomass()
	for _, spawner in pairs(data.raw["unit-spawner"]) do
		if spawner.loot == nil then
			spawner.loot = {}
		end
		local hasLoot = false
		for _, lootEntry in ipairs(spawner.loot) do
			if string.match(lootEntry.item, "alien-biomass") then
				hasLoot = true
				break
			end
		end
		if hasLoot == false then
			if string.match(spawner.name, "spawner") or string.match(spawner.name, "nest") then
				table.insert(spawner.loot, {item = "alien-biomass", probability = 1, count_min = settings.startup["biomass-min"].value + settings.startup["biomass-structure-bonus"].value, count_max = settings.startup["biomass-max"].value + settings.startup["biomass-structure-bonus"].value})
			end
		end
	end
	for _, unit in pairs(data.raw["unit"]) do
		if unit.loot == nil then
			unit.loot = {}
		end
		local hasLoot = false
		for _, lootEntry in ipairs(unit.loot) do
			if string.match(lootEntry.item, "alien-biomass") then
				hasLoot = true
				break
			end
		end
		if hasLoot == false then
			if string.match(unit.name, "biter") then
				if string.match(unit.name, "small") then
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = settings.startup["biomass-min"].value, count_max = settings.startup["biomass-max"].value})
				elseif string.match(unit.name, "medium") then
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = (settings.startup["biomass-min"].value + math.floor(settings.startup["biomass-min-scale"].value * 2)), count_max = settings.startup["biomass-max"].value + math.floor(settings.startup["biomass-max-scale"].value * 2)})
				elseif string.match(unit.name, "large") then
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = (settings.startup["biomass-min"].value + math.floor(settings.startup["biomass-min-scale"].value * 3)), count_max = settings.startup["biomass-max"].value + math.floor(settings.startup["biomass-max-scale"].value * 3)})
				elseif string.match(unit.name, "behemoth") then
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = (settings.startup["biomass-min"].value + math.floor(settings.startup["biomass-min-scale"].value * 4)), count_max = settings.startup["biomass-max"].value + math.floor(settings.startup["biomass-max-scale"].value * 4)})
				else
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = (settings.startup["biomass-min"].value + math.floor(settings.startup["biomass-min-scale"].value * 5)), count_max = settings.startup["biomass-max"].value + math.floor(settings.startup["biomass-max-scale"].value * 5)})
				end
			elseif string.match(unit.name, "spitter") then
				if string.match(unit.name, "small") then
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = settings.startup["biomass-min"].value, count_max = settings.startup["biomass-max"].value})
				elseif string.match(unit.name, "medium") then
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = (settings.startup["biomass-min"].value + math.floor(settings.startup["biomass-min-scale"].value * 2)), count_max = settings.startup["biomass-max"].value + math.floor(settings.startup["biomass-max-scale"].value * 2)})
				elseif string.match(unit.name, "large") then
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = (settings.startup["biomass-min"].value + math.floor(settings.startup["biomass-min-scale"].value * 3)), count_max = settings.startup["biomass-max"].value + math.floor(settings.startup["biomass-max-scale"].value * 3)})
				elseif string.match(unit.name, "behemoth") then
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = (settings.startup["biomass-min"].value + math.floor(settings.startup["biomass-min-scale"].value * 4)), count_max = settings.startup["biomass-max"].value + math.floor(settings.startup["biomass-max-scale"].value * 4)})
				else
					table.insert(unit.loot, {item = "alien-biomass", probability = 1, count_min = (settings.startup["biomass-min"].value + math.floor(settings.startup["biomass-min-scale"].value * 5)), count_max = settings.startup["biomass-max"].value + math.floor(settings.startup["biomass-max-scale"].value * 5)})
				end
			end
		end
	end
	for _, worm in pairs(data.raw["turret"]) do
		if worm.loot == nil then
			worm.loot = {}
		end
		local hasLoot = false
		for _, lootEntry in ipairs(worm.loot) do
			if string.match(lootEntry.item, "alien-biomass") then
				hasLoot = true
				break
			end
		end
		if hasLoot == false then
			if string.match(worm.name, "worm") then
				if string.match(worm.name, "medium") then
					table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = settings.startup["biomass-min"].value + settings.startup["biomass-structure-bonus"].value + settings.startup["biomass-min-scale"].value, count_max = settings.startup["biomass-max"].value + settings.startup["biomass-structure-bonus"].value + settings.startup["biomass-max-scale"].value})
				elseif string.match(worm.name, "big") then
					table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = settings.startup["biomass-min"].value + settings.startup["biomass-structure-bonus"].value + (settings.startup["biomass-min-scale"].value * 2), count_max = settings.startup["biomass-max"].value + settings.startup["biomass-structure-bonus"].value + (settings.startup["biomass-max-scale"].value * 2)})
				elseif string.match(worm.name, "behemoth") then
					table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = settings.startup["biomass-min"].value + settings.startup["biomass-structure-bonus"].value + (settings.startup["biomass-min-scale"].value * 3), count_max = settings.startup["biomass-max"].value + settings.startup["biomass-structure-bonus"].value + (settings.startup["biomass-max-scale"].value * 3)})
				else
					table.insert(worm.loot, {item = "alien-biomass", probability = 1, count_min = settings.startup["biomass-min"].value + settings.startup["biomass-structure-bonus"].value + (settings.startup["biomass-min-scale"].value * 4), count_max = settings.startup["biomass-max"].value + settings.startup["biomass-structure-bonus"].value + (settings.startup["biomass-max-scale"].value * 4)})
				end
			end
		end
	end
end

AddBiomass()

for i = 2,7 do -- could probably go real crazy and make it `for HybridHP.length` or something dynamic.
    local wall = table.deepcopy(data.raw.wall['hybridWall'])
    wall.name='hybridWall_'..i
    wall.max_health = HybridHP[i]
--  wall.minable.result = wall.name -- Nope, want all wall types to drop the base item. It'll place the correct one on build.
    wall.order = "z[hybridWall]"..i
    table.insert(wallTiers, wall)
    
    local item = table.deepcopy(data.raw.item['hybridized-wall'])
    item.name = wall.name
    item.order = "z[hybridWall]"..i
    item.place_result = wall.name
    item.hidden = true
    table.insert(items, item)
	
end

for i = 2,7 do
    local gate = table.deepcopy(data.raw.gate['hybridGate'])
    gate.name='hybridGate_'..i
    gate.max_health = HybridHP[i]
--  gate.minable.result = gate.name
    gate.order = "z[hybridGate]"..i
    table.insert(gateTiers, gate)
    
    local item = table.deepcopy(data.raw.item['hybridized-gate'])
    item.name = gate.name
    item.order = "z[hybridGate]"..i
    item.place_result = gate.name
    item.hidden = true
    table.insert(items, item)
end
  

for _,wall in pairs(wallTiers) do data:extend({wall}) end
for _,gate in pairs(gateTiers) do data:extend({gate}) end
for _,item in pairs(items) do data:extend({item}) end