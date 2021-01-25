# Overview
This Fusion 360 Post Processor was originally based on the "Generic milling post for CENTROID" Version 42683 from the Autodesk HSM Post Library.

As the Generic Centroid Post Processor is lacking improved support for Rotary Axis and has no support at all for Fusion 360 Probing,
the Fanuc Post Processors from the Autodesk HSM Post Library have been used as templates to add improvements to this version of the Centroid CNC12 specific milling Post Processor.  

This Post Processor has only been tested with the Centroid Acorn board but should work with all of the Centroid Control Boards.
Using the Post Processor Properties to write Fusion 360 Information to CNC12 variables does require CNC12 Version 4.16 or higher.

**Please report issues on the [Centroid Forum](https://centroidcncforum.com/viewtopic.php?f=60&t=2992). No Warranties are given. Use at your own risk!**

# New Version V5 (January 25th 2021)
* The check for redundant Tool # (same Tool# with different tool geometry) is now a Post Processor Property that can be turned on and off. The default setting is to check for redundant Tool#
* The maximum number of tools can now be adjusted in the Post Processor Properties. The default is set to 200 tools matching the CNC12 tool library
* The activation/deactivation of the coolant command (M7/M8 and M9) has been optimized and is now placed at the point when the Z axis is at the clearance height
* When using the Post Processor Property "Check/Update CNC12 Tool Library" it was possible that a message was displayed that the tool diameter in the Fusion 360 tool library is different from the CNC12 tool library but they were displayed exactly the same on the screen. This issue was caused by CNC12 internal rounding errors. The new diameter comparison method is now using a comparison tolerance factor that solved this issue
* Program Numbers that are reserved for CNC12 (9100 - 9999) are creating issues when being used in the Post Processor. This Post Processor will now create a post error with a log message that these program numbers can't be used

# Version V4 (December 26th 2020)
* Just a bug fix where the WCS# always defaulted to G54 ignoring other WCS#'s in setups.
* ***Update January 25th 2021: It turned out this issue was caused by a bug in Fusion 360 and has been fixed in the latest version***

# Added Features in V3
* Added in v3: [Fusion 360 Probing Support](probing.md)

# Added Post Processor Properties
These are the additional features that can be activated trough the Post Processor Properties

* NEW in V5 [Check for conflicting Tool Numbers (same Number but different Tools)] (checkDuplicateTools.md)
* NEW in V5 [Maximum allowed Number of Tools] (maxToolNumber.md)
* Added in v3 [Check/Update CNC12 Tool Library](checkLibrary.md)
* Added in v3 [Reset Rotary Axis at End of Job](resetRotary.md)
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

* NEW in v5: Added logic to prevent the use of Program Numbers 9100-9999 as they are reserved for CNC12 
* Added in v3: Improved Rotary Axis Support 
* Added in v2: [Using Inverse Time Feedrate for Rotary Axis](inverseTime.md)
* [Support for Manual NC Commands](manualNC.md)


