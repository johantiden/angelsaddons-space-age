local OV = angelsmods.functions.OV
local move_item = angelsmods.functions.move_item

OV.global_replace_item("carbon", "angels-solid-carbon")

if mods["loader_mini_1x1"] and mods["boblogistics"] then
  OV.global_replace_item("turbo-transport-belt", "bob-turbo-transport-belt")
end

OV.execute()