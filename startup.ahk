#SingleInstance force

; 这是整个增强键盘/鼠标系统的主入口点
; 只需要包含主脚本文件即可启动所有功能

#Include "main_hotkeys.ahk"

; 启动时显示一个简短的提示，表明脚本已经启动
ToolTip("键盘鼠标增强系统已启动！")
Sleep(1000)
ToolTip()