#Include "config.ahk"

; --- 键盘模拟鼠标模块 ---
; 模块内部状态变量
global S := 0  ; 当前速度
global X := 0  ; X轴移动值
global Y := 0  ; Y轴移动值

; ===== 鼠标点击热键 =====
; CapsLock + u/f/o 用于鼠标点击操作

~CapsLock & u::
{
    if GetKeyState("u", "P") {
        Click("Down")
        KeyWait("u")
        Click("Up")
    } else
        Click
}

~CapsLock & f::
{
    if GetKeyState("f", "P") {
        Click("Down")
        KeyWait("f")
        Click("Up")
    } else
        Click
}

~CapsLock & o::
{
    if GetKeyState("o", "P") {
        Click("Right Down")
        KeyWait("o")
        Click("Right Up")
    } else
        Click("Right")
}

; ===== 鼠标移动热键 =====
; CapsLock + i/j/k/l 用于鼠标移动操作

i::
{
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