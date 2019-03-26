randomChars(length) {

   static   c

   if   !c
      Loop, 26
         c .=   (!c ? "" : "`n") Chr(A_Index + 96)
   Loop %   length
   {
      Random, n, 1, 1296
      Loop %   n
         Sort, c, Random
      str .=   SubStr(c,1,1)
   }
   return   str
}

printOnePage()
{
Sleep 50
MouseClick, left, 685,653
Sleep, 300
Send, ^p
Sleep, 500
Send, {Enter}
Sleep, 300
Send, {Home}
Sleep, 50
Send % randomChars(8)
Sleep, 200
Send, {Enter}
return
}

^h::
MsgBox, Click where you want to capture
MouseGetPos, endxpos, endypos
MsgBox Co-ordinate is  %endxpos% , %endypos%
return

^j::
InputBox, pages, How many pages?
Loop % pages 
{
    printOnePage()
    Sleep, 350
    Send, {Right}
    Random, sleepytime, 1000,3300
    Sleep % sleepytime
}
MsgBox, All Done
return


