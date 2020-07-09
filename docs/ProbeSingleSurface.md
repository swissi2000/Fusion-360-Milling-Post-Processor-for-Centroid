# Fusion 360 Probing Cycle: Single Surface XYZ 


![](/images/fp002.PNG)


## Description
Measures the exact position of a X-, Y- or Z-Surface.


## WCS Probing Cycle

![](/images/fp012.PNG)

A typical block for a Single Surface WCS Probing Cycle looks like this:

```javascript
G65 P9811 A1 X5. Q2. M1. W1. S1
```
### Parameter A: Axis Index
Parameter A is the Axis Index where Axis X=1, Y=2 and Z=3, so A1 in the example above indicates a probing move allong the X-Axis.

### Parameter X, Y or Z: Expected Surface Position 
The value of parameter X, Y or Z indicates the expected position of the surface that has to be probed. 
This parameter must match the Axis Index A, that means if Axis Index is A1, then a X value is expected, for A2 it must be Y and for A3 is must be Z.
The position is calculated by Fusion 360 based on the defined WCS 0 location and the stock/model position of the surface.
If you wonder why the Axis Index A is needed and why not just passing a X, Y or Z value, you have to know that in the CNC12 scipting language a parameter has a default value of 0 and there's no way to differentiate if a parameter is 0 because the parameter has not been used or a value of 0 has been passed.

### Parameter Q: Overtravel Distance
The overtravel distance defines how far the probe is allowed to travel passed the expected surface position before the probing move is aborted with a "*Surface not found*" error.
This value should not be much larger than the position tolerance of the surface.

### Parameter M: Position Tolerance
This parameter defines the position error the surface is allowed to have and works in conjunction with the "*Out of Position*" check box in the Action Tab to stop the WCS probing cycle and display an "*Out of Tolerance*" message.

### Parameter W: Print Results
Possible values are W1 and W2 where W1 just increments the "*Feature*" number while W2 does increment the "*Component*" number and resets the "*Feature*" number to 1.
See [Print Results](ProbePrintResults.md) for more details.

### Parameter S: WCS #
Defines the WCS # that will be reset by this probing cycle. 
By default this is the currently active, driving WCS and can be changed in the "*Actions*" tab with the "*Overwrite Driving WCS*" check box. 
Note that the Free version of CNC12 only supports WCS #1 (G54), Mill Pro supports WCS # 1-6 (G54 - G59) and Mill Digitizing Bundle supports WCS #1-18 (G54 - G59 and E7 - E18).

## Geometry Probing Cycle

![](/images/fp013.PNG)

A typical block for a Single Surface Geometry Probing Cycle looks like this:

```javascript
G65 P9811 A1 X5. Q2. F0.5 H1. T3. V0.1 W1.
```
### Parameter A: Axis Index
Parameter A is the Axis Index where Axis X=1, Y=2 and Z=3, so A1 in the example above indicates a probing move allong the X-Axis.

### Parameter X, Y or Z: Expected Surface Position 
The value of parameter X, Y or Z indicates the expected position of the surface that has to be probed. 
This parameter must match the Axis Index A, that means if Axis Index is A1, then a X value is expected, for A2 it must be Y and for A3 is must be Z.
The position is calculated by Fusion 360 based on the defined WCS 0 location and the stock/model position of the surface.
If you wonder why the Axis Index A is needed and why not just passing a X, Y or Z value, you have to know that in the CNC12 scipting language a parameter has a default value of 0 and there's no way to differentiate if a parameter is 0 because the parameter has not been used or a value of 0 has been passed.

### Parameter Q: Overtravel Distance
The overtravel distance defines how far the probe is allowed to travel passed the expected surface position before the probing move is aborted with a "*Surface not found*" error.
This value should not be much larger than the position tolerance of the surface.

### Parameter F: Error Correction Factor
This % Factor determines how much of the measured error should be applied to correct tool wear.
This parameter is only present if Tool Wear adjustment has been selected.

### Parameter H: Position Tolerance
This parameter defines the position error the surface is allowed to have and works in conjunction with the "*Wrong Size*" check box in the Action Tab to stop the Geometry probing cycle and display an "*Out of Tolerance*" message.

### Parameter T: Tool Offset Number
This number defines the Tool Offset that will be adjusted for wear. For a X and Y surface, this will be the tool diameter offset number and for a Z surface this will be the tool height offset number.
Note that the Fusion 360 as well as the CNC12 Tool Library allow to configure tool diameter and height offsets that don't match the actual tool number. 
That means in theory tool number 3 could have a diameter offset number 10 and a height offset number 20.
This parameter is only present if Tool Wear adjustment has been selected.

### Parameter V: Minimum Update Threshold
Defines the threshold value that will trigger a wear adjustment. If the measured error is below the threshold value, no wear adjustment will be made.
This parameter is only present if Tool Wear adjustment has been selected.

### Parameter W: Print Results
Possible values are W1 and W2 where W1 just increments the "*Feature*" number while W2 does increment the "*Component*" number and resets the "*Feature*" number to 1.
See [Print Results](ProbePrintResults.md) for more details.



[*Use Browser Back Button to Return*]