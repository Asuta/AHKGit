; Pocket Enhancement v1.1.0
; By ClassicOldSong
; https://ccoooss.com
; https://gist.github.com/ClassicOldSong/6eec077dc54e62ab68c2ab29b03713cc
#NoEnv
#SingleInstance
#MaxHotkeysPerInterval 10000
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Window ; 去掉了也没啥影响。。。。(头像测试)
SetBatchLines,% -1, S:=2 ; 设置批量操作的行数，-1表示不限制。（去掉这个，鼠标移动速度就会不稳定）

; ============= START USER-CONFIGURABLE SECTION =============
ShiftKey := "Space"	; The key used to switch to scrollwheel. Can be any key name from the AHK Key list: https://autohotkey.com/docs/KeyList.htm
AltKey := "Alt"	; The key used to switch to scrollwheel. Can be any key name from the AHK Key list: https://autohotkey.com/docs/KeyList.htm
ScaleFactor := 3	; The amount to multiply movement when scrolling
MouseSpeed := 30	; The amount to multiply movement when scrolling
MouseSleep := 0.01	; The amount to multiply movement when scrolling
MouseStartSpeed := 0.5	; The amount to multiply movement when scrolling
MouseAcceleration := 1	; The amount to multiply movement when scrolling

; ============= END USER-CONFIGURABLE SECTION =============

#Include, mousewheel.ahk
;#InstallKeybdHook

;#MenuMaskKey vkA5

~LCtrl & `;::
    Send ^{`;}
    Send ^{c}
    Scrolled := 1
return

~!j::Left
~!l::Right
~!i::Up
~!k::Down

~!`;::Delete
; 不知道为什么这个只会在alt+tab之后才能用


~Esc & F1::Suspend
~Esc & F2::Reload
; 按下Esc+F3，触发leftctrl、leftshift、leftalt、leftwin四个键
~Esc & F3::
    Send {LCtrl}
    Send {LShift}
    Send {LAlt}
    Send {LWin}
    Send {Space}
return
; 按下Esc+F4，让MouseAcceleration = 1000，再按一次恢复
~Esc & F4::
    if (MouseAcceleration == 1)
        MouseAcceleration := 1000
    else
        MouseAcceleration := 1
return



;按下Esc+F5，出现当前focus的窗口的名称（text）的tooltip，再按一次消失
; ~Esc & F5::
;     MouseGetPos, , , hwnd
;     WinGetTitle, title, ahk_id %hwnd%
;     WinGetClass, class, ahk_id %hwnd%
;     ToolTip, %title%`n%class%
;     Sleep, 2000
;     ToolTip
; return


~Esc & F5::
WinGetTitle, currentTitle, A ; 获取当前窗口标题
WinGetClass, currentClass, A ; 获取当前窗口类名
ControlGetFocus, focusedControl, A ; 获取当前焦点控件
ControlGet, hwnd, Hwnd,, %focusedControl%, A ; 获取控件的HWND
ControlGetText, text, % "ahk_id " hwnd ; 使用HWND获取文本

; 显示收集到的信息
ToolTip, 
(
Title: %currentTitle%
Class: %currentClass%
Control: %focusedControl%
Text: %text%
)
Sleep, 2000
ToolTip




    


RCtrl::LWin

~Space & LCtrl::
    Send {RWin}
    Scrolled := 1
return

~Space & LButton::
    Send !{Left}
    Scrolled := 1
return

~Space & RButton::
    Send !{Right}
    Scrolled := 1
return

SendMode Input
#InstallKeybdHook
#UseHook

~LCtrl & h::
    Send , ^z
    Sleep,30
    Send {Esc}
return

~Space & h::
    Send , ^z
    Sleep,30
    Send {Esc}
    Scrolled := 1
return

~Space & q::
    Send {Esc}
    Scrolled := 1
return

~Space & n::
    ;Send {Backspace}
    Scrolled := 1
return

~Space & '::
    ;Send {Backspace}
    if (GetKeyState("LShift", "P"))
        Send +{Backspace}
    Scrolled := 1
return

