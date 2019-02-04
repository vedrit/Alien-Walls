--require("variable")
--game.reload_script()
global.tierUpdated = false
for index,force in pairs(game.forces) do
  if force.technologies["alien-hybridization-1"].researched then
    --force.technologies['alien-bioengineering'].researched = true
	force.recipes['alien-bioconstruct'].enabled = true
	end
	if force.technologies["alien-hybrid-upgrade-1"].researched then
        global.alienregenrate = 5
        global.alienwalltier = 2 --Not sure global will be available for migration
		global.tierUpdated = true
    end      
    if force.technologies["alien-hybrid-upgrade-2"].researched then
        global.alienregenrate = 10
        global.alienwalltier = 3
		global.tierUpdated = true
    end
    if force.technologies["alien-hybrid-upgrade-3"].researched then
        global.alienregenrate = 15
        global.alienwalltier = 4
		global.tierUpdated = true
    end
    if force.technologies["alien-hybrid-upgrade-4"].researched then
        global.alienregenrate = 25
        global.alienwalltier = 5
		global.tierUpdated = true
    end
	game.print("Forcing update on walls. " .. tostring(global.tierUpdated) .. tostring(global.alienwalltier))
end