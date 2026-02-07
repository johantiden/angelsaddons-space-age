
-- BALANCING
-- Space age makes rocket-part(s) are way cheaper than vanilla rockets. The goal of the game is no longer to launch a single rocket, but very very many.
-- In the same vein, adding space age to Bob/Angels should make rockets cheaper again, even if bobrevamp and angelspetrochem makes them more expensive.
-- We halve the ingredients needed for rocket parts. low-density-structure and rocket-fuel are already at 1, so we just halve the ingredients of them in turn.
if mods["bobrevamp"] then
    if data.raw.item["bob-tungsten-pipe"] then
        bobmods.lib.recipe.set_ingredient("rocket-part", { type = "item", name = "bob-tungsten-pipe", amount = 15 })
    end
    bobmods.lib.recipe.set_ingredient("rocket-part", { type = "item", name = "bob-heat-shield-tile", amount = 5 })

    if data.raw.item["bob-titanium-plate"] then
        bobmods.lib.recipe.set_ingredient("low-density-structure", { type = "item", name = "bob-titanium-plate", amount = 10 })
    else
        bobmods.lib.recipe.set_ingredient("low-density-structure", { type = "item", name = "steel-plate", amount = 10 })
    end
    if data.raw.item["bob-aluminium-plate"] then
        bobmods.lib.recipe.set_ingredient("low-density-structure", { type = "item", name = "bob-aluminium-plate", amount = 1 })
    else
        bobmods.lib.recipe.set_ingredient("low-density-structure", { type = "item", name = "copper-plate", amount = 1 })
    end
    bobmods.lib.recipe.set_ingredient("low-density-structure", { type = "item", name = "plastic-bar", amount = 1 })
end

if mods["angelspetrochem"] then
    if data.raw.item["angels-rocket-fuel-capsule"] then
        bobmods.lib.recipe.set_ingredient("rocket-fuel", { type = "item", name = "angels-rocket-fuel-capsule", amount = 5 })
    end
    if data.raw.item["angels-rocket-oxidizer-capsule"] then
        bobmods.lib.recipe.set_ingredient("rocket-fuel", { type = "item", name = "angels-rocket-oxidizer-capsule", amount = 5 })
    end
    -- Conservation of energy: Rocket fuel is now 50MJ, down from 100MJ, to reflect the halving of the ingredients.
    data.raw.item["rocket-fuel"].fuel_value = "50MJ"
else
    -- TODO: We currently depend on angelspetrochem so this shouldn't occur, but if we ever make angelspetrochem optional, we should halve the ingredients of rocket-fuel here as well.
end