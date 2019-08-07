---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by root.
--- DateTime: 8/6/19 9:30 AM
---

local BasePlugin = require("kong.plugins.base_plugin")


local MyHanlder = BasePlugin:extend()

local log = kong.log
local strPrefix = "===========> config: "
local requestPrint = "===========> req: "

MyHanlder.VERSION = "1.0.0"
MyHanlder.PRIORITY = 14

function MyHanlder:new()
    MyHanlder.super.new(self, "test")
end

function MyHanlder:access(conf)
    MyHanlder.super.access(self)

    log.info(strPrefix.."access executed...")
    log.info(strPrefix.."method="..conf.method)
    log.info(strPrefix.."headerName="..conf.header)
    log.info(strPrefix.."key="..conf.key)

    local headers = kong.request.get_headers()
    
    log.info(requestPrint.."access executed...")
    log.info(requestPrint.."method="..kong.request.get_method())


    for i, v in ipairs(headers) do
        log.info(requestPrint.."headerName="..i.." / headerValue="..v)
    end

    if conf.intercepter then
        log.info("================> 拦截他  <===============")
    end

    --log.info(requestPrint.."key="..conf.key)
end

return MyHanlder



