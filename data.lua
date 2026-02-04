--INITIALIZE
angelsmods = angelsmods or {}


-- Change oil ocean tiles to crude-oil - Offshore pumps will use the "fluid" field.
data.raw["tile"]["oil-ocean-shallow"].fluid = "crude-oil"
data.raw["tile"]["oil-ocean-deep"].fluid = "crude-oil"

