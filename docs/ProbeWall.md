# Fusion 360 Probing Cycle: Wall/Web XY 


![](/images/fp003.PNG)


## Description
Measures the exact position of the two wall surfaces and positions the probe at the center of the wall at the end of the probing cycle.


## WCS Probing Cycle

![](/images/fp014.PNG)

A typical block for a Wall/Web WCS Probing Cycle looks like this:

```javascript
G65 P9812 A2 Y30. Z-2.5 Q2. R3. H0.2 M0.1 W1. S1
```
### Parameter A: Axis Index
Parameter A is the Axis Index where Axis X=1, Y=2, so A2 in the example above indicates a probing move allong the Y-Axis.

### Parameter X or Y: Expected Wall/Web Width 
The value of parameter X or Y holds the expected Wall/Web Width to be probed based on the Fusion 360 model. The probing cycle will start at the expected center of the Wall/Web.
This parameter must match the Axis Index A, that means if Axis Index is A1, then a X value is expected, for A2 it must be Y.

### Parameter Z: Probing Height
Sets the Z-Position for the probe to drop down to to measure the Wall/Web surfaces. 

### Parameter Q: Overtravel Distance
The overtravel distance defines how far the probe is allowed to travel passed the expected surface position before the probing move is aborted with a "*Surface not found*" error.

### Parameter R: Approach Distance
Sets the distance the probe will travel passed the expected Wall position before dropping down on Z to the probing height or with other words, 
this is the distance the probe will travel from the start of the probing move to the expected Wall position.

### Parameter H: Size Tolerance
This parameter defines the size error the wall width is allowed to have and works in conjunction with the "*Wrong Size*" check box in the Action Tab to stop the WCS probing cycle and display an "*Wrong Size*" message.

### Parameter M: Position Tolerance
This parameter defines the position error the center of the wall is allowed to have and works in conjunction with the "*Out of Position*" check box in the Action Tab to stop the WCS probing cycle and display an "*Out of Tolerance*" message.

### Parameter W: Print Results
Possible values are W1 and W2 where W1 just increments the "*Feature*" number while W2 does increment the "*Component*" number and resets the "*Feature*" number to 1.
See [Print Results](ProbePrintResults.md) for more details.

### Parameter S: WCS #
Defines the WCS # that will be reset by this probing cycle. 
By default this is the currently active, driving WCS and can be changed in the "*Actions*" tab with the "*Overwrite Driving WCS*" check box. 
Note that the Free version of CNC12 only supports WCS #1 (G54), Mill Pro supports WCS # 1-6 (G54 - G59) and Mill Digitizing Bundle supports WCS #1-18 (G54 - G59 and E7 - E18).

## Geometry Probing Cycle

![](/images/fp015.PNG)

A typical block for a Wall/Web Geometry Probing Cycle looks like this:

```javascript
G65 P9812 A2 Y30. Z-2.5 Q2. R3. F0.5 H0.2 M0.1 T3. V0.1 W1.
```
### Parameter A: Axis Index
Parameter A is the Axis Index where Axis X=1, Y=2 and Z=3, so A1 in the example above indicates a probing move allong the X-Axis.

### Parameter X or Y: Expected Wall/Web Width 
The value of parameter X or Y holds the expected Wall/Web Width to be probed based on the Fusion 360 model. The probing cycle will start at the expected center of the Wall/Web.
This parameter must match the Axis Index A, that means if Axis Index is A1, then a X value is expected, for A2 it must be Y.

### Parameter Z: Probing Height
Sets the Z-Position for the probe to drop down to to measure the Wall/Web surfaces. 

### Parameter Q: Overtravel Distance
The overtravel distance defines how far the probe is allowed to travel passed the expected surface position before the probing move is aborted with a "*Surface not found*" error.

### Parameter R: Approach Distance
Sets the distance the probe will travel passed the expected Wall position before dropping down on Z to the probing height or with other words, 
this is the distance the probe will travel from the start of the probing move to the expected Wall position.

### Parameter F: Error Correction Factor
This % Factor determines how much of the measured error should be applied to correct tool wear.
This parameter is only present if Tool Wear adjustment has been selected.

### Parameter H: Size Tolerance
This parameter defines the size error the wall width is allowed to have and works in conjunction with the "*Wrong Size*" check box in the Action Tab to stop the Geometry probing cycle and display a "*Wrong Size*" message.

### Parameter M: Position Tolerance
This parameter defines the position error the center of the wall is allowed to have and works in conjunction with the "*Out of Position*" check box in the Action Tab to stop the Geometry probing cycle and display an "*Out of Tolerance*" message.

### Parameter T: Tool Offset Number
This number defines the Tool Diameter Offset that will be adjusted for wear. 
Note that the Fusion 360 as well as the CNC12 Tool Library allow to configure tool diameter offsets that don't match the actual tool number. 
That means in theory tool number 3 could have a diameter offset number 10.
This parameter is only present if Tool Wear adjustment has been selected.

### Parameter V: Minimum Update Threshold
Defines the threshold value that will trigger a wear adjustment. If the measured error is below the threshold value, no wear adjustment will be made.
This parameter is only present if Tool Wear adjustment has been selected.

### Parameter W: Print Results
Possible values are W1 and W2 where W1 just increments the "*Feature*" number while W2 does increment the "*Component*" number and resets the "*Feature*" number to 1.
See [Print Results](ProbePrintResults.md) for more details.



[*Use Browser Back Button to Return*]