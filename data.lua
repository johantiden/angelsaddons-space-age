
local shallow = table.deepcopy(data.raw["tile"]["oil-ocean-shallow"]) 
shallow.fluid = "crude-oil"

local deep = table.deepcopy(data.raw["tile"]["oil-ocean-deep"]) 
deep.fluid = "crude-oil"

data:extend{shallow, deep}