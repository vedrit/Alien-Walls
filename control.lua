require("util")
require("variable")

local wallConnections

local function upgrade_wall(wall)
    -- Get the current health percentage. We don't want all the new wall sections to be at max health if the old ones weren't.
    --game.print("Replacing "..wall.name.." with upgrade. Current tier ".. global.alienwalltier)
    local newWall
	local wallHealth = wall.health
    local dir = wall.direction
    local pos = wall.position
    local wallSurface = wall.surface
    local wallForce = wall.force
	local wallName = wall.name
	local previousMaxHP = game.entity_prototypes[wallName].max_health
	local healthPercent = wall.health / previousMaxHP or 1
    if string.find(wall.name, "Wall") ~= nil then
		if wall.valid then
			connectionDefs = wall.circuit_connection_definitions
			-- Create a wall section.
			newWall = wallSurface.create_entity{name = "hybridWall_"..global.alienwalltier , position = pos, direction = dir, force = wallForce, fast_replace = true, spill = false, create_build_effect_smoke = false}
			-- Set the health of the new level wall.
			if wallHealth < previousMaxHP and newWall ~= nil then
				newWall.health = game.entity_prototypes["hybridWall_"..global.alienwalltier].max_health * healthPercent
			end
			if connectionDefs ~= nil then
				local segment = {wall = newWall, conDef = connectionDefs}
				if wallConnections == nil then
					wallConnections = {}
				end
				table.insert(wallConnections, segment)
			end
        end
    end
    return newWall
end

function upgrade_gate(gate)
    local healthPercent = gate.health / game.entity_prototypes[gate.name].max_health
    local newWall
    local dir = gate.direction
    local pos = gate.position
    local wallSurface = gate.surface
    local wallForce = gate.force
	local wallName = gate.name
	local wallHealth = gate.health
	local previousMaxHP = game.entity_prototypes[wallName].max_health
    -- Create a gate.
    newWall = wallSurface.create_entity{name = "hybridGate_"..global.alienwalltier, position = pos, direction = dir, force = wallForce, fast_replace = true, spill = false, create_build_effect_smoke = false}
    -- Set the health of the new level gate.
    if wallHealth < previousMaxHP then
        newWall.health = game.entity_prototypes["hybridGate_"..global.alienwalltier].max_health * healthPercent
    end
    return newWall
end

local function configChanged(event)
	--game.print("Game state changed. Tier: " .. tostring(global.alienwalltier) .. " regen rate: " .. tostring(global.alienregenrate))
	for _, player in pairs(game.players) do 
            update_current_tier(player.force)
    end
	update_walls()
end
	
function update_walls()
    --game.print("Updating walls.")
	global.tierUpdated = false
    if global.alienwall_walls == nil then
        global.alienwall_walls = {}
    end
    if global.alienwall_gates == nil then
        global.alienwall_gates = {}
    end
    if global.alienwalltier > 1 then
        local newWalls = {}
        local newGates = {}
        -- Replace each wall section (or gate) with one of the newer wall/gate level.
        for _, wall in pairs(global.alienwall_walls) do
            -- If it's dead we don't need to upgrade.
            -- No need to remove it either, as the current list will be obsolete soon.
            if wall.valid then
	            --game.print("Valid wall found, upgrading")
                local newWall = upgrade_wall(wall)
                -- Insert into the list of new wall sections.
                table.insert(newWalls, newWall)
            end
        end
        for _, gate in pairs(global.alienwall_gates) do
            if gate.valid then
	            --game.print("Valid gate found, upgrading")
                local newWall = upgrade_gate(gate)
                -- Insert into the list of new wall sections.
                table.insert(newGates, newWall)
            end
        end
        -- The old list is obsolete now, simply overwrite.
        global.alienwall_walls = newWalls
        global.alienwall_gates = newGates
    end
    if wallConnections ~= nil then
        for _, entry in pairs(wallConnections) do
            local segment = entry.wall
            for _, def in ipairs(entry.conDef) do
                segment.connect_neighbour(def)
            end
        end
    end
end

function on_hybrid_built(entity)
    -- Check to ensure no entities from outside this mod make it in.
    if string.find(entity.name, "Wall") ~= nil and entity ~= nil then
        --For some reason, keep getting a nil instead of a table, so let's make sure the global table isn't empty
        if global.alienwall_walls == nil then
            global.alienwall_walls = {}
        end
        if global.alienwalltier > 1 then
	        local newWall = upgrade_wall(entity)
            table.insert(global.alienwall_walls, newWall)
        else
            table.insert(global.alienwall_walls, entity)
        end
    elseif string.find(entity.name, "Gate") ~= nil then
        if global.alienwall_gates == nil then
            global.alienwall_gates = {}
        end
        if global.alienwalltier > 1 then
	        local newWall = upgrade_gate(entity)
            table.insert(global.alienwall_gates, newWall)
        else
            table.insert(global.alienwall_gates, entity)
        end
    end
end

