; 获取当前用户的桌面路径
ProgramPath := A_Desktop "\new.exe"

; 启动程序
StartProgram() {
    global ProgramPath
    Run(ProgramPath)
}

; 结束程序
EndProgram() {
    ProcessClose("new.exe")
}

; 重启程序
RestartProgram() {
    EndProgram()
    Sleep(1000) ; 等待1秒以确保程序完全关闭
    StartProgram()
}

; 热键定义
^!s::StartProgram()   ; Ctrl + Alt + S 启动程序
^!e::EndProgram()     ; Ctrl + Alt + E 结束程序
^!r::RestartProgram() ; Ctrl + Alt + R 重启程序

; 提示信息
MsgBox("脚本已启动。使用 Ctrl+Alt+S 启动，Ctrl+Alt+E 结束，Ctrl+Alt+R 重启程序。")
