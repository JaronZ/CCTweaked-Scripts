local mod_file = {}

function mod_file.iterate_lines(file)
    return function() return file.readLine() end
end

return mod_file
