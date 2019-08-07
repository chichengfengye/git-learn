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

    ngx.log(strPrefix.."access executed...")
    ngx.log(strPrefix.."method="..conf.method)
    ngx.log(strPrefix.."headerName="..conf.header)
    ngx.log(strPrefix.."key="..conf.key)


    print(strPrefix.."access executed...")
    print(strPrefix.."method="..conf.method)
    print(strPrefix.."headerName="..conf.header)
    print(strPrefix.."key="..conf.key)

    local headers = kong.request.get_headers()
    
    ngx.log(requestPrint.."access executed...")
    ngx.log(requestPrint.."method="..kong.request.get_method())

    print(requestPrint.."access executed...")
    print(requestPrint.."method="..kong.request.get_method())


    for i, v in ipairs(headers) do
        ngx.log(requestPrint.."headerName="..i.." / headerValue="..v)
    end

    for i, v in ipairs(headers) do
        print(requestPrint.."headerName="..i.." / headerValue="..v)
    end

    if conf.intercepter then
        ngx.log("================> 拦截他  <===============")
    end

    --ngx.log(requestPrint.."key="..conf.key)
end

return MyHanlder



