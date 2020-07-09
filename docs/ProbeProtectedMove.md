# Fusion 360 Probing Cycle: Protected Probe Move XYZ

## Description
The Protected Probe Move is being used to safely position the probe before starting a probing cycle. 
The trip status of the probe is monitored during the move and movement will instantly be stopped should an unexpected probe trip occur. 
One, two or all three Axes could be moved at the same time.

## Protected Probe Move Command and Parameters

```javascript
(moving just the Z-Axis)
G65 P9810 C3 Z-9.5 F1000.

(moving all 3 Axes)
G65 P9810 A1 X1.5 B2 Y5.5 C3 Z-9.5 F1000.
```
### Parameter A1, B2 and C3: Axis Index
This parameter indicates which axis needs to be moved. A1=X, B2=Y and C3=Z. 
If a A1 parameter is given, a X position value is expected. A B2 parameter is expecting a Y position and a C3 parameter a Z position.
One, two or three axes can be moved at the same time.

### Parameter X, Y or Z: Axis Position to move to
The value of parameter X, Y and Z holds the position the axis should move to and must match up with the Axis Index A1, B2 or C3.

### Parameter F: Probe Positioning Feedrate 
Sets the feedrate used for protective probe moves.




[*Use Browser Back Button to Return*]