#SingleInstance force
SendMode("Input")
InstallKeybdHook()
#UseHook

; 全局设置
A_MaxHotkeysPerInterval := 10000
SetWorkingDir(A_ScriptDir)
CoordMode("Mouse", "Window")
SetKeyDelay(0)  ; 设置按键延迟为0

; 引入配置和模块
#Include "config.ahk"
#Include "scroll_wheel_enhancer.ahk"
#Include "keyboard_mouse.ahk"
#Include "canvas_panning.ahk"

; =============================通用热键设置============================

; 禁用 CapsLock 默认行为
CapsLock::Return

; ===== Alt + JKLI 导航快捷键 =====
$!j::Send("{Blind}{Left}")
$+!j::Send("{Blind}{Left}")  ; 显式定义Shift+Alt组合

$!l::Send("{Blind}{Right}")
$+!l::Send("{Blind}{Right}")  ; 显式定义Shift+Alt组合

$!i::Send("{Blind}{Up}")
$+!i::Send("{Blind}{Up}")  ; 显式定义Shift+Alt组合

$!k::Send("{Blind}{Down}")
$+!k::Send("{Blind}{Down}")  ; 显式定义Shift+Alt组合

$!`;::Send("{Blind}{Delete}")

; ===== Esc 组合键 =====
~Esc & F3::
{
    Send("{LCtrl}")
    Send("{LShift}")
    Send("{LAlt}")
    Send("{LWin}")
    Send("{Space}")
}

~Esc & F4::
{
    global MouseAcceleration
    if (MouseAcceleration == 1)
        MouseAcceleration := 1000
    else
        MouseAcceleration := 1
}

~Esc & F5::
{
    global DragSpeed
    if (DragSpeed == 1)
        DragSpeed := 2
    else
        DragSpeed := 1
}

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

; ===== 其他通用热键 =====
RCtrl::
{
    Send("{LWin Down}")
    KeyWait("RCtrl")
    Send("{LWin Up}")
}

~Space & LCtrl::
{
    global Scrolled
    Send("{RWin}")
    Scrolled := 1
}

~Space & LButton::
{
    global Scrolled
    Send("!{Left}")
    Scrolled := 1
}

~Space & RButton::
{
    global Scrolled
    Send("!{Right}")
    Scrolled := 1
}

~LCtrl & h::
{
    Send("^z")
    Sleep(30)
    Send("{Esc}")
}

~Space & h::
{
    global Scrolled
    Send("^z")
    Sleep(30)
    Send("{Esc}")
    Scrolled := 1
}

~Space & q::
{
    global Scrolled
    Send("{Esc}")
    Scrolled := 1
}

~Space & n::
{
    global Scrolled
    Scrolled := 1
}

~Space & '::
{
    global Scrolled
    if (GetKeyState("LShift", "P"))
        Send("+{Backspace}")
    Scrolled := 1
}

~Space & `;::
{
    global Scrolled
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

~Space & f::
{
    global Scrolled
    Scrolled := 1
}

; ===== 使用Space+方向键的导航热键 =====
~Space & i::
{
    global Scrolled
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
    global Scrolled
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
    global Scrolled
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
    global Scrolled
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
    global Scrolled
    if (GetKeyState("LShift", "P"))
        Send("+{Home}")
    else
        Send("{Home}")
    Scrolled := 1
}

~Space & p::
{
    global Scrolled
    if (GetKeyState("LShift", "P"))
        Send("+{End}")
    else if (GetKeyState("lbutton", "P"))
        Send("#p")
    else
        Send("{End}")
    Scrolled := 1
}

~Space & a::
{
    Send("{Win Up}")
}

~Space & PrintScreen::
{
    Send("#s")
}

; ===== 鼠标滚轮在任务栏上的特殊行为 =====
~WheelUp::
{
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send("{Volume_Up}")
}

~WheelDown::
{
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send("{Volume_Down}")
}

~MButton::
{
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send("{Volume_Mute}")
}

; 鼠标左键+回车：退出脚本
~lbutton & enter::
{
    ExitApp()
}

; ===== 辅助函数 =====
Existclass(class)
{
    MouseGetPos(, , &win)
    winid := WinGetid(class)
    if (win = winid)
        Return 1
    Else
        Return 0
} 