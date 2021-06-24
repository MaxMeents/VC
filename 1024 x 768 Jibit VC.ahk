
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv
#InstallMouseHook 
#SingleInstance, Force
#MaxHotkeysPerInterval, 5000
IfWinNotExist, Cheat Engine 7.2
{
	run, C:\VC\Cheat Engine.lnk
	sleep, 2000
	WinMaximize, Cheat Engine 7.2
}
global stillon := 0
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
TakeScreenshot:
gui, destroy
clipboard :=
sleep, 100
send, ^{space} 
~^space::
reset := 0
Loop{
if GetKeyState("Lbutton") ; While left mouse button is being held:
{
if(reset < 1){
MouseGetPos, x1, y1
}	
  
  reset++
}else{
	if(reset > 0){
	break

}

}
}
MouseGetPos, x2, y2
clipwait, 10
StringReplace, clipboard, clipboard, C:\VC, %A_Scriptdir%
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


HeroQuestTimer:
gui, destroy
gosub, ActivateVC
settimer, HeroQuest, 100
Return

HeroQuest:
ImageSearch, OutputVarX, OutputVarY, 793-25, 593-25, 823+25, 627+25, *50 %a_scriptdir%\Pictures\2021-06-12 18_13_34-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 808,610
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 401-25, 243-25, 438+25, 284+25, *50 %a_scriptdir%\Pictures\2021-06-12 18_13_44-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 420,264
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 480-25, 640-25, 542+25, 671+25, *50 %a_scriptdir%\Pictures\2021-06-12 18_14_00-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 511,656
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 663-25, 644-25, 821+25, 672+25, *30 %a_scriptdir%\Pictures\2021-06-12 06_17_25-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 5
{
mousemove, 742,658
click down
sleep, 20
click up
}
settimer, HeroQuest, off 
sleep, 500
settimer, HeroQuestSelectLock, 100
}
Return
HeroQuestSelectLock:
reset++
if(reset > 9){
reset := 0
mousemove, 563,497
send, {wheelup 200}
sleep, 1000
}
sleep, 500
ImageSearch, OutputVarX, OutputVarY, 814, 193, 906, 620, *80  %a_scriptdir%\Pictures\2021-06-12 14_06_50-Valkyrie Connect WW.png 
if(ErrorLevel == 0){

OutputVarX := OutputVarX
OutputVarY := OutputVarY
Loop, 1
{

mousemove, 566,656
click down
sleep, 60
click up
mousemove, 566,656
click down
sleep, 60
click up

sleep, 200	
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
settimer, HeroQuestSelectLock, off 
settimer, HeroQuestInner, 100
}
}
ImageSearch, OutputVarX, OutputVarY, 443, 164, 518, 621, *50 %a_scriptdir%\Pictures\2021-06-12 13_58_26-Valkyrie Connect WW.png 
if(ErrorLevel == 0){

OutputVarX := OutputVarX
OutputVarY := OutputVarY
Loop, 1
{

mousemove, 566,656
click down
sleep, 60
click up
mousemove, 566,656
click down
sleep, 60
click up

sleep, 200	
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
settimer, HeroQuestSelectLock, off 
settimer, HeroQuestInner, 100
}
}
ImageSearch, OutputVarX, OutputVarY, 443, 175, 903, 637, 399+25, *50 C:\Users\User\Documents\GitHub\Bleach 2\ValkarieConnect\Pictures\2021-06-12 08_22_23-Valkyrie Connect WW.png 
if(ErrorLevel == 0){

OutputVarX := OutputVarX
OutputVarY := OutputVarY
Loop, 1
{

mousemove, 566,656
click down
sleep, 60
click up
mousemove, 566,656
click down
sleep, 60
click up

sleep, 200	
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
settimer, HeroQuestSelectLock, off 
settimer, HeroQuestInner, 100
}
}
ImageSearch, OutputVarX, OutputVarY,  443, 175, 903, 637, *120 %a_scriptdir%\Pictures\2021-06-12 06_28_22-Valkyrie Connect WW.png 
if(ErrorLevel == 0){

OutputVarX := OutputVarX
OutputVarY := OutputVarY
Loop, 1
{

mousemove, 566,656
click down
sleep, 60
click up
mousemove, 566,656
click down
sleep, 60
click up

sleep, 200	
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
settimer, HeroQuestSelectLock, off 
settimer, HeroQuestInner, 100
}
}
ImageSearch, OutputVarX, OutputVarY,  443, 175, 903, 637, *50 %a_scriptdir%\Pictures\2021-06-12 07_33_45-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
OutputVarX := OutputVarX
OutputVarY := OutputVarY	
Loop, 1
{

mousemove, 566,656
click down
sleep, 60
click up
mousemove, 566,656
click down
sleep, 60
click up

sleep, 200	
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
settimer, HeroQuestSelectLock, off 
settimer, HeroQuestInner, 100
}
}
ImageSearch, OutputVarX, OutputVarY,  443, 175, 903, 637, *50 %a_scriptdir%\Pictures\2021-06-12 06_28_22-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
OutputVarX := OutputVarX
OutputVarY := OutputVarY
Loop, 1
{

mousemove, 566,656
click down
sleep, 60
click up
mousemove, 566,656
click down
sleep, 60
click up

sleep, 200	
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
settimer, HeroQuestSelectLock, off 
settimer, HeroQuestInner, 100
}
}else{
mousemove, 563,497
send, {wheeldown 10}
sleep, 100
}
Return
HeroQuestInnerTimer:
gui, destroy 
settimer, HeroQuestInner, 100
Return
HeroQuestInner:
ImageSearch, OutputVarX, OutputVarY, 140-25, 636-25, 187+25, 684+25, *80 %a_scriptdir%\Pictures\2021-06-12 07_13_43-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
settimer, HeroQuestInner, off 
reset := 0
gosub, HeroQuestTimer
}
reset++
if(reset == 8){
ImageSearch, OutputVarX, OutputVarY, 265-25, 670-25, 292+25, 683+25, *100 %a_scriptdir%\Pictures\2021-06-12 07_02_38-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 8
{
mousemove, 419,663
click down
sleep, 60
click up
}
Loop, 8
{
mousemove, 583,666
click down
sleep, 60
click up
}
Loop, 8
{
mousemove, 740,667
click down
sleep, 60
click up
}
}
}
if(reset > 8){
mousemove, 27,48
click down
sleep, 60
click up
reset := 0
gosub, HeroQuestTimer
}
gosub, EndBattle
ImageSearch, OutputVarX, OutputVarY, 953-25, 631-25, 963+25, 643+25, *30 %a_scriptdir%\Pictures\2021-06-12 05_05_18-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
reset := 0
}
gosub, SelectExclimation
ImageSearch, OutputVarX, OutputVarY, 205-25, 225-25, 230+25, 247+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_47_23-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 218,236
click down
sleep, 20
click up
reset := 0
}
}
ImageSearch, OutputVarX, OutputVarY, 0, 127, 1013, 589, *30 %a_scriptdir%\Pictures\2021-06-12 04_10_55-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
reset := 0
}
}
ImageSearch, OutputVarX, OutputVarY, 800-25, 537-25, 837+25, 571+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_14_05-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 819,554
click down
sleep, 20
click up
reset := 0
}
}
ImageSearch, OutputVarX, OutputVarY, 856-25, 626-25, 888+25, 658+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_14_40-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 872,642
click down
sleep, 20
click up
reset := 0
}
}
ImageSearch, OutputVarX, OutputVarY, 485-25, 192-25, 526+25, 247+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_15_25-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 506,220
click down
sleep, 20
click up
reset := 0
}
}
ImageSearch, OutputVarX, OutputVarY, 924-25, 586-25, 939+25, 602+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_16_01-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 932,594
click down
sleep, 20
click up
reset := 0
}
}
ImageSearch, OutputVarX, OutputVarY, 412-25, 463-25, 431+25, 484+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_16_57-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 422,474
click down
sleep, 20
click up
reset := 0
}
}
ImageSearch, OutputVarX, OutputVarY, 938-25, 44-25, 949+25, 62+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_18_09-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 944,53
click down
sleep, 20
click up
reset := 0
}
}
ImageSearch, OutputVarX, OutputVarY, 562-25, 464-25, 580+25, 484+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_18_27-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 571,474
click down
sleep, 20
click up
reset := 0
}
}
ImageSearch, OutputVarX, OutputVarY, 558-25, 570-25, 562+25, 587+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_18_52-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 560,579
click down
sleep, 20
click up
reset := 0
}
}
Return
RestartCommon:
IfWinActive, Valkyrie Connect WW
{
	WinMaximize, Valkyrie Connect WW
}

