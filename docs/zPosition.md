# Z-Position at End of Job

![](/images/pp015.PNG)

## Description
This Property allows to modify the Z-Axis return position at the end of a job. 

Possible options are:

* G28
* G30
* G30 P3
* G30 P4
* No Move

## Implementation Details
The default value is *G28*. Selecting *No Move* can be dangerous and is not recommended. Use it at yourt own risk!

The coordinates of the *G28* and *G30* commands can be configured in CNC12 under *Setup[F1]->Part[F1]->WCS Table[F9]->Return[F1]*

![](/images/pp014.PNG)

The default values in CNC12 for *G28* and *G30* for all axis is *0*, so by default the machine will return to the *Z0* position at the end of the job.

Choose one of the available Return-Options and modify the return coordinates in CNC12 as required.


[Back](index.md)