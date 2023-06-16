local serpent = require("serpent")

function transform(item)
    return {
        label = item.label,
        weight = item.weight,
        stack = not item.unique,
    }
end
--have a file structured like this and nothing else https://i.imgur.com/eTFekcY.png and it will work.
-- e.g. for dofile "C:\\Users\\User\\Downloads\\convert\\old\\old_file.lua"
-- it can be whatever dir you want it in.
dofile("where ever the old file formatted as above is")

for k, v in pairs(ItemList) do
    ItemList[k] = transform(v)
end

local function serialize(t)
    local kv = {}
    for k,v in pairs(t) do
        if type(v) == "string" then
            v = "'" .. v .. "'"
        elseif type(v) == "boolean" then
            v = tostring(v)
        end
        table.insert(kv, k .. " = " .. v)
    end
    return "{ " .. table.concat(kv, ", ") .. " }"
end

--format this io.open the same as the dofile
local file = io.open("where ever the new file is - make sure its empty - you can copy it over to ox items.lua", "w")

file:write("ItemList = {\n")
for k, v in pairs(ItemList) do
    file:write("['" .. k .. "'] = " .. serialize(v) .. ",\n")
end
file:write("}\n")
file:close()