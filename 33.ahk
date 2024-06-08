~#h:: ; 监听 Windows + H
    ; 等待松开 Windows 键或 H 键
    KeyWait, LWin
    KeyWait, h
    ; 发送 Esc 键以关闭语音输入窗口
    Send, {Esc}
return