ImageSearch, OutputVarXX, OutputVarYY, 609-25, 476-25, 709+25, 507+25, *50 %a_scriptdir%\Pictures\2021-06-13 10_23_40-Window.png 
if(ErrorLevel == 0){
sleep, 2000
mousemove, 487,387
click down
sleep, 60
click up
mousemove, 487,387
click down
sleep, 60
click up
send, {ctrldown}a{ctrlup}
clipboard := 
clipboard := CurrentEmail
clipwait, 10
send, {ctrldown}v{ctrlup}
sleep, 200
mousemove, 451,413
click down
sleep, 60
click up
mousemove, 451,413
click down
sleep, 60
click up
sleep, 100
send, {ctrldown}a{ctrlup}
clipboard := 
clipboard := Pword
clipwait, 10
send, {ctrldown}v{ctrlup}
sleep, 200
mousemove, 653,490
click down
sleep, 20
click up
mousemove, 653,490
click down
sleep, 20
click up
mousemove, 653,490
click down
sleep, 20
click up
sleep, 4000
mousemove, 615,222
click down
sleep, 60
click up
mousemove, 615,222
click down
sleep, 60
click up
sleep, 3000
Runwait, taskkill /im chrome.exe /f
gosub, ActivateVC
}
ImageSearch, OutputVarX, OutputVarY, 609-25, 485-25, 707+25, 507+25, *50 %a_scriptdir%\Pictures\2021-06-13 09_48_50-Window.png 
if(ErrorLevel == 0){

}
ImageSearch, OutputVarX, OutputVarY, 70-25, 213-25, 133+25, 261+25, *50 %a_scriptdir%2\Pictures\2021-06-13 09_21_21-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 102,237
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 484-25, 540-25, 533+25, 574+25, *50 C:\Users\User\Documents\GitHub\Bleach 2\ValkarieConnect\Pictures\2021-06-13 08_35_58-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 509,557
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarXX, OutputVarYY, 408-25, 545-25, 485+25, 573+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_16_01-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 447,559
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarXX, OutputVarYY, 491-25, 616-25, 514+25, 636+25, *50 %a_scriptdir%\Pictures\2021-06-12 03_55_02-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 503,626
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarXX, OutputVarYY, 521-25, 553-25, 540+25, 566+25, *50 %a_scriptdir%\Pictures\2021-06-12 04_44_37-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 531,560
click down
sleep, 20
click up
}
}


Return
CR1024:
gui, destroy 
ChangeResolution(1024, 768)
Return
gui, destroy
send, {lwin}
sleep, 200
send, display settings{enter}
sleep, 1500
send, {tab down}
sleep, 10
send, {tab up}
send, {tab down}
sleep, 10
send, {tab up}
send, {tab down}
sleep, 10
send, {tab up}
send, {tab down}
sleep, 10
send, {tab up}
send, {enter}
sleep, 200
send, {end}{up}{enter}
sleep, 1000
send, +{tab}{enter}
sleep, 500
winclose, Settings
Return
CR3840:
gui, destroy
ChangeResolution(3840, 2160)
Return

ChangeResolution(Screen_Width := 1920, Screen_Height := 1080, Color_Depth := 32)
{
	VarSetCapacity(Device_Mode,156,0)
	NumPut(156,Device_Mode,36) 
	DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&Device_Mode )
	NumPut(0x5c0000,Device_Mode,40) 
	NumPut(Color_Depth,Device_Mode,104)
	NumPut(Screen_Width,Device_Mode,108)
	NumPut(Screen_Height,Device_Mode,112)
	Return DllCall( "ChangeDisplaySettingsA", UInt,&Device_Mode, UInt,0 )
}
Return
EnableCE:
gui, destroy
run, %a_scriptdir%\CE.exe
Return
!c::
ConnectHostTimer:
gui,destroy
settimer, ConnectHost, 100
Return
ConnectHost:
gosub, PlayerLevelUp
ImageSearch, OutputVarX, OutputVarY, 492-90, 269-90, 610+90, 300+90, *95 C:\VC\Pictures\2021-06-24 01_16_54-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 551,285
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 668-200, 539-200, 738+200, 576+200, *95 C:\VC\Pictures\2021-06-24 00_42_42-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 703,558
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 648-90, 237-90, 744+90, 275+90, *95 C:\VC\Pictures\2021-06-24 00_40_55-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 696,256
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 779-90, 504-90, 850+90, 537+90, *95 C:\VC\Pictures\2021-06-24 00_41_02-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 815,521
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 858-90, 619-90, 895+90, 668+90, *95 C:\VC\Pictures\2021-06-24 00_41_10-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 877,644
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 918-200, 463-200, 970+200, 510+200, *95 C:\VC\Pictures\2021-06-24 00_46_09-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 944,487
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 649-200, 455-200, 710+200, 480+200, *95 C:\VC\Pictures\2021-06-24 00_46_18-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 680,468
click down
sleep, 20
click up
}
}
Return
ConnectHostUntilSoulTimer:
gui,destroy
settimer, ConnectHostUntilSoul, 150
settimer, CheckForSoul, 74
Return
CheckForSoul:
ImageSearch, OutputVarX, OutputVarY, 920-150, 461-150, 965+150, 506+150, *95 C:\VC\Pictures\2021-06-24 13_34_54-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
	settimer, ConnectHostUntilSoul, off
	sleep, 80
	stillon := 1
ImageSearch, OutputVarX, OutputVarY, 408-150, 545-150, 460+150, 591+150, *95 C:\VC\Pictures\2021-06-24 13_35_30-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
	stillon := 0
	settimer, ConnectHostUntilSoul, 150
	settimer, CheckForSoul, off 
}else{
	settimer, CheckForSoul, off 
	settimer, ConnectHostUntilSoul, off
}
}
Return

ConnectHostUntilSoul:
gosub, PlayerLevelUp
settimer, CheckForSoul, 74 
stillon := 0
ImageSearch, OutputVarX, OutputVarY, 492-90, 269-90, 610+90, 300+90, *95 C:\VC\Pictures\2021-06-24 01_16_54-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 551,285
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 668-200, 539-200, 738+200, 576+200, *95 C:\VC\Pictures\2021-06-24 00_42_42-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 703,558
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 648-90, 237-90, 744+90, 275+90, *95 C:\VC\Pictures\2021-06-24 00_40_55-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 696,256
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 779-90, 504-90, 850+90, 537+90, *95 C:\VC\Pictures\2021-06-24 00_41_02-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 815,521
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 858-90, 619-90, 895+90, 668+90, *95 C:\VC\Pictures\2021-06-24 00_41_10-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 877,644
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 918-200, 463-200, 970+200, 510+200, *95 C:\VC\Pictures\2021-06-24 00_46_09-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
if(stillon == 0){
Loop, 1
{
mousemove, 944,487
click down
sleep, 20
click up
}
}	

}
ImageSearch, OutputVarX, OutputVarY, 649-200, 455-200, 710+200, 480+200, *95 C:\VC\Pictures\2021-06-24 00_46_18-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 680,468
click down
sleep, 20
click up
}
}
Return

#s::
ConnectToHostGameTimer:
gui, destroy
settimer, ConnectToHostGame, 100
Return
ConnectToHostGame:
gosub, PlayerLevelUp
ImageSearch, OutputVarX, OutputVarY, 486-90, 460-90, 539+90, 491+90, *95 C:\VC\Pictures\2021-06-24 02_47_46-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 513,476
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 32-90, 679-90, 64+90, 710+90, *95 C:\VC\Pictures\2021-06-24 00_50_42-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 48,695
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 271-90, 63-90, 323+90, 91+90, *95 C:\VC\Pictures\2021-06-24 00_52_19-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 297,77
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 209-90, 230-90, 250+90, 259+90, *95 C:\VC\Pictures\2021-06-24 00_54_12-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 230,245
click down
sleep, 20
click up
}
settimer, ConnectToHostGame, off 
settimer, ConnectedToHostGame, 100
}
ImageSearch, OutputVarX, OutputVarY, 391-90, 700-90, 426+90, 720+90, *55 C:\VC\Pictures\2021-06-24 00_52_47-Settings.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 409,710
click down
sleep, 20
click up
}
sleep, 500
}

