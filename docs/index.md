# Overview
This Fusion 360 Post Processor was originally based on the "Generic milling post for CENTROID" Version 42683 from the Autodesk HSM Post Library.

As the Generic Centroid Post Processor is lacking improved support for Rotary Axis and has no support at all for Fusion 360 Probing,
the Fanuc Post Processors from the Autodesk HSM Post Library have been used as templates to add improvements to this version of the Centroid CNC12 specific milling Post Processor.  

This Post Processor has only been tested with the Centroid Acorn board but should work with all of the Centroid Control Boards.
Using the Post Processor Properties to write Fusion 360 Information to CNC12 variables does require CNC12 Version 4.16 or higher.

**Please report issues on the [Centroid Forum](https://centroidcncforum.com/viewtopic.php?f=60&t=2992). No Warranties are given. Use at your own risk!**

# Added Features in V3
* NEW in v3: [Fusion 360 Probing Support](probing.md)

# Added Post Processor Properties
These are the additional features that can be activated trough the Post Processor Properties

* NEW in v3 [Check/Update CNC12 Tool Library](checkLibrary.md)
* NEW in v3 [Reset Rotary Axis at End of Job](resetRotary.md)
* Added in v2: [Safe Retracts](safeRetracts.md)
* Added in v2: [Smoothing Profile](smoothingProfile.md)
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

* NEW in v3: Improved Rotary Axis Support 
* Added in v2: [Using Inverse Time Feedrate for Rotary Axis](inverseTime.md)
* [Check for conflicting Tool Numbers (same Number but different Tools)](checkDuplicateTools.md)
* [Support for Manual NC Commands](manualNC.md)


