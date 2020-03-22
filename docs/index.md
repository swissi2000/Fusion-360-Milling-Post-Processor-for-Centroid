# Overview
This Fusion 360 Post Processor is based on the "Generic milling post for CENTROID" Version 42683 from the Autodesk HSM Post Library.

This Post Processor has only been tested with the Centroid Acorn board but should work with all of the Centroid Control Boards.
Using the Post Processor Properties to write Fusion 360 Information to CNC12 variables does require CNC12 Version 4.16 or higher.

**Please report issues as such in GitHub. No Warranties are given. Use at your own risk!**

# Added Post Processor Properties
These are the additional features that that can be activated trough the Post Processor Properties

* NEW in v2 [Safe Retracts](safeRetracts.md)
* NEW in v2 [Smoothing Profile](smoothingProfile.md)
* [Add Command to Begin/End of Job](addCommand.md)
* [Add Debug Information](addDebug.md)
* [Check Tool Offset](checkToolOffset.md)
* [Enable Clamp (*M10/M11*)](enableClamp.md)
* [Comment Line Formatting](commentFormatting.md)
* [Dwell after Spindle Start](enableDwell.md)
* [Enforce Numeric Program Name](forceNumeric.md)
* [XY-Position at End of Job](xyPosition.md)
* [Z-Position at End of Job](zPosition.md)
* [Rotary Table Axis](rotaryAxis.md)
* [Write CNC12 Info Variables](CNC12.md)

![](/images/pp001.PNG)

# Additional Post Processor Logic
Additional logic has been added to the Post Processor to support

* NEW in v2 [Using Inverse Time Feedrate for Rotary Axis](inverseTime.md)
* [Check for conflicting Tool Numbers (same Number but different Tools)](checkDuplicateTools.md)
* [Support for Manual NC Commands](manualNC.md)