Return
ConnectedToHostGame:
gosub, PlayerLevelUp
ImageSearch, OutputVarX, OutputVarY, 391-90, 700-90, 426+90, 720+90, *55 C:\VC\Pictures\2021-06-24 00_52_47-Settings.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 409,710
click down
sleep, 20
click up
}
settimer, ConnectedToHostGame, off 
settimer, ConnectToHostGame, 100
}
ImageSearch, OutputVarX, OutputVarY, 486-90, 460-90, 539+90, 491+90, *95 C:\VC\Pictures\2021-06-24 02_47_46-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 513,476
click down
sleep, 20
click up
}
settimer, ConnectedToHostGame, off 
settimer, ConnectToHostGame, 100
}
ImageSearch, OutputVarX, OutputVarY, 858-150, 623-150, 896+150, 670+150, *95 C:\VC\Pictures\2021-06-24 00_54_41-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 877,647
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 460-200, 488-200, 555+200, 528+200, *95 C:\VC\Pictures\2021-06-24 00_58_47-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 508,508
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 321-200, 453-200, 374+200, 494+200, *95 C:\VC\Pictures\2021-06-24 00_56_40-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 348,474
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 914-150, 584-150, 969+150, 630+150, *35 C:\VC\Pictures\2021-06-24 01_06_17-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
sleep, 500
Loop, 3
{
mousemove, 942,606
click down
sleep, 20
click up
}
settimer, ConnectedToHostGame, off 
settimer, ConnectToHostGame, 100
}
Return
#m::
XButton1::
Gui, -Caption +AlwaysOnTop
Gui, Font, s15
Gui, Font, c4287f5
gui, add, text,gTakeScreenshot, Take Screenshot
gui, add, text,gCR1024, 1024 x 768 
gui, add, text,gCR3840, 3840 x 2160
gui, add, text,gEnableCE, Enable CE
gui, add, text,gConnectHostTimer, Host Connect
gui, add, text,gConnectHostUntilSoulTimer, Host Connect Till Soul
gui, add, text,gConnectToHostGameTimer, Connect To Host Game
gui, add, text,gHeroQuestTimer, Hero Quest 
gui, add, text,gStoryMissions, StoryMission 
gui, add, text,gPromoteLevelUpOrbs, Promote-Level Up-Orbs 
gui, add, text,gHeroQuestInnerTimer, HeroQuestInner
gui, show 
Return
PromoteLevelUpOrbs:
gui, destroy 
gosub, ActivateVC
settimer, plo, 100
Return
plo:
ImageSearch, OutputVarX, OutputVarY, 88, 668, 957, 704, *50 %a_scriptdir%\Pictures\2021-06-12 07_48_11-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 5
{
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
}
sleep, 500
settimer, plo, off
gosub, ploinner
}else{
mousemove, 516,646
send, {wheelup 15}
sleep, 1000
}
Return
ploinner:
mousemove, 359,356
click down
sleep, 60
click up
sleep, 800
ImageSearch, OutputVarX, OutputVarY, 489-25, 463-25, 530+25, 485+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_07_20-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 510,474
click down
sleep, 20
click up
}
sleep, 800
}
ImageSearch, OutputVarX, OutputVarY, 210-25, 225-25, 240+25, 253+25, *50 %a_scriptdir%\Pictures\2021-06-12 07_52_34-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 225,239
click down
sleep, 20
click up
}
sleep, 500
}
ImageSearch, OutputVarX, OutputVarY, 882-25, 360-25, 894+25, 374+25, *50 %a_scriptdir%\Pictures\2021-06-12 07_55_51-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
mousemove, 826,402
click down
sleep, 60
click up
settimer, orbsinner, 100
}else{
settimer, Promote, 100
}
Return
orbsinner:
ImageSearch, OutputVarX, OutputVarY, 489-25, 542-25, 532+25, 576+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_06_09-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 511,559
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 578-25, 490-25, 620+25, 515+25, *50 %a_scriptdir%\Pictures\2021-06-12 07_57_30-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 599,503
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 657-25, 530-25, 749+25, 568+25, *50 %a_scriptdir%\Pictures\2021-06-12 07_57_15-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 703,549
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 546-25, 503-25, 583+25, 525+25, *50 %a_scriptdir%\Pictures\2021-06-12 07_57_56-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 565,514
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 629-25, 526-25, 669+25, 577+25, *50 %a_scriptdir%\Pictures\2021-06-12 07_58_12-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
settimer, orbsinner, off 
settimer, ToMaxLvL, 100
}
Return
ToMaxLvL:
ImageSearch, OutputVarX, OutputVarY, 164-25, 457-25, 204+25, 479+25, *30 %a_scriptdir%\Pictures\2021-06-12 07_58_54-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 184,468
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 170-25, 457-25, 201+25, 479+25, *30 %a_scriptdir%\Pictures\2021-06-12 07_59_20-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
settimer, ToMaxLvL, off 
settimer, Promote, 100
}
Return
Promote:
ImageSearch, OutputVarX, OutputVarY, 491-25, 545-25, 529+25, 574+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_09_05-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 510,560
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 245-25, 519-25, 257+25, 562+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_08_43-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 251,541
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 618-25, 531-25, 653+25, 575+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_00_57-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 34,47
click down
sleep, 60
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 229-25, 376-25, 240+25, 390+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_02_37-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 235,383
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 575-25, 488-25, 614+25, 514+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_03_22-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 595,501
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 219-25, 377-25, 232+25, 398+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_04_50-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
settimer, Promote, off
gosub, PromoteLevelUpOrbs
}
Return
GitPull:
gui, destroy
IfWinNotExist, GitHub Desktop
{
run, %a_scriptdir%\GitHubDesktop.lnk
sleep, 5000
WinActivate, GitHub Desktop
sleep, 500
send, ^+p
}else{
WinActivate, GitHub Desktop
sleep, 500
send, ^+p
sleep, 500
WinMinimize,  GitHub Desktop
sleep, 3000
reload
}
Return
BeginnerDiamonds:
gui, Destroy
gosub, ActivateVC
settimer, BeginnerDiamond, 100
Return
BeginnerDiamond:
gosub, Hero 
Return

Hero:
gui, Destroy
ImageSearch, OutputVarX, OutputVarY, 330-25, 423-25, 378+25, 468+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_44_55-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 354,446
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 204-25, 223-25, 239+25, 251+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_45_12-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 222,237
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 644-25, 430-25, 700+25, 460+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_45_28-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 672,445
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 116-25, 206-25, 165+25, 261+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_45_47-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 141,234
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 88-25, 186-25, 119+25, 216+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_45_58-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 104,201
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 858-25, 615-25, 914+25, 648+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_46_11-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 886,632
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 14-25, 35-25, 45+25, 61+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_46_31-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 30,48
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 821-25, 391-25, 866+25, 435+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_46_45-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 844,413
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 865-25, 446-25, 904+25, 479+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_46_58-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 885,463
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 383-25, 557-25, 429+25, 581+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_47_08-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 406,569
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 661-25, 538-25, 726+25, 566+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_47_19-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 694,552
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 572-25, 487-25, 621+25, 517+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_47_34-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 597,502
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 495-25, 544-25, 525+25, 572+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_47_45-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 510,558
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 492-25, 560-25, 528+25, 596+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_47_58-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 510,578
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 489-25, 541-25, 533+25, 566+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_48_08-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 511,554
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 486-25, 197-25, 512+25, 239+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_48_20-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 499,218
click down
sleep, 20
click up
sleep, 500
}
}
gosub, ActivateVC
ImageSearch, OutputVarX, OutputVarY, 630-25, 573-25, 682+25, 609+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_41_23-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 656,591
click down
sleep, 20
click up
sleep, 500
}
}
ImageSearch, OutputVarX, OutputVarY, 222-25, 523-25, 300+25, 555+25, *50 %a_scriptdir%\Pictures\2021-06-12 08_43_11-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 261,539
click down
sleep, 20
click up
sleep, 500
}
}
Return
StoryMissions:
gui, destroy
gosub, ActivateVC
settimer, StoryMission, 100
Return
SelectSkip:
ImageSearch, OutputVarX, OutputVarY, 939-25, 47-25, 963+25, 63+25, *50 %a_scriptdir%\Pictures\2021-06-12 09_51_20-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 951,55
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 562-25, 464-25, 595+25, 492+25, *50 %a_scriptdir%\Pictures\2021-06-12 09_52_05-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 579,478
click down
sleep, 20
click up
}
}
Return
SelectTapTheScreen:
ImageSearch, OutputVarX, OutputVarY, 558-25, 569-25, 562+25, 588+25, *50 %a_scriptdir%\Pictures\2021-06-12 09_52_31-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 560,579
click down
sleep, 20
click up
}
}
Return
SelectExclimation:
ImageSearch, OutputVarX, OutputVarY, 18, 178, 1014, 573,  *50 %a_scriptdir%\Pictures\2021-06-12 18_23_26-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
OutputVarY := OutputVarY - 50
Loop, 1
{
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 18, 178, 1014, 573, *50 %a_scriptdir%\Pictures\2021-06-12 09_41_28-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
OutputVarY := OutputVarY - 50
Loop, 1
{
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
}
}

CharacterMinimize:
ImageSearch, OutputVarX, OutputVarY, 374, 211, 699, 567, *50 %a_scriptdir%\Pictures\2021-06-12 18_45_00-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY,  374, 211, 699, 567, *50 %a_scriptdir%\Pictures\2021-06-12 13_50_48-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
}
}
Return
UnlockedFeatureOk:
ImageSearch, OutputVarX, OutputVarY, 492-25, 459-25, 532+25, 493+25, *50 %a_scriptdir%\Pictures\2021-06-12 18_36_42-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 512,476
click down
sleep, 20
click up
}
}
Return
HelTo4star:
ImageSearch, OutputVarX, OutputVarY, 331-90, 561-90, 405+90, 601+90, *95 C:\VC\Pictures\2021-06-24 05_30_02-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 368,581
click down
sleep, 20
click up
}
}
Return
StoryMission:
gosub, SelectExclimation
gosub, SelectSkip
gosub, SelectTapTheScreen
gosub, EndBattle
gosub, PlayerLevelUp
gosub, ChapterClear
gosub, CloseButton
gosub, CharacterMinimize
gosub, UnlockedFeatureOk
gosub, HelTo4star
ImageSearch, OutputVarX, OutputVarY, 794-25, 535-25, 842+25, 572+25, *50 %a_scriptdir%\Pictures\2021-06-12 09_54_42-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 818,554
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 799-25, 484-25, 830+25, 522+25, *50 %a_scriptdir%\Pictures\2021-06-12 09_43_13-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 815,503
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 858-25, 628-25, 892+25, 658+25, *50 %a_scriptdir%\Pictures\2021-06-12 09_45_38-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 875,643
click down
sleep, 20
click up
}
}


ImageSearch, OutputVarX, OutputVarY, 799-25, 594-25, 827+25, 628+25, *50 %a_scriptdir%\Pictures\2021-06-12 09_40_09-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 813,611
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 156-25, 401-25, 193+25, 442+25, *50 %a_scriptdir%\Pictures\2021-06-12 09_40_19-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 175,422
click down
sleep, 20
click up
}
}

