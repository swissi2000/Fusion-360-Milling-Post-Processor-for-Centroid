# Dwell after Spindle Start

![](/images/pp010.PNG)

## Description
Spindles with a high RPM require some time to reach full speed and need a delay between the spindle start command and the first cutting contact. This property allows to add a *Dwell* command after each spindle start to give the spindle time to get to full speed before the job continues. 

## Implementation Details
The higher the commanded spindle speed, the longer it takes for the spindle to get to full speed. Therefore this option has been implemented as a factor of the spindle speed. The default value is 0 which will not output a *Dwell* command.

Entering a Factor of *100* will delay the continuation of the job after a *M3/M4* with a spindle speed of *6'000rpm* has been executed by *6 seconds*.
A Factor of *50* will delay a speed of *6'000rpm* by *3 seconds*. The output will look like this:

```javascript
.
N40 S6000 M3
N45 G4 P3.
.
```

[Back](index.md)