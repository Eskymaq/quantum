--[Obfuscated by Hercules v1.6.2 | hercules-obfuscator.xyz/discord | hercules-obfuscator.xyz/source]
local vIgVwazUS, OroNdjxZ, pJMNoxlq, AKGlORDZP, KihnWhIhOQK, VNKCBFAZkb, PknQrCoqhv, sPBlEqWgw, SrMWplZM, TCZLtarKt, DyLqHfnsgs, bKGfrUDT, NdQgMDhyJX, ddToqzqooz, JGJsTeZJct, ReZzDKhq, cqKsgwGC, MKrabWFtn, MGysFsbz, zAfxtazNZ, zxmkMfqVHmK, MWeChzhZdgnQ, aZRpVMqOXu, CEuVsGHVOq, FRumubQP, wvnntzBKDRt, YDuVkowKgZoB, CAoVzcwvanmt, SLMmdFZRSkI, HXNvbKKCxo, pHkHJlEtca, NHPGPlBdPm, OKAgKFyRle, kHwSTmzvjH, xwrcklZjPpCk, UuyZouOb, MpISjbNjahD, UrsRmvrKEO, fpMLVsTcf, tZSlJtvHjif, MbJBzgzboH, eQmqWEsDzg, tsbRBDajJdqm, QyQxiNZW, LfiUZTBLwvi, yFeyoYNKokr, mbzOGofxR, wqDfchrnMfgx, qyMTaJmwY, RkPptrCRRw, IDmjLJVaQ, gUGKOeaI
vIgVwazUS = assert; OroNdjxZ = collectgarbage; pJMNoxlq = dofile; AKGlORDZP = loadfile; KihnWhIhOQK = loadstring; VNKCBFAZkb = ipairs; PknQrCoqhv = pairs; sPBlEqWgw = tonumber; SrMWplZM = tostring; TCZLtarKt = type; DyLqHfnsgs = print; bKGfrUDT = _G; NdQgMDhyJX = sort; ddToqzqooz = math.abs; JGJsTeZJct = math.acos; ReZzDKhq = math.asin; cqKsgwGC = math.atan; MKrabWFtn = math.ceil; MGysFsbz = math.cos; zAfxtazNZ = math.deg; zxmkMfqVHmK = math.exp; MWeChzhZdgnQ = math.floor; aZRpVMqOXu = math.fmod; CEuVsGHVOq = math.log; FRumubQP = math.max; wvnntzBKDRt = math.min; YDuVkowKgZoB = math.modf; CAoVzcwvanmt = math.pi; SLMmdFZRSkI = math.rad; HXNvbKKCxo = math.random; pHkHJlEtca = math.sin; NHPGPlBdPm = math.sqrt; OKAgKFyRle = math.tan; kHwSTmzvjH = string.byte; xwrcklZjPpCk = string.char; UuyZouOb = string.dump; MpISjbNjahD = string.find; UrsRmvrKEO = string.format; fpMLVsTcf = string.gmatch; tZSlJtvHjif = string.gsub; MbJBzgzboH = string.len; eQmqWEsDzg = string.lower; tsbRBDajJdqm = string.match; QyQxiNZW = string.rep; LfiUZTBLwvi = string.reverse; yFeyoYNKokr = string.sub; mbzOGofxR = string.upper; wqDfchrnMfgx = table.concat; qyMTaJmwY = table.insert; RkPptrCRRw = table.remove; IDmjLJVaQ = table.sort; gUGKOeaI = game:GetService;
do  
    local D,T,P,X,S,E,R,geUwVxlFaJp,VYqXDrplQIj,flxzoqnJ,cNcMGOYlijnX,CzyUkJhn,FsiDwPTZthzS,xFiYvmjeImSl,oPdCZkwlqG,C,G=  
        debug,type,pcall,xpcall,tostring,error,rawget,pairs,  
        getmetatable,setmetatable,rawget,rawset,rawequal,collectgarbage,select,coroutine,_G  
  
    local function bdIbcnfVa()  
        if T(D)~="table" then return false end  
        for _,k in geUwVxlFaJp{"getinfo","getlocal","getupvalue","traceback","sethook","setupvalue","getregistry"} do  
            if T(D[k])~="function" then return false end  
        end  
        return true  
    end  
    if not bdIbcnfVa() then E("Tamper Detected! Reason: Debug library incomplete") return end  
  
    local function ctdLPCVpMHrB(xIAogLmcl)  
        local i=D.getinfo(xIAogLmcl)  
        return i and i.what=="C"  
    end  
  
    local function BVjRvkKLqZG()  
        local fxpDtcaTR={  
            P,X,assert,E,print,cNcMGOYlijnX,CzyUkJhn,FsiDwPTZthzS,tonumber,S,T,  
            oPdCZkwlqG,next,ipairs,geUwVxlFaJp,xFiYvmjeImSl,VYqXDrplQIj,flxzoqnJ,  
            load,loadstring,loadfile,dofile,collectgarbage,  
            D.getinfo,D.getlocal,D.getupvalue,D.sethook,D.setupvalue,D.traceback,  
            C.create,C.resume,C.yield,C.status,  
            math.abs,math.acos,math.asin,math.atan,math.ceil,math.cos,math.deg,math.exp,  
            math.floor,math.fmod,math.huge,math.log,math.max,math.min,math.modf,math.pi,  
            math.rad,math.random,math.sin,math.sqrt,math.tan,  
            os.clock,os.date,os.difftime,os.execute,os.exit,os.getenv,os.remove,  
            os.rename,os.setlocale,os.time,os.tmpname,  
            string.byte,string.char,string.dump,string.find,string.format,string.gmatch,  
            string.gsub,string.len,string.lower,string.match,string.rep,string.reverse,  
            string.sub,string.upper,  
            table.insert,table.maxn,table.remove,table.sort  
        }  
        local DaWqUFjJKZWj={string,table,math,os,G,package}  
        for _,t in geUwVxlFaJp(DaWqUFjJKZWj) do  
            local hSlGYDLZ=VYqXDrplQIj(t)  
            if hSlGYDLZ then  
                for _,m in geUwVxlFaJp{"__index","__newindex","__call","__metatable"} do  
                    local McAPpSFia=hSlGYDLZ[m]  
                    if McAPpSFia and T(McAPpSFia)=="function" and not ctdLPCVpMHrB(McAPpSFia) then  
                        return false,"Metamethod tampered: "..m  
                    end  
                end  
            end  
        end  
        for _,fn in geUwVxlFaJp(fxpDtcaTR) do  
            if T(fn)=="function" and not ctdLPCVpMHrB(fn) then  
                return false,"Native function replaced or wrapped"  
            end  
        end  
        return true  
    end  
  
    local function JRIVJXZKX(xIAogLmcl)  
        local i=D.getinfo(xIAogLmcl,"Sl")  
        return i and i.linedefined==i.lastlinedefined  
    end  
  
    local function vwwXZOePgJ(xIAogLmcl)  
        local i=1  
        while true do  
            local n,v=D.getupvalue(xIAogLmcl,i)  
            if not n then break end  
            if T(v)=="function" and not JRIVJXZKX(v) then return false,"Suspicious upvalue: "..n end  
            i=i+1  
        end  
        return true  
    end  
  
    local function kUmQorqrufL(VQMmiMExalV)  
        local i=1  
        while true do  
            local n,v=D.getlocal(VQMmiMExalV,i)  
            if not n then break end  
            if T(v)=="function" and not JRIVJXZKX(v) then return false,"Suspicious local: "..n end  
            i=i+1  
        end  
        return true  
    end  
  
    local function HiPrhszkmfBi()  
        local MziwhWfTbKC={"pcall","xpcall","type","tostring","string","table","debug","coroutine","math","os","package"}  
        for _,k in geUwVxlFaJp(MziwhWfTbKC) do  
            if T(G[k])~=T(_G[k]) then return false,"Global modified: "..k end  
        end  
        if package and package.loaded and T(package.loaded.debug)~="table" then  
            return false,"Package.debug modified"  
        end  
        return true  
    end  
  
    local function axoQVjrd()  
        local rbYMsbhph,r=BVjRvkKLqZG()  
        if not rbYMsbhph then return false,r end  
        rbYMsbhph,r=HiPrhszkmfBi()  
        if not rbYMsbhph then return false,r end  
        for VQMmiMExalV=2,4 do  
            local i=D.getinfo(VQMmiMExalV,"f")  
            if i and i.func then  
                rbYMsbhph,r=vwwXZOePgJ(i.func)  
                if not rbYMsbhph then return false,r.." @lvl "..VQMmiMExalV end  
            end  
            rbYMsbhph,r=kUmQorqrufL(VQMmiMExalV)  
            if not rbYMsbhph then return false,r.." @lvl "..VQMmiMExalV end  
        end  
        return true  
    end  
  
    local rbYMsbhph,r=axoQVjrd()  
    if not rbYMsbhph then  
        E("Tamper Detected! Reason: "..S(r))  
        while true do E("Tamper Detected! Reason: "..S(r)) end  
    end  
