#Include "config.ahk"

; --- 画布平移缩放模块 ---
; 模块内部状态变量
global isCtrlDown := false  ; 控制Ctrl键状态

; ===== 画布缩放功能 =====
; CapsLock + q/e 用于缩放操作

CapsLock & q::
{
    global isCtrlDown  ; 添加全局变量声明
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
    global isCtrlDown  ; 添加全局变量声明
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

; ===== 画布平移功能 =====
; CapsLock + w/a/s/d 用于平移操作

w::
{
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

; ===== 辅助函数 =====

; 检测当前应用程序类型，返回缩放速度
IsWhatApp()
{
    hwnd := WinActive("A")
    title := WinGetTitle()
    ;获取title的后半部分
    title := SubStr(title, (InStr(title, "-")+1)<1 ? (InStr(title, "-")+1)-1 : (InStr(title, "-")+1))
    
    ; 如果title中包含"OneNote"，则执行后面的语句
    if (InStr(title, "OneNote") > 0)
    {
        Return 50
    }
    else
    {
        Return 150
    }
}

; 检测当前应用程序类型，返回平移速度
InWhatApp()
{
    hwnd := WinActive("A")
    title := WinGetTitle()
    ;获取title的后半部分
    title := SubStr(title, (InStr(title, "-")+1)<1 ? (InStr(title, "-")+1)-1 : (InStr(title, "-")+1))
    
    ; 如果title中包含"OneNote"，则执行后面的语句
    if (InStr(title, "OneNote") > 0)
    {
        Return 1000
    }
    else
    {
        Return 1200
    }
} 