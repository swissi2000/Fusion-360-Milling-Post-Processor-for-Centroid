# Smoothing Profiles

![](/images/pp053.PNG)

## Description
G-Code Smoothing is an algorithm that pre-processes G code and smooths out the G-code geometry ahead of time before handing off the moves to the Control Board. 
3D Surfacing and V Carve programs benefit greatly from this feature.

![](/images/pp055.PNG)

CNC12 has 4 built-in, ready to use Smoothing Profiles available for

* Precision Mill
* Contouring Mill
* Precision Router
* Contouring Router

A total of 99 Smoothing Profiles can be configured in CNC12 under *Setup[F1]->Smoothing Setup[F8]*

![](/images/pp054.PNG)

Consult the [Centroid Acorn CNC12 G-code Smoothing User's Manual](https://www.centroidcnc.com/centroid_diy/downloads/acorn_documentation/acorn_gcode_smoothing_users_manual.pdf) for more details.


## Implementation Details
The default value is *-1*. The following values are supported:

* -1   will use the currently active Smoothing Profile
* 0    will turn off Smoothing
* 1-99 to activate Smoothing Profile 1-99

The Post Processor will add a *G64* command like this:

```python
.
N65 G64 ON P4.
.
```

Consult the Centroid CNC12 Mill Operators Manual for more details on the G64 parameters.


[Back](index.md)