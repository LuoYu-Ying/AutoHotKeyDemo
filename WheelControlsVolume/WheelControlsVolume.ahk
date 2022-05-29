#SingleInstance, Force
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

MsgBox, 鼠标放在任务栏，滚动滚轮实现音量的加减`n使用方法：`n 向上滚动：音量增加`n 向下滚动：音量较小`n 按下滚轮：静音/恢复`n退出程序：`n 鼠标左键点击任务栏时按下Esc键

~WheelUp:: 
    if (checkWinId() = 1) 
        Send,{Volume_Up} 
Return 

~WheelDown:: 
    if (checkWinId() = 1) 
        Send,{Volume_Down} 
Return 

~MButton:: 
    if (checkWinId() = 1) 
        Send,{Volume_Mute} 
Return 

~lbutton & esc:: ;鼠标放在任务栏，滚动滚轮实现音量的加减
    TrayTip, WheelMakesVolume, 程序已退出, 3
exitapp 

checkWinId() { 
    MouseGetPos, , ,win 
    WinGet, winId, id, ahk_class Shell_TrayWnd
    if win = %winId% 
        Return, 1 
    Else 
        Return, 0 
}
