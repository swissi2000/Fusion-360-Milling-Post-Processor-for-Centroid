# Check/Update Tool Library

![](/images/pp056.PNG)

## Description
If Tool Paths are generated in Fusion 360 with the setting **"In Computer"**, the Tool Diameter Offset in the CNC12 Offset Library is not being used during machining operations and is only needed if accurate **Graphing** in CNC12 is desired.
The draw back of this method is that Tool Wear corrections can't be made on the machine and it is necessary to go back to Fusion 360 to generate new, tool wear adjusted tool paths and then go back to the machine to execute them.

If Tool Paths are generated in Fusion 360 with the setting **"In Control"**, Fusion 360 will generate Tool Paths with Tool Diameter Offsets so it is crucial that the Tool Diameters from the Fusion 360 and CNC12 Tool Library match.
This method is preferred by the operators who like to adjust for Tool Wear directly at the machine without the need to go back into Fusion 360 to create new tool paths.
 
If this Property is checked, the Post Processor will dump the tool diameters from the Fusion 360 Tool Library of all tools being used in the job at the beginning of the job file.
CNC12 specific commands will be added that will loop trough all tools comparing the tool diameter from the Fusion 360 Tool Library with the Diameters from the CNC12 Tool Offset Library.

The added code at the beginning of the job file looks like this:

``` javascript
...
(******************** Begin of Tool Library Diameters check ********************)
N10 #29000 = 6
N15 #29001 = 1
N20 #29201 = 4.
N25 #29002 = 2
N30 #29202 = 10.
N35 #29003 = 3
N40 #29203 = 8.
N45 #29004 = 6
N50 #29204 = 4.
N55 #29005 = 9
N60 #29205 = 6.
N65 #29006 = 12
N70 #29206 = 6.5
N75 #100 = 0
N80 #110 = 0
N85  ;Begin of Tool Check Loop
N90 If #[11000 + #[13000 + #[29001 + #101]]] != #[29001 + #101 + 200] Then M224 #100 "WARNING!\n\nTool #%.0f Diameter does not match!\n\nFusion D: %f\nCNC12 D: %f\n\n#)[A]bort\n#)[I]gnore and continue\n#)[U]pdate CNC12 Library" #[29001 + #101] #[29201 + #101] #[11000 + #[13000 + #[29001 + #101]]]
N95 If #100 != 0 && #100 != 1 && #100 != 4 && #100 != 21 Then GOTO 85
N100 If #100 == 1 Then M99
N105 If #100 == 21 Then #[11000 + #[13000 + #[29001 + #101]]] = #[29201 + #101]
N110 #101 = #101 + 1
N115 If #101 < #29000 Then GOTO 85
(********************* End of Tool Library Diameters check *********************)
...
```    
If the Tool Diameter from the Fusion 360 Tool Library does not match the Diameter Offset from the CNC12 Offset Library, a warning message like this will be displayed:

![](/images/pp057.PNG)

The warning message will give the following options:

* [A]bort: Entering the letter "A" will immediately abort the job
* [I]gnore and continue: Entering the letter "I" will let the job continue without any actions
* [U]pdate the CNC12 Tool Library: Entering the letter "U" will update the corresponding CNC12 Diameter Offset and continue the job

It would be nice to sync all tool information between the Fusion 360 and the CNC12 Tool Library but unfortunately CNC12 does not provide Write-Access to other information in the Tool Libary at this point.



[Back](index.md)

