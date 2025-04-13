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

; 使用DllCall直接移动鼠标，比MouseMove更高效
DirectMouseMove(dx, dy) {
    static MOUSEEVENTF_MOVE := 0x0001
    DllCall("mouse_event", "UInt", MOUSEEVENTF_MOVE, "Int", dx, "Int", dy, "UInt", 0, "UPtr", 0)
}

i::
{
    if GetKeyState("CAPSLOCK", "P") {
        Critical("On")  ; 确保不被中断执行
        S := MouseStartSpeed  ; 重置S为初始速度
        X := 0
        Y := 0
        
        ; 降低循环内操作复杂度，简化速度计算
        speedMultiplier := 1.0
        
        Loop {
            if not GetKeyState("i", "P")
                break
                
            ; 优化速度计算
            currSpeed := S + (MouseAcceleration * speedMultiplier)
            speedMultiplier += MouseAccelerationFactor  ; 平滑的加速
            
            Y := -currSpeed
            if GetKeyState("j", "P")
                X := -currSpeed
            else if GetKeyState("l", "P")
                X := currSpeed
            else
                X := 0
                
            ; 使用直接DllCall移动鼠标
            DirectMouseMove(X, Y)
            
            ; 动态调整休眠时间，速度快时减少休眠
            sleepTime := Max(1, MouseSleep - (speedMultiplier / 10))
            Sleep(sleepTime)
        }
        Critical("Off")
    }
    else
        Send("{i}")
}

j::
{
    if GetKeyState("CAPSLOCK", "P") {
        Critical("On")  ; 确保不被中断执行
        S := MouseStartSpeed  ; 重置S为初始速度
        X := 0
        Y := 0
        
        ; 降低循环内操作复杂度，简化速度计算
        speedMultiplier := 1.0
        
        Loop {
            if not GetKeyState("j", "P")
                break
                
            ; 优化速度计算
            currSpeed := S + (MouseAcceleration * speedMultiplier)
            speedMultiplier += MouseAccelerationFactor  ; 平滑的加速
            
            X := -currSpeed
            if GetKeyState("i", "P")
                Y := -currSpeed
            else if GetKeyState("k", "P")
                Y := currSpeed
            else
                Y := 0
                
            ; 使用直接DllCall移动鼠标
            DirectMouseMove(X, Y)
            
            ; 动态调整休眠时间，速度快时减少休眠
            sleepTime := Max(1, MouseSleep - (speedMultiplier / 10))
            Sleep(sleepTime)
        }
        Critical("Off")
    }
    else
        Send("{j}")
}

k::
{
    if GetKeyState("CAPSLOCK", "P") {
        Critical("On")  ; 确保不被中断执行
        S := MouseStartSpeed  ; 重置S为初始速度
        X := 0
        Y := 0
        
        ; 降低循环内操作复杂度，简化速度计算
        speedMultiplier := 1.0
        
        Loop {
            if not GetKeyState("k", "P")
                break
                
            ; 优化速度计算
            currSpeed := S + (MouseAcceleration * speedMultiplier)
            speedMultiplier += MouseAccelerationFactor  ; 平滑的加速
            
            Y := currSpeed
            if GetKeyState("j", "P")
                X := -currSpeed
            else if GetKeyState("l", "P")
                X := currSpeed
            else
                X := 0
                
            ; 使用直接DllCall移动鼠标
            DirectMouseMove(X, Y)
            
            ; 动态调整休眠时间，速度快时减少休眠
            sleepTime := Max(1, MouseSleep - (speedMultiplier / 10))
            Sleep(sleepTime)
        }
        Critical("Off")
    }
    else
        Send("{k}")
}

l::
{
    if GetKeyState("CAPSLOCK", "P") {
        Critical("On")  ; 确保不被中断执行
        S := MouseStartSpeed  ; 重置S为初始速度
        X := 0
        Y := 0
        
        ; 降低循环内操作复杂度，简化速度计算
        speedMultiplier := 1.0
        
        Loop {
            if not GetKeyState("l", "P")
                break
                
            ; 优化速度计算
            currSpeed := S + (MouseAcceleration * speedMultiplier)
            speedMultiplier += MouseAccelerationFactor  ; 平滑的加速
            
            X := currSpeed
            if GetKeyState("i", "P")
                Y := -currSpeed
            else if GetKeyState("k", "P")
                Y := currSpeed
            else
                Y := 0
                
            ; 使用直接DllCall移动鼠标
            DirectMouseMove(X, Y)
            
            ; 动态调整休眠时间，速度快时减少休眠
            sleepTime := Max(1, MouseSleep - (speedMultiplier / 10))
            Sleep(sleepTime)
        }
        Critical("Off")
    }
    else
        Send("{l}")
} 