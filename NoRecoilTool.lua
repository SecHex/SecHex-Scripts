--[[


██████╗░██╗░█████╗░██╗░░██╗░██████╗███████╗░█████╗░
██╔══██╗██║██╔══██╗╚██╗██╔╝██╔════╝██╔════╝██╔══██╗
██████╦╝██║██║░░██║░╚███╔╝░╚█████╗░█████╗░░██║░░╚═╝
██╔══██╗██║██║░░██║░██╔██╗░░╚═══██╗██╔══╝░░██║░░██╗
██████╦╝██║╚█████╔╝██╔╝╚██╗██████╔╝███████╗╚█████╔╝
╚═════╝░╚═╝░╚════╝░╚═╝░░╚═╝╚═════╝░╚══════╝░╚════╝░

--~~Bios no Recoil Tool~~ ->	https://github.com/BioXsec
--]]


    local sandra = true
    local udo = false --updating--
 
function OnEvent(event, arg)
         OutputLogMessage("event = %s, arg = %s\n", event, arg)
 
if (event == "PROFILE_ACTIVATED") then
    EnablePrimaryMouseButtonEvents(true)
end  

--						<=================~~Press Numlock to turn on~~======================>

if IsKeyLockOn("numlock")then 
if (event== "MOUSE_BUTTON_PRESSED" and arg == 7) then
sandra = not sandra
if (recoil == true) then
    OutputLogMessage ("[+] No Recoil is On\n")
else
    OutputLogMessage ("[-] No Recoil is Off\n")
end 
end

--						<=================~~NoRecoil Settings~~======================>
 
if (event == "MOUSE_BUTTON_PRESSED" and arg ==1 and sandra == true) then
if IsMouseButtonPressed(1) and IsMouseButtonPressed(3)then
repeat
   MoveMouseRelative(0,4)
   Sleep(14)
until not IsMouseButtonPressed(1) or not IsMouseButtonPressed(3)
end
end

end 
end
