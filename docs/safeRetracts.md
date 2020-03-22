# Safe Retract Position

![](/images/pp052.PNG)

## Description
This Property allows to specify the Retract Position of the Z Axis. 

Possible options are:

* G28
* G30
* G30 P3
* G30 P4
* Clearance Height


## Implementation Details
The default value is *G28*. If *Clearance Height* is selected, the Z-Axis will retract to the Clearance Height set in Fusion 360.

The coordinates of the *G28* and *G30* commands can be configured in CNC12 under *Setup[F1]->Part[F1]->WCS Table[F9]->Return[F1]*

![](/images/pp014.PNG)

The default values in CNC12 for *G28* and *G30* for all axis is *0*, so by default the Z Axis will retract to the machines Z0 Position..

Choose one of the available Return-Options and modify the return coordinates in CNC12 as required.

Note that the retract position of the Z Axis at the end of the job can be configured seperately with [Z-Position at End of Job](zPosition.md)

[Back](index.md)