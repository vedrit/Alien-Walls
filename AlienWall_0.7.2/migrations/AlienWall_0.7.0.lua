--require("variable")
--game.reload_script()
for index,force in pairs(game.forces) do
  if force.technologies["alien-hybridization-1"].researched then
    --force.technologies['alien-bioengineering'].researched = true
	force.recipes['alien-bioconstruct'].enabled = true
	end
	if force.technologies["alien-hybrid-upgrade-1"].researched then
        global.alienregenrate = 5
        global.alienwalltier = 2 --Not sure global will be available for migration
		global.alienTierUpdated = true --No idea if this'll work. Set a bool to trigger update_walls() after loading
        --update_walls() --Not sure this will work either
    end      
    if force.technologies["alien-hybrid-upgrade-2"].researched then
        global.alienregenrate = 10
        global.alienwalltier = 3
		global.alienTierUpdated = true
        --update_walls()
    end
    if force.technologies["alien-hybrid-upgrade-3"].researched then
        global.alienregenrate = 15
        global.alienwalltier = 4
		global.alienTierUpdated = true
        --update_walls()
    end
    if force.technologies["alien-hybrid-upgrade-4"].researched then
        global.alienregenrate = 25
        global.alienwalltier = 5
		global.alienTierUpdated = true
        --update_walls()
    end
end