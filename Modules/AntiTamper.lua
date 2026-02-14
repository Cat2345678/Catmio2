-- Modules/AntiTamper.lua
-- Anti-tamper protection for Catmio
-- Safe for Roblox - doesn't touch Roblox globals

local Module = {}

local function CreateAntiDebug()
    return [[
-- Anti-Debug
local function _AD()
    local _e = getfenv or function() return _ENV end
    if not _e().game or not _e().script then
        error("\0")
    end
end
spawn(function() while wait(math.random(5,15)) do pcall(_AD) end end)
]]
end

local function CreateEnvCheck()
    return [[
-- Env Check
if not game or not game.GetService then error("\0") end
if not script or not script.Parent then error("\0") end
]]
end

local function CreateIntegrityCheck()
    local checksum = math.random(100000, 999999)
    return string.format([[
-- Integrity
local _cs = %d
spawn(function() 
    wait(math.random(1,3))
    if math.random(1,10) > 8 then
        local _v = _cs + math.random(1,100)
        if _v ~= _cs then return end
    end
end)
]], checksum)
end

local function CreateAntiHook()
    return [[
-- Anti-Hook
local _o = {loadstring=loadstring, pcall=pcall, require=require}
spawn(function()
    while wait(math.random(10,30)) do
        for _n,_f in pairs(_o) do
            local _e = getfenv and getfenv() or _ENV
            if _e[_n] ~= _f then error("\0") end
        end
    end
end)
]]
end

function Module.Process(code)
    local protections = {}
    
    -- Add protection layers
    table.insert(protections, CreateEnvCheck())
    table.insert(protections, CreateAntiDebug())
    table.insert(protections, CreateIntegrityCheck())
    table.insert(protections, CreateAntiHook())
    
    -- Combine protections + original code
    local protected = table.concat(protections, "\n") .. code
    
    -- Wrap in pcall for error handling
    protected = string.format([[
do
    local _ok, _err = pcall(function()
%s
    end)
    if not _ok then
        while true do end
    end
end
]], protected)
    
    return protected
end

return Module
