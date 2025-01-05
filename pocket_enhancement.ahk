#SingleInstance
SendMode("Input")
InstallKeybdHook()
#UseHook

; 全局变量声明
A_MaxHotkeysPerInterval := 10000
SetWorkingDir(A_ScriptDir)
CoordMode("Mouse", "Window")

; 定义全局变量
global S := 0
global X := 0
global Y := 0
isCtrlDown := false

; ============= START USER-CONFIGURABLE SECTION =============
ShiftKey := "Space"	; The key used to switch to scrollwheel. Can be any key name from the AHK Key list: https://autohotkey.com/docs/KeyList.htm
AltKey := "Alt"	; The key used to switch to scrollwheel. Can be any key name from the AHK Key list: https://autohotkey.com/docs/KeyList.htm
ScaleFactor := 3	; The amount to multiply movement when scrolling
MouseSpeed := 30	; The amount to multiply movement when scrolling
MouseSleep := 10	; The amount to multiply movement when scrolling
MouseStartSpeed := 0.5	; The amount to multiply movement when scrolling
MouseAcceleration := 1	; The amount to multiply movement when scrolling
DragSpeed  := 1 ; 按键移动画布的速度

; ============= END USER-CONFIGURABLE SECTION =============

#Include "mousewheel.ahk"
;#InstallKeybdHook

;#MenuMaskKey vkA5

;!j::Return  ; 禁用 Alt + J

~LCtrl & `;::
{
    Send("^{`;}")
    Send("^{c}")
    Scrolled := 1
}

!j::
{
    Send("{Left}")
}

!l::
{
    Send("{Right}")
}

~!i::
{
    Send("{Up}")
}

~!k::
{
    Send("{Down}")
}

~!`;::Delete
; 不知道为什么这个只会在alt+tab之后才能用


; ~Esc & F1::Suspend
; ~Esc & F2::Reload
; 按下Esc+F3，触发leftctrl、leftshift、leftalt、leftwin四个键
~Esc & F3::
{
    Send("{LCtrl}")
    Send("{LShift}")
    Send("{LAlt}")
    Send("{LWin}")
    Send("{Space}")
}

; 按下Esc+F4，让MouseAcceleration = 1000，再按一次恢复
~Esc & F4::
{
    if (MouseAcceleration == 1)
        MouseAcceleration := 1000
    else
        MouseAcceleration := 1
}

~Esc & F5::
{
    if (DragSpeed == 1)
        DragSpeed := 2
    else
        DragSpeed := 1
}



;按下Esc+F5，出现当前focus的窗口的名称（text）的tooltip，再按一次消失
; ~Esc & F5::
;     MouseGetPos, , , hwnd
;     WinGetTitle, title, ahk_id %hwnd%
;     WinGetClass, class, ahk_id %hwnd%
;     ToolTip, %title%`n%class%
;     Sleep, 2000
;     ToolTip
; return


