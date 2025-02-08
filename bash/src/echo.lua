local args = {...}

local result = ""
for i = 1, #args do
    if i ~= 1 then
        result = result.." "
    end
    result = result..args[i]
end
result = result.."\n"

print(result)
