#NoEnv
#SingleInstance force
#include MouseDelta.ahk

ScrollMode := 1
Scrolled := 1
CanRelase := 0
md := new MouseDelta("MouseEvent") 




hotkey, % ShiftKey, ShiftKeyPressed
hotkey, % ShiftKey " up", ShiftKeyReleased
return


;if input alt +q, then it will be sent as alt + q and the canrelase will be set to 0(until 100ms)
!q:: 
	CanRelase := 0
	Send {Alt Down}{q}
	Sleep 100
	Send {Alt Up}
 	CanRelase := 1   
return
;(这里加上这么个东西是为了让alt + q（查词软件）不触发space而导致网页向下滑一下。。。。)



ShiftKeyPressed:
	BlockInput, MouseMove
	ScrollMode := 0
	md.SetState(!ScrollMode)""
	return

ShiftKeyReleased:
	BlockInput, MouseMoveOff
	ScrollMode := 1
	md.SetState(!ScrollMode)
	if (!Scrolled&&CanRelase) {
		Send {%ShiftKey%}
	}
	Scrolled := 0
	return

; Gets called when mouse moves or stops
; x and y are DELTA moves (Amount moved since last message), NOT coordinates.
MouseEvent(MouseID, x := 0, y := 0) {
	global ScaleFactor, Scrolled
	if (MouseID) {
		; x *= ScaleFactor, y *= ScaleFactor
		; DllCall("mouse_event",uint,1,int, x * -1 ,int, y * -1 ,ui nt,0,int,0)
		Scrolled := 1
		DllCall("mouse_event", uint, 0x01000, int, x, int, y, uint, x * ScaleFactor * -1, int, 0)
		DllCall("mouse_event", uint, 0x800, int, x, int, y, uint, y * ScaleFactor, int, 0)
	}
}

; HotKeys to change ScaleFactor
CapsLock & -::
	ScaleFactor -= 1
	if (ScaleFactor <= 0) {
		ScaleFactor := 1
	}
	ShowScrollSpeed()
	return

CapsLock & +::
	ScaleFactor += 1
	ShowScrollSpeed()
	return

ShowScrollSpeed() {
	global ScaleFactor
	ToolTip, Scroll Speed: %ScaleFactor%
	SetTimer, RemoveToolTip, Off
	SetTimer, RemoveToolTip, 500
}

RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	ToolTip
	return