~Space & `;::
    Send {Backspace}
    if (GetKeyState("LShift", "P"))
        Send +{Backspace}
    Scrolled := 1
return

~RAlt & l::Run,C:\Windows\System32\Rundll32.Exe user32.dll LockWorkStation

~lbutton & Space::LWin




~LButton & RButton::
~RButton & LButton::
Send, {Alt Down}{q}{Alt Up}
return

~LButton::
~RButton::
return



;=============================移动光标（和一点其他的）============================

~Space & f::
    ; Send {Enter}
    Scrolled := 1
return

~Space & i::
    if (GetKeyState("LShift", "P"))
        Send +{Up}
    else
        Send {Up}
    Scrolled := 1
return

~Space & j::
    if (GetKeyState("LShift", "P"))
    {
        if (GetKeyState("F", "P"))
            Send {Ctrl down}{Shift down}{Left}{Ctrl up}{Shift up}
        else
        {
            Send +{Left}
        }

    }
    Else if (GetKeyState("CapsLock", "P"))
    {
        if (GetKeyState("A", "P"))
            Send {Ctrl down}{Shift down}{Left}{Ctrl up}{Shift up}
        else
        {
            Send {Ctrl down}
            Send {Left}
            Send {Ctrl up}
        }

    }
    Else if (GetKeyState("F", "P"))
    {
        Send {Ctrl down}
        Send {Left}
        Send {Ctrl up}
    }
    else
        Send {Left}
    Scrolled := 1
return

~Space & l::
    if (GetKeyState("LShift", "P"))
    {
        if (GetKeyState("F", "P"))
            Send {Ctrl down}{Shift down}{Right}{Ctrl up}{Shift up}
        else
        {
            Send +{Right}
        }

    }
    Else if (GetKeyState("CapsLock", "P"))
    {
        if (GetKeyState("A", "P"))
            Send {Ctrl down}{Shift down}{Right}{Ctrl up}{Shift up}
        else
        {
            Send {Ctrl down}
            Send {Right}
            Send {Ctrl up}
        }

    }
    Else if (GetKeyState("F", "P"))
    {
        Send {Ctrl down}
        Send {Right}
        Send {Ctrl up}
    }
    else
        Send {Right}
    Scrolled := 1
return

~Space & k::
    if (GetKeyState("LShift", "P"))
        Send +{Down}
    else if (GetKeyState("lbutton", "P"))
        Send #k
    else
        Send {Down}
    Scrolled := 1
return

~Space & u::
    if (GetKeyState("LShift", "P"))
        Send +{Home}
    else
        Send {Home}
    Scrolled := 1
return

~Space & p::
    if (GetKeyState("LShift", "P"))
        Send +{End}
    else if (GetKeyState("lbutton", "P"))
        Send #p
    else
        Send {End}
    Scrolled := 1
return

;=============================好像没啥用============================
~Space & a::Send {Win Up}
~Space & PrintScreen::#+s

;=============================caplock屏蔽============================
;实际上加上下面的这个东西的作用是，让单度点击caplock彻底失效  虽然原理是什么也没想明白。。。。。
;好像之前之所以有作用可能是因为方轮子写的什么东西导致的   多半在另外两个脚本里
CapsLock::Return

~CapsLock & x::Right
Scrolled := 1
return

;=============================移动鼠标============================

~CapsLock & u::lbutton
return

~CapsLock & f::lbutton
return

~CapsLock & o::rbutton
return

i::
    if GetKeyState("CAPSLOCK", "P"){
        SetBatchLines,% -1, S:=MouseStartSpeed, X:=0 , Y:=0
        Loop
        {
            if not GetKeyState("i", "P")
            {
                break
            }
            S+=MouseAcceleration
            Y:=-S
            if GetKeyState("j", "P")
            {
                ; S+=MouseAcceleration
                X:=-S
            }

            if GetKeyState("l", "P")
            {
                ; S+=MouseAcceleration
                X:=S
            }
            Mousemove,X, Y, 0, R
            sleep MouseSleep ;
        }
    }
    else {
        Send {i} ;
    }
Return

j::
    if GetKeyState("CAPSLOCK", "P"){
        SetBatchLines,% -1, S:=MouseStartSpeed, X:=0 , Y:=0
        Loop
        {
            if not GetKeyState("j", "P")
            {
                break
            }
            S+=MouseAcceleration
            X:=-S
            if GetKeyState("i", "P")
            {
                ; S+=MouseAcceleration
                Y:=-S
            }

            if GetKeyState("k", "P")
            {
                ; S+=MouseAcceleration
                Y:=S
            }
            Mousemove,X, Y, 0, R
            sleep MouseSleep ;
        }
    }
    else {
        Send {j} ;
    }
Return

k::
    if GetKeyState("CAPSLOCK", "P"){
        SetBatchLines,% -1, S:=MouseStartSpeed, X:=0 , Y:=0
        Loop
        {
            if not GetKeyState("k", "P")
            {
                break
            }
            S+=MouseAcceleration
            Y:=S
            if GetKeyState("j", "P")
            {
                ; S+=MouseAcceleration
                X:=-S
            }

            if GetKeyState("l", "P")
            {
                ; S+=MouseAcceleration
                X:=S
            }
            Mousemove,X, Y, 0, R
            sleep MouseSleep ;
        }
    }
    else {
        Send {k} ;
    }
Return

l::
    if GetKeyState("CAPSLOCK", "P"){
        SetBatchLines,% -1, S:=MouseStartSpeed, X:=0 , Y:=0
        Loop
        {
            if not GetKeyState("l", "P")
            {
                break
            }
            S+=MouseAcceleration
            X:=S
            if GetKeyState("i", "P")
            {
                ; S+=MouseAcceleration
                Y:=-S
            }

            if GetKeyState("k", "P")
            {
                ; S+=MouseAcceleration
                Y:=S
            }
            Mousemove,X, Y, 0, R
            sleep MouseSleep ;
        }
    }
    else {
        Send {l} ;
    }
Return

;=============================移动画布(页面)============================

; zoomSpeed := 50

CapsLock & q::
    if GetKeyState("CAPSLOCK", "P"){
        zoomSpeed := IsWhatApp()
        Loop
        {
            if not GetKeyState("q", "P") ;
                break
            Send {Ctrl Down}{WheelDown}
            Sleep zoomSpeed
            Send {Ctrl Up}
        }
    }
    else {
        Send {q} ;
    }
Return

CapsLock & e::
    if GetKeyState("CAPSLOCK", "P"){
        zoomSpeed := IsWhatApp()
        Loop
        {
            if not GetKeyState("e", "P") ;
                break
            Send {Ctrl Down}{WheelUp}
            Sleep zoomSpeed
            Send {Ctrl Up}
        }
    }
    else {
        Send {e} ;
    }
Return

IsWhatApp()
{
    hwnd := WinActive("A")
    WinGetTitle,title
    ;获取title的后半部分
    title := SubStr(title,InStr(title,"-")+1)
    ;输出title
    ; MsgBox %title%
    ; 如果title中包含“OneNote”，则执行后面的语句
    if (InStr(title,"OneNote") > 0)
    {
        Return 50
    }
    else
    {
        ;输出“no”
        Return 150
    }
}

w::
    if GetKeyState("CAPSLOCK", "P"){
        ;MouseGetPos, x, y
        x :=InWhatApp()*2
        y :=InWhatApp()
        Loop
        {
            if not GetKeyState("w", "P") ;
                break
            DllCall("mouse_event", uint, 0x800, int, x, int, y, uint, y * 0.1, int, 0)
            if GetKeyState("a", "P")
                DllCall("mouse_event", uint, 0x01000, int, x, int, y, uint, x * -0.1, int, 0)
            if GetKeyState("d", "P")
                DllCall("mouse_event", uint, 0x01000, int, x, int, y, uint, x *0.1, int, 0)
            sleep 100 ;
        }
    }
    else {
        Send {w} ;
    }
Return

a::
    if GetKeyState("CAPSLOCK", "P"){
        ;MouseGetPos, x, y
        x :=InWhatApp()*2
        y :=InWhatApp()
        Loop
        {
            if not GetKeyState("a", "P") ;
                break
            DllCall("mouse_event", uint, 0x01000, int, x, int, y, uint, x * -0.1, int, 0)
            if GetKeyState("w", "P")
                DllCall("mouse_event", uint, 0x800, int, x, int, y, uint, y * 0.1, int, 0)
            if GetKeyState("s", "P")
                DllCall("mouse_event", uint, 0x800, int, x, int, y, uint, y * -0.1, int, 0)
            sleep 100 ;
        }
    }
    else {
        Send {a} ;
    }
Return

s::
    if GetKeyState("CAPSLOCK", "P"){
        ;MouseGetPos, x, y
        x :=InWhatApp()*2
        y :=InWhatApp()
        Loop
        {
            if not GetKeyState("s", "P") ;
                break
            DllCall("mouse_event", uint, 0x800, int, x, int, y, uint, y * -0.1, int, 0)
            if GetKeyState("a", "P")
                DllCall("mouse_event", uint, 0x01000, int, x, int, y, uint, x * -0.1, int, 0)
            if GetKeyState("d", "P")
                DllCall("mouse_event", uint, 0x01000, int, x, int, y, uint, x *0.1, int, 0)
            sleep 100 ;
        }
    }
    else {
        Send {s} ;
    }
Return

d::
    if GetKeyState("CAPSLOCK", "P"){
        ;MouseGetPos, x, y
        x :=InWhatApp()*2
        y :=InWhatApp()

        Loop
        {
            if not GetKeyState("d", "P") ;
                break
            DllCall("mouse_event", uint, 0x01000, int, x, int, y, uint, x *0.1, int, 0)
            if GetKeyState("s", "P")
                DllCall("mouse_event", uint, 0x800, int, x, int, y, uint, y * -0.1, int, 0)
            if GetKeyState("w", "P")
                DllCall("mouse_event", uint, 0x800, int, x, int, y, uint, y * 0.1, int, 0)
            sleep 100 ;
        }
    }
    else {
        Send {d} ;
    }
Return

InWhatApp()
{
    hwnd := WinActive("A")
    WinGetTitle,title
    ;获取title的后半部分
    title := SubStr(title,InStr(title,"-")+1)
    ;输出title
    ; MsgBox %title%
    ; 如果title中包含“OneNote”，则执行后面的语句
    if (InStr(title,"OneNote") > 0)
    {
        Return 1000
    }
    else
    {
        ;输出“no”
        Return 1200
    }
}

;=========================================================
~lbutton & enter:: ;鼠标放在任务栏，滚动滚轮实现音量的加减
exitapp
~WheelUp::
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send,{Volume_Up}
Return
~WheelDown::
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send,{Volume_Down}
Return
~MButton::
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send,{Volume_Mute}
Return

Existclass(class)
{
    MouseGetPos,,,win
    WinGet,winid,id,%class%
    if win = %winid%
        Return,1
    Else
        Return,0
}
