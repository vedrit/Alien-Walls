-- require("variable")
game.players[1].print("Migration pre-init - Global Wall Tier:")
game.players[1].print(tostring(global.alienwalltier))
game.players[1].print("Migration pre-init - Global Wall Table:")
game.players[1].print(tostring(global.alienwall))
game.players[1].print("Migration pre-init - Old version regen:")
game.players[1].print(tostring(global.alienregen))
if global.alienwall == nil then global.alienwall = {} end
if global.alienregenrate == nil or global.alienregenrate == 0 then global.alienregenrate = 2 end -- `variable` module doesn't seem to import properly in this environment. Another reason to use mod-settings. But even if this value is wrong here, it'll get overwritten eventually.
if global.alienwalltier == nil or global.alienwalltier == 0 then global.alienwalltier = 1 end
regenrate = global.alienregenrate
walltier = global.alienwalltier
game.players[1].print("Migration post-init - Global Wall Table:")
game.players[1].print(tostring(global.alienwall))
game.players[1].print("Migration init - Wall Tier:")
game.players[1].print(tostring(walltier))
-- Migrations are run before control.lua, so the functions defined in it don't exist yet here. So I have to duplicate most of them:

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
      newWall = game.surfaces[1].create_entity{name = gateNames[walltier], position = pos, direction = dir, force = game.forces.player}
      -- Set the health of the new level gate.
      newWall.health = game.entity_prototypes[gateNames[walltier]].max_health * healthPercent
   else
      -- Create a wall section.
      -- Currently hardcodes to use surface[1]. Very rarely do maps use multiple surfaces, but something to keep in mind.
      -- Must destroy existing wall first, otherwise create_entity fails and returns nil.
      wall.destroy()
      newWall = game.surfaces[1].create_entity{name = wallNames[walltier], position = pos, direction = dir, force = game.forces.player}
	  game.players[1].print("Updated a wall")
	  game.players[1].print(tostring(walltier))
	  -- Set the health of the new level wall.
      newWall.health = game.entity_prototypes[wallNames[walltier]].max_health * healthPercent
   end
   return newWall
end

function update_walls()
	game.players[1].print("Updating yer walls")
	game.players[1].print("Migration final - Global Wall Table:")
	game.players[1].print(tostring(global.alienwall))
   local newWalls = {}
   -- Replace each wall section (or gate) with one of the newer wall/gate level.
   for _, wall in pairs(global.alienwall) do
	   game.players[1].print("I'm a wall in the registry array!")
	   game.players[1].print(tostring(wall))
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

function update_current_tier(force)
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
    regenrate = global.alienregenrate
    walltier = global.alienwalltier
	game.players[1].print("Migration tech - Wall Tier:")
	game.players[1].print(tostring(walltier))
end

update_current_tier(game.forces["player"]) -- Workaround because `game.player` is undefined during migration step. Probably doesn't make a real difference anyway.
update_walls()
game.players[1].print("Migration finished?")

update_current_tier(game.forces["player"])
update_walls()