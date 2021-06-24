#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv
#SingleInstance, Force
#InstallKeybdHook
#MaxHotkeysPerInterval, 5000
#UseHook, On
IfWinNotExist, Cheat Engine 7.2
{
	run, C:\VC\Cheat Engine.lnk
	sleep, 2000
	WinMaximize, Cheat Engine 7.2
}

global accountNum := 10001
global ComputerID := 
global CurrentEmail := "blabla@gmail.com"
global LevelupOnce := 0
global RecoverEmail :=
global Pword := "Seven7752326"
CID_Loc := a_scriptdir "\.."
IfWinNotExist, ahk_exe Capture2Text.exe
{
 run, %CID_Loc%\Capture2Text\Capture2Text.exe
}
FileCreateDir, %CID_Loc%/VC Accounts
if(!FileExist(CID_Loc . "/VC Accounts/Computer_ID.txt")){
	FileAppend, , %CID_Loc%\VC Accounts\Computer_ID.txt
}
if(!FileExist(CID_Loc . "/VC Accounts/accountNum.txt")){
	FileAppend, 1, %CID_Loc%\VC Accounts\accountNum.txt
}else{
	FileRead, accountNum, %CID_Loc%\VC Accounts\accountNum.txt
}
FileRead, ComputerID, %CID_Loc%\VC Accounts\Computer_ID.txt
global storyfound := 0
SetBatchLines, -1
DllCall("dwmapi\DwmEnableComposition", "uint", 0)
global NeedToGoBack := false
global stuckrunning := 0
global reset := 0
global editscreenNum := 0
global teamnum := 2
global buytickets := 0
global plusX :=
global plusY :=
global stuck := 0
global stuckblack := 0
^w::pause
^Right::    send,{end}
^Left::     send,{Home}
^down::     send,^{end}
^up::       send,^{home}
^+Right::   send,+{end}
^+Left::    send,+{home}
^+down::    send,^+{end}
^+up::      send,^+{home}
settimer, CheckClipboard, 200
#c::
activateCE:
WinShow, Cheat Engine 7.2
WinActivate, Cheat Engine 7.2
Return
CheckClipboard:
if(clipboard == "RerollPart1Done"){
clipboard :=
MsgBox, , Done Part 1
}
Return
IncreaseAccountNum:
accountNum++
FileDelete, %CID_Loc%\VC Accounts\accountNum.txt
sleep, 100
FileAppend, %accountNum%, %CID_Loc%\VC Accounts\accountNum.txt
Return
f7::
closeVC:
DllCall("EndTask"
, Ptr , WinExist("ahk_exe ValkyrieConnect.exe")
, UInt, false
, UInt, true) ; force
Return
RerollVCbat:
run, %a_scriptdir%\Reroll VC.bat
sleep, 3000
clipboard :=
clipboard := "Yes"
send, {ctrldown}v{ctrlup}{enter}
sleep, 1000
Return
RunVC:
run, %a_scriptdir%\VALKYRIE CONNECT.url
Return
#v::
ActivateVC:
WinActivate, Valkyrie Connect WW
WinShow, Valkyrie Connect WW
Return

~f2::
XButton2::
Reload
return
F6::
MsgBox, , %ComputerID%
Return
F5::

clipboard :=
MouseGetPos, X, Y
if(X < 0){
X += 1024
}
clipboard = mousemove, %X%,%Y%`nclick down`nsleep, 60`nclick up
clipwait
ToolTip, Mouseclick copied
sleep, 300
tooltip, 
Return
~^space::
KeyWait, Lbutton,D
MouseGetPos, x1, y1
sleep, 300
KeyWait, Lbutton,U
MouseGetPos, x2, y2
clipboard :=
clipwait, 25

;x1 := Round(x1 )
;x3 := (x2 - x1)/2
;if(x3 > 960){
;x2 -= 1920
if(x2 < 0){
	x2+= 1024
}
x3 := (x2 - x1)/2

y3 := (y2 - y1)/2
x3 += x1 
y3 += y1

x3 := Round(x3)
y3 := Round(y3)
clipboard = ImageSearch, OutputVarX, OutputVarY, %x1%-90, %y1%-90, %x2%+90, %y2%+90, *95 %clipboard% `nif(ErrorLevel == 0){`nLoop, 1`n{`nmousemove, %x3%,%y3%`nclick down`nsleep, 20`nclick up`n}`n}
Return

^F7::
tooltip, Press Rbutton on top left of area 
KeyWait, Rbutton,D
MouseGetPos, x1, y1
sleep, 600
tooltip, Press Rbutton on top left of area 
KeyWait, Rbutton,D
sleep, 600
MouseGetPos, x2, y2
Tooltip, Click a unique color of what you want to click 
KeyWait, Rbutton,D
sleep, 600
MouseGetPos, x, y
PixelGetColor, c, x,y

clipboard = PixelSearch, tx, ty, %x1%, %y1%, %x2%, %y2%, %c%, 2, Fast`nif(ErrorLevel == 0){`n}
Return
^f8::
tooltip, Press Rbutton on top left of area 
sleep, 300
tooltip,
KeyWait, Rbutton,D
MouseGetPos, x1, y1
sleep, 600
tooltip, Press Rbutton on top left of area 
sleep, 300
tooltip,
KeyWait, Rbutton,D
sleep, 600
MouseGetPos, x2, y2
clipboard = run, cmd.exe /c C:\Capture2Text\Capture2Text_CLI.exe --scale-factor "5" --screen-rect "%x1% %y1% %x2% %y2%"  --clipboard,, hide
Return
^9::
Return
^0::
gosub, closeVC
sleep, 500
gosub, RerollVCbat
sleep, 500
gosub, RunVC
sleep, 8000
run, C:\VC\RerollPart1.exe
Return