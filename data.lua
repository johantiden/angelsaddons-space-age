--INITIALIZE
angelsmods = angelsmods or {}


-- Change oil ocean tiles to crude-oil - Offshore pumps will use the "fluid" field.
data.raw["tile"]["oil-ocean-shallow"].fluid = "crude-oil"
data.raw["tile"]["oil-ocean-deep"].fluid = "crude-oil"

-- Many Fulgora recipes require electronic-circuit but there is no way to get them on Fulgora. 
if mods["bobelectronics"] then
    local scrap_results = data.raw["recipe"]["scrap-recycling"].results
    table.insert(scrap_results,
        {type = "item", name = "electronic-circuit",        amount = 1, probability = 0.2, show_details_in_recipe_tooltip = false})
end