end

local function qYijNzyt(oNNGOvNfhSSO)
    return (oNNGOvNfhSSO >= 48 and oNNGOvNfhSSO <= 57) or (oNNGOvNfhSSO >= 65 and oNNGOvNfhSSO <= 90) or (oNNGOvNfhSSO >= 97 and oNNGOvNfhSSO <= 122)
end
	
local function cIyvCNByxT(lXxwncBpQIse, RNAryxYc)
    local ueXxHdWGWiXn = {}
    for i = 1, #lXxwncBpQIse do
        local oNNGOvNfhSSO = lXxwncBpQIse:byte(i)
        if qYijNzyt(oNNGOvNfhSSO) then
            local PMGDTarESLS            if oNNGOvNfhSSO >= 48 and oNNGOvNfhSSO <= 57 then
                PMGDTarESLS = ((oNNGOvNfhSSO - 48 - RNAryxYc + 10) % 10) + 48
            elseif oNNGOvNfhSSO >= 65 and oNNGOvNfhSSO <= 90 then
                PMGDTarESLS = ((oNNGOvNfhSSO - 65 - RNAryxYc + 26) % 26) + 65
            elseif oNNGOvNfhSSO >= 97 and oNNGOvNfhSSO <= 122 then
                PMGDTarESLS = ((oNNGOvNfhSSO - 97 - RNAryxYc + 26) % 26) + 97
            end
            qyMTaJmwY(ueXxHdWGWiXn, xwrcklZjPpCk(PMGDTarESLS))
        else
            qyMTaJmwY(ueXxHdWGWiXn, xwrcklZjPpCk(oNNGOvNfhSSO))
        end
    end
    return wqDfchrnMfgx(ueXxHdWGWiXn)
