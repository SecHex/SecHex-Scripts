--[[
                      :::!~!!!!!:.
                  .xUHWH!! !!?M88WHX:.
                .X*#M@$!!  !X!M$$$$$$WWx:.
               :!!!!!!?H! :!$!$$$$$$$$$$8X:
              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!
             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
               !:~~~ .:!M"T#$$$$WX??#MRRMMM!
               ~?WuxiW*`   `"#$$$$8!!!!??!!!
             :X- M$$$$       `"T#$T~!8$WUXU~
            :%`  ~#$$$m:        ~!~ ?$$$$$$
          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"
.....   -~~:<` !    ~?T#$$@@W@*?$$      /`
W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :
#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~
.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `
Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!
$R@i.~~ !     :   ~$$$$$B$$en:``
?MXT@Wx.~    :     ~"##*$$$$M~


--~~SecHex's no Recoil Tool~~ ->	https://github.com/SecHex
--]]


local NoRecoil = true
local recoilStrength = 4

function OnEvent(event, arg)
         OutputLogMessage("event = %s, arg = %s\n", event, arg)
 
if (event == "PROFILE_ACTIVATED") then
    EnablePrimaryMouseButtonEvents(true)
end  

--						<=================~~Press Numlock to turn on~~======================>

if IsKeyLockOn("numlock")then 
if (event== "MOUSE_BUTTON_PRESSED" and arg == 7) then
NoRecoil = not NoRecoil
if (recoil == true) then
    OutputLogMessage ("[+] No Recoil is On\n")
else
    OutputLogMessage ("[-] No Recoil is Off\n")
end 
end

--						<=================~~Change recoil strength with mouse buttons~~======================>

if (event== "MOUSE_BUTTON_PRESSED" and arg == 4) then
    recoilStrength = recoilStrength + 1
    OutputLogMessage("[+] Recoil strength increased to %d\n", recoilStrength)
end

if (event== "MOUSE_BUTTON_PRESSED" and arg == 5) then
    recoilStrength = recoilStrength - 1
    OutputLogMessage("[-] Recoil strength decreased to %d\n", recoilStrength)
end

--						<=================~~NoRecoil Settings~~======================>
 
if (event == "MOUSE_BUTTON_PRESSED" and arg ==1 and NoRecoil == true) then
if IsMouseButtonPressed(1) and IsMouseButtonPressed(3)then
repeat
   MoveMouseRelative(0,recoilStrength)
   Sleep(14)
until not IsMouseButtonPressed(1) or not IsMouseButtonPressed(3)
end
end

end 
end

