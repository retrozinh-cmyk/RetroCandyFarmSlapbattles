--[[BY RETRO | CandyFarm Luau obfuscated (source protection, not encryption)]]
local _l0I00IlOl12=game:GetService("\080\108\097\121\101\114\115")
local _0l0lIOI0O2=game:GetService("\072\116\116\112\083\101\114\118\105\099\101")
local _ll0OllIIO0=game:GetService("\084\101\108\101\112\111\114\116\083\101\114\118\105\099\101")
local _0IO0Ill0l17=_l0I00IlOl12.LocalPlayer
local _0Il0lOO0I35=(getgenv and getgenv()) or _G
if type(_0Il0lOO0I35.CandyFarmStop)=="\102\117\110\099\116\105\111\110" then pcall(_0Il0lOO0I35.CandyFarmStop) end
local _0llIOI0O018={AutoFarm=true,AutoHop=true,LoopDelay=0.08,EmptyChecks=5,SpawnWait=12,HopRetry=5,ServerPages=5,PlatformPos=Vector3.new(10000,10000,10000),ReexecuteURL=""}
local _0O0O0II0O24={Running=true,Hopping=false,Started=false,Empty=0,StartTime=os.clock(),Visited={},Platform=nil,Connections={}}
local _0Ol0lOI0O10=workspace:FindFirstChild("\082\101\116\114\111\067\097\110\100\121\072\105\110\116")
if _0Ol0lOI0O10 then _0Ol0lOI0O10:Destroy() end
local _IlI0I0III19=Instance.new("\072\105\110\116")
_IlI0I0III19.Name="\082\101\116\114\111\067\097\110\100\121\072\105\110\116"
_IlI0I0III19.Text="\066\089\032\082\069\084\082\079\046\032\074\079\073\078\032\068\073\083\067\079\082\068\032\083\069\082\086\069\082\032\104\116\116\112\115\058\047\047\100\105\115\099\111\114\100\046\103\103\047\116\090\088\088\051\069\106\075\100"
_IlI0I0III19.Parent=workspace
local function _lOlOllIlI13()
local _Ol00OIl0I9=_0IO0Ill0l17.Character
return _Ol00OIl0I9 and _Ol00OIl0I9:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
end
local function _00lIllllI1()
local _IIOII0ll034=_lOlOllIlI13()
if not _IIOII0ll034 then return end
if not _0O0O0II0O24.Platform or not _0O0O0II0O24.Platform.Parent then
local _I0lIlIl0028=Instance.new("\080\097\114\116")
_I0lIlIl0028.Name="\067\097\110\100\121\070\097\114\109\080\108\097\116\102\111\114\109"
_I0lIlIl0028.Size=Vector3.new(2000,2,2000)
_I0lIlIl0028.Position=_0llIOI0O018.PlatformPos
_I0lIlIl0028.Anchored=true
_I0lIlIl0028.CanCollide=true
_I0lIlIl0028.Parent=workspace
_0O0O0II0O24.Platform=_I0lIlIl0028
end
_IIOII0ll034.CFrame=CFrame.new(_0llIOI0O018.PlatformPos+Vector3.new(0,4,0))
end
local function _OIOIllO0O6()
local _0O0ll00lO20=workspace:FindFirstChild("\067\097\110\100\121\067\111\114\110\115")
local _l00l000lI21={}
if not _0O0ll00lO20 then return _l00l000lI21 end
for _,_IlIlII0OO37 in ipairs(_0O0ll00lO20:GetDescendants()) do
if _IlIlII0OO37:IsA("\066\097\115\101\080\097\114\116") then _l00l000lI21[#_l00l000lI21+1]=_IlIlII0OO37 end
end
return _l00l000lI21
end
local function _ll0O0Ol0I3()
local _IIOII0ll034=_lOlOllIlI13()
if not _IIOII0ll034 then return 0 end
local _O0lIO0OIl29=_OIOIllO0O6()
if #_O0lIO0OIl29==0 then return 0 end
_0O0O0II0O24.Started=true
_00lIllllI1()
for _,_l00IOl00025 in ipairs(_O0lIO0OIl29) do
if _l00IOl00025.Parent then pcall(function() _l00IOl00025.CFrame=_IIOII0ll034.CFrame end) end
end
return #_O0lIO0OIl29
end
local function _lIlIIllII4(_IIIlOIOlO39)
local _OIOlI00OO38=_0Il0lOO0I35.request or _0Il0lOO0I35.http_request
if type(_0Il0lOO0I35.syn)=="\116\097\098\108\101" then _OIOlI00OO38=_OIOlI00OO38 or _0Il0lOO0I35.syn.request end
if type(_OIOlI00OO38)~="\102\117\110\099\116\105\111\110" then error("\069\120\101\099\117\116\111\114\032\115\101\109\032\115\117\112\111\114\116\101\032\072\084\084\080") end
local _0I00llI0I11=_OIOlI00OO38({Url=_IIIlOIOlO39,Method="\071\069\084"})
if not _0I00llI0I11 then return nil end
local _00O0l0l0030=_0I00llI0I11.Body or _0I00llI0I11.body
if type(_00O0l0l0030)~="\115\116\114\105\110\103" then return nil end
return _0l0lIOI0O2:JSONDecode(_00O0l0l0030)
end
local function _0Ill0OIl05()
local _IOIOIOO0I22=nil
local _0IIlIOIIO31={}
for _=1,_0llIOI0O018.ServerPages do
local _IIIlOIOlO39="\104\116\116\112\115\058\047\047\103\097\109\101\115\046\114\111\098\108\111\120\046\099\111\109\047\118\049\047\103\097\109\101\115\047"..game.PlaceId.."\047\095\048\073\048\073\073\079\108\108\048\049\052\047\080\117\098\108\105\099\063\115\111\114\116\079\114\100\101\114\061\065\115\099\038\108\105\109\105\116\061\049\048\048"
if _IOIOIOO0I22 then _IIIlOIOlO39=_IIIlOIOlO39.."\038\095\073\079\073\079\073\079\079\048\073\050\050\061"..HttpService:UrlEncode(_IOIOIOO0I22) end
local ok,_0l000OIIO32=pcall(_lIlIIllII4,_IIIlOIOlO39)
if not ok or type(_0l000OIIO32)~="\116\097\098\108\101" then warn("\091\067\097\110\100\121\070\097\114\109\093\032\072\084\084\080\058",_0l000OIIO32) break end
for _,_0I000OIII23 in ipairs(_0l000OIIO32.data or {}) do
if _0I000OIII23.id and _0I000OIII23.id~=game.JobId and not _0O0O0II0O24.Visited[_0I000OIII23.id] and type(_0I000OIII23.playing)=="\110\117\109\098\101\114" and type(_0I000OIII23.maxPlayers)=="\110\117\109\098\101\114" and _0I000OIII23.playing<_0I000OIII23.maxPlayers then
_0IIlIOIIO31[#_0IIlIOIIO31+1]=_0I000OIII23
end
end
_IOIOIOO0I22=_0l000OIIO32.nextPageCursor
if not _IOIOIOO0I22 then break end
end
table.sort(_0IIlIOIIO31,function(a,b) return a.playing<b.playing end)
return _0IIlIOIIO31
end
local function _IOllO00007()
if _0llIOI0O018.ReexecuteURL=="" then return end
local _0lllI0IlO26=_0Il0lOO0I35.queue_on_teleport or _0Il0lOO0I35.queueonteleport
if type(_0Il0lOO0I35.syn)=="\116\097\098\108\101" then _0lllI0IlO26=_0lllI0IlO26 or _0Il0lOO0I35.syn.queue_on_teleport end
if type(_0lllI0IlO26)=="\102\117\110\099\116\105\111\110" then
local _IOlI00Oll33="\108\111\097\100\115\116\114\105\110\103\040\103\097\109\101\058\072\116\116\112\071\101\116\040"..string.format("\037\113",_0llIOI0O018.ReexecuteURL).."\041\041\040\041"
pcall(_0lllI0IlO26,_IOlI00Oll33)
end
end
local function _IllOll0l036()
if _0O0O0II0O24.Hopping or not _0O0O0II0O24.Running then return end
_0O0O0II0O24.Hopping=true
local ok,_0I0IIOll014=pcall(_0Ill0OIl05)
if not ok or type(_0I0IIOll014)~="\116\097\098\108\101" or #_0I0IIOll014==0 then
warn("\091\067\097\110\100\121\070\097\114\109\093\032\078\101\110\104\117\109\032\115\101\114\118\105\100\111\114\032\101\110\099\111\110\116\114\097\100\111")
_0O0O0II0O24.Hopping=false
task.wait(_0llIOI0O018.HopRetry)
return
end
_IOllO00007()
for _,_0I000OIII23 in ipairs(_0I0IIOll014) do
if not _0O0O0II0O24.Running then break end
_0O0O0II0O24.Visited[_0I000OIII23.id]=true
local _l0ll0l0OO16,_O00O0lOlI40=pcall(function() _ll0OllIIO0:TeleportToPlaceInstance(game.PlaceId,_0I000OIII23.id,_0IO0Ill0l17) end)
if not _l0ll0l0OO16 then warn("\091\067\097\110\100\121\070\097\114\109\093\032\070\097\108\104\097\032\116\101\108\101\112\111\114\116\101\058",_O00O0lOlI40) else task.wait(8) end
end
_0O0O0II0O24.Hopping=false
end
_0O0O0II0O24.Connections[#_0O0O0II0O24.Connections+1]=_ll0OllIIO0.TeleportInitFailed:Connect(function(p,_l00l000lI21,_OIOIIOIIl15)
if p==_0IO0Ill0l17 then warn("\091\067\097\110\100\121\070\097\114\109\093\032\084\101\108\101\112\111\114\116\073\110\105\116\070\097\105\108\101\100\058",_OIOIIOIIl15) _0O0O0II0O24.Hopping=false end
end)
_0O0O0II0O24.Connections[#_0O0O0II0O24.Connections+1]=_0IO0Ill0l17.CharacterAdded:Connect(function()
_0O0O0II0O24.Started=false
_0O0O0II0O24.Empty=0
_0O0O0II0O24.StartTime=os.clock()
end)
_0Il0lOO0I35.CandyFarmStop=function()
_0O0O0II0O24.Running=false
for _,_O0l0lIO0l8 in ipairs(_0O0O0II0O24.Connections) do _O0l0lIO0l8:Disconnect() end
if _0O0O0II0O24.Platform then _0O0O0II0O24.Platform:Destroy() end
if _IlI0I0III19 then _IlI0I0III19:Destroy() end
end
task.spawn(function()
while _0O0O0II0O24.Running do
if _0llIOI0O018.AutoFarm and not _0O0O0II0O24.Hopping then
local _IIOII0ll034=_lOlOllIlI13()
if _IIOII0ll034 then
local _Ol0l0IIlO27=_ll0O0Ol0I3()
if _Ol0l0IIlO27>0 then _0O0O0II0O24.Empty=0
elseif _0O0O0II0O24.Started or os.clock()-_0O0O0II0O24.StartTime>=_0llIOI0O018.SpawnWait then
_0O0O0II0O24.Empty=_0O0O0II0O24.Empty+1
if _0O0O0II0O24.Empty>=_0llIOI0O018.EmptyChecks then
_0O0O0II0O24.Empty=0
if _0llIOI0O018.AutoHop then task.spawn(_IllOll0l036) end
end
end
end
end
task.wait(_0llIOI0O018.LoopDelay)
end
end)
