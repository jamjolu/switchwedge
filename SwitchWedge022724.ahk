iniF := "sw.ini"     ; initializes startup state-mostly for scan mouse
iniH := "swsettings" ; There is only one section in the ini file
bar_char := "|"
reloading = 0
reLoad:
OpMode = Single Switch
Scanner = 1
ScanRate = 4
dragging = 0
slowSend = 1
moving = 0
SetupName = %iniH%
SetupList:= ""
keyIn1 = +Tab ; default key trigger
keyIn2 = Backspace
keyIn3 = Tab ; default key trigger
keyIn4 = Space
keyIn5 = Right
xpos = 0 ; target coodinates
ypos = 0
x2pos = 0
y2pos = 0
xpos1 = 100
ypos1 = 0
xpos2 = 200
ypos2 = 0
xpos3 = 300
ypos3 = 0
xpos4 = 400
ypos4 = 0
xpos5 = 500
ypos5 = 0
xpos6 = 600
ypos6 = 0
xpos7 = 700
ypos7 = 0
xpos8 = 800
ypos8 = 0
xpos9 = 900
ypos9 = 0
xpos10 = 1000
ypos10 = 0
spotIx = 0
spotMsg = "text"
spotTalk = 0
spotScanIx = 0
clickIx = 1
maskTimer = 0
notMasking = 1
scanning = 0
mouseSpeed = 125 ; sets mouse speed where smaller is faster
mouseState = 4
mouseOffset = 10 ; sets the smallest distance in pixels the mouse can move
mouseClickState = 0
scanMouseMode = 1
shrunk = 0
ttVisible = 0
ttText = This is it!
winWid = w650
winWidMin = w650
winHgtMax = h200
winHgtMin = h25
lastHgt = w650
lastWid = h200
Msg1 = {Tab}
Msg2 = {Enter}
Msg3 = +{Tab}
Msg4 = {Space}
Msg5 = {right}
customMsg1 = ? ; add a string to send for first message (hilite)
customMsg2 = ? ; add a string to send for second msg (select)
customMsg3 = ? ; add a string to send for third message (remap only)
customMsg4 = ? ; add a string to send for fourth msg (remap only)
customMsg5 = hey ; add a string to send for fifth msg (remap only)
StartOff = 1
noHelp = 1
viewInfo = 0
suspended = 1
cbTTS = 0
HelpText = Context help
infoText = SwitchWedge can enhance accessibility to many programs and websites, and it can greatly increase the utility of common switch interfaces such as keyboard emulators like the DJ Switch Interface Pro, adapted mice, or adapted joysticks/gamepads. SwitchWedge supports up to 5 switches, and offers a number of operating modes to trigger various helpful actions. The two leftmost inputs (triggers) are associated with these operating modes allowing them to support:`n`n 1. - Single Switch scanning - the first switch activation repeatedly sends a user defined keystroke to an application at the scan rate to highlight items. A second activation of the same switch sends the second user defined keystroke to select an item.`n 2. - Two Switch scanning-  The user uses separate switches, one to send keystrokes for moving the scan highlight and one to select an item.`n 3. - One Click - the switch activation sends a click to a user defined target. Subsequent switch hits are ignored during the Mask Time interval that follows the initial trigger.`n 4. - Two Click - The trigger sends a click at a first target and then after the Scan Rate interval, a second click to a second target. Subsequent triggers are ignored during the Mask Time interval that follows the initial trigger.`n 5. - Scan Mouse 1 - The trigger initiates a sequence of tool tips that appear near the mouse cursor at the Scan Rate which describe mouse actions: either mouse moves or mouse clicks. The user can move the mouse cursor as defined by the Mouse Speed where smaller numbers yield a faster movement.`n 6. - Scan Mouse 2 - Same as Scan Mouse 1 but adds the possibility of auditory support for scanning by copying the tool tip text to the clipboard where a helper program like TTSReader, Orato, ClipSpeak, or Deskbot can read it outloud.`n 7. - Scan Spot 1 and 2 -You can define up to 10 spots on the screen that get 'scanned'. Either keyboard trigger starts the scan which sequentially positions the mouse cursor over each spot at the scan rate. A second trigger stops the scan and sends a mouse click to the last mouse position. Scan Spot 2 allows you to enter auditory cue text for each spot. The cues are spoken by a helper clipboard text-to-speech application like Orato or Deskbot. `n 8. -  Remap Mode - sends whatever message is associated with each of the triggers to the active application. You can set a Mask interval as well.  `n`n The other 3 inputs operate as simple key/click sequence remappers. By setting a custom key sequence for any input, a user can issue a long sequence of keys and clicks with a single switch activation. `n Note that the leftmost 2 triggers take presidence of the other 3. In any case, avoid using the same definitions for more than 1 trigger, except for 'none'- the no trigger setting. Finally, you can save named setups to make reconfiguring SwitchWedge for favorite applications easy and quick.`n`n Other keyboard shortcuts:`n Press ~ to Suspend or Resume SwitchWedge. SwitchWedge must be resumed to record hotspots.`n Press Alt-s key combo to Shrink or Expand the SwitchWedge window. `n Press the Alt-t key combo to capture the name of the active window and to optionally save a setup with this name.`n`n Press the "Help" button in SwitchWedge to close this window.
HelpTitle = Some Mode
infoTitle = General Info About SwitchWedge

goSub, iniSetup

Gui,font,s10,Bold

Gui, Add, GroupBox, x108 y0 w134 h86
Gui, Add, GroupBox, x248 y0 w204 h86
Gui, Add, GroupBox, x108 y92 w345 h74
Gui, Add, Text, x2 y2 w100 h20, Operating As:
Gui, Add, Text, x305 y2 w96 h20, Other Remaps-
Gui, Add, Text, x2 y32 w100 h20 , Switch Triggers:
Gui, Add, Text, x184 y92 w200 h20 , Define Custom Key Sequences-
Gui, Add, Text, x2 y62 w100 h20 , Key Seq. Sent:
Gui, Add, Checkbox, x2 y92 gSetVars vStartOff Checked%StartOff%, Start SW Off?
Gui, Add, Text, x475 y32 w100 h20, Scan Rate:
Gui, Add, Text, x475 y62 w100 h20, Mask Time:
Gui, Add, Text, x475 y92 w120 h20, Mouse Speed:
Gui, Add, Checkbox, x475 y118 w120 Checked%slowSend% vslowSend gSetVars, Slow Send
Gui, Add, Text, x2 y174 w90, Get Setup:
Gui,font,,
Gui, Add, Text, x475 y142 w170 h80, Add new features to your DJ or Quizworks Switch Interface.`n`n--->Press ~ to Suspend/Resume
Gui, Add, DropDownList, x110 y2 w130 gSetMode vOpMode, %OpMode%||Single Switch|Two Switch|One Click|Two Click|Scan Mouse 1|Scan Mouse 2|Spot Scan 1|Spot Scan 2|2 Switch Spot Scan 1|2 Switch Spot Scan 2|Remap|Click List
Gui,Add, Button, x588 y2 w60 h20 gGetHelp, Help
Gui, Add, Button, x475 y2 w110 h20 gShrinkShow, Show/Hide Cntrls
Gui, Add, DropDownlist, x582 y92 w60 gsetVars vmouseSpeed, %mouseSpeed%||25|50|75|100|125|150|175|200|225
Gui, Add, DropDownList, x110 y32 w60 gSetVars vkeyIn1, %keyIn1%||0|1|2|3|Space|Enter|Tab|+Tab|BackSpace|Right|Left|Up|Down|LButton|RButton|MButton|Joy1|Joy2|Joy3|Joy4|Joy5|Joy6|Joy7|Joy8|none
Gui, Add, DropDownList, x180 y32 w60 gSetVars vkeyIn2, %keyIn2%||0|1|2|3|Space|Enter|Tab|+Tab|BackSpace|Right|Left|Up|Down|LButton|RButton|MButton|Joy1|Joy2|Joy3|Joy4|Joy5|Joy6|Joy7|Joy8|none
Gui, Add, DropDownList, x250 y32 w60 gSetVars vkeyIn3, %keyIn3%||0|1|2|3|Space|Enter|Tab|+Tab|BackSpace|Right|Left|Up|Down|LButton|RButton|MButton|Joy1|Joy2|Joy3|Joy4|Joy5|Joy6|Joy7|Joy8|none
Gui, Add, DropDownList, x320 y32 w60 gSetVars vkeyIn4, %keyIn4%||0|1|2|3|Space|Enter|Tab|+Tab|BackSpace|Right|Left|Up|Down|LButton|RButton|MButton|Joy1|Joy2|Joy3|Joy4|Joy5|Joy6|Joy7|Joy8|none
Gui, Add, DropDownList, x390 y32 w60 gSetVars vkeyIn5, %keyIn5%||0|1|2|3|Space|Enter|Tab|+Tab|BackSpace|Right|Left|Up|Down|LButton|RButton|MButton|Joy1|Joy2|Joy3|Joy4|Joy5|Joy6|Joy7|Joy8|none
Gui, Add, DropDownList, x110 y62 w60 gSetVars vMsg1, %Msg1%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg1%
Gui, Add, DropDownList, x180 y62 w60 gSetVars vMsg2, %Msg2%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg2%
Gui, Add, DropDownList, x250 y62 w60 gSetVars vMsg3, %Msg3%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg3%
Gui, Add, DropDownList, x320 y62 w60 gSetVars vMsg4, %Msg4%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg4%
Gui, Add, DropDownList, x390 y62 w60 gSetVars vMsg5, %Msg5%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg5%
Gui, Add, DropDownList, x582 y32 w60 gSetVars vScanRate, %scanRate%||1|2|3|4|5|6|7|10|15|20|30|45|60|90|120
Gui, Add, DropDownList, x582 y62 w60 gSetVars vMaskTimer, %maskTimer%||0|1|2|3|4|5|6|7|8
Gui, Add, Button, x110 y112 w60 h20 gsetCustom1, Set Seq. 1
Gui, Add, Button, x180 y112 w60 h20 gsetCustom2, Set Seq. 2
Gui, Add, Button, x250 y112 w60 h20 gsetCustom3, Set Seq. 3
Gui, Add, Button, x320 y112 w60 h20 gsetCustom4, Set Seq. 4
Gui, Add, Button, x390 y112 w60 h20 gsetCustom5, Set Seq. 5
Gui, Add, Button, x427 y142 w20 h20 gcustomHelp,?
Gui, Add, Edit, x112 y142 w310 h20 vCustom, Enter Your Custom Sequence Here
Gui, Add, DropDownList, x112 y174 w260 gpickSetup viniH, %iniH%||%SetupList%
Gui, Add, Button, x380 y174 w70 gsaveThisSetup, Save setup

Gui, Color, 37DFDF
CoordMode, Mouse, Screen
CoordMode, toolTip, Screen
GoSub, setVars
GoSub, loadSetupList
if (StartOff)
  {
     suspended = 1
     Suspend On
	 Gui, Show, x10 y10 %lastHgt% %lastWid%, SwitchWedge2 DW Edition OFF -->Setup for: %iniH%
  } Else
  {
    suspended = 0
	Suspend Off
	Gui, Show, x10 y10 %lastHgt% %lastWid%, SwitchWedge022724 ON -->Setup for: %iniH%
  }
 setTitleMatchMode 2
goSub, setMode
IfwinExist, SwitchWedge
{
  WinSet, AlwaysOnTop, On, SwitchWedge
}

return

m_x = 0
m_y = 0
tipText = ""

!m::	
	MouseGetPos, m_x, m_y,,
	tipText :=  "mouse position is " . m_x . " , " . m_y
	toolTip %tipText%
return

; dismiss tootip  --> Ctl+Alt+m
^!m::
	toolTip  
return

`::
+`::
Suspend
gosub, SuspendToggle
return

SuspendToggle:
 if !(suspended)
      {
        suspended = 1
        Suspend On
		goSub, KillScan
        msgBox, SwitchWedge Action is OFF - Press ~ to re-activate. Press Enter to close this box.
		Gui, Show, x10 y10 %lastHgt% %lastWid%, SwitchWedge Off -->Setup for: %iniH%
		WinRestore, SwitchWedge	
       }
    else
      {
        suspended = 0
        suspend Off
        msgBox, SwitchWedge Action is ON - Press Enter to close this box.
		Gui, Show, x10 y10 %lastHgt% %lastWid%, SwitchWedge On -->Setup for: %iniH%
		WinMinimize, SwitchWedge
      }
return

!s::
gosub, shrinkShow
return

!t::
suspend, permit
WinGetActiveTitle, SaveSetup
gosub, setupSaver
return

setupSaver:
 MsgBox,35, Change the name to save as a new setup, Yes = save, or rename this setup. No = Skip saving 
 ifMsgBox Yes
	{
	  inputBox, SaveSetup, You Can Save This Setup or Create a New One, For a new setup edit this setup name- current setup is:,,,,,,,,%SaveSetup% 
	  StringReplace, SaveSetup, SaveSetup, %bar_char%,, All
	  msgBox,1,Is the %SaveSetup% Setup OK to Save?,  Setup to be saved is called: %SaveSetup%
	  ifMsgBox OK
	    {
		   iniH = %SaveSetup%
		   guiControl,,iniH,|%iniH%||%SetupList%
		   gosub, saveIniSetup
		   if (suspended)
			{
				Gui, Show,, SwitchWedge Off -->Setup for: %iniH%
			}
			else
			{
				Gui, Show,, SwitchWedge On -->Setup for: %iniH%
			}
		   
		 }
	}
return


saveThisSetup:
 Gui,Submit,NoHide
 SaveSetup = %iniH%
gosub, setupSaver
return

GetHelp:
!F1::
suspend, permit
	run, SwitchWedgeHelp022724.html
return

; Record mouse positions over targets

!1::
suspend, permit
posIx := 1
if (posIx > spotIx) {
spotIx := posIx
scanSpotIx := 0
}
MouseGetPos, xpos%posIx%, ypos%posIx% 
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 }
 Gosub, saveIniSetup
return

!2::
suspend, permit
posIx := 2
scanSpotIx := 0
if (posIx > spotIx) {
spotIx := posIx
}
MouseGetPos, xpos%posIx%, ypos%posIx% 
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 }
 Gosub, saveIniSetup
return

!3::
suspend, permit
posIx := 3
scanSpotIx := 0
if (posIx > spotIx) {
spotIx := posIx
}
MouseGetPos, xpos%posIx%, ypos%posIx% 
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 }
 Gosub, saveIniSetup
return

!4::
suspend, permit
posIx := 4
scanSpotIx := 0
if (posIx > spotIx) {
spotIx := posIx
}
MouseGetPos, xpos%posIx%, ypos%posIx% 
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 }
 Gosub, saveIniSetup
return

!5::
suspend, permit
posIx := 5
scanSpotIx := 0
if (posIx > spotIx) {
spotIx := posIx
}
MouseGetPos, xpos%posIx%, ypos%posIx%
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 } 
 Gosub, saveIniSetup
return

!6::
suspend, permit
posIx := 6
scanSpotIx := 0
if (posIx > spotIx) {
spotIx := posIx
}
MouseGetPos, xpos%posIx%, ypos%posIx% 
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 }
 Gosub, saveIniSetup
return

!7::
suspend, permit
posIx := 7
scanSpotIx := 0
if (posIx > spotIx) {
spotIx := posIx
}
MouseGetPos, xpos%posIx%, ypos%posIx% 
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 }
 Gosub, saveIniSetup
return

!8::
suspend, permit
posIx := 8
scanSpotIx := 0
if (posIx > spotIx) {
spotIx := posIx
}
MouseGetPos, xpos%posIx%, ypos%posIx% 
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 }
 Gosub, saveIniSetup
return

!9::
suspend, permit
posIx := 9
scanSpotIx := 0
if (posIx > spotIx) {
spotIx := posIx
}
MouseGetPos, xpos%posIx%, ypos%posIx% 
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 }
 Gosub, saveIniSetup
return

!0::
suspend, permit
posIx := 10
scanSpotIx := 0
if (posIx > spotIx) {
spotIx := posIx
}
MouseGetPos, xpos%posIx%, ypos%posIx%
if (spotTalk)
 {
   InputBox, spotMsg%posIx%, Enter a verbal cue,,,,150,,,,,Nothing
 } 
 Gosub, saveIniSetup
return

!z::
suspend, permit
spotIx := 0
If (OpMode == "Spot Scan 1") OR (OpMode == "Spot Scan 2")
 {
  msgBox, Spot scan is reset.
 }
 If (OpMode == "Click List")
 {
   msgBox, Click List is reset.
 }
return


; Hotkeys for DJ switch interface, adapted mouse, and joystick buttons 1 to 8. If trigger (keyIn2)or(keyIn1) == hotkey
; then act according to OpMode, or else just pass key along. if keyIn3,4,5 == hotkey then send remapping.

$0::
whatBtn := 0
if (keyIn3 == 0)
  whatBtn := 3
if (keyIn4 == 0)
  whatBtn := 4
if (keyIn5 == 0)
  whatBtn := 5
if (keyIn1 == 0)
  whatBtn := 1
if (keyIn2 == 0)
  whatBtn := 2

if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send 0	
 }							
return


$1::
whatBtn := 0
if (keyIn3 == 1)
  whatBtn := 3
if (keyIn4 == 1)
  whatBtn := 4
if (keyIn5 == 1)
  whatBtn := 5
if (keyIn1 == 1)
  whatBtn := 1
if (keyIn2 == 1)
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send 1
 }
return

$2::
whatBtn := 0
if (keyIn3 == 2)
  whatBtn := 3
if (keyIn4 == 2)
  whatBtn := 4
if (keyIn5 == 2)
  whatBtn := 5
if (keyIn1 == 2)
  whatBtn := 1
if (keyIn2 == 2)
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send 2
 }
return

$3::
whatBtn := 0
if (keyIn3 == 3)
  whatBtn := 3
if (keyIn4 == 3)
  whatBtn := 4
if (keyIn5 == 3)
  whatBtn := 5
if (keyIn1 == 3)
  whatBtn := 1
if (keyIn2 == 3)
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send 3
 }
return

$Tab::
whatBtn := 0
if (keyIn1 == "Tab")
  whatBtn := 1
if (keyIn2 == "Tab")
  whatBtn := 2
if (keyIn3 == "Tab")
  whatBtn := 3
if (keyIn4 == "Tab")
  whatBtn := 4
if (keyIn5 == "Tab")
  whatBtn := 5
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send {Tab}
 }
return

$+Tab::
whatBtn := 0
if (keyIn1 == "+Tab")
  whatBtn := 1
if (keyIn2 == "+Tab")
  whatBtn := 2
if (keyIn3 == "+Tab")
  whatBtn := 3
if (keyIn4 == "+Tab")
  whatBtn := 4
if (keyIn5 == "+Tab")
  whatBtn := 5
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send {Shift}+{Tab}
 }
return

$Space::
whatBtn := 0
if (keyIn3 == "Space")
  whatBtn := 3
if (keyIn4 == "Space")
  whatBtn := 4
if (keyIn5 == "Space")
  whatBtn := 5
if (keyIn1 == "Space")
  whatBtn := 1
if (keyIn2 == "Space")
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send {Space}
 }
return

$Enter::
whatBtn := 0
if (keyIn3 == "Enter")
  whatBtn := 3
if (keyIn4 == "Enter")
  whatBtn := 4
if (keyIn5 == "Enter")
  whatBtn := 5
if (keyIn1 == "Enter")
  whatBtn := 1
if (keyIn2 == "Enter")
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send {Enter}
 }
return		

$Backspace::
whatBtn := 0
if (keyIn3 == "Backspace")
  whatBtn := 3
if (keyIn4 == "Backspace")
  whatBtn := 4
if (keyIn5 == "Backspace")
  whatBtn := 5
if (keyIn1 == "Backspace")
  whatBtn := 1
if (keyIn2 == "Backspace")
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send {Backspace}
 }
return

$Up::
whatBtn := 0
if (keyIn3 == "Up")
  whatBtn := 3
if (keyIn4 == "Up")
  whatBtn := 4
if (keyIn5 == "Up")
  whatBtn := 5
if (keyIn1 == "Up")
  whatBtn := 1
if (keyIn2 == "Up")
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send {Up}
 }
return

$Down::
whatBtn := 0
if (keyIn3 == "Down")
  whatBtn := 3
if (keyIn4 == "Down")
  whatBtn := 4
if (keyIn5 == "Down")
  whatBtn := 5
if (keyIn1 == "Down")
  whatBtn := 1
if (keyIn2 == "Down")
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send {Down}
 }
return

$Left::
whatBtn := 0
if (keyIn3 == "Left")
  whatBtn := 3
if (keyIn4 == "Left")
  whatBtn := 4
if (keyIn5 == "Left")
  whatBtn := 5
if (keyIn1 == "Left")
whatBtn := 1
if (keyIn2 == "Left")
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send {Left}
 }
return

$Right::
whatBtn := 0
if (keyIn3 == "Right")
  whatBtn := 3
if (keyIn4 == "Right")
  whatBtn := 4
if (keyIn5 == "Right")
  whatBtn := 5
if (keyIn1 == "Right")
  whatBtn := 1
if (keyIn2 == "Right")
  whatBtn := 2
if (whatBtn)
 {
   goSub, scanAction
 }
else
 {
   send {Right}
 }
return	

Joy1::
 whatBtn := 0
 if (keyIn3 == "Joy1")
  whatBtn := 3
if (keyIn4 == "Joy1")
  whatBtn := 4
if (keyIn5 == "Joy1")
  whatBtn := 5
 If (keyIn1 == "Joy1") 
    whatBtn := 1
 if (keyIn2 == "Joy1") 
    whatBtn := 2
 if (WhatBtn) 
    gosub, ScanAction
return

Joy2::
 whatBtn := 0
 if (keyIn3 == "Joy2")
  whatBtn := 3
if (keyIn4 == "Joy2")
  whatBtn := 4
if (keyIn5 == "Joy2")
  whatBtn := 5
 If (keyIn1 == "Joy2") 
    whatBtn := 1
 if (keyIn2 == "Joy2") 
    whatBtn := 2
 if (WhatBtn) 
    gosub, ScanAction
return

Joy3::
 whatBtn := 0
 if (keyIn3 == "Joy3")
  whatBtn := 3
if (keyIn4 == "Joy3")
  whatBtn := 4
if (keyIn5 == "Joy3")
  whatBtn := 5
 If (keyIn1 == "Joy3") 
    whatBtn := 1
 if (keyIn2 == "Joy3") 
    whatBtn := 2
 if (WhatBtn) 
    gosub, ScanAction
return

Joy4::
 whatBtn := 0
 if (keyIn3 == "Joy4")
  whatBtn := 3
if (keyIn4 == "Joy4")
  whatBtn := 4
if (keyIn5 == "Joy4")
  whatBtn := 5
 If (keyIn1 == "Joy4") 
    whatBtn := 1
 if (keyIn2 == "Joy4") 
    whatBtn := 2
 if (WhatBtn) 
    gosub, ScanAction
return

Joy5::
 whatBtn := 0
 If (keyIn1 == "Joy5") 
    whatBtn := 1
 if (keyIn2 == "Joy5") 
    whatBtn := 2
if (keyIn3 == "{Joy5}")
  whatBtn := 3
if (keyIn4 == "{Joy5}")
  whatBtn := 4
if (keyIn5 == "{Joy5}")
  whatBtn := 5
 if (WhatBtn) 
    gosub, ScanAction
return

Joy6::
 whatBtn := 0
 if (keyIn3 == "Joy6")
  whatBtn := 3
if (keyIn4 == "Joy6")
  whatBtn := 4
if (keyIn5 == "Joy6")
  whatBtn := 5
 If (keyIn1 == "Joy6") 
    whatBtn := 1
 if (keyIn2 == Joy6) 
    whatBtn := 2
 if (WhatBtn) 
    gosub, ScanAction
return

Joy7::
 whatBtn := 0
 If (keyIn1 == "Joy7") 
    whatBtn := 1
 if (keyIn2 == "Joy7") 
    whatBtn := 2
if (keyIn3 == "{Joy7}")
  whatBtn := 3
if (keyIn4 == "{Joy7}")
  whatBtn := 4
if (keyIn5 == "{Joy7}")
  whatBtn := 5
 if (WhatBtn) 
    gosub, ScanAction
return

Joy8::
 whatBtn := 0
 if (keyIn3 == "Joy8")
  whatBtn := 3
if (keyIn4 == "Joy8")
  whatBtn := 4
if (keyIn5 == "Joy8")
  whatBtn := 5
 If (keyIn1 == "Joy8") 
    whatBtn := 1
 if (keyIn2 == "Joy8") 
    whatBtn := 2
 if (WhatBtn) 
    gosub, ScanAction
return	

$Lbutton::
whatBtn:= 0
if (keyIn3 == "LButton")
  whatBtn := 3
if (keyIn4 == "LButton")
  whatBtn := 4
if (keyIn5 == "LButton")
  whatBtn := 5
if (keyIn1 == "LButton")
  whatBtn := 1
if (keyIn2 == "LButton")
  whatBtn := 2
if (whatBtn)
 { 
   goSub, scanAction
 }
else
 { 
   Click	
 }
return

$Rbutton::
whatBtn:= 0
if (keyIn3 == "RButton")
  whatBtn := 3
if (keyIn4 == "RButton")
  whatBtn := 4
if (keyIn5 == "RButton")
  whatBtn := 5
if (keyIn1 == "RButton")
  whatBtn := 1
if (keyIn2 == "RButton")
  whatBtn := 2
if (whatBtn)
 {
   
   goSub, scanAction
 }
else
 {
   
   Click right	
 }
return

$Mbutton::
whatBtn:= 0
if (keyIn3 == "MButton")
  whatBtn := 3
if (keyIn4 == "MButton")
  whatBtn := 4
if (keyIn5 == "MButton")
  whatBtn := 5
if (keyIn1 == "MButton")
  whatBtn := 1
if (keyIn2 == "MButton")
  whatBtn := 2
if (whatBtn)
 {
   
   goSub, scanAction
 }
else
 {
   
   Click middle	
 }
return

pickSetup:
reloading = 1
gosub setVars
Gui, Destroy
gosub, reLoad
Return

loadSetupList:
	menuList := ""
	separator := "|"
	lineItem := ""
	loop, read, %iniF%
		{
			if inStr(A_LoopReadLine, "[")
				{
					
					StringTrimLeft, lineItem, A_LoopReadLine, 1
					StringTrimRight, lineItem, lineItem, 1
					menuList := menuList . separator . lineItem
				}
			
		}
	
	StringTrimLeft, menuList, menuList, 1
	SetupList := menuList
	guiControl,,iniH, %iniH%|%SetupList%
	reloading = 1
return



; Turn on/off help screen

showInfo:
 if !(viewInfo)
   {
     Progress, m2 b2 w800 fs10 zh0 c00, %infoText%,,%infoTitle%
	 viewInfo = 1
	}
	else
	{ 
	  Progress, Off
	  viewInfo = 0
	 }
 
Return

customHelp:
 helpTitle = Custom Message Help
 helpText = Specify custom messages for Key Sequences Sent by first entering text into the edit box below the Define Custom Key Sequences buttons, and then by clicking one of them. This sets the key sequence to the custom message. The custom message also appears at the bottom of the Key Seq. Sent menus. Special characters like enter and space have to be enclosed in braces as in {enter} and {space}. Send a left mouse click with {click} and right click with {click right}. For modifier keys use the following:`n ! sends Alt `n + sends Shift `n ^ sends Ctrl `n # sends Win `n For example: !{f4} sends Alt F4 `nMultiple charaters can be strung together. Refer to the Send command in  Autohotkey help for more details.

 msgBox,0,%helpTitle%,%helpText%

return

DoHelp:

    msgBox,0,%helpTitle%,%helpText%

return

setCustom1:
Gui,Submit,NoHide
customMsg1 = %Custom%
Msg1 = %Custom%
guiControl,,Msg1,|%Msg1%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|{click 2}|%customMsg1%
goSub, saveIniSetup
return

setCustom2:
Gui,Submit,NoHide
customMsg2 = %Custom%
Msg2 = %Custom%
guiControl,,Msg2,|%Msg2%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|{click 2}|%customMsg2%
goSub, saveIniSetup
return

setCustom3:
Gui,Submit,NoHide
customMsg3 = %Custom%
Msg3 = %Custom%
guiControl,,Msg3,|%Msg3%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|{click 2}|%customMsg3%
goSub, saveIniSetup
return

setCustom4:
Gui,Submit,NoHide
customMsg4 = %Custom%
Msg4 = %Custom%
guiControl,,Msg4,|%Msg4%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|{click 2}|%customMsg4%
goSub, saveIniSetup
return


setCustom5:
Gui,Submit,NoHide
customMsg5 = %Custom%
Msg5 = %Custom%
guiControl,,Msg5,|%Msg5%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|{click 2}|%customMsg5%
goSub, saveIniSetup
return

GuiControlShowHide(controls,state){

	Loop,Parse,controls,|

	GuiControl, %state%,%A_LoopField%

}

ShrinkShow:
if (shrunk)
  {
    Gui, Show, x10 y10 %winHgtMax% %winWid%
    lastHgt = %wingHgtMax%
    lastWid = %winWid%
    shrunk = 0
   }
 else
   {
     Gui, Show, x10 y10 %winHgtMin% %winWidMin%
     lastHgt = %wingHgtMin%
     lastWid = %winWidMin%
     shrunk = 1
   }
return


SetMode:
Gui,Submit,NoHide
GuiControlShowHide("MaskTimer|ScanRate|Msg1|Msg2|mouseSpeed","Show") 
scanner = 0
spotTalk = 0
goSub, saveIniSetup
If (OpMode == "Single Switch")
 {
   Scanner = 1
   helpTitle = Single Switch Mode
   helpText = Single Switch mode starts and stops an autoscan. The Trigger defines which key, other input option controls the scan. The Key Seq. Sent menus define which key(s) to use to highlight scannable items (1st menu,) and which key to use to select the highlighted item (2nd menu)- e.g. Tab and Enter. Highlighting proceeds automatically at the Scan Rate. 
   GuiControlShowHide("MaskTimer|mouseSpeed","Hide")
 if !(noHelp)
  {
   goSub, DoHelp
  }
 }
If (OpMode == "Two Switch")
 {
   helpTitle = Two Switch Mode
   helpText = Two Switch mode simply remaps the trigger keys. You can generate a two-switch, user directed scan where the Key Trigger menus define which keystroke(s) will advance the highlight (1st menu), and which keystroke selects the highlighted item (2nd menu.) Key Seq. Sent defines what keys are sent when the trigger keys are pressed. Scan Rate, Mask Time and Mouse Speed are ignored.
   GuiControlShowHide("MaskTimer|ScanRate|mouseSpeed","Hide")
  if !(noHelp)
  {
   goSub, DoHelp
  }
 
 }

 If (OpMode == "One Click")
 {
   helpTitle = One Click Mode
   helpText = The Key Trigger identifies which a key will send a left click to a previously identified target. To record the target position, first activate SwitchWedge (use the ~ key). Then hover the mouse cursor over the target and use the Alt-1 keyboard combo to record it. (The Win key looks flag like and is between the Ctrl and Alt keys.) Mask Time defines how long after a click that addtional key presses are ignored. Key Seq. Sent and Scan Rate are ignored.
   GuiControlShowHide("ScanRate|Msg1|Msg2|mouseSpeed","Hide")   
 if !(noHelp)
  {
   goSub, DoHelp
  }
}
If (OpMode == "Two Click")
 {
   helpTitle = Two Click Mode
   helpText = Key Trigger defines which key ot other input option starts a sequence where left click is sent to a first target, and after a defined interval (Scan Rate) another left click is sent to a second target. Hover the mouse cursor over target 1 and use the Alt-1 keyboard combo to record its positon. Similarly, use Alt-2 to record target 2. Scan Rate sets the time between the two clicks, and Mask Time defines how long after a the 1st click that addtional key presses are ignored. Key Sequences are not sent. 
  GuiControlShowHide("Msg1|Msg2|mouseSpeed","Hide")
  if !(noHelp)
  {
   goSub, DoHelp
  }
}
If (OpMode == "Remap")
 {
   helpTitle = Remap Mode
   helpText = Each trigger  can send whatever message is defined by the associated Key Seq. Msg settings to the active application. Mask Time defines how long after a switch activation that additional switch presses are ignored. Scan rate is not relevant. Set the Mask Time to zero for the fastest response.
  GuiControlShowHide("ScanRate|mouseSpeed","Hide")
  if !(noHelp)
  {
   goSub, DoHelp
  }
}
If (OpMode == "Scan Mouse 1")
 {
   helpTitle = Scan Mouse 1
   helpText = Either Key Trigger you choose can start or stop scanning mouse actions. Potential actions appear as tool tips near the mouse cursor indicating mouse behaviors like which direction the cursor moves, or which mouse button actions to issue. Mouse Speed defines how fast the mouse moves where smaller numbers make the mouse faster. A good value to start with is 100. A drag action ends when the user selects 'Click' from the 'Mouse Clicks' scan sequence.
  GuiControlShowHide("MaskTimer|Msg1|Msg2","Hide")
  cbTTS = 0
   if !(noHelp)
  {
   goSub, DoHelp
  }
 }
If (OpMode == "Scan Mouse 2")
 {
   helpTitle = Scan Mouse 2
   helpText = Like Scan Mouse 1 but also copies the tooltip text to the clipboard so that a clipboard reading text-to-speech program like TTSreader, Deskbot or Deskbot can provide auditory support. Key Trigger defines which key(s) start or stop scanning mouse actions. Actions appearing as tool tips near the mouse cursor indicate potential mouse behaviors like which direction the cursor moves, or different mouse button actions. Mouse Speed defines how fast the mouse moves where smaller numbers make the mouse faster. A good value to start with is 100. A drag action ends when the user selects 'Click' from the 'Mouse Clicks' scan sequence.
   GuiControlShowHide("MaskTimer|Msg1|Msg2","Hide")  
  cbTTS = 1
   if !(noHelp)
  {
   goSub, DoHelp
  }
 }
 If (OpMode == "Spot Scan 1") OR (OpMode == "Spot Scan 2")
 { 
   spotTalk = 0
   if (OpMode == "Spot Scan 2")
    {
	  spotTalk = 1
	}
   helpTitle = Spot Scan
   helpText = Spot scan allows you to define up to 10 hot spots that will be scanned in numerical order. Identify the first hotspot by hovering the mouse cursor over the first target and capturing the mouse position with the Alt-1 key combo. The second hotspot is recorded with the Alt-2 combo, and so forth up to the tenth hotspot that is recorded with the Alt-0 key combo. Use Alt-z to clear the scan sequence. Key Trigger defines which key is used to start or stop scanning which occurs at the Scan Rate. Spot Scan 2 provides for auditory cues with the help of a clipboard text-to-speech utility like Deskbot or TTSReader. Spot Scan 1 does not offer auditory cues, but the application being scanned may be able to supply a cue as a result of a 'mouse-over' event. ----Press Enter to close this box.
   GuiControlShowHide("MaskTimer|Msg1|Msg2|mouseSpeed","Hide")
   cbTTS = 0
   escToggle = 1
   spotScanIx = 0
   if !(noHelp)
  {
   goSub, DoHelp
  }
 }
 If (OpMode == "2 Switch Spot Scan 1") OR (OpMode == "2 Switch Spot Scan 2")
 { 
   spotTalk = 0
   if (OpMode == "2 Switch Spot Scan 2")    {
	  spotTalk = 1
	}
   helpTitle = 2 Switch Spot Scan
   helpText = 2 Switch Spot scan allows you to define up to 10 hot spots that will be scanned in numerical order. Identify the first hotspot by hovering the mouse cursor over the first target and capturing the mouse position with the Alt-1 key combo. The second hotspot is recorded with the Alt-2 combo, and so forth up to the tenth hotspot that is recorded with the Alt-0 key combo. Use Alt-z to clear the scan sequence. The leftmost key trigger defines which key is used to move the cursor or and the seconf key trigger defines which key clicks the current hotspot. 2 Switch Spot Scan 2 provides for auditory cues with the help of a clipboard text-to-speech utility like Deskbot or TTSReader. Spot Scan 1 does not offer auditory cues, but the application being scanned may be able to supply a cue as a result of a 'mouse-over' event. ----Press Enter to close this box.
   GuiControlShowHide("MaskTimer|Msg1|Msg2|mouseSpeed","Hide")
   cbTTS = 0
   escToggle = 1
   spotScanIx = 0
   if !(noHelp)
  {
   goSub, DoHelp
  }
 }
 If (OpMode == "Click List")
 { 
   spotTalk = 0
   if (OpMode == "Spot Scan 2")
    {
	  spotTalk = 1
	}
   helpTitle = Click List
   helpText = Click List allows you to define up to 10 hot spots that will be clicked on in numerical order with each trigger. After the highest number hotspot is clicked the list will be reset to the first hot spot. Identify the first hotspot by hovering the mouse cursor over the first target and capturing the mouse position with the Alt-1 key combo. The second hotspot is recorded with the Alt-2 combo, and so forth up to the tenth hotspot that is recorded with the Alt-0 key combo. Use Alt-z to clear the Click List sequence. Key Trigger defines which key is used to send clicks.  ----Press Enter to close this box.
   GuiControlShowHide("ScanRate|MaskTimer|Msg1|Msg2|mouseSpeed","Hide")
   cbTTS = 0
   escToggle = 1
   spotScanIx = 0
   if !(noHelp)
  {
   goSub, DoHelp
  }
 }
 
if (noHelp)
  {
   noHelp := 0
  }
return

; Routine selects action according the OpMode as a result of a
; trigger being pressed.

scanAction:
if (whatBtn < 3)
{
 if (OpMode == "Two Switch")
 {
   if (whatBtn = 2)
     {
       goSub, SelectItem
     }
   else
     {
       goSub, HiliteNext
     }
  }

 If (OpMode == "Single Switch")
  { 
    If (scanning)
      {
        scanning := 0
        SetTimer, HiliteNext, off
        goSub, SelectItem
       }
     else
       {
         scanning := 1
         goSub, HiliteNext
         dt := 1000 * scanRate
         SetTimer, HiliteNext, %dt%
       }    
   }
  If (OpMode == "One Click") OR (OpMode == "Two Click") OR (OpMode == "Remap")
  {
    goSub, ClickAction
  }
  if (OpMode == "Scan Mouse 1") OR (OpMode == "Scan Mouse 2")
   {
     goSub, mouseScan
   }
   If ((OpMode == "Spot Scan 1") OR (OpMode == "Spot Scan 2")) AND (spotIx > 0)
   { 
    If (scanning) 
      {
        scanning := 0
        SetTimer, SpotHiliteNext, off
        goSub, SpotSelectItem
       }
     else
       {
         scanning := 1
         goSub, SpotHiliteNext
         dt := 1000 * scanRate
         SetTimer, SpotHiliteNext, %dt%
       }    
   }
   If (OpMode == "Click List") AND (spotIx > 0)
   { 
    
        goSub, SpotHiliteNext
		goSub, SpotSelectItem
          
   }
   if (((OpMode == "2 Switch Spot Scan 1") OR (OpMode == "2 Switch Spot Scan 2")) AND (spotIx > 0))
 {
   if (whatBtn = 2)
     {
       goSub, SpotSelectItem
     }
   else
     {
       goSub, SpotHiliteNext
     }
  }
 }
 
   
 if (whatBtn == 3)
       {
         Send %Msg3%
        }
if (whatBtn == 4)
       {
         Send %Msg4%
        }
if (whatBtn == 5)
       {
         Send %Msg5%
        }
return

; Click on identified target(s)

ClickAction:
if (notMasking)
{
  notMasking = 0
  clickIx = 1
  gosub, doClickIx
  dt := -1000 * ScanRate
  mt := -1000 * MaskTimer
  setTimer, maskIt, %mt%
  if (OpMode == "Two Click")
    {
      clickIx = 2
      setTimer,doClickIx,%dt%
    }
  
}
return

doClick:
  click %xpos%, %ypos%
return

maskIt:
  notMasking = 1
return

doClick2:
  click %x2pos%, %y2pos%
return

doClickIx:
 if (OpMode == "Remap")
   {
     if (whatBtn == 1)
       {
         Send %Msg1%
        }
     if (whatBtn == 2)
       {
         Send %Msg2%
       }
   }
 else
   {
     xp := xpos%clickIx%
     yp := ypos%clickIx%
     click %xp%, %yp%
   }
return


SetVars:
Gui,Submit,NoHide
gosub, KillScan
if %slowSend%
	{
		setKeyDelay, 100
		
	}
	else
	{
		setKeyDelay, 0
		
	}
setHotkeys("0|1|2|3|Space|Enter|Tab|+Tab|BackSpace|Right|Left|Up|Down|LButton|RButton|MButton|Joy1|Joy2|Joy3|Joy4|Joy5|Joy6|Joy7|Joy8","Off")
hkStr = %keyIn1%|%keyIn2%|%keyIn3%|%keyIn4%|%keyIn5%
setHotkeys(hkStr,"On")
if ! reloading
	{
		gosub, saveIniSetup
	}
	else 
	{
		reloading = 0
	}
guiControl,,Msg1,|%Msg1%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg1%
guiControl,,Msg2,|%Msg2%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg2%
guiControl,,Msg3,|%Msg3%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg3%
guiControl,,Msg4,|%Msg4%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg4%
guiControl,,Msg5,|%Msg5%||{Tab}|{Enter}|{Space}|{Right}|{Left}|{Up}|{Down}|+{Tab}|0|1|2|3|4|{click}|{click right}|%customMsg5%
return


; Keyboard scan routines

HiliteNext:
Send %Msg1%
return

SelectItem:
Send %Msg2%
return

;spot scan routines 

SpotHiliteNext:
++scanSpotIx
xp := xpos%scanSpotIx%
yp := ypos%scanSpotIx%
mouseMove, %xp%, %yp%, 0
if (spotTalk)
 {
   cue := spotMsg%scanSpotIx%
   clipboard = %cue%
 }
if (spotIx == scanSpotIx)
  {
    scanSpotIx := 0
  }
return

SpotSelectItem:
xp := xpos%scanSpotIx%
yp := ypos%scanSpotIx%
Click, %xp%, %yp% 
return



; Mouse scan routines currently supports two sets of 5 states:
; as         Moves        or    Clicks
; 0 - Either Up           or    Click
; 1 - Either Right        or    Double Click
; 2 - Either Down         or    Right Click
; 3 - Either Left         or    Drag
; 4 - Either Mouse Clicks or    Mouse Moves

mouseScan:
if (moving)
 {
   moving := 0
   setTimer, mMouse, off 
 }
if (scanning)
 {
    if (mouseState < 4)
     {
      scanning := 0
      SetTimer, nextMouseAction, off
      goSub, TTHide
      goSub, doMouseAction
        
     }
    else
     {
       scanMouseMode := !(scanMouseMode)
  
     }
 
 }
 else
  {
    scanning := 1
    goSub, nextMouseAction
    dt := 1000 * scanRate
    SetTimer, nextMouseAction, %dt%
 }
return

doMouseAction:

   if (scanMouseMode)
    {
      moving := 1
      SetTimer, mMouse, %mouseSpeed%
    }
   else
   {
      goSub, cMouse
   }
 
return



mMouse:
if (mouseState == 0)
 {
   goSub, mmUp
 }
if (mouseState == 1)
 {
   goSub, mmRight
 }
if (mouseState == 2)
 {
   goSub, mmDown
 }
if (mouseState == 3)
 {
   goSub, mmLeft
 }
return

cMouse:

if (mouseState == 0)
 {
   click 
 }
if (mouseState == 1)
 {
   click 2 
 }
if (mouseState == 2)
 {
   click right 
 }
if (mouseState == 3)
 {
  if (dragging)
   {
     dragging := 0
     click up
   }
  else
   {
     click down 
     dragging := 1  
     scanning := 1
     mouseState:= 4
    
    dt := 1000 * scanRate
    SetTimer, nextMouseAction, %dt%
    }
 }
scanMouseMode := 1
mouseState:= 4
return

nextMouseAction:
MouseGetPos, xPos, yPos
mouseState += 1
 if (mouseState == 5)
  {
    mouseState := 0
  }
 if (scanMouseMode)
   {
     if (mouseState == 0)
      {
        ttText := "Up"
      }
     if (mouseState == 1)
      {
        ttText := "Right"
      }
     if (mouseState == 2)
      {
        ttText := "Down"
      }
     if (mouseState == 3)
      {
        ttText := "Left"
      }
     if (mouseState == 4)
      {
        ttText := "Mouse Clicks"
        
      }
   }
 else
   {
    if (mouseState == 0)
     {
       ttText := "Click"
     }
    if (mouseState == 1)
     {
       ttText := "Double Click"
     }
    if (mouseState == 2)
     {
       ttText := "Right Click"
     }
    if (mouseState == 3)
     {
       ttText := "Drag"

     }
    if (mouseState == 4)
     {
       ttText := "Mouse Moves"
      
     }
 
   }
 
 goSub, TTShow
 return

mmRight:
mouseMove, mouseOffset, 0, 0, R
MouseGetPos, xPos, yPos
Return

mmLeft:
mouseMove, -1*(mouseOffset), 0, 0, R
MouseGetPos, xPos, yPos
Return

mmDown:
mouseMove, 0, mouseOffset, 0, R
MouseGetPos, xPos, yPos
return

mmUp:
mouseMove, 0, -1*(mouseOffset), 0, R
MouseGetPos, xPos, yPos
return

TTShowHide:
if (ttVisible)
 {
   ttVisible = 0
   toolTip,,xPos,Ypos
 }
 else
 {
  ttVisible = 1
  toolTip, %ttText%, xPos, yPos
  if cbTTS
   {
    clipboard=%ttText%
   }
 }
return

TTShow:

 ttVisible = 1
 toolTip, %ttText%, xPos, yPos
 if cbTTS
   {
    clipboard=%ttText%
   }
 
return

TTHide:
 ttVisible = 0
 toolTip,,xPos,Ypos
return

;turn hotkeys or triggers on or off

setHotkeys(list,state)
{
Loop,Parse,list,|

	if Not(A_LoopField = "none")
		{
			hotkey, %A_LoopField%, %state%
		}
}

; brute force halt scanning of any type, conclude mouse actions as well

KillScan:
	scanning := 0
	SetTimer, nextMouseAction, off
	SetTimer, SpotHiliteNext, off
	SetTimer, HiliteNext, off
	moving := 0
	dragging := 0
    click up
    setTimer, mMouse, off 
	goSub, TTHide
	
return

; ini routines for reading and saving setup 

iniGet(iniKey,inF,inS)
{
  
  iniRead, iniVar,%inF%,%inS%,%iniKey%
  if (iniVar == "ERROR")
   {
     msgBox Initalization error - %iniKey%, or %inF%, or %inS%, not found or misspelled
     
   }
  else
   {
     return iniVar
   }
}

iniSetup:
  StartOff := iniGet("StartOff",iniF,iniH)
  scanRate := iniGet("scanRate",iniF,iniH)
  maskTimer := iniGet("maskTimer",iniF,iniH)
  OpMode := iniGet("OpMode",iniF,iniH)
  mouseSpeed := iniGet("mouseSpeed",iniF,iniH)
  keyIn1 := iniGet("keyIn1",iniF,iniH)
  keyIn2 := iniGet("keyIn2",iniF,iniH)
  keyIn3 := iniGet("keyIn3",iniF,iniH)
  keyIn4 := iniGet("keyIn4",iniF,iniH)
  keyIn5 := iniGet("keyIn5",iniF,iniH)
  Msg1 := iniGet("Msg1",iniF,iniH)
  Msg2 := iniGet("Msg2",iniF,iniH)
  Msg3 := iniGet("Msg3",iniF,iniH)
  Msg4 := iniGet("Msg4",iniF,iniH)
  Msg5 := iniGet("Msg5",iniF,iniH)
  customMsg1 := iniGet("customMsg1",iniF,iniH)
  customMsg2 := iniGet("customMsg2",iniF,iniH)
  customMsg3 := iniGet("customMsg3",iniF,iniH)
  customMsg4 := iniGet("customMsg4",iniF,iniH)
  customMsg5 := iniGet("customMsg5",iniF,iniH)
  spotIx := iniGet("spotIx",iniF,iniH)
  xpos1 := iniGet("xpos1",iniF,iniH)
  ypos1 := iniGet("ypos1",iniF,iniH)
  xpos2 := iniGet("xpos2",iniF,iniH)
  ypos2 := iniGet("ypos2",iniF,iniH)
  xpos3 := iniGet("xpos3",iniF,iniH)
  ypos3 := iniGet("ypos3",iniF,iniH)
  xpos4 := iniGet("xpos4",iniF,iniH)
  ypos4 := iniGet("ypos4",iniF,iniH)
  xpos5 := iniGet("xpos5",iniF,iniH)
  ypos5 := iniGet("ypos5",iniF,iniH)
  xpos6 := iniGet("xpos6",iniF,iniH)
  ypos6 := iniGet("ypos6",iniF,iniH)
  xpos7 := iniGet("xpos7",iniF,iniH)
  ypos7 := iniGet("ypos7",iniF,iniH)
  xpos8 := iniGet("xpos8",iniF,iniH)
  ypos8 := iniGet("ypos8",iniF,iniH)
  xpos9 := iniGet("xpos9",iniF,iniH)
  ypos9 := iniGet("ypos9",iniF,iniH)
  xpos10 := iniGet("xpos10",iniF,iniH)
  ypos10 := iniGet("ypos10",iniF,iniH)
   slowSend := iniGet("slowSend",iniF,iniH)
  
return

saveIniSetup:
  iniWrite, %StartOff%, %iniF%, %iniH%, StartOff
  iniWrite, %scanRate%, %iniF%, %iniH%, scanRate
  iniWrite, %maskTimer%, %iniF%, %iniH%, maskTimer
  iniWrite, %OpMode%, %iniF%, %iniH%, OpMode
  iniWrite, %mouseSpeed%, %iniF%, %iniH%, mouseSpeed
  iniWrite, %keyIn1%, %iniF%, %iniH%, keyIn1
  iniWrite, %keyIn2%, %iniF%, %iniH%, keyIn2
  iniWrite, %keyIn3%, %iniF%, %iniH%, keyIn3
  iniWrite, %keyIn4%, %iniF%, %iniH%, keyIn4
  iniWrite, %keyIn5%, %iniF%, %iniH%, keyIn5
  iniWrite, %Msg1%, %iniF%, %iniH%, Msg1
  iniWrite, %Msg2%, %iniF%, %iniH%, Msg2
  iniWrite, %Msg3%, %iniF%, %iniH%, Msg3
  iniWrite, %Msg4%, %iniF%, %iniH%, Msg4
  iniWrite, %Msg5%, %iniF%, %iniH%, Msg5
  iniWrite, %customMsg1%, %iniF%, %iniH%, customMsg1
  iniWrite, %customMsg2%, %iniF%, %iniH%, customMsg2
  iniWrite, %customMsg3%, %iniF%, %iniH%, customMsg3
  iniWrite, %customMsg4%, %iniF%, %iniH%, customMsg4
  iniWrite, %customMsg5%, %iniF%, %iniH%, customMsg5
  iniWrite, %spotIx%, %iniF%, %iniH%, spotIx
  iniWrite, %xpos1%, %iniF%, %iniH%, xpos1
  iniWrite, %ypos1%, %iniF%, %iniH%, ypos1
  iniWrite, %xpos2%, %iniF%, %iniH%, xpos2
  iniWrite, %ypos2%, %iniF%, %iniH%, ypos2
  iniWrite, %xpos3%, %iniF%, %iniH%, xpos3
  iniWrite, %ypos3%, %iniF%, %iniH%, ypos3
  iniWrite, %xpos4%, %iniF%, %iniH%, xpos4
  iniWrite, %ypos4%, %iniF%, %iniH%, ypos4
  iniWrite, %xpos5%, %iniF%, %iniH%, xpos5
  iniWrite, %ypos5%, %iniF%, %iniH%, ypos5
  iniWrite, %xpos6%, %iniF%, %iniH%, xpos6
  iniWrite, %ypos6%, %iniF%, %iniH%, ypos6
  iniWrite, %xpos7%, %iniF%, %iniH%, xpos7
  iniWrite, %ypos7%, %iniF%, %iniH%, ypos7
  iniWrite, %xpos8%, %iniF%, %iniH%, xpos8
  iniWrite, %ypos8%, %iniF%, %iniH%, ypos8
  iniWrite, %xpos9%, %iniF%, %iniH%, xpos9
  iniWrite, %ypos9%, %iniF%, %iniH%, ypos9
  iniWrite, %xpos10%, %iniF%, %iniH%, xpos10
  iniWrite, %ypos10%, %iniF%, %iniH%, ypos10
  iniWrite, %slowSend%, %iniF%, %iniH%, slowSend
return

Return

GuiClose:


ExitApp