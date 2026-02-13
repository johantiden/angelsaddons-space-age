--INITIALIZE
angelsmods = angelsmods or {}
local OV = angelsmods.functions.OV

-- Change oil ocean tiles to crude-oil - Offshore pumps will use the "fluid" field.
data.raw.tile["oil-ocean-shallow"].fluid = "crude-oil"
data.raw.tile["oil-ocean-deep"].fluid = "crude-oil"

-- Change sulfuric acid geyser to angels-liquid-sulfuric-acid
if mods["angelspetrochem"] then
    data.raw["resource"]["sulfuric-acid-geyser"]["minable"].results = {
    { type = "fluid", name = "angels-liquid-sulfuric-acid", amount_min = 10, amount_max = 10, probability = 1 },
    }
end

-- Many Fulgora recipes require electronic-circuit but there is no way to get them on Fulgora. 
if mods["bobelectronics"] then
    local scrap_results = data.raw["recipe"]["scrap-recycling"].results
    table.insert(scrap_results,
        {type = "item", name = "electronic-circuit",        amount = 1, probability = 0.2, show_details_in_recipe_tooltip = false})
end

-- merge carbon from space age into angels carbon, see also migrations
if mods["angelspetrochem"] then
  OV.global_replace_item("carbon", "angels-solid-carbon")
  data.raw.recipe["carbon"].icon = data.raw.recipe["angels-solid-carbon"].icon
end

-- space-age adds turbo-transport-belt, merge it with bob's version for interoperability, see also migrations
if mods["boblogistics"] then
  OV.global_replace_item("turbo-transport-belt", "bob-turbo-transport-belt")
end

if mods["angelspetrochem"] then
  OV.global_replace_item("sulfuric-acid", "angels-liquid-sulfuric-acid")
end

-- bobswarfare adds coal to the firearm-magazine recipe, but coal is not readily available in space. This adds another recipe for firearm-magazine that uses carbon instead of coal.
if mods["bobwarfare"] then
  local copy = table.deepcopy(data.raw["recipe"]["firearm-magazine"])
  copy.name = "firearm-magazine-carbon"
  copy.surface_conditions = {{
    property = "gravity",
    max = 0.1
  }}
  copy.ingredients = {
    {type = "item", name = "iron-plate", amount = 2},
    {type = "item", name = "carbon", amount = 1}
  }

  data:extend{copy}
end

OV.execute()