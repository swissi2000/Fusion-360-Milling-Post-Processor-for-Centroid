# Enable Clamp *M10/M11*

![](/images/pp008.PNG)

## Description
This Property allows to enable the *Clamp* commands *M10/M11* of a rotary table and is being used in combination with the [Property: Rotary Table Axis](rotaryAxis.md).

## Implementation Details
If this Property is activated, the Post Processor will add a *M11 Clamp-Off* command before an axis rotation move and a *M10 Clamp-On* command after the move has finished. The job file will look like this:

```python
.
N45 M11
N50 G0 A0.
N55 M10
.
```


[Back](index.md)