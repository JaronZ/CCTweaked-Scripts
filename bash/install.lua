local repoURL = "https://raw.githubusercontent.com/JaronZ/CCTweaked-Scripts/main/"
local libLoc = "lib/jaronz/"
local libRoot = repoURL..libLoc
local programRoot = repoURL.."bash/src/"

local libFiles = {"program.lua", "file.lua"}
local programFiles = {"cat.lua", "touch.lua", "echo.lua"}

fs.makeDir(libLoc)

for i = 1, #libFiles do
    local fileName = libFiles[i]

    -- Remove if already exists, so it can be replaced with a possible newer version
    if fs.exists(libLoc..fileName) then
		print("Updating '"..libLoc..fileName.."'...")
        fs.delete(libLoc..fileName)
    end

    local libURL = libRoot..fileName
    local libFile = http.get(libURL).readAll()

    local file = fs.open(libLoc..fileName, "w")
	file.write(libFile)
	file.close()
end

for i = 1, #programFiles do
    local fileName = programFiles[i]

    if fs.exists(fileName) then
        print("warning: program '"..fileName.."' already exists")
        print("do you want to overwrite this file? (Y/N)")
        local answer = read()
        if answer ~= "y" and answer ~= "Y" then
            goto endDownload
        end
		print("overwriting program '"..fileName.."'...")
        fs.delete(fileName)
    end

    local programURL = programRoot..fileName
    local programFile = http.get(programURL).readAll()

    local file = fs.open(fileName, "w")
	file.write(programFile)
	file.close()

    ::endDownload::
end