ImageSearch, OutputVarX, OutputVarY, 952-25, 635-25, 963+25, 646+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_50_26-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 959,639
click down
sleep, 20
click up
}
sleep, 500
}
Return
JoinBattleThenCheatEngineTimer:
gui, destroy
settimer, JoinBattleThenCheatEngine, 200 
Return
JoinBattleThenCheatEngine:
ImageSearch, OutputVarX, OutputVarY, 156-25, 132-25, 176+25, 154+25, *50 %a_scriptdir%\Pictures\2021-06-12 06_00_02-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 166,143
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 834-25, 624-25, 925+25, 660+25, *50 %a_scriptdir%\Pictures\2021-06-12 04_59_33-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 5
{
mousemove, 880,642
click down
sleep, 20
click up
}
settimer, JoinBattleThenCheatEngine, off 
settimer, Turnoffauto2x, 100
}

ImageSearch, OutputVarX, OutputVarY, 809-25, 545-25, 826+25, 563+25, *50 %a_scriptdir%\Pictures\2021-06-12 04_54_22-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 818,554
click down
sleep, 20
click up
}
}

ImageSearch, OutputVarX, OutputVarY, 798-25, 608-25, 823+25, 630+25, *50 %a_scriptdir%\Pictures\2021-06-12 04_45_44-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 811,619
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 153-25, 419-25, 188+25, 447+25, *50 %a_scriptdir%\Pictures\2021-06-12 04_46_36-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 171,433
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 326-25, 90-25, 358+25, 117+25, *50 %a_scriptdir%\Pictures\2021-06-12 04_46_53-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
if(NeedToGoBack == true){
Loop, 70
{
mousemove, 31,373
click down
sleep, 60
click up
}
NeedToGoBack := false
}
}
ImageSearch, OutputVarX, OutputVarY, 139-25, 451-25, 161+25, 471+25, *50 %a_scriptdir%\Pictures\2021-06-12 04_47_40-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 150,461
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 806-25, 543-25, 825+25, 564+25, *50 %a_scriptdir%\Pictures\2021-06-12 04_47_57-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 816,554
click down
sleep, 20
click up
}
}

Return
Turnoffauto2x:
gui, destroy
gosub, TurnOffAuto
gosub, TurnOn2x
gosub, CheatEngineBattle
Return
TurnOn2xGosub:
ImageSearch, OutputVarX, OutputVarY, 947-25, 549-25, 954+25, 558+25, *50 %a_scriptdir%\Pictures\2021-06-12 05_08_16-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 951,554
click down
sleep, 20
click up
}
sleep, 500
}
Return
TurnOn2x:
Loop{
ImageSearch, OutputVarX, OutputVarY, 947-25, 550-25, 956+25, 561+25, *30 %a_scriptdir%\Pictures\2021-06-12 05_07_38-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
break
}
ImageSearch, OutputVarX, OutputVarY, 947-25, 549-25, 954+25, 558+25, *30 %a_scriptdir%\Pictures\2021-06-12 05_08_16-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 951,554
click down
sleep, 20
click up
}
sleep, 500
}
}
Return
Scan_1:
mousemove, 362,161
click down
sleep, 60
click up
send, ^a
sleep, 200
send, 1.00
sleep, 200
mousemove, 382,113
click down
sleep, 60
click up
sleep, 1000
Return
Scan_2:
mousemove, 372,162
click down
sleep, 60
click up
send, ^a
sleep, 200
send, 2.00
sleep, 200
mousemove, 382,113
click down
sleep, 60
click up
sleep, 1000
Return
TurnOff2x:
Loop{
ImageSearch, OutputVarX, OutputVarY, 947-25, 550-25, 956+25, 561+25, *30 %a_scriptdir%\Pictures\2021-06-12 05_07_38-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 951,554
click down
sleep, 20
click up
}
sleep, 500
}
ImageSearch, OutputVarX, OutputVarY, 947-25, 549-25, 954+25, 558+25, *50 %a_scriptdir%\Pictures\2021-06-12 05_08_16-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
break
}
}
Return
TurnOffAuto:
Loop {
ImageSearch, OutputVarX, OutputVarY, 952-25, 635-25, 963+25, 646+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_50_26-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
break
}

ImageSearch, OutputVarX, OutputVarY, 953-25, 631-25, 963+25, 643+25, *50 %a_scriptdir%\Pictures\2021-06-12 05_05_18-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 959,639
click down
sleep, 20
click up
}
sleep, 500
}
}
Return
TurnOnAutoGosub:
ImageSearch, OutputVarX, OutputVarY, 952-25, 635-25, 963+25, 646+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_50_26-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 959,639
click down
sleep, 20
click up
}
sleep, 500
}
Return
TurnOnAuto:
Loop {
ImageSearch, OutputVarX, OutputVarY, 952-25, 635-25, 963+25, 646+25, *30 %a_scriptdir%\Pictures\2021-06-12 04_50_26-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 959,639
click down
sleep, 20
click up
}
sleep, 500
}
ImageSearch, OutputVarX, OutputVarY, 953-25, 631-25, 963+25, 643+25, *30 %a_scriptdir%\Pictures\2021-06-12 05_05_18-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
break
}
}
Return
CheatEngineBattle:
gui, destroy
gosub, CheatEngineActivate
sleep, 300
gosub, FirstScan
gosub, ActivateVC
sleep, 300
gosub, TurnOff2x 
sleep, 300
gosub, CheatEngineActivate
sleep, 300
gosub, Scan_1
gosub, ActivateVC
sleep, 300
gosub, TurnOn2x 
sleep, 300
gosub, CheatEngineActivate
sleep, 300
gosub, Scan_2
gosub, ActivateVC
sleep, 300
gosub, TurnOff2x 
sleep, 300
gosub, CheatEngineActivate
sleep, 300
gosub, Scan_1
gosub, ActivateVC
sleep, 300
gosub, TurnOn2x 
sleep, 300
gosub, CheatEngineActivate
sleep, 300
gosub, Scan_2
gosub, ActivateVC
sleep, 300
gosub, TurnOnAuto
gosub, FinishBattle
sleep, 300
gosub, CheatEngineActivate
sleep, 300
gosub, Scan_1
gosub, AddandChange
Return
CheatEngineActivate:
WinActivate, Cheat Engine 7.2
WinShow, Cheat Engine 7.2
Return
FirstScan:
sleep, 300
mousemove, 354,219
click down
sleep, 60
click up
send, {home}{down 5}{enter}
sleep, 300
mousemove, 370,155
click down
sleep, 60
click up
send, ^a
sleep, 200
send, 2.00
sleep, 200
mousemove, 299,118
click down
sleep, 60
click up
sleep, 3000
Return
FinishBattle:
gui, destroy
Loop{
ImageSearch, OutputVarX, OutputVarY, 922-25, 586-25, 943+25, 609+25, *50 %a_scriptdir%\Pictures\2021-06-12 05_47_27-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 933,598
click down
sleep, 20
click up
}
}	
ImageSearch, OutputVarX, OutputVarY, 412-25, 462-25, 429+25, 485+25, *50 %a_scriptdir%\Pictures\2021-06-12 05_40_13-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 421,474
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 205-25, 225-25, 230+25, 247+25, *50 %a_scriptdir%\Pictures\2021-06-12 04_47_23-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 218,236
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 913-25, 568-25, 951+25, 612+25, *50 %a_scriptdir%\Pictures\2021-06-12 05_43_31-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 932,590
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 922-25, 581-25, 943+25, 602+25, *50 %a_scriptdir%\Pictures\2021-06-12 05_51_03-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 933,592
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 959-25, 37-25, 990+25, 65+25, *30 %a_scriptdir%\Pictures\2021-06-12 05_44_01-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
break
}
}
Return
AddandChange:
gui, destroy
mousemove, 145,157
click down
sleep, 60
click up
sleep, 200
send, ^a
sleep, 200
click, Right
sleep, 200
send, {down}{enter}
sleep, 300
mousemove, 106,526
click down
sleep, 60
click up
send, ^a
sleep, 200
send, {space}
sleep, 200
click, Right
sleep, 200
send, {down 2}{enter}
sleep, 300
send, {down 3}{enter}
sleep, 1000
send, 15{enter}
gosub, ActivateVC
Return

