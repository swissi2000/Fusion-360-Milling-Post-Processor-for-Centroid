# Maximum allowed Number of Tools

![](/images/pp060.PNG)

## Description
This property allows to modify the maximum allowed tool number. The Post Processor will create a warning if a tool number is being used that exceeds the specified number.

The default setting is 200 which matches the maximum tool number in CNC12.

## Implementation Details
The hardcoded maximum number of tools in the post processor has been replaced with the variable that can now dynamically be set with this property.


[Back](index.md)