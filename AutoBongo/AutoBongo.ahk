#Requires AutoHotkey v2.0
#MaxThreadsperHotKey 2


;---CHANGE THE FOLLOWING VARIABLES AS NEEDED---
;How many minutes between each check for the chest pop-up:
minutes := 10
;Location of chest image to search for:
pth:= A_WorkingDir "\bongochest.bmp"



;---DO NOT CHANGE THE FOLLOWING VARIABLES---
;Get minutes variable to time in milliseconds
tme:= minutes*60000
;Get width and height of all active monitors combined
vScreenW := SysGet(78)
vScreenH := SysGet(79)
;Set coord modes of pixel and mouse to entire screen
CoordMode "Pixel", "Screen"
CoordMode "Mouse", "Screen"



SetTimer BongoCheck,tme

;Searches for chest pop-up every [minutes] minutes and clicks it if found
BongoCheck(){
    ;Searches entire screen for chest pop-up image:
    if (ImageSearch(&ix,&iy,-3160,-3160,vScreenW,vScreenH,pth)){
        ;if found, click the chest pop-up:
        Click ix,iy

        ;DEBUG: uncomment the following lines if debugging
        ;MouseMove ix,iy
        ;MsgBox("Found at " ix "," iy,"result","OK")
    }
    else{
        ;DEBUG: uncomment the following line if debugging
        ;MsgBox("Not found","result","OK")
    }
    return
}