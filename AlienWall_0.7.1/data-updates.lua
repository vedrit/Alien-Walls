require("util")
require("variable")

local wallTiers = {}
local gateTiers = {}
local items = {}

for i = 2,5 do -- could probably go real crazy and make it `for HybridHP.length` or something dynamic.
    local wall = table.deepcopy(data.raw.wall['hybridWall'])
    wall.name='hybridWall-tier-'..i
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

for i = 2,5 do
    local gate = table.deepcopy(data.raw.gate['hybridGate'])
    gate.name='hybridGate-tier-'..i
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