Restart:
gui, destroy
WinActivate, Valkyrie Connect WW
WinShow, Valkyrie Connect WW
WinMaximize,Valkyrie Connect WW
WinClose, Valkyrie Connect WW
Runwait, taskkill /im ValkyrieConnect.exe /f
Runwait, taskkill /im cheatengine-x86_64-SSE4-AVX2.exe /f
Runwait, taskkill /im cheatengine-x86_64.exe /f
sleep, 2000
Loop, 200
{
ImageSearch, OutputVarX, OutputVarY, 556-25, 462-25, 599+25, 492+25, *50 %a_scriptdir%\Pictures\2021-06-12 05_12_19-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 5
{
mousemove, 578,477
click down
sleep, 20
click up
}
break
}
}
sleep, 3000
run, %a_scriptdir%\VALKYRIE CONNECT.url
sleep, 5000
run, %a_scriptdir%\Cheat Engine.lnk
sleep, 3000
WinMove, Cheat Engine 7.2, , 0, 0,,800
SetTitleMatchMode, 2
winset, AlwaysOnTop, On, Cheat Engine 7.2
WinActivate, Cheat Engine 7.2
sleep, 2000
winset, AlwaysOnTop, On, Cheat Engine 7.2
WinActivate, Cheat Engine 7.2
mousemove, 24,69
click down
sleep, 60
click up
mousemove, 24,69
click down
sleep, 60
click up
mousemove, 24,69
click down
sleep, 60
click up
sleep, 500
send, Valkyr
sleep, 200
send, {enter}
sleep, 500
WinActivate, Valkyrie Connect WW
WinShow, Valkyrie Connect WW
WinMaximize,Valkyrie Connect WW
sleep, 500
mousemove, 769,580
click down
sleep, 60
click up
mousemove, 769,580
click down
sleep, 60
click up
settimer, JoinBattleThenCheatEngine, 100
Return
PlayerLevelUp:
ImageSearch, OutputVarX, OutputVarY, 212-25, 223-25, 240+25, 250+25, *50 %a_scriptdir%\Pictures\2021-06-12 13_44_52-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 226,237
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 488-25, 197-25, 508+25, 241+25, *50 %a_scriptdir%\Pictures\2021-06-12 10_01_15-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 498,219
click down
sleep, 20
click up
}
}
Return
ChapterClear:
ImageSearch, OutputVarX, OutputVarY, 210-25, 287-25, 223+25, 315+25, *50 %a_scriptdir%\Pictures\2021-06-12 10_04_30-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 217,301
click down
sleep, 20
click up
}
}
Return
CloseButton:

ImageSearch, OutputVarX, OutputVarY, 71, 75, 440, 341, *50 %a_scriptdir%\Pictures\2021-06-12 18_37_50-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, %OutputVarX%, %OutputVarY%
click down
sleep, 20
click up
}
}
;ImageSearch, OutputVarX, OutputVarY, 222-25, 158-25, 246+25, 182+25, *50 %a_scriptdir%\Pictures\2021-06-12 13_49_09-Valkyrie Connect WW.png 
;if(ErrorLevel == 0){
;Loop, 1
;{
;mousemove, 234,170
;click down
;sleep, 20
;click up
;}
;}
;ImageSearch, OutputVarX, OutputVarY, 287-25, 131-25, 308+25, 153+25, *50 C:\Users\User\Documents\GitHub\Bleach 2\ValkarieConnect\Pictures\2021-06-12 13_18_51-Valkyrie Connect WW.png 
;if(ErrorLevel == 0){
;Loop, 1
;{
;mousemove, 298,142
;click down
;sleep, 20
;click up
;}
;}
Return

EndBattle:
ImageSearch, OutputVarX, OutputVarY, 963-25, 656-25, 985+25, 676+25, *25 %a_scriptdir%\Pictures\2021-06-12 06_50_03-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 5
{
mousemove, 918,577
click down
sleep, 20
click up

}
sleep, 1600
}
Return
NewGame:
gui, destroy
gosub, ActivateVC
settimer, NewGameTimer, 100
Return
NewGameTimer:
ImageSearch, OutputVarX, OutputVarY, 591-25, 494-25, 649+25, 527+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_05_06-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 620,511
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 550-25, 543-25, 608+25, 579+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_07_47-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 579,561
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 492-25, 458-25, 532+25, 486+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_08_17-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 5
{
mousemove, 512,472
click down
sleep, 20
click up
}
sleep, 3000
mousemove, 421,394
click down
sleep, 60
click up
mousemove, 421,394
click down
sleep, 60
click up
}
ImageSearch, OutputVarX, OutputVarY, 937-25, 48-25, 970+25, 65+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_09_17-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 954,57
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 561-25, 457-25, 598+25, 488+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_09_36-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 580,473
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 219-25, 523-25, 295+25, 554+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_10_03-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 257,539
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 181-25, 216-25, 210+25, 243+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_10_21-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 196,230
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 302-25, 216-25, 340+25, 246+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_10_26-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 321,231
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 455-25, 217-25, 490+25, 246+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_10_31-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 473,232
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 573-25, 213-25, 608+25, 239+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_10_34-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 591,226
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 716-25, 219-25, 747+25, 241+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_10_38-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 732,230
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 856-25, 628-25, 893+25, 656+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_10_45-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 875,642
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 272-25, 515-25, 310+25, 550+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_11_19-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 291,533
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 798-25, 621-25, 826+25, 644+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_11_31-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 812,633
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 130-25, 493-25, 149+25, 513+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_12_07-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 141,608
click down
sleep, 60
click up
mousemove, 141,608
click down
sleep, 60
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 803-25, 530-25, 818+25, 552+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_12_39-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 804,631
click down
sleep, 60
click up
mousemove, 804,631
click down
sleep, 60
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 788-25, 604-25, 821+25, 640+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_13_11-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 805,622
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 911-25, 574-25, 951+25, 613+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_13_50-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 931,594
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 499-25, 139-25, 512+25, 180+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_14_10-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 924,574
click down
sleep, 60
click up
mousemove, 924,574
click down
sleep, 60
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 595-25, 538-25, 635+25, 568+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_14_42-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 615,553
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 489-25, 450-25, 530+25, 480+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_15_07-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 510,465
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 140-25, 444-25, 167+25, 469+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_15_26-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 154,457
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 799-25, 536-25, 837+25, 569+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_15_39-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 818,553
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 219-25, 521-25, 300+25, 560+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_15_58-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 260,541
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 895-25, 356-25, 916+25, 369+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_16_07-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 906,363
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 192-25, 142-25, 208+25, 167+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_16_20-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 194,242
click down
sleep, 60
click up
mousemove, 194,242
click down
sleep, 60
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 858-25, 624-25, 889+25, 657+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_16_52-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 874,641
click down
sleep, 20
click up
}
}
gosub, TurnOnAutoGosub
gosub, TurnOn2xGosub
gosub, PlayerLevelUp
gosub, EndBattle
ImageSearch, OutputVarX, OutputVarY, 513-25, 67-25, 552+25, 114+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_22_57-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
settimer, NewGameTimer, off 
settimer, NewGamePart2, 100
}
Return
NewGamePart2Timer:
gui, destroy
gosub, ActivateVC
settimer, NewGamePart2, 100
Return
BonusScreen:
ImageSearch, OutputVarX, OutputVarY, 513-25, 67-25, 552+25, 114+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_22_57-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
mousemove, 522,468
click down
sleep, 60
click up
mousemove, 522,468
click down
sleep, 60
click up
}
ImageSearch, OutputVarX, OutputVarY, 492-25, 453-25, 526+25, 475+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_24_57-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 509,464
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 630-25, 571-25, 673+25, 606+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_26_12-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 652,589
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 152-25, 132-25, 179+25, 159+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_26_34-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 166,146
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 408-25, 545-25, 483+25, 574+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_27_35-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
;Cancel ATEAM
Loop, 1
{
mousemove, 446,560
click down
sleep, 20
click up
mousemove, 446,560
click down
sleep, 20
click up
mousemove, 446,560
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 617-25, 568-25, 685+25, 609+25, *50 %a_scriptdir%\Pictures\2021-06-12 23_41_32-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 651,589
click down
sleep, 20
click up
}
}
Return
SummonSkuld:
ImageSearch, OutputVarX, OutputVarY, 371-25, 591-25, 416+25, 626+25, *50 %a_scriptdir%\Pictures\2021-06-13 10_21_24-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 394,609
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 965-25, 276-25, 999+25, 305+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_23_02-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 982,291
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 199-25, 613-25, 218+25, 635+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_29_06-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 209,624
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 371-25, 591-25, 416+25, 626+25, *50 %a_scriptdir%\Pictures\2021-06-13 10_21_24-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 394,609
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 560-25, 245-25, 588+25, 273+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_30_00-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 574,259
click down
sleep, 20
click up
}
sleep, 800
}
ImageSearch, OutputVarX, OutputVarY, 371-25, 591-25, 416+25, 626+25, *50 %a_scriptdir%\Pictures\2021-06-13 10_21_24-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 394,609
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 733-25, 664-25, 778+25, 699+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_30_11-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 756,682
click down
sleep, 20
click up
}
sleep, 1600
}
ImageSearch, OutputVarX, OutputVarY, 371-25, 587-25, 435+25, 626+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_27_46-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 403,607
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 393-25, 591-25, 350+25, 618+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_30_21-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 372,605
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 574-25, 485-25, 614+25, 518+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_30_33-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 594,502
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 491-25, 541-25, 526+25, 568+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_30_51-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 509,555
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 489-25, 460-25, 533+25, 491+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_32_48-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 511,476
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 151-25, 133-25, 178+25, 157+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_33_04-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 165,145
click down
sleep, 20
click up
}
}

ImageSearch, OutputVarX, OutputVarY, 938-25, 39-25, 962+25, 57+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_28_29-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 950,48
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 476-25, 558-25, 542+25, 599+25, *50 %a_scriptdir%\Pictures\2021-06-12 21_33_27-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 5
{
mousemove, 509,579
click down
sleep, 20
click up
}
settimer, CollectDiamonds, 100
}

