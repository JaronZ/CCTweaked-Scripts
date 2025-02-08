local program_utils = require("lib/jaronz/program")
local file_utils = require("lib/jaronz/file")

local __NAME = program_utils.getRunningProgramName()

local args = {...}

if #args == 0 then
    while true do
        print(read())
    end
end

for i = 1, #args do
    if not fs.exists(args[i]) then
        print(__NAME..": "..args[i]..": No such file or directory")
    elseif fs.isDir(args[i]) then
        print(__NAME..": "..args[i]..": Is a directory")
    else
        local file = fs.open(args[i], "r")
        for line in file_utils.iterate_lines(file) do
            print(line)
        end
        file.close()
    end
end
