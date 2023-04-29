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

--~~Rapunzel's no Recoil Tool~~ ->	https://github.com/Rapunzel-ware
--]]


--	<===============~~Recoil Presets~~===============>

local recoilPresets = {
    {strength = 4, description = "low"},
    {strength = 6, description = "medium"},
    {strength = 8, description = "high"}
}



local selectedPresetIndex = 1
local noRecoilEnabled = true


--	<===============~~Functions~~===============>
function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %s\n", event, arg)
    
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    end
    

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 7) then
        noRecoilEnabled = not noRecoilEnabled
        if (noRecoilEnabled) then
            OutputLogMessage("[+] No recoil is on\n")
        else
            OutputLogMessage("[-] No recoil is off\n")
        end
    end
    

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
        selectedPresetIndex = (selectedPresetIndex % #recoilPresets) + 1
        OutputLogMessage("[+] Selected recoil preset: %s\n", recoilPresets[selectedPresetIndex].description)
    end
    

    if (noRecoilEnabled and event == "MOUSE_BUTTON_PRESSED" and arg == 1 and IsMouseButtonPressed(1) and IsMouseButtonPressed(3)) then
        local recoilStrength = recoilPresets[selectedPresetIndex].strength
        repeat
            MoveMouseRelative(0, recoilStrength)
            Sleep(14)
        until not (IsMouseButtonPressed(1) and IsMouseButtonPressed(3))
    end
end
