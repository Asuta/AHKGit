; 获取脚本所在目录下的程序路径
ProgramPath := A_ScriptDir "\pocket_enhancement.exe"

; 启动程序
StartProgram() {
    global ProgramPath
    Run(ProgramPath)
}

; 结束程序
EndProgram() {
    ProcessClose("pocket_enhancement.exe")
}

; 重启程序
RestartProgram() {
    EndProgram()
    Sleep(100) ; 等待1秒以确保程序完全关闭
    StartProgram()
}

; 完全重启（重启自身和外部程序）
FullRestart() {
    EndProgram()
    Reload()
}

; 热键定义
; ^!s::StartProgram()   ; Ctrl + Alt + S 启动程序
~Esc & F1::EndProgram()     ; Ctrl + Alt + E 结束程序
~Esc & F2::FullRestart() ; Ctrl + Alt + R 重启程序

; 提示信息
; MsgBox("脚本已启动。使用 Ctrl+Alt+S 启动，Ctrl+Alt+E 结束，Ctrl+Alt+R 重启程序。")

; 启动时自动执行一次重启
RestartProgram()