function update_current_tier(force)
	-- Regen rates could probably also be a list in variable.lua / mod-settings.json.
	-- Ideally, the regen rates would also be tied to the wall entities and we wouldn't be relying on globals at all. Would make multiplayer forces work properly as well. But that's another project for another time.
	if force.technologies["alien-hybrid-upgrade-1"].researched then
        global.alienregenrate = 5
        global.alienwalltier = 2
	end
	if force.technologies["alien-hybrid-upgrade-2"].researched then
        global.alienregenrate = 10
        global.alienwalltier = 3
	end
	if force.technologies["alien-hybrid-upgrade-3"].researched then
        global.alienregenrate = 15
        global.alienwalltier = 4
	end
	if force.technologies["alien-hybrid-upgrade-4"].researched then
        global.alienregenrate = 25
        global.alienwalltier = 5
	end
	if force.technologies["alien-hybrid-upgrade-4"].researched then
        global.alienregenrate = 40
        global.alienwalltier = 6
	end
	if force.technologies["alien-hybrid-upgrade-5"].researched then
        global.alienregenrate = 75
        global.alienwalltier = 7
	end
    regenrate = global.alienregenrate
    hybridWallTier = global.alienwalltier
end

local function init()
	if global.damaged_list == nil then
		global.damaged_list = {}
	end
    wallConnections = {}
    if global.alienwall_gates == nil then
        global.alienwall_gates = {}
    end
    if global.alienwall_walls == nil then
        global.alienwall_walls = {}
    end
    global.alienregenrate = HybridRegen
    global.alienwalltier = 1
    regenrate = global.alienregenrate
    hybridWallTier = global.alienwalltier
end

local function loaded()
	if global.alienregenrate == nil or global.alienregenrate == 0 then 
		regenrate = HybridRegen
	else regenrate = global.alienregenrate
	end
	if global.alienwalltier == nil or global.alienwalltier == 0 then 
		hybridWallTier = 1
	else hybridWallTier = global.alienwalltier
	end
	-- Best I can do without being able to modify `global` during `on_load` or a migration script
end

function heal_walls()
    if global.damaged_list ~= nil then
        for k,segment in pairs(global.damaged_list) do
            if segment.valid then
                local health = segment.health
                if health < game.entity_prototypes[segment.name].max_health then -- Haven't profiled it, but instinct tells me this might be an expensive lookup to do inside the loop for each wall piece. See about caching the current tier's max HP maybe?
                    segment.health = health + regenrate
				elseif health == game.entity_prototypes[segment.name].max_health then
					table.remove(global.damaged_list, k)
				end
            else
				
                table.remove(global.damaged_list, k)
            end
        end
    end
end

function damage(entity, damage)
	if global.damaged_list == nil then
		global.damaged_list = {}
	end
	if string.find(entity.name, "hybrid") then
		table.insert(global.damaged_list, entity)
	end
end

function validate_walls()
	if global.tierUpdated == true then
		--game.print("Tiers have been updated. Running wall update!")
		update_walls()
		global.tierUpdated = false
	end
	if global.alienwall_gates ~= nil then
        for k,alienwall in pairs(global.alienwall_gates) do
            if not alienwall.valid then
				table.remove(global.alienwall_gates, k)
            end
        end
    end
	if global.alienwall_walls ~= nil then
        for k,alienwall in pairs(global.alienwall_walls) do
            if not alienwall.valid then
				table.remove(global.alienwall_walls, k)
            end
        end
    end
end

script.on_init(init)
script.on_load(loaded)
script.on_configuration_changed(configChanged)

script.on_event({defines.events.on_built_entity ,
                defines.events.on_robot_built_entity,
				defines.events.on_entity_cloned,
				defines.events.script_raised_built,
				defines.events.script_raised_revive}, function(event) on_hybrid_built(event.created_entity) end)
script.on_event(defines.events.on_entity_damaged, function(event) damage(event.entity, event.final_damage_amount) end, {{filter = "type", type = "wall"}, {filter = "type", type = "gate"}} )

script.set_event_filter(defines.events.script_raised_revive, {{filter = "type", type = "wall"}, {filter = "type", type = "gate"}})
script.set_event_filter(defines.events.on_built_entity,{{filter = "type", type = "wall"}, {filter = "type", type = "gate"}})
script.set_event_filter(defines.events.on_entity_cloned,{{filter = "type", type = "wall"}, {filter = "type", type = "gate"}})
script.set_event_filter(defines.events.on_robot_built_entity,{{filter = "type", type = "wall"}, {filter = "type", type = "gate"}})
script.set_event_filter(defines.events.script_raised_built,{{filter = "type", type = "wall"}, {filter = "type", type = "gate"}})

script.on_nth_tick(60, heal_walls)
script.on_nth_tick(120, validate_walls)

script.on_event(defines.events.on_research_finished, function(event)
    local research = event.research.name
    if string.find(research, "alien%-hybrid%-upgrade") then
        for _, player in pairs(game.players) do 
            update_current_tier(player.force)
        end    
      -- I'm still not sure if it's possible to handle multiple player forces with different tiers, but in theory you'd call the force of the one doing the research here, not `player`.
        update_walls()
    end
end)