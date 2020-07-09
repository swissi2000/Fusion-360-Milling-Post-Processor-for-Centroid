;------------------------------------------------------------------------------
; Filename: begin.cnc
; Description: Execute at the beginning of each job
; Notes: Add M98 "c:\cncm\ncfiles\begin.cnc" to the beginning of each Job
;        Requires the Fusion 360 Post Processor Property "Write CNC12 Info Variables" to be enabled
; VARIABLES USED
; #25012 - Time in seconds - System variable
; #29951 - time started - User variable
#101 = 0  ; How many seconds a message should be displayed. 0 is indefinitely and needs to be confirmed with Cycle Start
;------------------------------------------------------------------------------

IF #50001                        ;Prevent lookahead from parsing past here
IF #4201 || #4202 THEN GOTO 1000 ;Skip macro if graphing or searching

N100

; Display Job Info
M225 #101 "#)CAM File  : %s\nPrg Name: %s\nComment: %s\n\nSetup: %s\n%s\n\nOrigin Point (Part 0): %s  WCS: %s\n\nTools needed (List limited to first 10 Tools):\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n                 Press Cycle Start to continue\n" #331 #302 #303 #304 #305 #324 #326 #351 #352 #353 #354 #355 #356 #357 #358 #359 #360

; Open the log file and record Date, Time and CAM File name with Version Number. 
; File end.cnc required at the end of job to record total runtime 
#29951 = #25012 ; start the timer to calculate total runtime of job  
M121 "#302.log" ;opens the log file with the same name as the Program Name in the same directory. Will create file if it doesn't exist
M223 "Run Date: " 
M127  ;Writes Date and Time to log file
M223 "Based on CAM File: %s\n" #331

N1000
M99  ; Return to calling job/macro