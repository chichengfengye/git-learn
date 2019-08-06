local constants = require "kong.constants"


local kong = kong
local type = type


local _realm = 'Key realm="' .. _KONG._NAME .. '"'


local TdtAuthHandler = {}


TdtAuthHandler.PRIORITY = 1009
TdtAuthHandler.VERSION = "1.0.0"


function TdtAuthHandler:access(conf)
    ngx.log(ngx.ERR, "execute plugin : [", self._name, "] access()...")
end


return TdtAuthHandler