local program_utils = require("lib/jaronz/program")

local __NAME = program_utils.getRunningProgramName()

local args = {...}

if #args == 0 then
    print(__NAME..": missing file operand")
    print("Try '"..__NAME.." --help' for more information")
    goto endProgram
end

for i = 1, #args do
    if not fs.exists(args[i]) then
        fs.open(args[i], "w").close()
    end
end

::endProgram::