Return
CollectDiamondsTimer:
gui, destroy
gosub, ActivateVC
settimer, CollectDiamonds, 100
Return
CollectDiamonds:
settimer, NewGamePart2, off 
settimer, NewGamePart2Modified, 300
ImageSearch, OutputVarX, OutputVarY, 39-25, 421-25, 61+25, 444+25, *50 %a_scriptdir%\Pictures\2021-06-14 16_30_31-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 50,433
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 721-25, 576-25, 769+25, 603+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_35_11-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 745,590
click down
sleep, 20
click up
}
sleep, 1500
}
ImageSearch, OutputVarX, OutputVarY, 490-25, 489-25, 531+25, 522+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_36_46-Window.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 511,506
click down
sleep, 20
click up
}
settimer, CollectDiamonds, off 
settimer, CollectMission, 100
}

ImageSearch, OutputVarX, OutputVarY, 487-25, 512-25, 537+25, 549+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_35_44-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 512,531
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 81-25, 116-25, 105+25, 140+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_31_10-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 93,128
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 574-25, 341-25, 599+25, 366+25, *50 %a_scriptdir%\Pictures\2021-06-13 04_43_10-Window.png 
if(ErrorLevel == 0){
Loop, 20
{
	ImageSearch, OutputVarX, OutputVarY, 481-25, 458-25, 543+25, 496+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_05_11-Window.png 
Loop, 3
{
mousemove, 512,477
click down
sleep, 20
click up
}
break
}
sleep, 500
mousemove, 26,53
click down
sleep, 20
click up
mousemove, 26,53
click down
sleep, 20
click up
mousemove, 26,53
click down
sleep, 20
click up
sleep, 6000
mousemove, 26,53
click down
sleep, 20
click up
mousemove, 26,53
click down
sleep, 20
click up
mousemove, 26,53
click down
sleep, 20
click up

}
ImageSearch, OutputVarX, OutputVarY, 72-25, 38-25, 101+25, 64+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_32_58-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 87,51
click down
sleep, 20
click up
}
Loop, 20
{
ImageSearch, OutputVarX, OutputVarY, 481-25, 458-25, 543+25, 496+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_05_11-Window.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 512,477
click down
sleep, 20
click up
}
}
break
}
sleep, 500
mousemove, 26,53
click down
sleep, 20
click up
mousemove, 26,53
click down
sleep, 20
click up
mousemove, 26,53
click down
sleep, 20
click up
sleep, 300
mousemove, 26,53
click down
sleep, 20
click up
mousemove, 26,53
click down
sleep, 20
click up
mousemove, 26,53
click down
sleep, 20
click up

}
ImageSearch, OutputVarX, OutputVarY, 438-25, 680-25, 448+25, 693+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_33_26-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 443,687
click down
sleep, 20
click up
}
}
Return
CollectMission:
settimer, SummonSkuld, off
ImageSearch, OutputVarX, OutputVarY, 127-25, 113-25, 151+25, 140+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_38_30-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 139,127
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 970-25, 432-25, 1000+25, 460+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_38_54-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 985,446
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 798-25, 357-25, 835+25, 394+25, *30 %a_scriptdir%\Pictures\2021-06-13 02_39_17-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 817,376
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 787-25, 355-25, 832+25, 380+25, *30 %a_scriptdir%\Pictures\2021-06-13 02_40_10-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 811,568
click down
sleep, 60
click up
mousemove, 811,568
click down
sleep, 60
click up

}
}
ImageSearch, OutputVarX, OutputVarY, 491-25, 488-25, 538+25, 525+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_41_05-Window.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 515,507
click down
sleep, 20
click up
}
settimer, CollectMission, off
settimer, CollectMission2, 100
}
Return
CollectMission2:

ImageSearch, OutputVarX, OutputVarY, 329-25, 141-25, 394+25, 170+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_42_12-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 362,156
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 795-25, 299-25, 841+25, 333+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_42_19-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 818,316
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 776-25, 291-25, 874+25, 335+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_43_33-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 825,313
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 776-25, 291-25, 874+25, 335+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_43_33-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 797,567
click down
sleep, 60
click up
mousemove, 797,567
click down
sleep, 60
click up
mousemove, 797,567
click down
sleep, 60
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 487-25, 488-25, 531+25, 521+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_44_12-Window.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 509,505
click down
sleep, 20
click up
}
settimer, CollectMission2, off
settimer, GoToHero, 100
}
Return
GoToHero:
ImageSearch, OutputVarX, OutputVarY, 66-25, 120-25, 97+25, 146+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_45_45-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 82,133
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 973-25, 123-25, 999+25, 149+25, *30 %a_scriptdir%\Pictures\2021-06-13 02_46_07-Window.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 986,136
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 622-25, 569-25, 691+25, 609+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_47_16-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 657,589
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 274-25, 506-25, 318+25, 555+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_47_44-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 296,531
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 339-25, 422-25, 373+25, 471+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_48_02-Window.png 
if(ErrorLevel == 0){
if(LevelupOnce < 3){
Loop, 2
{
mousemove, 356,447
click down
sleep, 1000
click up
}
LevelupOnce++
}
}
ImageSearch, OutputVarX, OutputVarY, 641-25, 427-25, 700+25, 462+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_48_49-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 671,445
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 123-25, 221-25, 168+25, 255+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_49_11-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 146,238
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 75-25, 211-25, 130+25, 253+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_49_30-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 103,232
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 861-25, 629-25, 916+25, 653+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_49_45-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 889,641
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 17-25, 38-25, 43+25, 60+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_49_59-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 30,49
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 817-25, 394-25, 864+25, 434+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_50_12-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 841,414
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 869-25, 459-25, 913+25, 492+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_50_25-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 891,476
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 377-25, 559-25, 432+25, 587+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_50_34-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 405,573
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 659-25, 544-25, 749+25, 570+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_50_46-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 704,557
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 580-25, 491-25, 622+25, 517+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_50_57-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 601,504
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 483-25, 542-25, 531+25, 575+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_51_13-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 507,559
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 495-25, 564-25, 528+25, 590+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_51_26-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 512,577
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 487-25, 533-25, 537+25, 576+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_51_36-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 512,555
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 148-25, 132-25, 179+25, 157+25, *50 %a_scriptdir%\Pictures\2021-06-13 02_51_51-Window.png 
if(ErrorLevel == 0){
Loop, 3
{
mousemove, 164,145
click down
sleep, 20
click up
}
gosub, PlayerLevelUp
sleep, 1000
settimer, SummonSkuld, off
settimer, GoToHero, off
settimer, GoSummonNow, 100
}
gosub, PlayerLevelUp
ImageSearch, OutputVarX, OutputVarY, 72-25, 35-25, 99+25, 71+25, *30 %a_scriptdir%\Pictures\2021-06-13 03_37_03-Window.png 
if(ErrorLevel == 0){
reset++
if(reset > 4){
settimer, SummonSkuld, off	
settimer, GoToHero, off
settimer, GoSummonNow, 100
}
}
Return
GoSummonNow:
LevelupOnce := 0
reset := 0
ImageSearch, OutputVarX, OutputVarY, 74-25, 35-25, 97+25, 66+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_39_09-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 86,51
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 477-25, 535-25, 547+25, 572+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_39_22-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 512,554
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 932-25, 293-25, 972+25, 319+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_39_36-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 952,306
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 856-25, 123-25, 918+25, 172+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_40_09-Window.png 
if(ErrorLevel == 0){
settimer, GoSummonNow, off	
gosub, SummonSub
}
Return
SummonSub:
gui, destroy 
gosub, ActivateVC
mousemove, 890,340
click down
sleep, 60
click up
mousemove, 890,340
click down
sleep, 60
click up
mousemove, 890,340
click down
sleep, 60
click up
sleep, 400
mousemove, 209,622
click down
sleep, 60
click up
mousemove, 209,622
click down
sleep, 60
click up
mousemove, 209,622
click down
sleep, 60
click up
Loop, 1000
{
ImageSearch, OutputVarX, OutputVarY, 68-25, 116-25, 99+25, 143+25, *50 %a_scriptdir%\Pictures\2021-06-13 04_46_30-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 84,130
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 915-25, 125-25, 943+25, 152+25, *50 %a_scriptdir%\Pictures\2021-06-13 04_10_34-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 929,139
click down
sleep, 10
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 727-25, 220-25, 758+25, 248+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_41_52-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 743,234
click down
sleep, 10
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 919-25, 222-25, 947+25, 253+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_42_09-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 933,238
click down
sleep, 10
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 731-25, 664-25, 788+25, 702+25, *50 %a_scriptdir%\Pictures\2021-06-13 04_13_21-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
break
}
break
}
}
mousemove, 691,697
click down
sleep, 60
click up
mousemove, 691,697
click down
sleep, 60
click up
mousemove, 691,697
click down
sleep, 60
click up
sleep, 500
Loop, 3
{
	mousemove, 478,613
click down
sleep, 60
click up
sleep, 2000
mousemove, 603,504
click down
sleep, 60
click up
sleep, 800
}
mousemove, 956,46
click down
sleep, 30
click up
mousemove, 956,46
click down
sleep, 30
click up
sleep, 2000
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
Loop, 3
{
mousemove, 674,572
click down
sleep, 60
click up
sleep, 2000
mousemove, 608,500
click down
sleep, 60
click up
sleep, 800
}
mousemove, 962,50
click down
sleep, 60
click up
mousemove, 962,50
click down
sleep, 60
click up
sleep, 2000
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
Loop, 3
{
mousemove, 674,572
click down
sleep, 60
click up
sleep, 2000
mousemove, 608,500
click down
sleep, 60
click up
sleep, 800
}
mousemove, 962,50
click down
sleep, 60
click up
mousemove, 962,50
click down
sleep, 60
click up
sleep, 2000
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
sleep, 1000
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
Loop, 3
{
mousemove, 674,572
click down
sleep, 60
click up
sleep, 2000
mousemove, 608,500
click down
sleep, 60
click up
sleep, 800
}
mousemove, 962,50
click down
sleep, 60
click up
mousemove, 962,50
click down
sleep, 60
click up
sleep, 2000
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
sleep, 1000
mousemove, 333,570
click down
sleep, 30
click up
mousemove, 333,570
click down
sleep, 30
click up
sleep, 7000
mousemove, 899,327
send, {wheelup 50}
sleep, 100
send, {wheelup 5}
sleep, 1000
mousemove, 897,151
click down
sleep, 60
click up
mousemove, 897,151
click down
sleep, 60
click up
mousemove, 897,151
click down
sleep, 60
click up
mousemove, 211,623
click down
sleep, 60
click up
mousemove, 211,623
click down
sleep, 60
click up
mousemove, 211,623
click down
sleep, 60
click up
Loop, 1000
{
ImageSearch, OutputVarX, OutputVarY, 68-25, 116-25, 99+25, 143+25, *50 %a_scriptdir%\Pictures\2021-06-13 04_46_30-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 84,130
click down
sleep, 20
click up
}
}	
ImageSearch, OutputVarX, OutputVarY, 824-25, 127-25, 851+25, 163+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_53_31-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 838,145
click down
sleep, 10
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 539-25, 129-25, 574+25, 169+25, *50 %a_scriptdir%\Pictures\2021-06-13 03_53_57-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 557,149
click down
sleep, 10
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 734-25, 660-25, 787+25, 704+25, *30 %a_scriptdir%\Pictures\2021-06-13 03_54_27-Window.png 
if(ErrorLevel == 0){
break
}
}
mousemove, 700,694
click down
sleep, 60
click up
mousemove, 700,694
click down
sleep, 60
click up
mousemove, 700,694
click down
sleep, 60
click up
sleep, 1000
Loop, 3
{
	mousemove, 478,613
click down
sleep, 60
click up
sleep, 2000
mousemove, 603,504
click down
sleep, 60
click up
sleep, 800
}
mousemove, 956,46
click down
sleep, 30
click up
mousemove, 956,46
click down
sleep, 30
click up
sleep, 2000
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
Loop, 3
{
mousemove, 674,572
click down
sleep, 60
click up
sleep, 2000
mousemove, 608,500
click down
sleep, 60
click up
sleep, 800
}
mousemove, 962,50
click down
sleep, 60
click up
mousemove, 962,50
click down
sleep, 60
click up
sleep, 2000
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
mousemove, 206,186
click down
sleep, 60
click up
settimer, OpenBoxes, 100
Return
OpenBoxes:
ImageSearch, OutputVarX, OutputVarY, 70-25, 38-25, 103+25, 69+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_24_35-Window.png 
if(ErrorLevel == 0){
reset++
if(reset < 4){	
Loop, 1
{
mousemove, 87,54
click down
sleep, 20
click up
}
}
}
ImageSearch, OutputVarX, OutputVarY, 961-25, 509-25, 993+25, 544+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_25_29-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 977,527
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 233-25, 155-25, 297+25, 186+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_25_38-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 265,171
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 336-25, 624-25, 386+25, 659+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_25_47-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 361,642
click down
sleep, 20
click up
}
sleep, 800
}
ImageSearch, OutputVarX, OutputVarY, 580-25, 414-25, 639+25, 436+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_25_56-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 610,425
click down
sleep, 20
click up
}

}
ImageSearch, OutputVarX, OutputVarY, 489-25, 565-25, 535+25, 599+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_27_07-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 512,582
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 939-25, 639-25, 981+25, 680+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_27_25-Window.png 
if(ErrorLevel == 0){
settimer, OpenBoxes, off 
settimer, GetReadyForATeam, 100
}
Return
GetReadyForATeam:
ImageSearch, OutputVarX, OutputVarY, 939-25, 639-25, 981+25, 680+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_27_25-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 960,660
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 73-25, 35-25, 104+25, 68+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_30_52-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 89,52
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 954-25, 505-25, 993+25, 543+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_31_09-Window.png 
if(ErrorLevel == 0){
settimer, GetReadyForATeam, off 
gosub, GetEmail
}
Return
NewGamePart2:
gosub, BonusScreen
gosub, SummonSkuld
gosub, PlayerLevelUp
Return
NewGamePart2Modified:
gosub, BonusScreen
gosub, PlayerLevelUp
Return

