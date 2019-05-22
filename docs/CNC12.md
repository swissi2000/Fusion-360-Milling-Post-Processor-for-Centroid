# Write CNC12 Info Variables

![](/images/pp019.PNG)

## Description
CNC12 offers 100 internal *User-String-Variables* that can be used by macros during job execution. The names of these variables are *#300 - #399*.

If this *Property* is enabled, the Post Processor will fill *User-String-Variables* with Information from Fusion 360 that can be used within CNC12. By default, the following information will be written to the job file (click the variable name/number for more details from where in Fusion 360 the information is coming from):

### File, Setup and Tool Path Information
* [#300](300.md) Tool Info from the Fusion 360 Tool Library. Updated before each Tool Change
* [#301](301.md) Fusion 360 Design File Name. Defined at the beginning and does not change
* [#302](302.md) Fusion 360 Program Name/Number as specified in the Post Window
* [#303](302.md) Fusion 360 Program comment as specified in the Post Window
* [#304](304.md) Fusion 360 Setup Name. Changes for each Setup in the Post
* [#305](304.md) Fusion 360 Setup Notes. Changes for each Setup in the Post
* [#306](306.md) Fusion 360 Tool Path Name. Changes for every new Tool Path
* [#307](306.md) Fusion 360 Tool Path Notes. Changes for every new Tool Path

### Tool Info from the Fusion 360 Tool Library. Updated before each Tool Change in the Post
* [#308](308.md) Tool Type 
* [#309](308.md) Tool Unit (mm or in) 
* [#310](308.md) Tool Diameter
* [#311](308.md) Tool Number of Flutes
* [#312](308.md) Tool Coolant
* [#313](308.md) Tool Description from General Tab of Tool Settings
* [#314](308.md) Tool Comment from Post Processor Tab of Tool Settings

### Feed and Speed Info. Updated before each Tool Change in the Post
* [#315](315.md) Spindle Speed
* [#316](315.md) Spindle Direction CW or CCW
* [#317](315.md) Optimal Load (WOC)
* [#318](315.md) Maximum Step Down (DOC)
* [#319](315.md) Feed Rate
* [#320](315.md) Feed per Tooth
* [#321](315.md) Ramp Feed Rate
* [#322](315.md) Plunge Feed Rate
* [#323](315.md) Feed per Revolution

### Setup Info. Updated for each new Setup in the Post
* [#324](324.md) Origin Point
* [#325](325.md) Z Clearance Height. Useful in combination with checkApproach Property
* [#326](325.md) Current WCS

### First 10 Tools made available in variables when both Properties "writeTools" and "writeCNC12Vars" are true and variable name is assigned
* [#351 - #360](351.md) Variable that will hold the Fusion 360 Tool Info for the first 10 Tools used


## Implementation Details
All these *CNC12 User-String-Variables* are defind at the beginning of the Post Processor around code line #120:

```javascript
Post Processor Script
...
// Begin Customizable CNC12 User-String-Variables. Valid Numbers #300 - #399 -swissi
//To prevent a parameter of being written to the CNC-File, set the variable name to xyzVar = ""
var writeToolLineVar  = "#300"   // Holds Tool Information from the Fusion 360 Tool Library. Updated before each Tool Change
var designNameVar     = "#301"   // Holds the Fusion 360 Design File Name. Defined at the beginning and does not change
var programNameVar    = "#302"   // Holds the Fusion 360 Program Name/Number as specified in the Post Window
var programCommentVar = "#303"   // Holds the Fusion 360 Program comment as specified in the Post Window
var setupNameVar      = "#304"   // Holds the Fusion 360 Setup Name. Changes for each Setup in the Post
var setupNotesVar     = "#305"   // Holds the Fusion 360 Setup Notes. Changes for each Setup in the Post
var toolPathNameVar   = "#399"   <- Change User-Variable-Number if required
var toolPathNotesVar  = ""       <- This will NOT write this info to the job file
...
```

As seen on the last two examples on the list above, the name/number of the *CNC12 User-String-Variable* can be changed should any of these varibales conflict with a variable that's already been used in other scripts/macros. Just be aware that the example scripts provided here need to be adjusted to the new variable name/number.

Also if some of this information is not needed in a job file, setting the variable name/number to "" will skip that info in the output file. This is an example of a job file:

```python 
%
O01001
N10 #301 = "Lift Plate Final v13"   ; Fusion 360 Design File Name
N15 #302 = "1001"    ; Program Name
N20 #303 = "Program Comment of Program Name 1001"   ; Program Comment
(T1  D=4. CR=0. TAPER=90deg - ZMIN=-1. - spot drill - 4mm Spot Drill)
(T3  D=8. CR=0. - ZMIN=-12.5 - flat end mill - 8mm Flat Endmill)
(T6  D=4. CR=0. - ZMIN=-6. - flat end mill - 4mm Flat Endmill)
(T9  D=6. CR=0. TAPER=45deg - ZMIN=-1.3 - chamfer mill - 6mm Chamfer Mill 45 Degr)
(T12  D=6.5 CR=0. TAPER=118deg - ZMIN=-14.953 - drill - 6.5mm Drill 118 Degree)
N25 #351 = "T1  D=4. CR=0. TAPER=90deg - ZMIN=-1. - spot drill - 4mm Spot Drill"
N30 #352 = "T3  D=8. CR=0. - ZMIN=-12.5 - flat end mill - 8mm Flat Endmill"
N35 #353 = "T6  D=4. CR=0. - ZMIN=-6. - flat end mill - 4mm Flat Endmill"
N40 #354 = "T9  D=6. CR=0. TAPER=45deg - ZMIN=-1.3 - chamfer mill - 6mm Chamfer Mill 45 Degr"
N45 #355 = "T12  D=6.5 CR=0. TAPER=118deg - ZMIN=-14.953 - drill - 6.5mm Drill 118 Degree"
N50 #356 = ""
N55 #357 = ""
N60 #358 = ""
N65 #359 = ""
N70 #360 = ""
N75 G90 G94 G17
N80 G21
(Outside Contour Adaptive)
N85 #304 = "Outside Contour and Holes"   ; Setup Name/Description
N90 #305 = "Clamp in the Center Hole"   ; Setup Notes
N95 #306 = "Outside Contour Adaptive"   ; Tool Path Name/Description
N100 #307 = "2D Adaptive roughing of outside contour"   ; Tool Path Notes
N105 #300 = "T3  D=8. CR=0. - ZMIN=-12.5 - flat end mill - 8mm Flat Endmill"
N110 #308 = "flat end mill"   ; Tool Type
N115 #309 = "millimeters"   ; Tool Units
N120 #310 = "8"   ; Tool Diameter
N125 #311 = "3"   ; Tool Number of Flutes
N130 #312 = "mist"   ; Tool Coolant
N135 #313 = "8mm Flat Endmill"   ; Tool Description
N140 #315 = "6000"   ; Spindle Speed
N145 #316 = "CW"   ; Spindle Direction
N150 #317 = "1"   ; Tool Optimal Load (WOC)
N155 #318 = "6.5"   ; Max Stepdown (DOC)
N160 #319 = "375"   ; Feed Rate
N165 #320 = "0.0208"   ; Feed per Tooth
N170 #321 = "1920"   ; Ramp Feed Rate
N175 #322 = "30"   ; Plunge Feed Rate
N180 #323 = "0.005"   ; Feed per Revolution
N185 #324 = "Stock Coord = Dir+(X70. Y54.5 Z0.) Dir-(X-70. Y-54.5 Z-12.)"   ; Origin Position
N190 #325 = "50"   ; Z Clearance Height
N195 #326 = "G54"   ; Current WCS
N200 G28 G91 Z0.
N205 G90
N210 T3 M6
N215 T1
N220 S6000 M3
N225 G54
N230 M7
N240 G0 X-76.045 Y-61.399
.
.
.
(Finish Ouside Contour)
N3595 #300 = "T3  D=8. CR=0. - ZMIN=-12.5 - flat end mill - 8mm Flat Endmill"
N3600 #308 = "flat end mill"   ; Tool Type
N3605 #309 = "millimeters"   ; Tool Units
N3610 #310 = "8"   ; Tool Diameter
N3615 #311 = "3"   ; Tool Number of Flutes
N3620 #312 = "mist"   ; Tool Coolant
N3625 #313 = "8mm Flat Endmill"   ; Tool Description
N3630 #315 = "6000"   ; Spindle Speed
N3635 #316 = "CW"   ; Spindle Direction
N3640 #319 = "375"   ; Feed Rate
N3645 #320 = "0.0208"   ; Feed per Tooth
N3650 #321 = "1920"   ; Ramp Feed Rate
N3655 #322 = "30"   ; Plunge Feed Rate
N3660 #323 = "0.005"   ; Feed per Revolution
N3665 #324 = "Stock Coord = Dir+(X70. Y54.5 Z0.) Dir-(X-70. Y-54.5 Z-12.)"   ; Origin Position
N3670 #325 = "15"   ; Z Clearance Height
N3675 #326 = "G54"   ; Current WCS
N3680 X73.233 Y-56.101
.
.
.
N7070 M30
(Resetting all used CNC12 User-String-Variables)
N7075 #300 = ""
N7080 #301 = ""
N7085 #302 = ""
N7090 #303 = ""
N7095 #304 = ""
N7100 #305 = ""
N7105 #306 = ""
N7110 #307 = ""
N7115 #308 = ""
N7120 #309 = ""
N7125 #310 = ""
N7130 #311 = ""
N7135 #312 = ""
N7140 #313 = ""
N7145 #314 = ""
N7150 #315 = ""
N7155 #316 = ""
N7160 #317 = ""
N7165 #318 = ""
N7170 #319 = ""
N7175 #320 = ""
N7180 #321 = ""
N7185 #322 = ""
N7190 #323 = ""
N7195 #324 = ""
N7200 #325 = ""
N7205 #326 = ""
%
```
## Use Cases
Macros can be used to display the information from the User-String-Variables.

### Customized Tool Change Macro
Copy the example mfunc6.mac file from the [Repository](https://github.com/swissi2000/Test) to the *C:\cncm\* folder. A M6 tool change will now provide the following additional information:

![](/images/pp020.PNG)

### Other Use Cases
* Check out the information about the [*Property: Add Command to Begin/End of Job*](addCommand.md) for more examples of how to use the CNC12 variables.
* Also check out the chapter [*Support for Manual NC Commands*](manualNC.md) for ideas of how to use *Manual NC* commands in Fusion 360 to display useful information in CNC12.


[Back](index.md)