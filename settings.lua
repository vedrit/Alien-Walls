data:extend({
	{
		type = "int-setting",
		name = "biomass-min",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 1,
		order = "0"
	},
	{
		type = "int-setting",
		name = "biomass-max",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 4,
		order = "1"
	},
	{
		type = "double-setting",
		name = "biomass-min-scale",
		setting_type = "startup",
		minimum_value = 1,
		maximum_value = 4,
		default_value = 1.5,
		order = "2"
	},
	{
		type = "double-setting",
		name = "biomass-max-scale",
		setting_type = "startup",
		minimum_value = 1,
		maximum_value = 4,
		default_value = 1.5,
		order = "3"
	},
	{
		type = "double-setting",
		name = "biomass-structure-bonus",
		setting_type = "startup",
		minimum_value = 1,
		maximum_value = 8,
		default_value = 2,
		order = "4"
	}
})