RegisterTimer:
settimer, Register, 100
Return
Register:
ImageSearch, OutputVarX, OutputVarY, 964-25, 507-25, 995+25, 541+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_46_08-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 980,524
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 242-25, 402-25, 295+25, 444+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_46_17-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 269,423
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 604-25, 246-25, 660+25, 293+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_47_16-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
settimer, Register, off
gosub, FinishRegistering
}
}
Return
^1::
send, {wheeldown 1}
Return
FinishRegistering:
run, https://baloonmail.com/
sleep, 4000
WinActivate, Home Page - baloonmail.com - Google Chrome
winshow, Home Page - baloonmail.com - Google Chrome
WinMaximize, Home Page - baloonmail.com - Google Chrome 
sleep, 1000
mousemove, 546,149
click down
sleep, 60
click up
sleep, 1000
mousemove, 476,294
click down
sleep, 60
click up
clipboard :=
clipboard := RecoverEmail
clipwait, 10
send, {ctrldown}v{ctrlup}
sleep, 200
mousemove, 678,365
click down
sleep, 60
click up
sleep, 5000
send, {wheeldown 1}
sleep, 500
mousemove, 165,702
click down
sleep, 20
click up
mousemove, 165,702
click down
sleep, 20
click up
mousemove, 165,702
click down
sleep, 20
click up
sleep, 3000
send, {wheeldown 1}
sleep, 500
send, {wheeldown 1}
sleep, 500
mousemove, 49,692
click down
sleep, 300
mousemove, 700,693
sleep, 300
click up
mousemove, 502,691
click, Right 
sleep, 500
send, {down 2}{enter}
sleep, 4000
send, {tab 3}
clipboard :=
clipboard := "Seven7752326"
send, {ctrldown}v{ctrlup}
sleep, 100
send, {tab}
sleep, 100
send, {ctrldown}v{ctrlup}
sleep, 100
send, {tab}{space}
sleep, 300
send, {tab}
send, 1988{tab}
sleep, 100
send, jun{tab}
sleep, 100
send, 2{tab}
sleep, 100
send, {space}
sleep, 100
send, {tab}{space}
sleep, 500
send, {enter}
sleep, 3000
mousemove, 538,376
click down
sleep, 60
click up
mousemove, 538,376
click down
sleep, 60
click up
mousemove, 538,376
click down
sleep, 60
click up
Runwait, taskkill /im chrome.exe /f
sleep, 500
gosub, ActivateVC
settimer, Login
Return
^t::
settimer, Login, 100
Return
Login:
IfWinActive, Home Page - baloonmail.com - Google Chrome
{
	send, ^w
	sleep, 1000
}
ImageSearch, OutputVarX, OutputVarY, 609-25, 485-25, 707+25, 507+25, *50 %a_scriptdir%\Pictures\2021-06-13 09_48_50-Window.png 
if(ErrorLevel == 0){
sleep, 2000
mousemove, 487,387
click down
sleep, 60
click up
mousemove, 487,387
click down
sleep, 60
click up
send, {ctrldown}a{ctrlup}
clipboard := 
clipboard := CurrentEmail
clipwait, 10
send, {ctrldown}v{ctrlup}
sleep, 200
mousemove, 451,413
click down
sleep, 60
click up
mousemove, 451,413
click down
sleep, 60
click up
sleep, 100
send, {ctrldown}a{ctrlup}
clipboard := 
clipboard := Pword
clipwait, 10
send, {ctrldown}v{ctrlup}
sleep, 200
mousemove, 653,490
click down
sleep, 20
click up
mousemove, 653,490
click down
sleep, 20
click up
mousemove, 653,490
click down
sleep, 20
click up
sleep, 4000
mousemove, 615,222
click down
sleep, 60
click up
mousemove, 615,222
click down
sleep, 60
click up
sleep, 3000
Runwait, taskkill /im chrome.exe /f
gosub, ActivateVC
}
ImageSearch, OutputVarX, OutputVarY, 597-25, 470-25, 708+25, 510+25, *50 C:\Users\maxme\Desktop\2021-06-13 08_46_06-AteamID.png 
if(ErrorLevel == 0){
sleep, 2000
mousemove, 487,387
click down
sleep, 60
click up
mousemove, 487,387
click down
sleep, 60
click up
send, {ctrldown}a{ctrlup}
clipboard := 
clipboard := CurrentEmail
clipwait, 10
send, {ctrldown}v{ctrlup}
sleep, 200
mousemove, 451,413
click down
sleep, 60
click up
mousemove, 451,413
click down
sleep, 60
click up
sleep, 100
send, {ctrldown}a{ctrlup}
clipboard := 
clipboard := Pword
clipwait, 10
send, {ctrldown}v{ctrlup}
sleep, 200
mousemove, 653,490
click down
sleep, 20
click up
mousemove, 653,490
click down
sleep, 20
click up
mousemove, 653,490
click down
sleep, 20
click up
sleep, 4000
mousemove, 615,222
click down
sleep, 60
click up
mousemove, 615,222
click down
sleep, 60
click up
sleep, 3000
Runwait, taskkill /im chrome.exe /f
gosub, ActivateVC
}
ImageSearch, OutputVarX, OutputVarY, 376-25, 325-25, 654+25, 370+25, *50 C:\Users\maxme\Desktop\2021-06-13 09_01_14-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 5
{
mousemove, 523,484
click down
sleep, 20
click up
}
sleep, 1000
SoundBeep, 2000, 500
gosub, SuccesfullyLinkedGame
}
ImageSearch, OutputVarX, OutputVarY, 574-25, 239-25, 635+25, 280+25, *50 %a_scriptdir%\Pictures\2021-06-13 06_09_26-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 605,260
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 454-25, 360-25, 495+25, 389+25, *50 %a_scriptdir%\Pictures\2021-06-13 06_13_55-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 475,375
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 378-25, 319-25, 645+25, 368+25, *50 %a_scriptdir%\Pictures\2021-06-13 06_14_16-Window.png 
if(ErrorLevel == 0){
mousemove, 511,480
click down
sleep, 60
click up
}
Return
^7::
GetEmail:
gosub, IncreaseAccountNum
WinClose, Home Page - baloonmail.com - Google Chrome
Runwait, taskkill /im chrome.exe /f
sleep, 2000
run, https://baloonmail.com/
sleep, 7000
WinActivate, Home Page - baloonmail.com - Google Chrome
winshow, Home Page - baloonmail.com - Google Chrome
WinMaximize, Home Page - baloonmail.com - Google Chrome 
sleep, 1000
Loop, 2000
{
ImageSearch, OutputVarX, OutputVarY, 182-25, 376-25, 215+25, 404+25, *50 %a_scriptdir%\Pictures\2021-06-13 01_06_21-Home Page - baloonmail.com.png 
if(ErrorLevel == 0){
mousemove, 817,390
click down
sleep, 60
click up
mousemove, 817,390
click down
sleep, 60
click up
mousemove, 817,390
click down
sleep, 60
click up
break
}else{
	SoundBeep, 2000, 15000
}
}
sleep, 3000
Loop, 2000
{
ImageSearch, OutputVarX, OutputVarY, 750-25, 377-25, 779+25, 403+25, *50 %a_scriptdir%\Pictures\2021-06-13 01_12_30-Home Page - baloonmail.com.png 
if(ErrorLevel == 0){
clipboard :=	
Loop, 3
{
mousemove, 765,390
click down
sleep, 60
click up
}
ClipWait, 10
break
}
}
CurrentEmail := clipboard
FileAppend, %clipboard%`n, %A_ScriptDir%\Accounts\EandA C_%ComputerID% A- %accountNum%.txt
FileAppend, %clipboard%, %A_ScriptDir%\Accounts\Email C_%ComputerID% A- %accountNum%.txt
FileAppend, A: %accountNum%`n%clipboard%`n, %A_ScriptDir%\Accounts\EandA C_%ComputerID%.txt
sleep, 500
clipboard :=
mousemove, 682,594
click down
sleep, 300
mousemove, 874,598
click up
sleep, 200
send, {ctrldown}c{ctrlup}
clipwait, 10
RecoverEmail := clipboard
FileAppend, %clipboard%, %A_ScriptDir%\Accounts\EandA C_%ComputerID% A- %accountNum%.txt
FileAppend, %clipboard%, %A_ScriptDir%\Accounts\Recovery C_%ComputerID% A- %accountNum%.txt
FileAppend, %clipboard%`n, %A_ScriptDir%\Accounts\EandA C_%ComputerID%.txt
WinClose, Home Page - baloonmail.com - Google Chrome
Runwait, taskkill /im chrome.exe /f
gosub, ActivateVC
settimer, Ateam, 100
Return
Ateam:
ImageSearch, OutputVarX, OutputVarY, 323-25, 241-25, 462+25, 303+25, *50 %a_scriptdir%\Pictures\2021-06-13 01_49_40-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 393,272
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 172-25, 115-25, 200+25, 140+25, *50 %a_scriptdir%\Pictures\2021-06-13 00_57_40-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 186,128
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 968-25, 513-25, 992+25, 538+25, *50 %a_scriptdir%\Pictures\2021-06-13 00_58_00-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 980,526
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 238-25, 396-25, 327+25, 448+25, *50 %a_scriptdir%\Pictures\2021-06-13 00_58_18-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 283,422
click down
sleep, 20
click up
}
}

