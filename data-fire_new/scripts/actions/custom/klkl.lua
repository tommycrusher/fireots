local klkl = Action()
function klkl.onUse(cid, item, frompos, item2, topos)
local uid = 2263
local message = "transformacja!"
local hit = 1000
local effect = 29
   if item.uid == uid then
    doPlayerAddMana(cid,mana)
    doPlayerSay(cid,message,effect)
   end
 end
klkl:uid(2263)
klkl:register()