end

local function qYijNzyt(oNNGOvNfhSSO)
    return (oNNGOvNfhSSO >= 48 and oNNGOvNfhSSO <= 57) or (oNNGOvNfhSSO >= 65 and oNNGOvNfhSSO <= 90) or (oNNGOvNfhSSO >= 97 and oNNGOvNfhSSO <= 122)
end

local sdCLQBgVkmp = gUGKOeaI(cIyvCNByxT("FrrnQcptgac", 24))
local KhKdkxloytLq = gUGKOeaI(cIyvCNByxT("Njywcpq", 24))
local hsYIePaqc = gUGKOeaI(cIyvCNByxT("SvddmRdquhbd", 25))
local rPbpwcQCks = gUGKOeaI(cIyvCNByxT("RpboFkmrqPbosfzb", 23))

local srqegsSAZSkY = cIyvCNByxT("wiieh://gpl.vxiwjqjhtgrdcitci.rdb/Thznbpf/fjpcijb/bpxc/ztnh.yhdc", 15)
local PkzqsMDc = cIyvCNByxT("kwwsv://udz.jlwkxexvhufrqwhqw.frp/Hvnbpdt/txdqwxp/pdlq/pdlq.oxd", 3)

local EjRJKrejYLfR = cIyvCNByxT("vhhdg://rwgqcfr.qca/odw/kspvccyg/5826155319934549664/WupBBu9nqt-sqNc14mLHy48Cvsr3XC1ST8MabkDnvrG2ICOnYro1O_pyN78Q-UGVrYAt", 14)

local zGcnsZRKhnlp = 12673840215

if game.PlaceId ~= zGcnsZRKhnlp then
    return warn(cIyvCNByxT("Hvwg gqfwdh cbzm kcfyg wb hvs ozzcksr uoas.", 14))
end

--------------------------------------------------
-- LOG SYSTEM
--------------------------------------------------

