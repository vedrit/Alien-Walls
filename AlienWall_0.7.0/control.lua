require("util")
require("variable")

-- As with many things, I'm tempted to dynamically generate this list. But it works for now.
wallNames = {"hybrid-wall", "hybrid-wall-tier-2", "hybrid-wall-tier-3", "hybrid-wall-tier-4", "hybrid-wall-tier-5"}
gateNames = {"hybrid-gate", "hybrid-gate-tier-2", "hybrid-gate-tier-3", "hybrid-gate-tier-4", "hybrid-gate-tier-5"}
         
function upgrade_wall_section(wall)
   -- Get the current health percentage. We don't want all the new wall sections to be at max health if the old ones weren't.
   local healthPercent = wall.health / game.entity_prototypes[wall.name].max_health
   local pos = wall.position
   local dir = wall.direction
   local newWall = {}
   -- Is the current thing a gate?
   if string.find(wall.name, "gate") ~= nil then
      -- Create a gate.
      wall.destroy()
      newWall = game.surfaces[1].create_entity{name = gateNames[global.alienwalltier], position = pos, direction = dir, force = game.forces.player}
      -- Set the health of the new level gate.
      newWall.health = game.entity_prototypes[gateNames[global.alienwalltier]].max_health * healthPercent
   else
      -- Create a wall section.
      -- Currently hardcodes to use surface[1]. Very rarely do maps use multiple surfaces, but something to keep in mind.
      -- Must destroy existing wall first, otherwise create_entity fails and returns nil.
      wall.destroy()
      newWall = game.surfaces[1].create_entity{name = wallNames[global.alienwalltier], position = pos, direction = dir, force = game.forces.player}
      -- Set the health of the new level wall.
      newWall.health = game.entity_prototypes[wallNames[global.alienwalltier]].max_health * healthPercent
   end
   return newWall
end

function update_walls()
   local newWalls = {}
   -- Replace each wall section (or gate) with one of the newer wall/gate level.
   for _, wall in pairs(global.alienwall) do
      -- If it's dead we don't need to upgrade.
      -- No need to remove it either, as the current list will be obsolete soon.
      if wall.valid then
         local newWall = upgrade_wall_section(wall)
         -- Insert into the list of new wall sections.
         table.insert(newWalls, newWall)
      end
   end
   -- The old list is obsolete now, simply overwrite.
   global.alienwall = newWalls
end

function on_built(entity)
    -- We have to consider different names now, with the levels. So use string.find to check if it's a wall/gate.
    if string.find(entity.name, "hybrid%-wall") or string.find(entity.name, "hybrid%-gate") then
      -- If we're at level 2 we'll need to upgade.
      local newWall = upgrade_wall_section(entity)
      -- Store it in the global list for later healing and possible levelling.
      table.insert(global.alienwall, newWall)
    end
end

function heal_wall()
   if global.alienwall ~= nil then
      for k,alienwall in pairs(global.alienwall) do
         if alienwall.valid then
            local health = alienwall.health
            if health < game.entity_prototypes[alienwall.name].max_health then -- Haven't profiled it, but instinct tells me this might be an expensive lookup to do inside the loop for each wall piece. See about caching the current tier's max HP maybe?
                alienwall.health = health + global.alienregen
            end
         else
            table.remove(global.alienwall, k)
         end
      end
   end
end

function init()
   if global.alienwall == nil then
      global.alienwall = {}
   end
   if global.alienregen == nil or global.alienregen == 0 then
      global.alienregen = 2 -- Value works out as HP/s. New default is fairly low, but seems balanced for early game.
   end
   -- Game complains about modifying `global` table during on_load, might run into problems with updating to new version in existing save.
   -- Look into a proper update method or something. Or just leave this check out entirely, it doesn't seem to be needed. At the very least it'll be set properly upon upgrade research.
   if global.alienwalltier == nil or global.alienwalltier == 0 then
      global.alienwalltier = 1
   end
   -- Replacing all walls on startup may or may not be a good idea, but should help keep things consistent
   -- Nope because the `game` global isn't available during init.
   -- update_walls()
end

script.on_init(init)
script.on_load(init)

script.on_event(defines.events.on_built_entity, function(event) on_built(event.created_entity) end)
script.on_event(defines.events.on_robot_built_entity, function(event) on_built(event.created_entity) end)

script.on_event(defines.events.on_tick, function(event)
      if (game.tick % 60) == 0 then
          heal_wall()
      end
end)

script.on_event(defines.events.on_research_finished, function(event)
    local research = event.research.name
    if research == "alien-hybrid-upgrade-1" then
        global.alienregen = 5 -- Regen rates could probably also be a list in variable.lua / mod-settings.json.
        -- Ideally, the regen rates would also be tied to the wall entities and we wouldn't be relying on globals at all. Would make multiplayer forces work properly as well. But that's another project for another time.
        global.alienwalltier = 2
        update_walls()
    end      
    if research == "alien-hybrid-upgrade-2" then
        global.alienregen = 10
        global.alienwalltier = 3
        update_walls()
    end
    if research == "alien-hybrid-upgrade-3" then
        global.alienregen = 15
        global.alienwalltier = 4
        update_walls()
    end
    if research == "alien-hybrid-upgrade-4" then
        global.alienregen = 25
        global.alienwalltier = 5
        update_walls()
    end
end   
)