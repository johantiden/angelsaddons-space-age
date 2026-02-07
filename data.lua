--INITIALIZE
angelsmods = angelsmods or {}
local OV = angelsmods.functions.OV

-- Change oil ocean tiles to crude-oil - Offshore pumps will use the "fluid" field.
data.raw["tile"]["oil-ocean-shallow"].fluid = "crude-oil"
data.raw["tile"]["oil-ocean-deep"].fluid = "crude-oil"

-- Many Fulgora recipes require electronic-circuit but there is no way to get them on Fulgora. 
if mods["bobelectronics"] then
    local scrap_results = data.raw["recipe"]["scrap-recycling"].results
    table.insert(scrap_results,
        {type = "item", name = "electronic-circuit",        amount = 1, probability = 0.2, show_details_in_recipe_tooltip = false})
end

-- merge carbon from space age into angels carbon, see also migrations
OV.global_replace_item("carbon", "angels-solid-carbon")

-- space-age adds turbo-transport-belt, merge it with bob's version for interoperability, see also migrations
if mods["boblogistics"] then
  OV.global_replace_item("turbo-transport-belt", "bob-turbo-transport-belt")
end

OV.execute()