#Include "config.ahk"

; --- 键盘模拟鼠标模块 ---
; 模块内部状态变量
global S := 0  ; 当前速度
global X := 0  ; X轴移动值
global Y := 0  ; Y轴移动值
global i_pressed := false  ; 跟踪i键是否被按下
global j_pressed := false  ; 跟踪j键是否被按下
global k_pressed := false  ; 跟踪k键是否被按下
global l_pressed := false  ; 跟踪l键是否被按下

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

; 检查是否有新的方向键被按下
CheckForNewDirectionKey(current_key) {
    global i_pressed, j_pressed, k_pressed, l_pressed
    
    ; 获取当前各方向键的状态
    i_current := GetKeyState("i", "P")
    j_current := GetKeyState("j", "P")
    k_current := GetKeyState("k", "P")
    l_current := GetKeyState("l", "P")
    
    ; 如果有新键被按下，返回true
    if (current_key != "i" && i_current && !i_pressed) {
        i_pressed := true
        return true
    }
    if (current_key != "j" && j_current && !j_pressed) {
        j_pressed := true
        return true
    }
    if (current_key != "k" && k_current && !k_pressed) {
        k_pressed := true
        return true
    }
    if (current_key != "l" && l_current && !l_pressed) {
        l_pressed := true
        return true
    }
    
    ; 更新按键状态
    i_pressed := i_current
    j_pressed := j_current
    k_pressed := k_current
    l_pressed := l_current
    
    return false
}

i::
{
    if GetKeyState("CAPSLOCK", "P") {
        Critical("On")  ; 确保不被中断执行
        S := MouseStartSpeed  ; 重置S为初始速度
        X := 0
        Y := 0
        speedMultiplier := 1.0 ; 每次按下都重置加速度倍数
        
        ; 更新i键的按下状态
        i_pressed := true
        
        Loop {
            if not GetKeyState("i", "P") {
                i_pressed := false
                break
            }
            
            ; 检查是否有新的方向键被按下
            if (CheckForNewDirectionKey("i")) {
                ; 如果有新键被按下，重置加速度
                speedMultiplier := 1.0
            }
                
            ; 独立计算当前按键的速度
            currSpeed := S + (MouseAcceleration * speedMultiplier)
            speedMultiplier += MouseAccelerationFactor
            
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
        speedMultiplier := 1.0 ; 每次按下都重置加速度倍数
        
        ; 更新j键的按下状态
        j_pressed := true
        
        Loop {
            if not GetKeyState("j", "P") {
                j_pressed := false
                break
            }
            
            ; 检查是否有新的方向键被按下
            if (CheckForNewDirectionKey("j")) {
                ; 如果有新键被按下，重置加速度
                speedMultiplier := 1.0
            }
                
            ; 独立计算当前按键的速度
            currSpeed := S + (MouseAcceleration * speedMultiplier)
            speedMultiplier += MouseAccelerationFactor
            
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
        speedMultiplier := 1.0 ; 每次按下都重置加速度倍数
        
        ; 更新k键的按下状态
        k_pressed := true
        
        Loop {
            if not GetKeyState("k", "P") {
                k_pressed := false
                break
            }
            
            ; 检查是否有新的方向键被按下
            if (CheckForNewDirectionKey("k")) {
                ; 如果有新键被按下，重置加速度
                speedMultiplier := 1.0
            }
                
            ; 独立计算当前按键的速度
            currSpeed := S + (MouseAcceleration * speedMultiplier)
            speedMultiplier += MouseAccelerationFactor
            
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
        speedMultiplier := 1.0 ; 每次按下都重置加速度倍数
        
        ; 更新l键的按下状态
        l_pressed := true
        
        Loop {
            if not GetKeyState("l", "P") {
                l_pressed := false
                break
            }
            
            ; 检查是否有新的方向键被按下
            if (CheckForNewDirectionKey("l")) {
                ; 如果有新键被按下，重置加速度
                speedMultiplier := 1.0
            }
                
            ; 独立计算当前按键的速度
            currSpeed := S + (MouseAcceleration * speedMultiplier)
            speedMultiplier += MouseAccelerationFactor
            
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