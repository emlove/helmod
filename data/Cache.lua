---
-- Description of the module.
-- @module Cache
--
local Cache = {
  -- single-line comment
  classname = "HMCache"
}

local data = {}

-------------------------------------------------------------------------------
-- Return data Cache
--
-- @function [parent=#Cache] getData
--
-- @param #string classname
-- @param #string name
--
-- @return #table
--
function Cache.getData(classname, name)
  Logging:debug(Cache.classname, "getData(classname, name)",classname, name)
  if classname == nil and name == nil then return data end
  if data[classname] == nil or data[classname][name] == nil then return nil end
  Logging:debug(Cache.classname, "--> cache",data[classname][name])
  return data[classname][name]
end

-------------------------------------------------------------------------------
-- Set data Cache
--
-- @function [parent=#Cache] setData
--
-- @param #string classname
-- @param #string name
-- @param #object value
--
-- @return #object
--
function Cache.setData(classname, name, value)
  Logging:debug(Cache.classname, "setData(classname, name, value)",classname, name, value)
  if data[classname] == nil then data[classname] = {} end
  data[classname][name] = value
end

-------------------------------------------------------------------------------
-- Has data
--
-- @function [parent=#Cache] hasData
--
-- @param #string classname
-- @param #string name
--
-- @return #boolean
--
function Cache.hasData(classname, name)
  Logging:debug(Cache.classname, "getData(hasData, name)",classname, name)
  return data[classname] ~= nil and data[classname][name] == nil
end

-------------------------------------------------------------------------------
-- Reset data
--
-- @function [parent=#Cache] reset
--
-- @param #string classname
-- @param #string name
-- 
function Cache.reset(classname, name)
  Logging:debug(Cache.classname, "reset(classname, name)", classname, name)
  if classname == nil and name == nil then
    data = {}
  elseif data[classname] ~= nil and name == nil then
    data[classname] = nil
  elseif data[classname] ~= nil then
    data[classname][name] = nil
  end
end

return Cache