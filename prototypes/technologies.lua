data:extend(
{
  {
    type = 'technology',
    name='alien-bioengineering',
	localised_name='Alien Bio Engineering',
    icon = '__AlienWall__/graphics/icons/alien-bioconstruct.png',
	icon_size = 32,
    effects = {{type = 'unlock-recipe', recipe='alien-bioconstruct'}},
    unit =
	{
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 15
    },
    order='a-e-a',
  },
  {
    type = "technology",
    name="alien-hybridization-1",
	localised_name='Alien Wall Hybridization',
	localised_description='Hybrid Wall that regenerates HP. Basic rate is 2 HP per second. Do research for higher regeneration rates.',
    icon = '__AlienWall__/graphics/icons/stone-walls.png',
	icon_size = 128,
    effects = {{type = "unlock-recipe", recipe="hybridized-wall"}},
    prerequisites = {"stone-wall", 'alien-bioengineering', "military-science-pack"},
	unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"military-science-pack", 1},
      },
      time = 30
    },
    order="a-e-b",
  },
  {
    type = "technology",
    name="alien-hybridization-2",
	localised_name='Alien Gate Hybridization',
	localised_description='Hybrid Gate that regenerates HP. Basic rate is 2 HP per second. Do research for higher regeneration rates.',
    icon = '__AlienWall__/graphics/icons/gates.png',
	icon_size = 128,
    effects = {{type = "unlock-recipe", recipe="hybridized-gate"}},
    prerequisites = {"alien-hybridization-1", "gate"},
	unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 2},
		{"military-science-pack", 2},
      },
      time = 60
    },
    order="a-e-c",
  },
  -- Kinda tempted to rebalance some of these costs, but I'll leave it alone for now.
  {
    type = "technology",
    name="alien-hybrid-upgrade-1",
	localised_name='Alien Hybrid Upgrade 1',
	localised_description='Research genetic improvements to the biomass used. Increases the strength and regenerative abilities of Hybrid structures.',
    icon = '__AlienWall__/graphics/icons/stone-walls-plus.png',
	icon_size = 128,
	effects = {},
    prerequisites = {"alien-hybridization-1", "chemical-science-pack"},
	unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 2},
		{"chemical-science-pack", 1},
		{"military-science-pack", 2},
      },
      time = 20
    },
    order="a-f-a",
	upgrade = "true",
  },
  {
    type = "technology",
    name="alien-hybrid-upgrade-2",
	localised_name='Alien Hybrid Upgrade 2',
	localised_description='Research genetic improvements to the biomass used. Further increases the strength and regenerative abilities of Hybrid structures.',
    icon = '__AlienWall__/graphics/icons/stone-walls-plus.png',
	icon_size = 128,
	effects = {},
    prerequisites = {"alien-hybrid-upgrade-1"},
	unit =
    {
      count = 400,
      ingredients =
      {
        {"automation-science-pack", 2},
        {"chemical-science-pack", 2},
		{"military-science-pack", 2},
      },
      time = 30
    },
    order="a-f-b",
	upgrade = "true",
  },
  {
    type = "technology",
    name="alien-hybrid-upgrade-3",
	localised_name='Alien Hybrid Upgrade 3',
	localised_description='Research genetic improvements to the biomass used. Further increases the strength and regenerative abilities of Hybrid structures.',
    icon = '__AlienWall__/graphics/icons/stone-walls-plus.png',
	icon_size = 128,
	effects = {},
    prerequisites = {"alien-hybrid-upgrade-2", "production-science-pack"},
	unit =
    {
      count = 400,
      ingredients =
      {
        {"automation-science-pack", 2},
        {"production-science-pack", 2},
		{"military-science-pack", 2},
		{"chemical-science-pack", 2},
		      },
      time = 60
    },
    order="a-f-c",
	upgrade = "true",
  },
  {
    type = "technology",
    name="alien-hybrid-upgrade-4",
	localised_name='Alien Hybrid Upgrade 4',
	localised_description='Research genetic improvements to the biomass used. Further increases the strength and regenerative abilities of Hybrid structures.',
    icon = '__AlienWall__/graphics/icons/stone-walls-plus.png',
	icon_size = 128,
	effects = {},
    prerequisites = {"alien-hybrid-upgrade-3"},
	unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 2},
		{"military-science-pack", 2},
		{"chemical-science-pack", 2},
		{"production-science-pack", 2},
		      },
      time = 60
    },
    order="a-f-d",
	upgrade = "true",
  },
  {
    type = "technology",
    name="alien-hybrid-upgrade-5",
	localised_name='Alien Hybrid Upgrade 5',
	localised_description='Research genetic improvements to the biomass used. Further increases the strength and regenerative abilities of Hybrid structures.',
    icon = '__AlienWall__/graphics/icons/stone-walls-plus.png',
	icon_size = 128,
	effects = {},
    prerequisites = {"alien-hybrid-upgrade-4", "space-science-pack"},
	unit =
    {
      count = 750,
      ingredients =
      {
        {"automation-science-pack", 2},
        {"space-science-pack", 2},
		{"military-science-pack", 2},
		{"chemical-science-pack", 2},
		{"production-science-pack", 2},
		      },
      time = 60
    },
    order="a-f-d",
	upgrade = "true",
  },
  {
    type = "technology",
    name="alien-hybrid-upgrade-6",
	localised_name='Alien Hybrid Upgrade 6',
	localised_description='Research genetic improvements to the biomass used. Further increases the strength and regenerative abilities of Hybrid structures.',
    icon = '__AlienWall__/graphics/icons/stone-walls-plus.png',
	icon_size = 128,
	effects = {},
    prerequisites = {"alien-hybrid-upgrade-5"},
	unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 2},
        {"space-science-pack", 2},
		{"military-science-pack", 2},
		{"chemical-science-pack", 2},
		{"production-science-pack", 2},
		      },
      time = 60
    },
    order="a-f-d",
	upgrade = "true",
  }
})
