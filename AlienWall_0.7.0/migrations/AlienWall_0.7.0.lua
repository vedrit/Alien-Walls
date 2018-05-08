for _,force in pairs(game.forces) do
  if force.technologies["alien-hybrid-upgrade-4"].researched then
    force.technologies["alien-hybrid-upgrade-4"].researched = false
	-- If they maxed out their hybrid upgrade tech, roll it back by one so they can re-research it and trigger the tier update.
  end
end