; Author: .THORNE

#Persistent
SetCapsLockState, AlwaysOff


F1::
   Suspend Permit

   If A_IsSuspended

      SoundPlay %UTILITIES%\AutoHotkey\Hotkey sounds\buttonclickrelease.wav

   Else

      SoundPlay %UTILITIES%\AutoHotkey\Hotkey sounds\buttonrollover.wav

   Suspend

Return


; ==================<<<••••>>>==================


          ; [ Custom keyboard layout ]


; LAlt::LCtrl
; LCtrl::LAlt
RAlt::CapsLock

; Switch [ with { and ] with }

:*?:[::
    SendInput, {Shift Down}`[{Shift up}
    return

:*?:]::
    SendInput, {Shift Down}`]{Shift Up}
    return

:*?:{::
    SendInput, `[
    return

:*?:}::
    SendInput, `]
    return


; ==================<<<••••>>>==================


              ; [ Layer setup ]


; Navigation

CapsLock & i::Send {Blind}{up}

CapsLock & j::Send {Blind}{left}

CapsLock & k::Send {Blind}{down}

CapsLock & l::Send {Blind}{right}

CapsLock & h::Send {Home}

CapsLock & `;::Send {Enter}

CapsLock & n::Send {Backspace}

; CapsLock & u::Send {PgUp}

; CapsLock & o::Send {PgDn}

CapsLock & BS::Send {Del}

; CapsLock & z::Send {XButton1} ; the 'back' button on a mouse

; CapsLock & c::Send {XButton2} ; the 'forward' button on a mouse

;-------------------------------------

; Close and reload application

CapsLock & x::Send !{F4}

CapsLock & r::Send ^{F5}

CapsLock & c::Send ^{t}

CapsLock & v::Send ^{w}

;-------------------------------------

; Rename

CapsLock & 2:: Send {F2}

;-------------------------------------

; Maps Ctrl+Win+Left & Right to Ctrl+y & Ctrl+x


CapsLock & 1::Send {LCtrl down}{LWin down}{Left down}{LCtrl up}{LWin up}{Left up}

CapsLock & 3::Send {LCtrl down}{LWin down}{Right down}{LCtrl up}{LWin up}{Right up}

;-------------------------------------

; Flux brightness up and down

CapsLock & e::Send !{PgUp}

CapsLock & q::Send !{PgDn}

;-------------------------------------

; Media Controls

CapsLock & f::Send {Media_Play_Pause}

CapsLock & w::Send {Volume_Up}

CapsLock & a::Send {Media_Prev}

CapsLock & s::Send {Volume_Down}

CapsLock & d::Send {Media_Next}

;-------------------------------------

; Context menu

CapsLock & g::Send {AppsKey}

;-------------------------------------

; Mouse move

CapsLock & 0::
While (GetKeyState("0", "P"))
{
    MouseMove, 0, -80, 2, R
	sleep 0
}
Return

CapsLock & p::
While (GetKeyState("p", "P"))
{
    MouseMove, 0, 80, 2, R
	sleep 0
}
Return

CapsLock & 9::
While (GetKeyState("9", "P"))
{
    MouseMove, -80, 0, 2, R
	sleep 0
}
Return

CapsLock & -::
While (GetKeyState("-", "P"))
{
    MouseMove, 80, 0, 2, R
	sleep 0
}
Return

;-------------------------------------

; Mouse click

CapsLock & o::
    Send {LButton}
Return

CapsLock & \::
    Send {RButton}
Return

;-------------------------------------

; Mouse scroll

CapsLock & {::
While (GetKeyState("{", "P"))
{
	send {WheelUp}
	;send ^{Up}
	sleep 21
}
Return

CapsLock & }::
While (GetKeyState("}", "P"))
{
	send {WheelDown}
	;send ^{Down}
	sleep 21
}
Return

;-------------------------------------

; Arctic Terminal

CapsLock & t::
if WinExist("ahk_exe WindowsTerminal.exe") {
    WinGetTitle, WinTitle, ahk_pid %NewPID%
    WinGet MX, MinMax, %WinTitle%
    if (MX = -1) {
        ; WinActivate, ahk_exe WindowsTerminal.exe
        WinRestore %WinTitle%
    } else if (MX = 0) {
        WinMinimize %WinTitle%
    }
} else Run wt.exe, %UTILITIES%
return

RShift & c::

global windowName
global X
global Y
global begWidth
global begHeight

WinGetTitle, windowName, A

WinGetPos, X, Y, begWidth, begHeight, %windowName%

CenterWindow(windowTitleVariable)
{
    WinGetPos,,, Width, Height, %windowTitleVariable%
    WinMove, %windowTitleVariable%,, (A_ScreenWidth/2)-(1920/2), (A_ScreenHeight/2)-(1080/2), 1920, 1080
}

CenterWindow(windowName)

return


RShift & b::

WinMove, %windowName%,, X, Y, begWidth, begHeight

return



RShift & x::

global windowName
global X
global Y
global begWidth
global begHeight

WinGetTitle, windowName, A

WinGetPos, X, Y, begWidth, begHeight, %windowName%

CenterWindowLarge(windowTitleVariable)
{
    WinGetPos,,, Width, Height, %windowTitleVariable%
    WinMove, %windowTitleVariable%,, (A_ScreenWidth/2)-(2000/2), (A_ScreenHeight/2)-(1600/2), 2000, 1500
}

CenterWindowLarge(windowName)

return



RShift & z::

global windowName
global X
global Y
global begWidth
global begHeight

WinGetTitle, windowName, A

WinGetPos, X, Y, begWidth, begHeight, %windowName%

CenterWindowExtraLarge(windowTitleVariable)
{
    WinGetPos,,, Width, Height, %windowTitleVariable%
    WinMove, %windowTitleVariable%,, (A_ScreenWidth/2)-(2800/2), (A_ScreenHeight/2)-(1700/2), 2800, 1600
}

CenterWindowExtraLarge(windowName)

return

;-------------------------------------

; Opn Arctic Terminal in active window directory

CapsLock & /::
Run wt.exe, % Explorer_GetSelection()

Explorer_GetSelection() {
   WinGetClass, winClass, % "ahk_id" . hWnd := WinExist("A")
   if !(winClass ~="Progman|WorkerW|(Cabinet|Explore)WClass")
      Return

   shellWindows := ComObjCreate("Shell.Application").Windows
   if (winClass ~= "Progman|WorkerW")
      shellFolderView := shellWindows.FindWindowSW(0, 0, SWC_DESKTOP := 8, 0, SWFO_NEEDDISPATCH := 1).Document
   else {
      for window in shellWindows
         if (hWnd = window.HWND) && (shellFolderView := window.Document)
            break
   }
   for item in shellFolderView.SelectedItems
      result .= (result = "" ? "" : "`n") . item.Path
   if !result
      result := shellFolderView.Folder.Self.Path
   Return result
}
