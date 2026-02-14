-- Settings.lua
local Config = {
   ["Byte_Shifting"] = {
      ["Enabled"] = true
   },
   ["Junk_Injection"] = {
      ["Amount"] = 80, -- Eats alot of register 
      ["Enabled"] = true
   },
   ["Anti_Tamper"] = {
      ["Enabled"] = true  -- NEW: Anti-tamper protection
   },
   ["Closure_Wrap"] = {
      ["Enabled"] = true
   }
}

function Config.set(n, p, v)
   if Config[n] then
      Config[n][p] = v
      return Config[n][p]
   end
end

function Config.get(n, p)
   if Config[n] then
      return Config[n][p]
   end
end

return Config