~Esc & F6::
{
    currentTitle := WinGetTitle("A")
    currentClass := WinGetClass("A")
    focusedControl := ControlGetClassNN(ControlGetFocus("A"))
    hwnd := ControlGetHwnd(focusedControl, "A")
    text := ControlGetText("ahk_id " hwnd)

    ToolTip("
(
Title: " currentTitle "
Class: " currentClass "
Control: " focusedControl "
Text: " text "
)")
    Sleep(2000)
    ToolTip()
}




    


RCtrl::
{
    Send("{LWin}")
}

~Space & LCtrl::
{
    Send("{RWin}")
    Scrolled := 1
}

~Space & LButton::
{
    Send("!{Left}")
    Scrolled := 1
}

~Space & RButton::
{
    Send("!{Right}")
    Scrolled := 1
}

~LCtrl & h::
{
    global
    Send("^z")
    Sleep(30)
    Send("{Esc}")
}

~Space & h::
{
    global
    Send("^z")
    Sleep(30)
    Send("{Esc}")
    Scrolled := 1
}

~Space & q::
{
    global
    Send("{Esc}")
    Scrolled := 1
}

~Space & n::
{
    global
    Scrolled := 1
}

~Space & '::
{
    global
    if (GetKeyState("LShift", "P"))
        Send("+{Backspace}")
    Scrolled := 1
}

~Space & `;::
{
    global
    Send("{Backspace}")
    if (GetKeyState("LShift", "P"))
        Send("+{Backspace}")
    Scrolled := 1
}

~RAlt & l::Run("C:\Windows\System32\Rundll32.Exe user32.dll LockWorkStation")

~lbutton & Space::
{
    Send("{LWin}")
}




~LButton & RButton::
~RButton & LButton::
{
    Send("{Alt Down}{q}{Alt Up}")
}

~LButton::
~RButton::
{
    global
}

~Space & f::
{
    global
    Scrolled := 1
}

~Space & i::
{
    global
    if (GetKeyState("LShift", "P"))
    {
        Send("+{Up}")
        try {
            if WinExist("ahk_exe ONENOTE.EXE")
                ControlSend("+{Up}", , "ahk_exe ONENOTE.EXE")
        }
    }
    else
    {
        Send("{Up}")
        try {
            if WinExist("ahk_exe ONENOTE.EXE")
                ControlSend("{Up}", , "ahk_exe ONENOTE.EXE")
        }
    }
    Scrolled := 1
}

~Space & j::
{
    global
    if (GetKeyState("LShift", "P"))
    {
        if (GetKeyState("F", "P"))
        {
            Send("{Ctrl down}{Shift down}{Left}{Ctrl up}{Shift up}")
            Send("{F up}")
        }
        else
        {
            Send("+{Left}")
        }
    }
    else if (GetKeyState("F", "P"))
    {
        Send("{Ctrl down}{Left}{Ctrl up}")
        Send("{F up}")
    }
    else
    {
        Send("{Left}")
    }
    Scrolled := 1
}

~Space & l::
{
    global
    if (GetKeyState("LShift", "P"))
    {
        if (GetKeyState("F", "P"))
            Send("{Ctrl down}{Shift down}{Right}{Ctrl up}{Shift up}")
        else
        {
            Send("+{Right}")
        }

    }
    Else if (GetKeyState("F", "P"))
    {
        Send("{Ctrl down}")
        Send("{Right}")
        Send("{Ctrl up}")
    }
    else
        Send("{Right}")
    Scrolled := 1
}

~Space & k::
{
    global
    if (GetKeyState("LShift", "P"))
    {
        Send("+{Down}")
        try {
            if WinExist("ahk_exe ONENOTE.EXE")
                ControlSend("+{Down}", , "ahk_exe ONENOTE.EXE")
        }
    }
    else if (GetKeyState("lbutton", "P"))
        Send("#k")
    else
    {
        Send("{Down}")
        try {
            if WinExist("ahk_exe ONENOTE.EXE")
                ControlSend("{Down}", , "ahk_exe ONENOTE.EXE")
        }
    }
    Scrolled := 1
}

~Space & u::
{
    global
    if (GetKeyState("LShift", "P"))
        Send("+{Home}")
    else
        Send("{Home}")
    Scrolled := 1
}

~Space & p::
{
    global
    if (GetKeyState("LShift", "P"))
        Send("+{End}")
    else if (GetKeyState("lbutton", "P"))
        Send("#p")
    else
        Send("{End}")
    Scrolled := 1
}

;=============================好像没啥用============================
~Space & a::
{
    Send("{Win Up}")
}

~Space & PrintScreen::
{
    Send("#s")
}

;=============================caplock屏蔽============================
CapsLock::Return

~CapsLock & x::
{
    Send("{Right}")
    Scrolled := 1
}

;=============================移动鼠标============================
~CapsLock & u::
{
    Click
}

~CapsLock & f::
{
    Click
}

~CapsLock & o::
{
    Click("Right")
}

i::
{
    global
    if GetKeyState("CAPSLOCK", "P") {
        S := MouseStartSpeed  ; 重置S为初始速度
        X := 0
        Y := 0
        Loop {
            if not GetKeyState("i", "P")
                break
            S+=MouseAcceleration
            Y:=-S
            if GetKeyState("j", "P")
                X:=-S
            if GetKeyState("l", "P")
                X:=S
            MouseMove(X, Y, 0, "R")
            Sleep(MouseSleep)
        }
    }
    else
        Send("{i}")
}

j::
{
    global
    if GetKeyState("CAPSLOCK", "P") {
        S := MouseStartSpeed  ; 重置S为初始速度
        X := 0
        Y := 0
        Loop {
            if not GetKeyState("j", "P")
                break
            S+=MouseAcceleration
            X:=-S
            if GetKeyState("i", "P")
                Y:=-S
            if GetKeyState("k", "P")
                Y:=S
            MouseMove(X, Y, 0, "R")
            Sleep(MouseSleep)
        }
    }
    else
        Send("{j}")
}

k::
{
    global
    if GetKeyState("CAPSLOCK", "P") {
        S := MouseStartSpeed  ; 重置S为初始速度
        X := 0
        Y := 0
        Loop {
            if not GetKeyState("k", "P")
                break
            S+=MouseAcceleration
            Y:=S
            if GetKeyState("j", "P")
                X:=-S
            if GetKeyState("l", "P")
                X:=S
            MouseMove(X, Y, 0, "R")
            Sleep(MouseSleep)
        }
    }
    else
        Send("{k}")
}

l::
{
    global
    if GetKeyState("CAPSLOCK", "P") {
        S := MouseStartSpeed  ; 重置S为初始速度
        X := 0
        Y := 0
        Loop {
            if not GetKeyState("l", "P")
                break
            S+=MouseAcceleration
            X:=S
            if GetKeyState("i", "P")
                Y:=-S
            if GetKeyState("k", "P")
                Y:=S
            MouseMove(X, Y, 0, "R")
            Sleep(MouseSleep)
        }
    }
    else
        Send("{l}")
}

;=============================移动画布(页面)============================

CapsLock & q::
{
    global
    if GetKeyState("CapsLock", "P") {
        zoomSpeed := IsWhatApp()
        Loop {
            ; 立即检测q键是否被释放
            if (GetKeyState("q", "P") = 0)
                break
            ; 执行放大/缩小操作
            if (!isCtrlDown) {
                Send("{Ctrl Down}")
                isCtrlDown := true
            }
            Send("{WheelDown}")
            Sleep(zoomSpeed)
        }
        ; 确保Ctrl键被释放
        if (isCtrlDown) {
            Send("{Ctrl Up}")
            isCtrlDown := false
        }
    }
    else
        Send("{q}")
}

CapsLock & e::
{
    global
    if GetKeyState("CapsLock", "P") {
        zoomSpeed := IsWhatApp()
        Loop {
            ; 立即检测e键是否被释放
            if (GetKeyState("e", "P") = 0)
                break
            ; 执行放大/缩小操作
            if (!isCtrlDown) {
                Send("{Ctrl Down}")
                isCtrlDown := true
            }
            Send("{WheelUp}")
            Sleep(zoomSpeed)
        }
        ; 确保Ctrl键被释放
        if (isCtrlDown) {
            Send("{Ctrl Up}")
            isCtrlDown := false
        }
    }
    else
        Send("{e}")
}

IsWhatApp()
{
    hwnd := WinActive("A")
    title := WinGetTitle()
    ;获取title的后半部分
    title := SubStr(title, (InStr(title, "-")+1)<1 ? (InStr(title, "-")+1)-1 : (InStr(title, "-")+1))
    ;输出title
    ; MsgBox %title%
    ; 如果title中包含"OneNote"，则执行后面的语句
    if (InStr(title, "OneNote") > 0)
    {
        Return 50
    }
    else
    {
        ;输出"no"
        Return 150
    }
}

w::
{
    global
    if GetKeyState("CAPSLOCK", "P") {
        x := InWhatApp()*DragSpeed
        y := InWhatApp()
        Loop {
            if not GetKeyState("w", "P")
                break
            DllCall("mouse_event", "uint", 0x800, "int", x, "int", y, "uint", y * 0.1, "int", 0)
            if GetKeyState("a", "P")
                DllCall("mouse_event", "uint", 0x01000, "int", x, "int", y, "uint", x * -0.1, "int", 0)
            if GetKeyState("d", "P")
                DllCall("mouse_event", "uint", 0x01000, "int", x, "int", y, "uint", x * 0.1, "int", 0)
            Sleep(100)
        }
    }
    else
        Send("{w}")
}

a::
{
    global
    if GetKeyState("CAPSLOCK", "P") {
        x := InWhatApp()*DragSpeed
        y := InWhatApp()
        Loop {
            if not GetKeyState("a", "P")
                break
            DllCall("mouse_event", "uint", 0x01000, "int", x, "int", y, "uint", x * -0.1, "int", 0)
            if GetKeyState("w", "P")
                DllCall("mouse_event", "uint", 0x800, "int", x, "int", y, "uint", y * 0.1, "int", 0)
            if GetKeyState("s", "P")
                DllCall("mouse_event", "uint", 0x800, "int", x, "int", y, "uint", y * -0.1, "int", 0)
            Sleep(100)
        }
    }
    else
        Send("{a}")
}

s::
{
    global
    if GetKeyState("CAPSLOCK", "P") {
        x := InWhatApp()*DragSpeed
        y := InWhatApp()
        Loop {
            if not GetKeyState("s", "P")
                break
            DllCall("mouse_event", "uint", 0x800, "int", x, "int", y, "uint", y * -0.1, "int", 0)
            if GetKeyState("a", "P")
                DllCall("mouse_event", "uint", 0x01000, "int", x, "int", y, "uint", x * -0.1, "int", 0)
            if GetKeyState("d", "P")
                DllCall("mouse_event", "uint", 0x01000, "int", x, "int", y, "uint", x * 0.1, "int", 0)
            Sleep(100)
        }
    }
    else
        Send("{s}")
}

d::
{
    global
    if GetKeyState("CAPSLOCK", "P") {
        x := InWhatApp()*DragSpeed
        y := InWhatApp()
        Loop {
            if not GetKeyState("d", "P")
                break
            DllCall("mouse_event", "uint", 0x01000, "int", x, "int", y, "uint", x * 0.1, "int", 0)
            if GetKeyState("s", "P")
                DllCall("mouse_event", "uint", 0x800, "int", x, "int", y, "uint", y * -0.1, "int", 0)
            if GetKeyState("w", "P")
                DllCall("mouse_event", "uint", 0x800, "int", x, "int", y, "uint", y * 0.1, "int", 0)
            Sleep(100)
        }
    }
    else
        Send("{d}")
}

InWhatApp()
{
    hwnd := WinActive("A")
    title := WinGetTitle()
    ;获取title的后半部分
    title := SubStr(title, (InStr(title, "-")+1)<1 ? (InStr(title, "-")+1)-1 : (InStr(title, "-")+1))
    ;输出title
    ; MsgBox %title%
    ; 如果title中包含"OneNote"，则执行后面的语句
    if (InStr(title, "OneNote") > 0)
    {
        Return 1000
    }
    else
    {
        ;输出"no"
        Return 1200
    }
}

;=========================================================
~lbutton & enter:: ;鼠标放在任务栏，滚动滚轮实现音量的加减
{
    ExitApp()
}

~WheelUp::
{
    global
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send("{Volume_Up}")
}

~WheelDown::
{
    global
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send("{Volume_Down}")
}

~MButton::
{
    global
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send("{Volume_Mute}")
}

Existclass(class)
{
    MouseGetPos(, , &win)
    winid := WinGetid(class)
    if (win = winid)
        Return 1
    Else
        Return 0
}



