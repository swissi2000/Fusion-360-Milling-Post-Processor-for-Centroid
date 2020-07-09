# Check Tool Offset 

![](/images/pp006.PNG)

## Description
This Property allows to stop program execution after each tool offset command. This allows to verify if the correct tool offset has been applied.

There are two options available, a *M0* stop or a *M200* message. Both need to be confirmed with a *Cycle Start* for the job to continue. Also in both cases the block/line will be preceded by the Skip Command "/" which will allow these stops to be skipped by activating */Skips On* in CNC12 (*Run[F4]->/Skips On[F4]*).

## Implementation Details
### Option M0
This option will add an *M0* command after each Tool Offset move. If */Skips* in CNC12 is not *On*, the job execution will stop to allow for the verification of the correct distanceand between tool tip and *Z0-Point*. Continuation needs to be confirmed with a *Cycle Start*. 

The job file will look like this:

```javascript
.
N60 G43 Z15. H4
/ N65 M0
(CHECK TOOL-HEIGHT-OFFSET)
.
```

### Option M200
This option will add a M200 command that will display a message after each Tool Offset move. If */Skips* in CNC12 is not *On*, the job execution will stop displaying a message to check for the correct Tool Offset. The message also contains the correct Z-Distance that Fusion 360 expects between the tool tip and the *Z0-Point*. Continuation needs to be confirmed with a *Cycle Start*. 

The job file will look like this:

```javascript
.
N60 G43 Z15. H4
/ N65 M200 "Check Tool-Height-Offset!\n\nZ-Distance between Tool and Z-Origin Point should be: 15\n\nPress Cycle Start to continue\n"
.
```
The diplayed message will look like this:

![](/images/pp007.PNG)


[Back](index.md)