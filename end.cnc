;------------------------------------------------------------------------------
; Filename: end.cnc
; Description: Write the total job runtime to the log file that was opened with begin.cnc
; Notes: Add M98 "c:\cncm\ncfiles\end.cnc" to the end of each Job
; VARIABLES USED
; #25012 - Time in seconds - System variable
; #29951 - time started - User variable
; #29952 - time stopped - User variable
; #29953 – Hours - User variable
; #29954 – Minutes - User variable
; #29955 – Seconds - User variable 
; #29956 - Total time in seconds - User variable
;------------------------------------------------------------------------------

IF #50010                        ;Prevent lookahead from parsing past here
IF #4201 || #4202 THEN GOTO 1000 ;Skip macro if graphing or searching

#29952 = #25012 ; - ending time- when the program is finished

#29956 = [#29952-#29951] ; Starting time subtracted from ending time to get total time in seconds

#29953 = FIX[#29956 / 3600]  ; Calculate the number of hours

#29954 = FIX[[#29956 - [#29953 * 3600]] / 60] ; Calculate the number of Minutes

#29955 = #29956 - (#29953 * 3600) - (#29954 * 60) ; Calculate the remaining Seconds

M223 "Run Time: %2.0f:%02.0f:%02.0f\n\n" #29953 #29954 #29955

N1000
M99