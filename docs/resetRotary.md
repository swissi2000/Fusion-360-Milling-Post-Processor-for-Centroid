# Reset Rotary Axis at End of Job

![](/images/pp058.PNG)

## Description
If a Rotary Axis does not have a defined Zero Position, there's no need to **Unwind** a Rotary Axis at the end of the job to get it back to the original Zero point.

If this Property is set, a **Reset Command** will be added at the end of the job file to reset the Rotary Axis back to Zero at the current position.

``` javascript
...
M26/A
G92 A0
...
```


[Back](index.md)

