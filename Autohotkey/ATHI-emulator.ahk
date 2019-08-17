﻿; Author: .THORNE

#Persistent
SetCapsLockState, AlwaysOff


F1::
   Suspend Permit

   If A_IsSuspended

      SoundPlay U:\User folders\Geekzone\Scripts\AutoHotkey\Hotkey sounds\buttonclickrelease.wav

   Else

      SoundPlay U:\User folders\Geekzone\Scripts\AutoHotkey\Hotkey sounds\buttonrollover.wav

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

CapsLock & n::Send {End}

CapsLock & u::Send {PgUp}

CapsLock & o::Send {PgDn}

CapsLock & BS::Send {Del}

CapsLock & z::Send {XButton1} ; the 'back' button on a mouse

CapsLock & c::Send {XButton2} ; the 'forward' button on a mouse

;-------------------------------------

; Close and reload application

CapsLock & t:: Send ^{T}{Browser_Home}

CapsLock & x::Send !{F4}

CapsLock & r::Send ^{F5}

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

; PrintScreen etc.

CapsLock & p::Send {PrintScreen}
CapsLock & g::Send {AppsKey}

;-------------------------------------

CapsLock & v::AltTab
CapsLock & b::ShiftAltTab