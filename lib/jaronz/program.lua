local mod_program = {}

function mod_program.getRunningProgramName()
  local program = shell.getRunningProgram()
  program = program:match"([^\.]*)\.(.*)"
  return program
end

return mod_program
