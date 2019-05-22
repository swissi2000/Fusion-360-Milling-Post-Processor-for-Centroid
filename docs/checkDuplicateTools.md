# Check for conflicting Tool Numbers

## Description
Additional logic has been added to the Post Processor that checks for conflicting Tool Information e.g. using the same Tool Number but with different geometry.


## Implementation Details
This code has been added to the *onOpen()* section of the Post Processor:
```javascript
  //Check for duplicate Tool Numbers -swissi
  if (true) {  // set to true to check for duplicate tool numbers w/different cutter geometry 
    for (var i = 0; i < getNumberOfSections(); ++i) { 
      var sectioni = getSection(i); 
      var tooli = sectioni.getTool(); 
      for (var j = i + 1; j < getNumberOfSections(); ++j) { 
        var sectionj = getSection(j);         
        var toolj = sectionj.getTool(); 
        if (tooli.number == toolj.number) { 
          if (xyzFormat.areDifferent(tooli.diameter, toolj.diameter) || 
             xyzFormat.areDifferent(tooli.cornerRadius, toolj.cornerRadius) || 
             abcFormat.areDifferent(tooli.taperAngle, toolj.taperAngle) || 
             (tooli.numberOfFlutes != toolj.numberOfFlutes)) {
              error(subst(localize("Using the same tool number for different cutter geometry for operation '%1' and  '%2'."),   
                 sectioni.hasParameter("operation-comment") ? sectioni.getParameter("operation-comment") : ("#" + (i + 1)),
                 sectionj.hasParameter("operation-comment") ? sectionj.getParameter("operation-comment") : ("#" + (j + 1)))); 
              return;
          }        
        }
      }
    }
  }
```
If the same Tool Number is being used with different cutter geometry, the Post Processor will generate the following error log:

```javascript
Warning: Tool 1 has multiple usages with conflicting geometry.
...
...
###############################################################################
Error: Using the same tool number for different cutter geometry for operation 'Spot Drill' and  'Drill 6.5mm'.
Error at line: 273
Failed while processing onOpen().
###############################################################################

```




[Back](index.md)