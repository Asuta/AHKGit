#SingleInstance force
#Include "config.ahk"
#Include "MouseDelta.ahk"

; --- 滚轮增强模块 ---
; 模块内部状态变量
global ScrollMode := 1
global CanRelase := 1

; 创建MouseDelta实例
global md := MouseDelta("MouseEvent")

; 热键绑定
Hotkey(ShiftKey, ShiftKeyPressed)
Hotkey(ShiftKey " up", ShiftKeyReleased)

; 按下ShiftKey（默认为Space）时触发
ShiftKeyPressed(ThisHotkey) {
    global
    BlockInput("MouseMove")
    ScrollMode := 0
    md.SetState(!ScrollMode)
    return
}

; 释放ShiftKey（默认为Space）时触发
ShiftKeyReleased(ThisHotkey) {
    global Scrolled, ScrollMode
    BlockInput("MouseMoveOff")
    ScrollMode := 1
    md.SetState(!ScrollMode)
    if (!Scrolled) {
        Send("{" ShiftKey "}")
    }
    Scrolled := 0
    return
}

; 当鼠标移动时的回调函数
; x和y是移动的增量，不是坐标
MouseEvent(MouseID, x := 0, y := 0) {
    global ScaleFactor, Scrolled
    if (MouseID) {
        Scrolled := 1
        DllCall("mouse_event", "uint", 0x01000, "int", x, "int", y, "uint", x * ScaleFactor * -1, "int", 0)
        DllCall("mouse_event", "uint", 0x800, "int", x, "int", y, "uint", y * ScaleFactor, "int", 0)
    }
}

; 调整滚动速度的热键
CapsLock & -:: {
    global
    ScaleFactor -= 1
    if (ScaleFactor <= 0) {
        ScaleFactor := 1
    }
    ShowScrollSpeed()
}

CapsLock & +:: {
    global
    ScaleFactor += 1
    ShowScrollSpeed()
}

; 显示滚动速度
ShowScrollSpeed() {
    global ScaleFactor
    ToolTip("滚动速度: " ScaleFactor)
    SetTimer(RemoveToolTip, 0)
    SetTimer(RemoveToolTip, 500)
}

; 移除提示
RemoveToolTip() {
    SetTimer(RemoveToolTip, 0)
    ToolTip()
    return
} 