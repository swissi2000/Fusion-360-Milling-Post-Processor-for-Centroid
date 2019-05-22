# Enforce Numeric Program Name

![](/images/pp011.PNG)

## Description
The default CENTROID Post Processor requires the *Program Name* to be numeric but CNC12 does allow alpha-numeric names. This property allows to turn off the enforcement of numeric program names to support more descriptive alpha numeric names.

## Implementation Details
By default, Fusion 360 does fill the fields *Program name or number* and *Program comment* in the *Post Process Window* with the corresponding values from the *Post Process Tab*  of the first *Setup* in the *CAM-File*:

![](/images/pp012.PNG)

Fusion 360 does allow to modify the default values and a non-numeric *Program Name/Number* can be entered even when the *Property: Enforce Numeric Program Name = Yes* is set. In this case, the Post Processor will create an error log file with this message:

```javascript
...

###############################################################################
Error: Program name must be a number. Change Properties to accept non-numeric Program Names
Error at line: 352
Failed while processing onOpen().
###############################################################################

...
```

### Option Enforce Numeric Program Name
This is the default setting and the Post Processor will only accept a number between *1 - 99999* as the *Program Name/Number*, otherwise the Post Processor will not create a *Job-File* and will output an error log instead, similar to the one listed above. A successful output does look like this:

```javascript
%
O01001
(1001)
(Program Comment of Program Name 1001)
(T1  D=4. CR=0. TAPER=90deg - ZMIN=-1. - spot drill - 4mm Spot Drill)
...

```

The Post Processor will write a block/line with the *Program Number* preceded by the letter "*O*". This *O-Program Number* is accepted by CNC12 and provides some built-in functionality. This is the description of this functionality from *Centroid's CNC12 Operators Manual*:

```
*Centroid's CNC12 Operators Manual*

Chapter 11.2.6 O — Program Number

The O program number allows you to identify your program with a certain number. 
However, if the speciﬁed program number is 9100-9999, the G-codes from the 
O number through the next M99 will be extracted (but not executed) and placed 
in a separate subprogram/macro ﬁle named Oxxxx.cnc, where xxxx is the speciﬁed 
program number. This separate ﬁle can later be called with M98 or G65.

```

### Option NOT to Enforce Numeric Program Name
This option will allow a more descriptive, alpha-numeric *Program Name*. Be aware that usimg this option does not provide the *O-Program Number* functionality as described above. The output with a non-numeric *Program Name* does look like this:

```javascript
%
(Non-Numeric Program Name)
(This is the Program Comment)
(T1  D=4. CR=0. TAPER=90deg - ZMIN=-1. - spot drill - 4mm Spot Drill)
...

```


[Back](index.md)