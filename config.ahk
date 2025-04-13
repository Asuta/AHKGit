; ============= 用户配置部分 =============
; 全局配置变量
global ShiftKey := "Space"	; 切换到滚轮模式的键。可以是任何 AHK 键名: https://autohotkey.com/docs/KeyList.htm
global AltKey := "Alt"	    ; Alt键配置
global ScaleFactor := 3	    ; 滚动时移动量的乘数
global MouseSpeed := 30	    ; 鼠标移动速度
global MouseSleep := 10	    ; 鼠标移动的延迟时间
global MouseStartSpeed := 0.5	; 鼠标初始速度
global MouseAcceleration := 1	; 鼠标加速度
global DragSpeed := 1       ; 按键移动画布的速度

; 全局状态变量（在多个模块之间共享）
global Scrolled := 0        ; 标记是否已滚动的状态变量
; ============= 配置部分结束 ============= 