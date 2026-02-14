-- // Our Config \\ --
local Config = require("Settings")

local StringToSequence = require("Modules.StringToSequence")
local Watermark = require("Modules.Watermark")
local Junk = require("Modules.Junk")
local CLI = require("Modules.CLI")

local Pipeline = {}

function Pipeline.Process(code)
  local obfuscated = ""
  
   if Config.get("Byte_Shifting", "Enabled") then
     obfuscated = StringToSequence.Process(code)
     else
       print("Please Enable ByteShifting") -- yeah idk
       return
   end
   
   if  Config.get("Junk_Injection", "Enabled") then
        obfuscated = Junk.Process(obfuscated, Config.get("Junk_Injection", "Amount"))
   end
  
  if Config.get("Closure_Wrap", "Enabled") then
        obfuscated = CLI.Process(obfuscated)
  end
  
  return Watermark.Process() .. obfuscated
end

return Pipeline
