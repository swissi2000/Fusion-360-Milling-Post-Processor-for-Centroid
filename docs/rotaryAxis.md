# Rotary Table Axis

![](/images/pp016.PNG)

## Description
This Property allows to enable a rotary axis in the Post Processor. The default Property setting is *No rotary*. Do not enable this Property if no *A, B or C* axis has been configured in CNC12. 

Possible options are:

* No Rotary (Default)
* Along +X (A Axis)
* Along +Y (B Axis)
* Along +Z (C Axis)
* Along -X (A Axis reversed)
* Along -B (B Axis reversed)
* Along -Z (C Axis reversed)

Along +X means the workpiece is pointing in the positive direction of the X Axis. The graphic below is showing the positive directions of all the axis:

![](/images/pp017.JPG)

The arrows of the graphics above are pointing in the positive direction but keep in mind that the arrow indicates the direction of the tool, not the workpiece. This is also true for rotary axis. 

### Example
A rotary table installed along the X Axis, workpiece pointing to the positive direction. 

![](/images/pp018.JPG)

Now looking onto the chuck from the workpiece side, the positive tool direction would be CCW, that means the chuck needs to turn CW for a positive move of the A Axis. By definition, this rotary table should be configured *Along +X*. The only difference between *Along +X* and *Along -X* is the rotational direction of the axis. Should the Axis turn the wrong way with one setting, just pick the opposite setting to correct it.


## Implementation Details
There are many different versions of rotary axis and for some of them, additional configuration settings are needed in the Post Processor. Because the Centroid Acorn CNC Control Board is intended for the DIY market, the settings for the most commen rotary table in this environment have been choosen which is a rotary axis with continous movement that does not need to be rewinded.

For additional information how to setup a 4th Axis in the Fusion 360 Post Processor, check out the [Autodesk Guide](https://knowledge.autodesk.com/support/fusion-360/learn-explore/caas/sfdcarticles/sfdcarticles/How-to-make-a-3-axis-post-processor-from-the-HSM-post-processor-library-support-4-or-5-axis-motion.html).


[Back](index.md)