# Comment Line Formatting

![](/images/pp009.PNG)

## Description
CNC12 allows two types of comment formatting:

```javascript
(This is the default Comment Option)
:This is the alternative Comment Option
```

## Implementation Details
### Option "*()*"
All comments will be enclosed between brackets. This is the default option. The job file will look like this:

```javascript
%
O01001
(1001)
(Program Comment of Program Name 1001)
(T1  D=4. CR=0. TAPER=90deg - ZMIN=-1. - spot drill - 4mm Spot Drill)
(T3  D=8. CR=0. - ZMIN=-12.5 - flat end mill - 8mm Flat Endmill)
(T6  D=4. CR=0. - ZMIN=-6. - flat end mill - 4mm Flat Endmill)
(T9  D=6. CR=0. TAPER=45deg - ZMIN=-1.3 - chamfer mill - 6mm Chamfer Mill 45 Degr)
(T12  D=6.5 CR=0. TAPER=118deg - ZMIN=-14.953 - drill - Drill 6.5mm 118 Degree)
N10 G90 G94 G17
N15 G21
(2D Adaptive2)
N20 G28 G91 Z0.
.
.
.
```

### Option "*:*"
All comments will be preceded by a colon. The job file will look like this:

```javascript
%
O01001
:1001
:Program Comment of Program Name 1001
:T1  D=4. CR=0. TAPER=90deg - ZMIN=-1. - spot drill - 4mm Spot Drill
:T3  D=8. CR=0. - ZMIN=-12.5 - flat end mill - 8mm Flat Endmill
:T6  D=4. CR=0. - ZMIN=-6. - flat end mill - 4mm Flat Endmill
:T9  D=6. CR=0. TAPER=45deg - ZMIN=-1.3 - chamfer mill - 6mm Chamfer Mill 45 Degr
:T12  D=6.5 CR=0. TAPER=118deg - ZMIN=-14.953 - drill - Drill 6.5mm 118 Degree
N10 G90 G94 G17
N15 G21
:2D Adaptive2
N20 G28 G91 Z0.
.
.
.
```

[Back](index.md)