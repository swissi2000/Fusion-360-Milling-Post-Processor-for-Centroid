# Inverse Time Feedrate for Rotational Axis

## Description
Regular feedrates in units per minute work well on moves with linear axes but when a rotational axis comes into play, the control would need to be able to track the exact position of the tool tip in 3D space and adjust rotational and linear feeds accordingly to keep the exact demanded feedrate.
As only highend machine controls have this capability, a good compromise is is to use *Inverse Time Feedrates* instead.

With *Inverse Time Feedrates* the post processor is calculating the length of each move in 3D space and then calculates the time it would take to move this distance with the requested feedrate in units/minute.

### Example
When the calculated lenght of a move in 3D space is 0.2mm and the requested feedrate is 1500mm/min, the time to execute this move is 0.2mm/1500mm/min = 0.000133min. 
The Inverse Time Feedrate of that is now F=7500min^-1. By taking the Inverse Time we get a value that will actually increase speed when the value increases when the feedrate overwrite is being used at the control.


## Implementation Details
When a rotational Axis is selected in the Fusion 360 Post Processor Options (see [Rotary Table Axis](rotaryAxis.md) for more details) G93 Inverse Time Feedrates are now calculated for all moves involving the Rotary Axis.

The job file will look like this:

```javascript
.
.
N80 G93 X-0.764 Z11.05 A-0.696 F9999.
N85 X-0.728 Z11.013 A-0.723 F9999.
N90 X-0.678 Z11. A-0.76 F9999.
N95 X-0.579 A-0.835 F8827.5
N100 X-0.532 A-0.941 F9999.
N105 X-0.501 A-1.157 F9999.
N110 X-0.495 A-1.425 F9999.
N115 X-0.541 A-3.102 F813.9
N120 X-0.588 A-4.779 F813.9
N125 X-0.635 A-6.459 F812.7
N130 X-0.681 A-8.139 F812.7
N135 X-0.751 A-10.655 F542.6
N140 X-0.821 A-13.171 F542.6
N145 X-0.891 A-15.686 F542.6
N150 X-0.961 A-18.202 F542.6

.
.
```


[Back](index.md)