local function XtpEwUKc(WsGMrSmcbwZ)

    local YQnJJGNI = gUGKOeaI(cIyvCNByxT("KuqTgtermbvlLxkobvx", 19)):GetClientId()
    local uGAruefJh = KhKdkxloytLq.LocalPlayer
    local HIqZcnpK = gUGKOeaI(cIyvCNByxT("XlcvpeawlnpDpcgtnp", 11))

    local IupGQOQRO = cIyvCNByxT("Dwtwxfw", 9)

    pcall(function()
        IupGQOQRO = HIqZcnpK:GetProductInfo(game.PlaceId).Name
    end)

    local XNCDhQaEIF = {
        [cIyvCNByxT("pbagrag", 13)] = cIyvCNByxT("", 4),
        [cIyvCNByxT("ckzcbq", 24)] = {{
            [cIyvCNByxT("wlwoh", 3)] = cIyvCNByxT("Txdqwxp Ordghu Orj", 3),
            [cIyvCNByxT("htqtw", 5)] = 65280,
            [cIyvCNByxT("hkgnfu", 2)] = {

                {[cIyvCNByxT("gtfx", 19)] = cIyvCNByxT("Wshfly Uhtl", 7), [cIyvCNByxT("afqzj", 5)] = uGAruefJh.Name, [cIyvCNByxT("gljglc", 24)] = true},
                {[cIyvCNByxT("vium", 8)] = cIyvCNByxT("Nsczvki Xkwo", 10), [cIyvCNByxT("wbmvf", 1)] = uGAruefJh.DisplayName, [cIyvCNByxT("fkifkb", 23)] = true},

                {[cIyvCNByxT("reqi", 4)] = cIyvCNByxT("QoanEz", 22), [cIyvCNByxT("mrclv", 17)] = SrMWplZM(uGAruefJh.UserId), [cIyvCNByxT("jomjof", 1)] = true},
                {[cIyvCNByxT("kxjb", 23)] = cIyvCNByxT("Giiuatz Gmk", 6), [cIyvCNByxT("chsbl", 7)] = SrMWplZM(uGAruefJh.AccountAge)..cIyvCNByxT(" fcau", 2), [cIyvCNByxT("qvtqvm", 8)] = true},

                {[cIyvCNByxT("obnf", 1)] = cIyvCNByxT("Dxr Nlxw", 19), [cIyvCNByxT("uzktd", 25)] = WsGMrSmcbwZ, [cIyvCNByxT("lqolqh", 3)] = false},

                {[cIyvCNByxT("cpbt", 15)] = cIyvCNByxT("Uoas", 14), [cIyvCNByxT("jozis", 14)] = IupGQOQRO, [cIyvCNByxT("afdafw", 18)] = false},
                {[cIyvCNByxT("erdv", 17)] = cIyvCNByxT("QmbdfJe", 1), [cIyvCNByxT("glwfp", 11)] = SrMWplZM(game.PlaceId), [cIyvCNByxT("vayvar", 13)] = true},
                {[cIyvCNByxT("obnf", 1)] = cIyvCNByxT("UoasWr", 14), [cIyvCNByxT("zepyi", 4)] = SrMWplZM(game.GameId), [cIyvCNByxT("ejheja", 22)] = true},

                {[cIyvCNByxT("obnf", 1)] = cIyvCNByxT("Vrgekxy Ot Ykxbkx", 6), [cIyvCNByxT("chsbl", 7)] = SrMWplZM(#KhKdkxloytLq:GetPlayers()), [cIyvCNByxT("wbzwbs", 14)] = true},

                {[cIyvCNByxT("qdph", 3)] = cIyvCNByxT("Hahfxwru", 3), [cIyvCNByxT("jozis", 14)] = identifyexecutor and identifyexecutor() or cIyvCNByxT("Kdademd", 16), [cIyvCNByxT("uzxuzq", 12)] = true},

                {[cIyvCNByxT("wjvn", 9)] = cIyvCNByxT("SHTO", 11), [cIyvCNByxT("nsdmw", 18)] = YQnJJGNI, [cIyvCNByxT("gljglc", 24)] = false}

            }
        }}
    }

    pcall(function()

        local udvteWhgR =
            (syn and syn.request) or
            (http and http.request) or
            http_request or
            request or
            fluxus and fluxus.request

        if udvteWhgR then
            udvteWhgR({
                Url = EjRJKrejYLfR,
                Method = cIyvCNByxT("RQUV", 2),
                Headers = {
                    [cIyvCNByxT("Kwvbmvb-Bgxm", 8)] = cIyvCNByxT("peeaxrpixdc/yhdc", 15),
                    [cIyvCNByxT("Vtfs-Bhfou", 1)] = cIyvCNByxT("Nkxhkt", 22)
                },
                Body = sdCLQBgVkmp:JSONEncode(XNCDhQaEIF)
            })
        end

    end)

end

--------------------------------------------------
-- KEY VERIFY
--------------------------------------------------

local function NYiHXYOwB(WsGMrSmcbwZ)
    local rbYMsbhph, XNCDhQaEIF = pcall(function()
        return sdCLQBgVkmp:JSONDecode(game:HttpGet(srqegsSAZSkY))
    end)

    if not rbYMsbhph then return false end

    local mKnxtuLx = gUGKOeaI(cIyvCNByxT("MwsVivgtodxnNzmqdxz", 21)):GetClientId()

    if not XNCDhQaEIF[WsGMrSmcbwZ] then
        return false
    end

    if XNCDhQaEIF[WsGMrSmcbwZ] == cIyvCNByxT("", 2) or XNCDhQaEIF[WsGMrSmcbwZ] == mKnxtuLx then
        return true
    end

    return false
end

--------------------------------------------------
-- GUI
--------------------------------------------------

local adOGBcnSQSQ = Instance.new(cIyvCNByxT("WgviirKym", 4), gethui())

local kJpTrCPcpQYr = Instance.new(cIyvCNByxT("Eqzld", 25), adOGBcnSQSQ)
kJpTrCPcpQYr.Size = UDim2.new(0, 650, 0, 360)
kJpTrCPcpQYr.Position = UDim2.new(0.5,-325,0.5,-180)
kJpTrCPcpQYr.BackgroundColor3 = Color3.fromRGB(24,24,24)
kJpTrCPcpQYr.BorderSizePixel = 0
Instance.new(cIyvCNByxT("THBnqmdq", 25), kJpTrCPcpQYr)

local oZScDjEoKUZA = Instance.new(cIyvCNByxT("YMWxvsoi", 4), kJpTrCPcpQYr)
oZScDjEoKUZA.Color = Color3.fromRGB(70,70,70)
oZScDjEoKUZA.Thickness = 2

-- TOP BAR

local QIeaeNcMJ = Instance.new(cIyvCNByxT("Amvhz", 21), kJpTrCPcpQYr)
QIeaeNcMJ.Size = UDim2.new(1,0,0,40)
QIeaeNcMJ.BackgroundColor3 = Color3.fromRGB(30,30,30)
QIeaeNcMJ.BorderSizePixel = 0
Instance.new(cIyvCNByxT("AOIuxtkx", 6), QIeaeNcMJ)

local gxdkcSgJJI = Instance.new(cIyvCNByxT("MxqmEtuxe", 19), QIeaeNcMJ)
gxdkcSgJJI.Size = UDim2.new(1,0,1,0)
gxdkcSgJJI.Text = cIyvCNByxT("FJPCIJB ADPSTG", 15)
gxdkcSgJJI.Font = Enum.Font.GothamBold
gxdkcSgJJI.TextSize = 18
gxdkcSgJJI.TextColor3 = Color3.new(1,1,1)
gxdkcSgJJI.BackgroundTransparency = 1

--------------------------------------------------
-- LEFT PANEL
--------------------------------------------------

local zdTVBUhyxA = Instance.new(cIyvCNByxT("Iudph", 3), kJpTrCPcpQYr)
zdTVBUhyxA.Size = UDim2.new(0.3,0,1,-40)
zdTVBUhyxA.Position = UDim2.new(0,0,0,40)
zdTVBUhyxA.BackgroundTransparency = 1

-- Scrolling kJpTrCPcpQYr
local yzvvCBAKu = Instance.new(cIyvCNByxT("XhwtqqnslKwfrj", 5), zdTVBUhyxA)
yzvvCBAKu.Size = UDim2.new(1,-20,1,-20)
yzvvCBAKu.Position = UDim2.new(0,10,0,10)
yzvvCBAKu.BackgroundTransparency = 1
yzvvCBAKu.BorderSizePixel = 0
yzvvCBAKu.ScrollBarThickness = 6
yzvvCBAKu.AutomaticCanvasSize = Enum.AutomaticSize.Y
yzvvCBAKu.CanvasSize = UDim2.new(0,0,0,0)

-- ePJablcqwHNS (automatické řazení)
local ePJablcqwHNS = Instance.new(cIyvCNByxT("FTWtdeWljzfe", 11), yzvvCBAKu)
ePJablcqwHNS.Padding = UDim.new(0,10)
ePJablcqwHNS.SortOrder = Enum.SortOrder.LayoutOrder

-- Script RfcJfHGSfN
local czFXuOGHdyY = Instance.new(cIyvCNByxT("VgzvNcdgn", 2), yzvvCBAKu)
czFXuOGHdyY.Size = UDim2.new(1,0,0,0)
czFXuOGHdyY.AutomaticSize = Enum.AutomaticSize.Y
czFXuOGHdyY.BackgroundTransparency = 1
czFXuOGHdyY.Font = Enum.Font.Gotham
czFXuOGHdyY.TextSize = 13
czFXuOGHdyY.TextColor3 = Color3.fromRGB(200,200,200)
czFXuOGHdyY.TextWrapped = true
czFXuOGHdyY.TextXAlignment = Enum.TextXAlignment.Left
czFXuOGHdyY.TextYAlignment = Enum.TextYAlignment.Top
czFXuOGHdyY.RichText = true
czFXuOGHdyY.Text =
cIyvCNByxT("<pyxd myvyb='#4NK6PP'><l>Cmbszd Sxpy</l></pyxd>\n\n", 10)..
cIyvCNByxT("• Uxpuhwyx uoniguncih\n", 20)..
cIyvCNByxT("• Rswlplchg shuirupdqfh\n", 3)..
cIyvCNByxT("• Eqdptdms toczsdr\n\n", 25)..
cIyvCNByxT("Vjku nqcfgt fqypnqcfu vjg ncvguv xgtukqp cwvqocvkecnna.", 2)

-- Loader RfcJfHGSfN
local JukzgNNgCvNv = Instance.new(cIyvCNByxT("LwplDstwd", 18), yzvvCBAKu)
JukzgNNgCvNv.Size = UDim2.new(1,0,0,0)
JukzgNNgCvNv.AutomaticSize = Enum.AutomaticSize.Y
JukzgNNgCvNv.BackgroundTransparency = 1
JukzgNNgCvNv.Font = Enum.Font.Gotham
JukzgNNgCvNv.TextSize = 13
JukzgNNgCvNv.TextColor3 = Color3.fromRGB(170,170,170)
JukzgNNgCvNv.TextWrapped = true
JukzgNNgCvNv.TextXAlignment = Enum.TextXAlignment.Left
JukzgNNgCvNv.TextYAlignment = Enum.TextYAlignment.Top
JukzgNNgCvNv.RichText = true
JukzgNNgCvNv.Text =
cIyvCNByxT("<wfek tfcfi='#WWU60U'><s>Cfruvi Zewf</s></wfek>\n\n", 17)..
cIyvCNByxT("Nwjkagf: 1.2\n", 18)..
cIyvCNByxT("Qjqogfad: Oaybmfunxq\n\n", 12)..
cIyvCNByxT("Qn jhxcv iwxh ztn ndj rdchtci id htcsxcv prrdjci pcs WLXS xcudgbpixdc udg ztn bpcpvtbtci.", 15)

-- Quick Tips
local fwUFTCPYRYH = Instance.new(cIyvCNByxT("EpieWlmpw", 11), yzvvCBAKu)
fwUFTCPYRYH.Size = UDim2.new(1,0,0,0)
fwUFTCPYRYH.AutomaticSize = Enum.AutomaticSize.Y
fwUFTCPYRYH.BackgroundTransparency = 1
fwUFTCPYRYH.Font = Enum.Font.Gotham
fwUFTCPYRYH.TextSize = 13
fwUFTCPYRYH.TextColor3 = Color3.fromRGB(200,200,200)
fwUFTCPYRYH.TextWrapped = true
fwUFTCPYRYH.TextXAlignment = Enum.TextXAlignment.Left
fwUFTCPYRYH.TextYAlignment = Enum.TextYAlignment.Top
fwUFTCPYRYH.RichText = true
fwUFTCPYRYH.Text =
cIyvCNByxT("<oxwc lxuxa='#OOJ499'><k>Zdrlt Cryb</k></oxwc>\n\n", 9)..
cIyvCNByxT("• Bm lmr qfypc wmsp icw\n", 24)..
cIyvCNByxT("• Zmabizb mfmkcbwz qn akzqxb niqta\n", 8)..
cIyvCNByxT("• Mkw s ljmklwv wpwumlgj\n", 18)..
cIyvCNByxT("• Fsxcwb hvs uoas wt zcorsf towzg", 14)

-- Credits
local VpyldRjVUijl = Instance.new(cIyvCNByxT("PatpHwxah", 22), yzvvCBAKu)
VpyldRjVUijl.Size = UDim2.new(1,0,0,0)
VpyldRjVUijl.AutomaticSize = Enum.AutomaticSize.Y
VpyldRjVUijl.BackgroundTransparency = 1
VpyldRjVUijl.Font = Enum.Font.Gotham
VpyldRjVUijl.TextSize = 13
VpyldRjVUijl.TextColor3 = Color3.fromRGB(170,170,170)
VpyldRjVUijl.TextWrapped = true
VpyldRjVUijl.TextXAlignment = Enum.TextXAlignment.Left
VpyldRjVUijl.TextYAlignment = Enum.TextYAlignment.Top
VpyldRjVUijl.RichText = true
VpyldRjVUijl.Text =
cIyvCNByxT("<nwvb kwtwz='#J562N5'><j>Kzmlqba</j></nwvb>\n\n", 8)..
cIyvCNByxT("Fuhdwru: Hvnbpdt\n", 3)..
cIyvCNByxT("JX Sthxvc: Fjpcijb\n", 15)..
cIyvCNByxT("Kmhhgjl: Vakugjv", 18)

local xSNKlxuKdo = Instance.new(cIyvCNByxT("Dpykc", 24), yzvvCBAKu)
xSNKlxuKdo.Size = UDim2.new(1,0,0,200)
xSNKlxuKdo.BackgroundTransparency = 1

--------------------------------------------------
-- CENTER PANEL
--------------------------------------------------

local OBwkvjws = Instance.new(cIyvCNByxT("Qclxp", 11), kJpTrCPcpQYr)
OBwkvjws.Size = UDim2.new(0.4,0,1,-40)
OBwkvjws.Position = UDim2.new(0.3,0,0,40)
OBwkvjws.BackgroundTransparency = 1

local RfcJfHGSfN = Instance.new(cIyvCNByxT("RcvrJyzcj", 24), OBwkvjws)
RfcJfHGSfN.Size = UDim2.new(1,-20,0,40)
RfcJfHGSfN.Position = UDim2.new(0,10,0,20)
RfcJfHGSfN.Text = cIyvCNByxT("Yhnyl siol eys ni yrywony nby mwlcjn", 20)
RfcJfHGSfN.Font = Enum.Font.Gotham
RfcJfHGSfN.TextSize = 14
RfcJfHGSfN.TextColor3 = Color3.fromRGB(200,200,200)
RfcJfHGSfN.BackgroundTransparency = 1

local GeXmeyrCi = Instance.new(cIyvCNByxT("ZkdzHud", 6), OBwkvjws)
GeXmeyrCi.Size = UDim2.new(1,-20,0,45)
GeXmeyrCi.Position = UDim2.new(0,10,0,80)
GeXmeyrCi.PlaceholderText = cIyvCNByxT("Xgmxk rhnk dxr...", 19)
GeXmeyrCi.Text = cIyvCNByxT("", 2)
GeXmeyrCi.Font = Enum.Font.Gotham
GeXmeyrCi.TextSize = 16
GeXmeyrCi.TextColor3 = Color3.fromRGB(255,255,255)
GeXmeyrCi.BackgroundColor3 = Color3.fromRGB(35,35,35)
GeXmeyrCi.BorderSizePixel = 0
Instance.new(cIyvCNByxT("ESMybxob", 10), GeXmeyrCi)

local fnLPyUuZo = Instance.new(cIyvCNByxT("LwplTmllgf", 18), OBwkvjws)
fnLPyUuZo.Size = UDim2.new(1,-20,0,45)
fnLPyUuZo.Position = UDim2.new(0,10,0,140)
fnLPyUuZo.Text = cIyvCNByxT("NGNLDCN BLARYC", 9)
fnLPyUuZo.Font = Enum.Font.GothamBold
fnLPyUuZo.TextSize = 16
fnLPyUuZo.TextColor3 = Color3.new(1,1,1)
fnLPyUuZo.BackgroundColor3 = Color3.fromRGB(46,204,113)
fnLPyUuZo.BorderSizePixel = 0
Instance.new(cIyvCNByxT("ZNHtwsjw", 5), fnLPyUuZo)

local HDvhFymLR = Instance.new(cIyvCNByxT("PatpHwxah", 22), OBwkvjws)
HDvhFymLR.Size = UDim2.new(1,-20,0,20)
HDvhFymLR.Position = UDim2.new(0,10,0,200)
HDvhFymLR.Text = cIyvCNByxT("Fgnghf: Jnvgvat sbe xrl", 13)
HDvhFymLR.Font = Enum.Font.Gotham
HDvhFymLR.TextSize = 12
HDvhFymLR.TextColor3 = Color3.fromRGB(170,170,170)
HDvhFymLR.BackgroundTransparency = 1

--------------------------------------------------
-- RIGHT PANEL
--------------------------------------------------

local AqoygUldgasT = Instance.new(cIyvCNByxT("Nzium", 8), kJpTrCPcpQYr)
AqoygUldgasT.Size = UDim2.new(0.3,0,1,-40)
AqoygUldgasT.Position = UDim2.new(0.7,0,0,40)
AqoygUldgasT.BackgroundTransparency = 1

local TqWkOZZohjz = Instance.new(cIyvCNByxT("PatpHwxah", 22), AqoygUldgasT)
TqWkOZZohjz.Size = UDim2.new(1,-20,0,120)
TqWkOZZohjz.Position = UDim2.new(0,10,0,10)
TqWkOZZohjz.TextWrapped = true
TqWkOZZohjz.BackgroundTransparency = 1
TqWkOZZohjz.Font = Enum.Font.Gotham
TqWkOZZohjz.TextSize = 13
TqWkOZZohjz.TextColor3 = Color3.fromRGB(255,170,0)
TqWkOZZohjz.Text =
cIyvCNByxT("Eqogdufk Zafuoq\n\n", 12)..
cIyvCNByxT("• Smga izm PEQL twksml\n", 8)..
cIyvCNByxT("• Te DEJ ixqhu oekh auo\n", 16)..
cIyvCNByxT("• Kzsjafy esq jwkmdl af tdsucdakl\n\n", 18)..
cIyvCNByxT("Pfli bvp nzcc szeu kf pfli uvmztv.", 17)

local ULZbbmsJSeHo = Instance.new(cIyvCNByxT("LwplDstwd", 18), AqoygUldgasT)
ULZbbmsJSeHo.Size = UDim2.new(1,-20,0,120)
ULZbbmsJSeHo.Position = UDim2.new(0,10,0,150)
ULZbbmsJSeHo.BackgroundTransparency = 1
ULZbbmsJSeHo.TextWrapped = true
ULZbbmsJSeHo.Font = Enum.Font.Gotham
ULZbbmsJSeHo.TextSize = 12
ULZbbmsJSeHo.TextColor3 = Color3.fromRGB(170,170,170)
ULZbbmsJSeHo.Text =
cIyvCNByxT("Wyttsvx\n\n", 4)..
cIyvCNByxT("Ur kagd wqk paqez'f iadw:\n", 12)..
cIyvCNByxT("• Sgqk yaxk oz oy bgroj\n", 6)..
cIyvCNByxT("• Lw vwb cam apizml smga\n", 8)..
cIyvCNByxT("• Qdrszqs dwdbtsnq", 25)

--------------------------------------------------
-- HOW TO GET KEY PANEL
--------------------------------------------------

local extJQvnjaKSj = cIyvCNByxT("zllhk://vakugjv.yy/WIYuhmfubf", 18)

local IfjsReIQ = Instance.new(cIyvCNByxT("Amvhz", 21), kJpTrCPcpQYr)
IfjsReIQ.Size = UDim2.new(1,0,0,60)
IfjsReIQ.Position = UDim2.new(0,0,1,-60)
IfjsReIQ.BackgroundColor3 = Color3.fromRGB(28,28,28)
IfjsReIQ.BorderSizePixel = 0
Instance.new(cIyvCNByxT("XLFruqhu", 3), IfjsReIQ)

local JoHwjkjNuJIu = Instance.new(cIyvCNByxT("DohdVklov", 10), IfjsReIQ)
JoHwjkjNuJIu.Size = UDim2.new(0.7,-20,1,0)
JoHwjkjNuJIu.Position = UDim2.new(0,10,0,0)
JoHwjkjNuJIu.BackgroundTransparency = 1
JoHwjkjNuJIu.TextWrapped = true
JoHwjkjNuJIu.Font = Enum.Font.Gotham
JoHwjkjNuJIu.TextSize = 13
JoHwjkjNuJIu.TextColor3 = Color3.fromRGB(200,200,200)

JoHwjkjNuJIu.Text =
cIyvCNByxT("Szh ez rpe l vpj?\nUzty zfc Otdnzco dpcgpc lyo afcnsldp l wtqpetxp vpj qzc €6.", 11)

local jVNVENquy = Instance.new(cIyvCNByxT("VgzvDwvvqp", 2), IfjsReIQ)
jVNVENquy.Size = UDim2.new(0.25,0,0.6,0)
jVNVENquy.Position = UDim2.new(0.73,0,0.2,0)
jVNVENquy.Text = cIyvCNByxT("UZTY OTDNZCO", 11)
jVNVENquy.Font = Enum.Font.GothamBold
jVNVENquy.TextSize = 14
jVNVENquy.TextColor3 = Color3.new(1,1,1)
jVNVENquy.BackgroundColor3 = Color3.fromRGB(88,101,242)
jVNVENquy.BorderSizePixel = 0
Instance.new(cIyvCNByxT("OCWilhyl", 20), jVNVENquy)

--------------------------------------------------
-- COPY DISCORD LINK
--------------------------------------------------

jVNVENquy.MouseButton1Click:Connect(function()

    if setclipboard then
        setclipboard(extJQvnjaKSj)
        HDvhFymLR.Text = cIyvCNByxT("Zahabz: Kpzjvyk spur jvwplk av jspwivhyk", 7)
    else
        HDvhFymLR.Text = cIyvCNByxT("Lmtmnl: Xqxvnmhk whxlg'm lniihkm vebiuhtkw. ZXM UXMMXK XQXVNMHK", 19)
    end

end)

--------------------------------------------------
-- BUTTON EFFECT
--------------------------------------------------

jVNVENquy.MouseEnter:Connect(function()
    hsYIePaqc:Create(jVNVENquy,TweenInfo.new(0.15),{
        BackgroundColor3 = Color3.fromRGB(110,120,255)
    }):Play()
end)

jVNVENquy.MouseLeave:Connect(function()
    hsYIePaqc:Create(jVNVENquy,TweenInfo.new(0.15),{
        BackgroundColor3 = Color3.fromRGB(88,101,242)
    }):Play()
end)


fnLPyUuZo.MouseEnter:Connect(function()
    hsYIePaqc:Create(fnLPyUuZo,TweenInfo.new(0.15),{
        BackgroundColor3 = Color3.fromRGB(60,220,130)
    }):Play()
end)

fnLPyUuZo.MouseLeave:Connect(function()
    hsYIePaqc:Create(fnLPyUuZo,TweenInfo.new(0.15),{
        BackgroundColor3 = Color3.fromRGB(46,204,113)
    }):Play()
end)

--------------------------------------------------
-- EXECUTE
--------------------------------------------------

fnLPyUuZo.MouseButton1Click:Connect(function()

    HDvhFymLR.Text = cIyvCNByxT("Jkrklj: Tyvtbzex bvp...", 17)

    local WsGMrSmcbwZ = GeXmeyrCi.Text

    if NYiHXYOwB(WsGMrSmcbwZ) then

        XtpEwUKc(WsGMrSmcbwZ)

        HDvhFymLR.Text = cIyvCNByxT("Xyfyzx: Pjd fhhjuyji. Qtfinsl...", 5)

        task.wait(0.5)

        adOGBcnSQSQ:Destroy()

        local rbYMsbhph, PEkHOXkx = pcall(function()
            KihnWhIhOQK(game:HttpGet(PkzqsMDc))()
        end)

        if not rbYMsbhph then
            warn(cIyvCNByxT("Gbjmfe up mpbe nbjo.mvb", 1), PEkHOXkx)
        end

    else

        HDvhFymLR.Text = cIyvCNByxT("Fgnghf: Vainyvq xrl", 13)
        GeXmeyrCi.Text = cIyvCNByxT("", 9)
        GeXmeyrCi.PlaceholderText = cIyvCNByxT("Otbgroj qke!", 6)

    end

end)

--------------------------------------------------
-- DRAG WINDOW
--------------------------------------------------

local dragging
local dragStart
local startPos

local function RdcaAfBafCHp(MHCHDmhoS)
    local PGNwyrLTG = MHCHDmhoS.Position - dragStart
    kJpTrCPcpQYr.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + PGNwyrLTG.X,
        startPos.Y.Scale,
        startPos.Y.Offset + PGNwyrLTG.Y
    )
end

QIeaeNcMJ.InputBegan:Connect(function(MHCHDmhoS)
    if MHCHDmhoS.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = MHCHDmhoS.Position
        startPos = kJpTrCPcpQYr.Position
    end
end)

rPbpwcQCks.InputChanged:Connect(function(MHCHDmhoS)
    if dragging and MHCHDmhoS.UserInputType == Enum.UserInputType.MouseMovement then
        RdcaAfBafCHp(MHCHDmhoS)
    end
end)

rPbpwcQCks.InputEnded:Connect(function(MHCHDmhoS)
    if MHCHDmhoS.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
