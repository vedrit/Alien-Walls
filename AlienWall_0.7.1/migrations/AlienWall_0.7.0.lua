--require("variable")
--game.reload_script()
for index,force in pairs(game.forces) do
  if force.technologies["alien-hybridization-1"].researched then
    --force.technologies['alien-bioengineering'].researched = true
	force.recipes['alien-bioconstruct'].enabled = true
	end
	if force.technologies["alien-hybrid-upgrade-1"].researched then
        HybridRegen = 5
        HybridTier = 2 --Not sure global will be available for migration
        update_walls() --Not sure this will work either
    end      
    if force.technologies["alien-hybrid-upgrade-2"].researched then
        HybridRegen = 10
        HybridTier = 3
        update_walls()
    end
    if force.technologies["alien-hybrid-upgrade-3"].researched then
        HybridRegen = 15
        HybridTier = 4
        update_walls()
    end
    if force.technologies["alien-hybrid-upgrade-4"].researched then
        HybridRegen = 25
        HybridTier = 5
        update_walls()
    end
end