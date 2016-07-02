data:extend(
{
  {
    type = 'technology',
    name='alien-bioengineering',
    icon = '__AlienWall__/graphics/icons/biomass/alien-bioconstruct.png',
    effects = {{type = 'unlock-recipe', recipe='alien-bioconstruct'}},
    prerequisites = {},
    unit =
	{
      count = 4,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order='a-e-a',
  },
  {
    type = "technology",
    name="alien-hybridization1",
    icon = "__AlienWall__/graphics/icons/wall/hybrid-wall.png",
    effects = {{type = "unlock-recipe", recipe="hybridized-wall"}},
    prerequisites = {"stone-walls", 'alien-bioengineering'},
	unit =
    {
      count = 5,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order="a-e-b",
  },
  {
    type = "technology",
    name="alien-hybridization2",
    icon = "__AlienWall__/graphics/icons/gate/hybrid-gate.png",
    effects = {{type = "unlock-recipe", recipe="hybridized-gate"}},
    prerequisites = {"alien-hybridization1", "gates"},
	unit =
    {
      count = 5,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 2}
      },
      time = 15
    },
    order="a-e-c",
  },
  {
    type = "technology",
    name="alien-hybrid-upgrade-1",
    icon = "__AlienWall__/graphics/icons/wall/hybrid-wall.png",
    prerequisites = {"alien-hybridization2"},
	unit =
    {
      count = 10,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 2}
      },
      time = 20
    },
    order="a-f-a",
  },
  {
    type = "technology",
    name="alien-hybrid-upgrade-2",
    icon = "__AlienWall__/graphics/icons/wall/hybrid-wall.png",
    prerequisites = {"alien-hybrid-upgrade-1"},
	unit =
    {
      count = 10,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 2},
		{"science-pack-3", 1}
      },
      time = 25
    },
    order="a-f-b",
	upgrade = "true",
  },
  {
    type = "technology",
    name="alien-hybrid-upgrade-3",
    icon = "__AlienWall__/graphics/icons/wall/hybrid-wall.png",
    prerequisites = {"alien-hybrid-upgrade-2"},
	unit =
    {
      count = 10,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 3},
		{"science-pack-3", 2},
		{"alien-science-pack", 1}
      },
      time = 30
    },
    order="a-f-c",
	upgrade = "true",
  },
  {
    type = "technology",
    name="alien-hybrid-upgrade-4",
    icon = "__AlienWall__/graphics/icons/wall/hybrid-wall.png",
    prerequisites = {"alien-hybrid-upgrade-3"},
	unit =
    {
      count = 10,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 3},
		{"science-pack-3", 2},
		{"alien-science-pack", 2}
      },
      time = 35
    },
    order="a-f-d",
	upgrade = "true",
  }
})