WinActivate, AteamID - Google Chrome
winshow, AteamID - Google Chrome
WinMaximize, AteamID - Google Chrome
ImageSearch, OutputVarX, OutputVarY, 588-25, 362-25, 641+25, 386+25, *50 %a_scriptdir%\Pictures\2021-06-13 01_44_00-AteamID.png 
if(ErrorLevel == 0){
settimer, Ateam, off	
gosub, EmailAteam
}
Return
EmailAteam:
sleep, 500
mousemove, 421,329
click down
sleep, 60
click up
mousemove, 421,329
click down
sleep, 60
click up
mousemove, 421,329
click down
sleep, 60
click up
mousemove, 421,329
click down
sleep, 60
click up
clipboard :=
clipboard := CurrentEmail
ClipWait, 10
send, {ctrldown}v{ctrlup}
sleep, 500
mousemove, 599,373
click down
sleep, 20
click up
sleep, 8000
WinClose, AteamID - Google Chrome
Runwait, taskkill /im chrome.exe /f
settimer, GoToTakePictures, 100
Return
GoToTakePictures:
gosub, ActivateVC
ImageSearch, OutputVarX, OutputVarY, 180-25, 131-25, 208+25, 161+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_38_26-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 194,146
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 71-25, 37-25, 97+25, 65+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_38_33-Window.png 
if(ErrorLevel == 0){
Loop, 1
{
mousemove, 84,51
click down
sleep, 20
click up
}
}
ImageSearch, OutputVarX, OutputVarY, 953-25, 109-25, 991+25, 148+25, *50 %a_scriptdir%\Pictures\2021-06-13 05_38_43-Window.png 
if(ErrorLevel == 0){
sleep, 1000
Loop, 5
{
mousemove, 972,129
click down
sleep, 20
click up
}
sleep, 4000
settimer, GoToTakePictures, off
}
Return
ocrname:
pclipboard := clipboard
SetMouseDelay, 5
SetDefaultMouseSpeed, 5
clipboard := 
send, {ctrldown}o{ctrlup}
sleep, 150
mousemove, 106,91
click down
sleep, 100
mousemove, 336,129
click up
clipwait, 10
if(pclipboard == clipboard){
;throwerror
}else{
	data_1 = C_%ComputerID% A:%accountNum% - %clipboard%
	FileRead, content, %A_ScriptDir%\Main Database %ComputerID%.txt
	if(NOT InStr(content, data_1)){
    	FileAppend, %data_1%, %A_ScriptDir%\Main Database.txt
    }
    data_2 = %clipboard%
	FileRead, content, %A_ScriptDir%\Accounts\C_%ComputerID% A- %accountNum%.txt
	if(NOT InStr(content, data_2)){
    	FileAppend, %data_2%, %A_ScriptDir%\Accounts\C_%ComputerID% A- %accountNum%.txt
    }
	;FileAppend, Account: %accountNum% - %clipboard%, %A_ScriptDir%\Main Database.txt
	;FileAppend, %clipboard%, %A_ScriptDir%\Accounts\Account %accountNum%.txt
}
sleep, 100
Return
SuccesfullyLinkedGame:
;accountNum++
FileDelete, %a_scriptdir%\current account num %ComputerID%.txt	
sleep, 300
FileAppend, %accountNum%, %a_scriptdir%\current account num %ComputerID%.txt	
gui, destroy
WinActivate, Valkyrie Connect WW
WinShow, Valkyrie Connect WW
WinMaximize,Valkyrie Connect WW
WinClose, Valkyrie Connect WW
Runwait, taskkill /im ValkyrieConnect.exe /f
Runwait, taskkill /im cheatengine-x86_64-SSE4-AVX2.exe /f
Runwait, taskkill /im cheatengine-x86_64.exe /f
sleep, 2000
Loop, 200
{
ImageSearch, OutputVarX, OutputVarY, 556-25, 462-25, 599+25, 492+25, *50 %a_scriptdir%\Pictures\2021-06-12 05_12_19-Valkyrie Connect WW.png 
if(ErrorLevel == 0){
Loop, 5
{
mousemove, 578,477
click down
sleep, 20
click up
}
break
}
}
sleep, 3000
run, %a_scriptdir%\Reroll VC.bat
sleep, 3000
clipboard :=
clipboard := "Yes"
send, {ctrldown}v{ctrlup}{enter}
sleep, 2000
run, %a_scriptdir%\VALKYRIE CONNECT.url
sleep, 8000
gosub, RestartCommon
gosub, ActivateVC
mousemove, 466,327
click down
sleep, 60
click up
mousemove, 466,327
click down
sleep, 60
click up
gosub, NewGame
Return