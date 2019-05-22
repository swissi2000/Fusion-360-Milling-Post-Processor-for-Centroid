# Fusion 360 Manual NC Commands

## Description
Logic has been added to the Post Processor to support the following *Manual NC* commands in Fusion 360:

* Comment
* Display Message
* Pass through
* Call program

Manual NC commands can be added anywhere in the Fusion 360 CAM Browser structure:

![](/images/pp044.PNG)

## Implementation Details

### Manual NC: Comment
This command gives the option to place comments into the job file. The formatting of the comment will be based on the [*Property: Comment Line Formatting*](commentFormatting.md).

![](/images/pp045.PNG)

The job file will look like this:

```javascript
.
.
N5160 G0 Z50.
(Comment placed before Finish Outside Contour)
(Finish Outside Contour)
N5165 X73.233 Y-56.101
N5170 Z15.
.
.
```

### Manual NC: Display Message
This command gives the option to display a message on the screen. The job execution will stop until the message is been confirmed with a *Cycle Start* command.

![](/images/pp046.PNG)

The Post Processor will output a *M200* command with the text string as argument. The job file will look like this:

```javascript
.
.
N5160 G0 Z50.
N5165 M200 "Check Tool before finishing Contour.\n\nCycle Start to continue"
(Finish Outside Contour)
N5170 X73.233 Y-56.101
N5175 Z15.
.
.
```
During the execution of the job file in CNC12, job execution will stop before the toolpath *Finish Outside Contour* begins with this message:

![](/images/pp047.PNG)

The message needs to be confirmed with a *Cycle Start* before the job continous.


### Manual NC: Pass through
As the name says, this command allows to pass a command unchanged through the Post Processor and will be placed in the job file at the position it was inserted in the CAM Browser Tree of Fusion 360. This is a very powerful command that allows to inject anything you can think off into the job file.

*WARNING* there's no syntax check on these commands. If these commands include anything that CNC12 does not understand, CNC12 will stop job execution with an error message.

![](/images/pp048.PNG)

As shown in the example above, multiple commands can be passed through to create a series of commands:

* #101 = 5 
* M225 #101 "This message will display for 5 seconds before toolpath Finish Outside Contour begins" 

The job file for this example will look like this:

```javascript
.
.
N5160 G0 Z50.
N5165 #101 = 5
N5170 M225 #101 "This message will display for 5 seconds before toolpath Finish Outside Contour begins" 
(Finish Outside Contour)
N5175 X73.233 Y-56.101
N5180 Z15.
.
.
```
During the execution of the job file in CNC12, the message will be displayed for 5 seconds and will disappear without user intervention.

![](/images/pp049.PNG)


It would be great to use *Pass through* commands in combination with the [*Property: Write CNC12 Info Variables*](CNC12.md) to inject commands that make use of the *CNC12 User-String-Variables* that have been set in the job file. Unfortunately all the information related to a *Tool Path* is populated at the beginning of the *onSection()* function but the Post Processor executes the *onPassThrough()* function before *onSection()* so the information will not be available at the position where the *Pass through* command has been injected.

Only information that has been defined at the beginning of the job file and does not change during the job execution can be used with *Pass through* injected commands. This is an example that makes use of the tool information in #351 and will display a warning message to the operator:

```javascript
#101 = 0
M225 #101 "WARNING!\n\nThe following operation is a deep pocket\nCheck tool lenght (ZMIN)\n\n%s\n\nPress Cycle Start to continue\n" #351
```

The two lines injected with *Manual NC: Pass through* commands before a toolpath in the Fusion 360 CAM Browser will display the following message:

![](/images/pp050.PNG)

The message needs to be confirmed with a *Cycle Start* before the job continous.


### Manual NC: Call Program
This command allows to call a sub-program that will be executed before the job continues. 

*WARNING* there's no syntax check on the the file name and if the file exists. If CNC12 can't open the file, job execution will be stopped with an error message.

![](/images/pp051.PNG)

What ever is being entered into the *Message* field will be injected into the job file with a *M98* command like this:

```javascript
M98 "c:\cncm\ncfiles\begin.cnc"
```
Note that when no path name for the file is included, CNC12 will look for the file in the same folder as the job file. The command will be injected right before the *Tool Path* begins like this:

```javascript
.
.
N80 G21
N85 M98 "c:\cncm\ncfiles\begin.cnc"
(Outside Contour 2D Adaptive)
N90 G28 G91 Z0.
.
.
```



[Back](index.md)