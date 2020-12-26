/**
  Copyright (C) 2012-2020 by Autodesk, Inc.
  All rights reserved.

  Centroid post processor configuration.

  $Revision: 42680 5c1fa50acdb1bb63ef5f7fa14280f184facca587 $
  $Date: 2020-03-09 16:22:50 $
  
  FORKID {A1485ECA-426C-48d3-B1AA-451087E4DD30}
*/

description = "CENTROID Milling swissi-004";
vendor = "CENTROID";
vendorUrl = "http://www.centroidcnc.com";
legal = "Copyright (C) 2012-2020 by Autodesk, Inc.";
certificationLevel = 2;
minimumRevision = 40783;

longDescription = "Centroid Generic Milling Post MinRev 40783-swissi-004";

extension = "nc";
programNameIsInteger = false;  //Now selectable trough Properties -swissi
setCodePage("ascii");

capabilities = CAPABILITY_MILLING;
tolerance = spatial(0.002, MM);

minimumChordLength = spatial(0.25, MM);
minimumCircularRadius = spatial(0.01, MM);
maximumCircularRadius = spatial(1000, MM);
minimumCircularSweep = toRad(0.01);
maximumCircularSweep = toRad(180);
allowHelicalMoves = true;
allowedCircularPlanes = undefined; // allow any circular motion

// user-defined properties
properties = {
  writeMachine: true, // write machine
  writeTools: true, // writes the tools
  preloadTool: false, // preloads next tool on tool change if any
  showSequenceNumbers: true, // show sequence numbers
  sequenceNumberStart: 10, // first sequence number
  sequenceNumberIncrement: 5, // increment for sequence numbers
  optionalStop: true, // optional stop
  separateWordsWithSpace: true, // specifies that the words should be separated with a white space
  useRadius: false, // specifies that arcs should be output using the radius (R word) instead of the I, J, and K words.
  //Begin Properties added by -swissi
  checkToolOffset: "No", // output program stop after tool length offset move.
  writeCNC12Vars: false, // Write CNC12 User-String -Variables with Fusion360 Info
  addDebugInfo: false, // Turn post debugging off(false) or on(true) 
  homeZatEnd: "G28", // Send machine to selected Z-Position at end of the job
  homeXYatEnd: "G28", // Send machine to selected XY-Position at end of the job
  dwellFactor: 0, // Add Dwell after spindle start (0 to disable)
  clampEnable: false, // Enable Clamp On/Off M10/M11
  forceNumeric: true,  // Enforce Numeric ProgramName Name 
  addCommandBegin: "", // Add a command to the Beginning of the job
  addCommandEnd: "", // Add a command to the End of the job
  commentFormat: "( )", //Select the preferred formatting of the comment line
  rotaryTableAxis: "none", // Rotary Axis along +X,+Y,+Z,-X,-Y,-Z
  resetRotary: false, // Reset Rotary Axis at End of Job
  smoothingProfile: -1, // smoothing profile (-1 to use current CNC12 settings, 0 to turn off smoothing, 1-99 to activate that smoothing profile)
  safeRetract: "G28", // specifies the desired safe retract option
  checkCNC12ToolLibrary: false, // Verifies if the Tool Diameter in the CNC12 Offset Library match the Fusion 360 Tool Library Diameter
  //End Properties added by -swissi
};

// user-defined property definitions
propertyDefinitions = {
  writeMachine: {title:"Write machine", description:"Output the machine settings in the header of the code.", group:0, type:"boolean"},
  writeTools: {title:"Write tool list", description:"Output a tool list in the header of the code.", group:0, type:"boolean"},
  preloadTool: {title:"Preload tool", description:"Preloads the next tool at a tool change (if any).", group:1, type:"boolean"},
  showSequenceNumbers: {title:"Use sequence numbers", description:"Use sequence numbers for each block of outputted code.", group:1, type:"boolean"},
  sequenceNumberStart: {title:"Start sequence number", description:"The number at which to start the sequence numbers.", group:1, type:"integer"},
  sequenceNumberIncrement: {title:"Sequence number increment", description:"The amount by which the sequence number is incremented by in each block.", group:1, type:"integer"},
  optionalStop: {title:"Optional stop", description:"Outputs optional stop code during when necessary in the code.", type:"boolean"},
  separateWordsWithSpace: {title:"Separate words with space", description:"Adds spaces between words if 'yes' is selected.", type:"boolean"},
  useRadius: {title:"Radius arcs", description:"If yes is selected, arcs are outputted using radius values rather than IJK.", type:"boolean"},
  //Begin Property Definitions added by -swissi
  checkToolOffset: {title: "Check Tool Offset", description:"Chose between an M0 stop or M200 message to verify Tool Height Offset after tool length comp move.", type:"enum",
    values:[
      {title:"No", id:"No"},
      {title:"M0", id:"M0"},
      {title:"M200", id:"M200"}  ] },
  writeCNC12Vars: {title: "Write CNC12 Info Variables", description:"Write CNC12 User-String-Variables with Fusion 360 Information.", type:"boolean"},
  addDebugInfo: {title:"Add Debug Information", description:"Turn post debugging info On or Off", type:"boolean"},
  safeRetract: {
    title: "Safe Retracts",
    description: "Select safe retract option. 'Clearance Height' retracts to the operation clearance height.", type: "enum",
       values:[
       {title:"G28", id:"G28"},
       {title:"G30", id:"G30"},
       {title:"G30 P3", id:"G30P3"},
       {title:"G30 P4", id:"G30P4"},
       {title:"Clearance Height", id:"clearanceHeight"} ]},
  homeZatEnd: {title:"Z-Positions at End of Job", description:"Selecting No Move is very risky. Only select if you know what you are doing!", type:"enum",
	  values:[
	   {title:"G28", id:"G28"},
	   {title:"G30", id:"G30"},
	   {title:"G30 P3", id:"G30P3"},
	   {title:"G30 P4", id:"G30P4"},
	   {title:"No Move", id:"none"}  ] }, 
  homeXYatEnd: {title:"XY-Positions at End of Job", description:"Select Return Position of X/Y Axis at End of Job", type:"enum",
	  values:[
	   {title:"G28", id:"G28"},
	   {title:"G30", id:"G30"},
	   {title:"G30 P3", id:"G30P3"},
       {title:"G30 P4", id:"G30P4"},
   	   {title:"No Move", id:"none"}  ] },   
  dwellFactor: {title:"Dwell after Spindle Start (% Factor of rpm)", description:"Adds a Dwell command after a Spindle Start. This factor is the percentage of the spindel speed. A factor of 100 will delay 5000rpm by 5 seconds. (0 to disable)", type:"integer"},
  clampEnable: {title:"Enable Clamp On/Off (M10/M11)", description:"Enables Clamp On/Off command M10/M11", type:"boolean"},
  forceNumeric: {title:"Enforce Numeric Program Name", description:"Forces the Program Name to be numeric. Set to No to allow non-numeric Program Names", type:"boolean"},
  addCommandBegin: {title:"Add Command to Begin of Job", description:"Add a command to the begin of the job", type:"string"},
  addCommandEnd: {title:"Add Command to End of Job", description:"Add a command to the end of the job", type:"string"},
  commentFormat: {title:"Comment Line Formatting", description:"Select the formatting of the Comment line", type:"enum",
    values:[
      {title:"( )", id:"( )"},
      {title:":", id:":"}  ] },
  rotaryTableAxis: {title:"Rotary Table Axis", description:"Select the rotary table axis orientation. Along X=A, Y=B, Z=C", type:"enum",
	  values:[
	   {title:"No rotary", id:"none"},
	   {title:"Along +X", id:"a"},
	   {title:"Along +Y", id:"b"},
	   {title:"Along +Z", id:"c"},
	   {title:"Along -X", id:"-a"},
	   {title:"Along -Y", id:"-b"},
       {title:"Along -Z", id:"-c"}     ] },
  resetRotary: {title:"Reset Rotary Axis at End of Job", description:"Reset Rotary Axis at End of Job", type:"boolean"},     
  smoothingProfile: {title:"Smoothing Profile", description:"-1 to use current CNC12 settings, 0 to turn off smoothing, 1-99 to activate that smoothing profile.", type:"integer"},
  checkCNC12ToolLibrary: {title:"Check/Update CNC12 Tool Library ", description:"Compares Tool Diameter between Fusion and CNC12 Tool Library and updates CNC12 if requested", type:"boolean"},
  //End Property Definitions added by -swissi
};

// Begin Customizable CNC12 User-String-Variables. Valid Numbers #300 - #399. -swissi
//To prevent a parameter from being written to the CNC-File, set the variable name to xyzVar = ""
var writeToolLineVar  = "#330"   // **Changed from 300 to 330 in v3** Tool Information from the Fusion 360 Tool Library. Updated before each Tool Change
var designNameVar     = "#331"   // **Changed from 301 to 331 in v3** Fusion 360 Design File Name. Defined at the beginning and does not change
var programNameVar    = "#302"   // Fusion 360 Program Name/Number as specified in the Post Window
var programCommentVar = "#303"   // Fusion 360 Program comment as specified in the Post Window
var setupNameVar      = "#304"   // Fusion 360 Setup Name. Changes for each Setup in the Post
var setupNotesVar     = "#305"   // Fusion 360 Setup Notes. Changes for each Setup in the Post
var toolPathNameVar   = "#306"   // Fusion 360 Tool Path Name. Changes for every new Tool Path
var toolPathNotesVar  = "#307"   // Fusion 360 Tool Path Notes. Changes for every new Tool Path
// Tool Info from the Fusion 360 Tool Library. Updated before each Tool Change in the Post
var toolTypeVar       = "#308"   // Tool Type 
var toolUnitVar       = "#309"   // Tool Unit (mm or in) 
var toolDiameterVar   = "#310"   // Tool Diameter
var toolNrOfFlutesVar = "#311"   // Tool Number of Flutes
var toolCoolantVar    = "#312"   // Tool Coolant
var toolDescrVar      = "#313"   // Tool Description from General Tab of Tool Settings
var toolCommentVar    = "#314"   // Tool Comment from Post Processor Tab of Tool Settings
//Feed and Speed Info. Updated before each Tool Change in the Post
var spindleSpeedVar   = "#315"   // Spindle Speed
var spindleDirVar     = "#316"   // Spindle Direction CW or CCW
var optimalLoadVar    = "#317"   // Optimal Load (WOC)
var maxStepdownVar    = "#318"   // Maximum Step Down (DOC)
var feedCuttingVar    = "#319"   // Feed Rate
var feedPerToothVar   = "#320"   // Feed per Tooth
var feedRampVar       = "#321"   // Ramp Feed Rate
var feedPlungeVar     = "#322"   // Plunge Feed Rate
var feedPerRevVar     = "#323"   // Feed per Revolution
//Setup Info. Updated for each new Setup in the Post
var setupOriginVar    = "#324"   // Origin Point
var zClearanceVar     = "#325"   // Z Clearance Height. Useful to display the distance when checkApproach Property is used
var currentWCSVar     = "#326"   // Current WCS
// First 10 Tools made available in variables when both Properties "writeTools" and "writeCNC12Vars" are true and variable name is assigned
var toolNumberAVar    = "#351"   // Variable that will hold the Fusion 360 Tool Info for first Tool used
var toolNumberBVar    = "#352"   // Variable that will hold the Fusion 360 Tool Info for second Tool used
var toolNumberCVar    = "#353"   // Variable that will hold the Fusion 360 Tool Info for third Tool used
var toolNumberDVar    = "#354"   // Variable that will hold the Fusion 360 Tool Info for forth Tool used
var toolNumberEVar    = "#355"   // Variable that will hold the Fusion 360 Tool Info for fift Tool used
var toolNumberFVar    = "#356"   // Variable that will hold the Fusion 360 Tool Info for sixt Tool used
var toolNumberGVar    = "#357"   // Variable that will hold the Fusion 360 Tool Info for seventh Tool used
var toolNumberHVar    = "#358"   // Variable that will hold the Fusion 360 Tool Info for eight Tool used
var toolNumberIVar    = "#359"   // Variable that will hold the Fusion 360 Tool Info for nineth Tool used
var toolNumberJVar    = "#360"   // Variable that will hold the Fusion 360 Tool Info for tenth Tool used
var toolNrVar         = 29000    // CNC12 Variable that holds the total Number of tools being used in a job. Used for CNC12 Tool Library check
var toolStartNrVar    = 29001    // CNC12 Start Variable Nr that will hold Tool Nr and Tool Diameter (29001 - 29400)
var gotoSequenceNr    = 0        // Variable to store the Goto sequence number needed for Tool Diameter check
// End Customizable CNC12 User-String-Variables. -swissi

var gFormat = createFormat({prefix:"G", decimals:0});
var mFormat = createFormat({prefix:"M", decimals:0});
var eFormat = createFormat({prefix:"E", decimals:0});
var hFormat = createFormat({prefix:"H", decimals:0});
var dFormat = createFormat({prefix:"D", decimals:0});
var nFormat = createFormat({prefix:"N", decimals:0}); //Used to write N-Numbers -swissi

var xyzFormat = createFormat({decimals:(unit == MM ? 3 : 4), forceDecimal:true});
var rFormat = xyzFormat; // radius
var abcFormat = createFormat({decimals:3, forceDecimal:true, scale:DEG});
var feedFormat = createFormat({decimals:(unit == MM ? 2 : 3), forceDecimal:true});
var toolFormat = createFormat({decimals:0});
var rpmFormat = createFormat({decimals:0});
var secFormat = createFormat({decimals:3, forceDecimal:true}); // seconds - range 0.001-1000
var taperFormat = createFormat({decimals:1, scale:DEG});
var finefeedFormat = createFormat({decimals:(unit == MM ? 4 : 5), forceDecimal:true}); // -swissi
var probe100Format = createFormat({decimals:3, zeropad:true, width:3, forceDecimal:true});

var xOutput = createVariable({prefix:"X"}, xyzFormat);
var yOutput = createVariable({prefix:"Y"}, xyzFormat);
//var zOutput = createVariable({prefix:"Z"}, xyzFormat);
var zOutput = createVariable({onchange: function() {retracted = false;}, prefix: "Z"}, xyzFormat);
var aOutput = createVariable({prefix:"A"}, abcFormat);
var bOutput = createVariable({prefix:"B"}, abcFormat);
var cOutput = createVariable({prefix:"C"}, abcFormat);
var feedOutput = createVariable({prefix:"F"}, feedFormat);
var sOutput = createVariable({prefix:"S", force:true}, rpmFormat);
var dOutput = createVariable({}, dFormat);

// circular output
var iOutput = createReferenceVariable({prefix:"I", force:true}, xyzFormat);
var jOutput = createReferenceVariable({prefix:"J", force:true}, xyzFormat);
var kOutput = createReferenceVariable({prefix:"K", force:true}, xyzFormat);
var gRotationModal = createModal({}, gFormat); // modal group 16 // G68-G69 -swissi

var gMotionModal = createModal({}, gFormat); // modal group 1 // G0-G3, ...
var gPlaneModal = createModal({onchange:function () {gMotionModal.reset();}}, gFormat); // modal group 2 // G17-19
var gAbsIncModal = createModal({}, gFormat); // modal group 3 // G90-91
var gFeedModeModal = createModal({}, gFormat); // modal group 5 // G93-94
var gUnitModal = createModal({}, gFormat); // modal group 6 // G20-21
var gCycleModal = createModal({}, gFormat); // modal group 9 // G81, ...
var gRetractModal = createModal({}, gFormat); // modal group 10 // G98-99

// fixed settings
var useMultiAxisFeatures = false;  //03/26/2020 -swissi
var WARNING_WORK_OFFSET = 0;
var forceMultiAxisIndexing = false; //06/19/2020 -swissi

var ANGLE_PROBE_NOT_SUPPORTED = 0; //03/26/2020 -swissi
var ANGLE_PROBE_USE_ROTATION = 1;  //03/26/2020 -swissi
var ANGLE_PROBE_USE_CAXIS = 2;     //03/26/2020 -swissi

// collected state
var sequenceNumber;
var currentWorkOffset;
var forceSpindleSpeed = false;       //03/26/2020 -swissi
var g68RotationMode = 0;             //03/26/2020 -swissi
var optionalSection = false;         //06/19/2020 -swissi
var incrementalMode = false;         //06/19/2020 -swissi
var cycleSubprogramIsActive = false; //06/19/2020 -swissi

var retracted = false; // specifies that the tool has been retracted to the safe plane
var zRanges = {}       //Make zRanges public variable -swissi

// Probing 06/19/2020 -swissi
var probeOutputWorkOffset = 1
var isFirstProbingMove = true
var probingCycleFile = "c:\\cncm\\probing\\F_cycles.cnc"

//Writes the specified block.
function writeBlock() {
  if (properties.showSequenceNumbers) {
    writeWords2(nFormat.format(sequenceNumber), arguments); //Changed to use nFormat -swissi
    sequenceNumber += properties.sequenceNumberIncrement;
  } else {
    writeWords(arguments);
  }
}

//Writes Blocks preceded with a "/" so they can be skipped during execution if wanted -swissi
function writeBlockSkip() {	
    if (properties.showSequenceNumbers) {
      writeWords2("/", nFormat.format(sequenceNumber), arguments);
      sequenceNumber += properties.sequenceNumberIncrement;
    } else {
      writeWords("/", arguments);
    }
  }

//Format type of comment line can be selected in Properties -swissi
function writeComment(text) {
  switch (properties.commentFormat) {
    case ":":
      writeln(":" + text);
      break;
    default:
      writeln("(" + text + ")");
      break;
  }
}

function onOpen() {
  if (properties.addDebugInfo) {  //Activates Debug Mode. -swissi
    setWriteInvocations(true);
    setWriteStack(false);
    writeln("!DEBUG: onOpen()")
  } 

  if (properties.useRadius) {
    maximumCircularSweep = toRad(90); // avoid potential center calculation errors for CNC
  }
  gRotationModal.format(69); // Default to G69 Rotation Off -swissi
  //Check for duplicate Tool Numbers with different cutter geometry-swissi
  if (true) { 
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

  //Begin Settings for Property Rotary Axis -swissi
  switch (properties.rotaryTableAxis) {  
	case "none":
		break;
	case "a":
	    var aAxis = createAxis({coordinate:0, table:true, axis:[1, 0, 0], cyclic:true, preference:0}); 
		machineConfiguration = new MachineConfiguration(aAxis);
		setMachineConfiguration(machineConfiguration);
		optimizeMachineAngles2(1); // map tip mode
		break;
	case "b":
	    var bAxis = createAxis({coordinate:1, table:true, axis:[0, 1, 0], cyclic:true, preference:0}); 
		machineConfiguration = new MachineConfiguration(bAxis);
		setMachineConfiguration(machineConfiguration);
		optimizeMachineAngles2(1); // map tip mode
		break;	
	case "c":
	    var cAxis = createAxis({coordinate:2, table:true, axis:[0, 0, 1], cyclic:true, preference:0}); 
		machineConfiguration = new MachineConfiguration(cAxis);
		setMachineConfiguration(machineConfiguration);
		optimizeMachineAngles2(1); // map tip mode
		break;
	case "-a":
	    var aAxis = createAxis({coordinate:0, table:true, axis:[-1, 0, 0], cyclic:true, preference:0}); 
		machineConfiguration = new MachineConfiguration(aAxis);
		setMachineConfiguration(machineConfiguration);
		optimizeMachineAngles2(1); // map tip mode
		break;
	case "-b":
	    var bAxis = createAxis({coordinate:1, table:true, axis:[0, -1, 0], cyclic:true, preference:0}); 
		machineConfiguration = new MachineConfiguration(bAxis);
		setMachineConfiguration(machineConfiguration);
		optimizeMachineAngles2(1); // map tip mode
		break;	
	case "-c":
	    var cAxis = createAxis({coordinate:2, table:true, axis:[0, 0, -1], cyclic:true, preference:0}); 
		machineConfiguration = new MachineConfiguration(cAxis);
		setMachineConfiguration(machineConfiguration);
		optimizeMachineAngles2(1); // map tip mode
		break;
	}
  //End Settings for Property Rotary Axis
 
  if (!machineConfiguration.isMachineCoordinate(0)) {
    aOutput.disable();
  }
  if (!machineConfiguration.isMachineCoordinate(1)) {
    bOutput.disable();
  }
  if (!machineConfiguration.isMachineCoordinate(2)) {
    cOutput.disable();
  }
  
  if (!properties.separateWordsWithSpace) {
    setWordSeparator("");
  }

  sequenceNumber = properties.sequenceNumberStart;
  writeln("%");

  //Begin modified Section to allow non-numeric Program Names -swissi
  if (!programName) {    
    error(localize("Program name has not been specified."));
    return;  
  }  

  if (properties.forceNumeric) {  
		var programId;
		try {
		  programId = getAsInt(programName);
		} catch(e) {
		  error(localize("Program name must be a number. Change Properties to accept non-numeric Program Names"));
		}
		if (!((programId >= 1) && (programId <= 99999))) {
		  error(localize("Program number is out of range."));
		}
		// old machines only support 4 digits
		var oFormat = createFormat({width:5, zeropad:true, decimals:0});
		writeln("O" + oFormat.format(programId));
  } 
  //End modified Section to allow non-numeric Program Names

  //Get Global Parameters -swissi
  if (properties.writeCNC12Vars) {  
    if (hasGlobalParameter("document-path")) {  
      var comment = getGlobalParameter("document-path");
      if (comment && designNameVar != "") {
        writeBlock(designNameVar + " = " + "\"" + comment + "\"" + "   ; Fusion 360 Design File Name");
      } 
    }  
    if (programNameVar != "") {
      writeBlock(programNameVar + " = " + "\"" + programName + "\"" + "    ; Program Name");
    }
    if (programComment && programCommentVar != "") {
      writeBlock(programCommentVar + " = " + "\"" + programComment.slice(0,80) + "\"" + "   ; Program Comment");
    }
  } else {
    writeComment(programName);
    if (programComment) {
        writeComment(programComment);
    }    
  }
 
  // dump machine configuration
  var vendor = machineConfiguration.getVendor();
  var model = machineConfiguration.getModel();
  var description = machineConfiguration.getDescription();

  if (properties.writeMachine && (vendor || model || description)) {
    writeComment(localize("Machine"));
    if (vendor) {
      writeComment("  " + localize("vendor") + ": " + vendor);
    }
    if (model) {
      writeComment("  " + localize("model") + ": " + model);
    }
    if (description) {
      writeComment("  " + localize("description") + ": "  + description);
    }
  }

  // dump tool information
  if (properties.writeTools || properties.writeCNC12Vars) {  //Do this section also if writeCNC12Vars is true -swissi
    zRanges = {}; //Changed to use puplic Variable zRanges -swissi
    if (is3D()) {
      var numberOfSections = getNumberOfSections();
      for (var i = 0; i < numberOfSections; ++i) {
        var section = getSection(i);
        var zRange = section.getGlobalZRange();
        var tool = section.getTool();
        if (zRanges[tool.number]) {
          zRanges[tool.number].expandToRange(zRange);
        } else {
          zRanges[tool.number] = zRange;
        }
      }
    }

    var tools = getToolTable();
    if (tools.getNumberOfTools() > 0 && properties.writeTools) {
      for (var i = 0; i < tools.getNumberOfTools(); ++i) {
        var tool = tools.getTool(i);
        var comment = "T" + toolFormat.format(tool.number) + "  " +
          "D=" + xyzFormat.format(tool.diameter) + " ";
        if (tool.cornerRadius > 0) {
          comment += localize("CR") + "=" + xyzFormat.format(tool.cornerRadius) + " - ";
        }  
        if ((tool.taperAngle > 0) && (tool.taperAngle < Math.PI)) {
          comment += localize("TAPER") + "=" + taperFormat.format(tool.taperAngle) + localize("deg") + " - ";
        }
        if (zRanges[tool.number]) {
          comment += localize("ZMIN") + "=" + xyzFormat.format(zRanges[tool.number].getMinimum()) + " - ";
        }
        comment += getToolTypeName(tool.type);
        if (tool.description) {   //Add Tool Description at the end if it exists -swissi
            comment += " - " + (tool.description);
          }
        writeComment(comment.slice(0,120));       
      }
    }
  }
  // Make the first 10 Tools available in CNC12 variables if requested -swissi
  var tools = getToolTable();
  if (properties.writeTools && properties.writeCNC12Vars) {
    for (var i = 0; i < 10; ++i) {
      if (i < tools.getNumberOfTools()) {
        var tool = tools.getTool(i);
        var comment = "T" + toolFormat.format(tool.number) + "  " +
          "D=" + xyzFormat.format(tool.diameter) + " ";
        if (tool.cornerRadius > 0) {
          comment += localize("CR") + "=" + xyzFormat.format(tool.cornerRadius) + " - ";
        }  
        if ((tool.taperAngle > 0) && (tool.taperAngle < Math.PI)) {
          comment += localize("TAPER") + "=" + taperFormat.format(tool.taperAngle) + localize("deg") + " - ";
        }
        if (zRanges[tool.number]) {
          comment += localize("ZMIN") + "=" + xyzFormat.format(zRanges[tool.number].getMinimum()) + " - ";
        }
        comment += getToolTypeName(tool.type);
        if (tool.description) {  
            comment += " - " + (tool.description);
        }      
      } else {
        comment = "";
      }
      switch (i) {
        case 0:
          if (toolNumberAVar != "") {
            writeBlock(toolNumberAVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;
        case 1:
          if (toolNumberBVar != "") {
            writeBlock(toolNumberBVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;  
        case 2:
          if (toolNumberCVar != "") {
            writeBlock(toolNumberCVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;  
        case 3:
          if (toolNumberDVar != "") {
            writeBlock(toolNumberDVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;
        case 4:
          if (toolNumberEVar != "") {
            writeBlock(toolNumberEVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;
        case 5:
          if (toolNumberFVar != "") {
            writeBlock(toolNumberFVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;          
        case 6:
          if (toolNumberGVar != "") {
            writeBlock(toolNumberGVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;    
        case 7:
          if (toolNumberHVar != "") {
            writeBlock(toolNumberHVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;    
        case 8:
          if (toolNumberIVar != "") {
            writeBlock(toolNumberIVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;  
        case 9:
          if (toolNumberJVar != "") {
            writeBlock(toolNumberJVar + " = " + "\"" + comment.slice(0,80) + "\"");
          }
          break;  
      }
    } 
  }

  // Create code to compare Tool Diameters between Fusion and CNC12 Tool Library and Update CNC12 if requested -swissi
  var tools = getToolTable();
  if (properties.checkCNC12ToolLibrary) {
    writeComment("******************** Begin of Tool Library Diameters check ********************");
    writeBlock("#"+ toolFormat.format(toolNrVar) + " = " + tools.getNumberOfTools());
    for (var i = 0; i < tools.getNumberOfTools(); ++i) {
      var tool = tools.getTool(i);
      var toolNr = "#"+ toolFormat.format(toolStartNrVar + i) + " = " + toolFormat.format(tool.number);
      var toolDia = "#"+ toolFormat.format(toolStartNrVar + i + 200) + " = " + xyzFormat.format(tool.diameter);
      writeBlock(toolNr);
      writeBlock(toolDia);
    }
    writeBlock("#100 = 0");
    writeBlock("#110 = 0");
    if (properties.showSequenceNumbers) {
        gotoSequenceNr = sequenceNumber
        writeBlock(" ;Begin of Tool Check Loop");
    } else {
        gotoSequenceNr = 100
        writeBlock("N100 ; Begin of Tool Check Loop");
    }
    writeBlock("If #[11000 + #[13000 + #[" + toolFormat.format(toolStartNrVar) + " + #101]]] != #[" + toolFormat.format(toolStartNrVar) + 
               " + #101 + 200] Then M224 #100 \"WARNING!\\n\\nTool #\%.0f Diameter does not match!\\n\\nFusion D: \%f\\nCNC12 D: \%f\\n\\n#\)[A]bort\\n#\)[I]gnore and continue\\n#\)[U]pdate CNC12 Library\" #[" 
               + toolFormat.format(toolStartNrVar) + " + #101] #[" + toolFormat.format(toolStartNrVar + 200) + " + #101] #[11000 + #[13000 + #[" + toolFormat.format(toolStartNrVar) + " + #101]]]");
    writeBlock("If #100 != 0 && #100 != 1 && #100 != 4 && #100 != 21 Then GOTO " + toolFormat.format(gotoSequenceNr));           
    writeBlock("If #100 == 1 Then M99");
    writeBlock("If #100 == 21 Then #[11000 + #[13000 + #[" + toolFormat.format(toolStartNrVar) + " + #101]]] = #[" + toolFormat.format(toolStartNrVar + 200) + " + #101]");
    writeBlock("#101 = #101 + 1");
    writeBlock("If #101 < #" + toolFormat.format(toolNrVar) + " Then GOTO " + toolFormat.format(gotoSequenceNr));
    writeComment("********************* End of Tool Library Diameters check *********************")
  } 

  if ((getNumberOfSections() > 0) && (getSection(0).workOffset == 0)) {
    for (var i = 0; i < getNumberOfSections(); ++i) {
      if (getSection(i).workOffset > 0) {
        error(localize("Using multiple work offsets is not possible if the initial work offset is 0."));
        return;
      }
    }
  }

  // absolute coordinates and feed per min
  writeBlock(gAbsIncModal.format(90), gFeedModeModal.format(94), gPlaneModal.format(17));

  switch (unit) {
  case IN:
    writeBlock(gUnitModal.format(20));
    break;
  case MM:
    writeBlock(gUnitModal.format(21));
    break;
  }
}

function onComment(message) {
  writeComment(message);
}

/** Force output of X, Y, and Z. */
function forceXYZ() {
  xOutput.reset();
  yOutput.reset();
  zOutput.reset();
}

/** Force output of A, B, and C. */
function forceABC() {
  aOutput.reset();
  bOutput.reset();
  cOutput.reset();
}

/** Force output of X, Y, Z, A, B, C, and F on next output. */
function forceAny() {
  forceXYZ();
  forceABC();
  feedOutput.reset();
}

//Support for Manual NC Commands Display Message, Call Program and Comment -swissi
var overridingProbeWorkOffset = 1;
function onParameter(name, value) {
  
  if (name == "probe-output-work-offset") {
        probeOutputWorkOffset = (value > 0) ? value : 1;
    }

  if (name == "operation:probeWorkOffset") {
        overridingProbeWorkOffset = (value > 0) ? value : 1;
    }

  if (properties.writeCNC12Vars) {
    switch (name) {
      case "display":
        writeBlock("M200 " + "\"" + value.slice(0,90) + "\"");
        break;

      case "call-subprogram":
        writeBlock(mFormat.format(98) + " \"" + value + "\"");
        break;

      case "operation-comment":
        writeComment(value);
        break;  
    }
  } else {

    switch (name) {
      case "display":
        writeBlock("M200 " + "\"" + value.slice(0,90) + "\"");
        break;

      case "operation-comment":
        writeComment(value);
        break;  
    } 
  }
}

//Support for Manual NC Command Pass through -swissi
function onPassThrough(text) {
  writeBlock(text);
}

var currentWorkPlaneABC = undefined;

function forceWorkPlane() {
  currentWorkPlaneABC = undefined;
}

//***swissi
function defineWorkPlane(_section, _setWorkPlane) {
    var abc = new Vector(0, 0, 0);
    if (forceMultiAxisIndexing || !is3D() || machineConfiguration.isMultiAxisConfiguration()) { // use 5-axis indexing for multi-axis mode
      // set working plane after datum shift
  
      if (_section.isMultiAxis()) {
        cancelTransformation();
        abc = _section.getInitialToolAxisABC();
        if (_setWorkPlane) {
          if (!retracted) {
            writeRetract(Z);
          }
          forceWorkPlane();
          onCommand(COMMAND_UNLOCK_MULTI_AXIS);
          gMotionModal.reset();
          writeBlock(
            gMotionModal.format(0),
            conditional(machineConfiguration.isMachineCoordinate(0), "A" + abcFormat.format(abc.x)),
            conditional(machineConfiguration.isMachineCoordinate(1), "B" + abcFormat.format(abc.y)),
            conditional(machineConfiguration.isMachineCoordinate(2), "C" + abcFormat.format(abc.z))
          );
        }
      } else {
        if (useMultiAxisFeatures) {
          var euler = _section.workPlane.getEuler2(EULER_ZXZ_R);
          abc = new Vector(euler.x, euler.y, euler.z);
          cancelTransformation();
        } else {
          abc = getWorkPlaneMachineABC(_section.workPlane, _setWorkPlane, true);
        }
        if (_setWorkPlane) {
          setWorkPlane(abc);
        }
      }
    } else { // pure 3D
      var remaining = _section.workPlane;
      if (!isSameDirection(remaining.forward, new Vector(0, 0, 1))) {
        error(localize("Tool orientation is not supported."));
        return abc;
      }
      setRotation(remaining);
    }
    return abc;
}


//***swissi
function cancelWorkPlane() {
    writeBlock(gRotationModal.format(69)); // cancel frame
    forceWorkPlane();
}

function setWorkPlane(abc) {
  if (!machineConfiguration.isMultiAxisConfiguration()) {
    return; // ignore
  }

  if (!((currentWorkPlaneABC == undefined) ||
        abcFormat.areDifferent(abc.x, currentWorkPlaneABC.x) ||
        abcFormat.areDifferent(abc.y, currentWorkPlaneABC.y) ||
        abcFormat.areDifferent(abc.z, currentWorkPlaneABC.z))) {
    return; // no change
  }

  if (properties.clampEnable) { //Enabling/disabling Clamps (M10/M11) is now a Property -swissi
    onCommand(COMMAND_UNLOCK_MULTI_AXIS);
	}

  // NOTE: add retract here
  if (!retracted) {
    writeRetract(Z);
  }

  writeBlock(
    gMotionModal.format(0),
    conditional(machineConfiguration.isMachineCoordinate(0), "A" + abcFormat.format(abc.x)),
    conditional(machineConfiguration.isMachineCoordinate(1), "B" + abcFormat.format(abc.y)),
    conditional(machineConfiguration.isMachineCoordinate(2), "C" + abcFormat.format(abc.z))
  );
  
  if (properties.clampEnable) { //Enabling/disabling Clamps (M10/M11) is now a Property -swissi 
	onCommand(COMMAND_LOCK_MULTI_AXIS);
	}

  currentWorkPlaneABC = abc;
}

var closestABC = false; // choose closest machine angles
var currentMachineABC;

function getWorkPlaneMachineABC(workPlane, _setWorkPlane, rotate) {
  var W = workPlane; // map to global frame

  var abc = machineConfiguration.getABC(W);
  if (closestABC) {
    if (currentMachineABC) {
      abc = machineConfiguration.remapToABC(abc, currentMachineABC);
    } else {
      abc = machineConfiguration.getPreferredABC(abc);
    }
  } else {
    abc = machineConfiguration.getPreferredABC(abc);
  }
  
  try {
    abc = machineConfiguration.remapABC(abc);
    currentMachineABC = abc;
  } catch (e) {
    error(
      localize("Machine angles not supported") + ":"
      + conditional(machineConfiguration.isMachineCoordinate(0), " A" + abcFormat.format(abc.x))
      + conditional(machineConfiguration.isMachineCoordinate(1), " B" + abcFormat.format(abc.y))
      + conditional(machineConfiguration.isMachineCoordinate(2), " C" + abcFormat.format(abc.z))
    );
  }
  
  var direction = machineConfiguration.getDirection(abc);
  if (!isSameDirection(direction, W.forward)) {
    error(localize("Orientation not supported."));
  }
  
  if (!machineConfiguration.isABCSupported(abc)) {
    error(
      localize("Work plane is not supported") + ":"
      + conditional(machineConfiguration.isMachineCoordinate(0), " A" + abcFormat.format(abc.x))
      + conditional(machineConfiguration.isMachineCoordinate(1), " B" + abcFormat.format(abc.y))
      + conditional(machineConfiguration.isMachineCoordinate(2), " C" + abcFormat.format(abc.z))
    );
  }

  if (rotate) {
    var tcp = false;
    if (tcp) {
      setRotation(W); // TCP mode
    } else {
      var O = machineConfiguration.getOrientation(abc);
      var R = machineConfiguration.getRemainingOrientation(abc, W);
      setRotation(R);
    }
  }

  return abc;
}

// 03/26/2020 - swissi
function isProbeOperation() {
    return hasParameter("operation-strategy") && ((getParameter("operation-strategy") == "probe" || getParameter("operation-strategy") == "probe_geometry"));
}

function onSection() {

  //Added to make Setup Name/Notes and Tool Path Name/Notes available in CNC12 as a User-String-Variable -swissi
  if (properties.writeCNC12Vars) {
    //if (isFirstSection() || tool.number != getPreviousSection().getTool().number) { //Add blocks only in the first section or when tool changes
      if (isFirstSection() || getPreviousSection().workOffset != currentSection.workOffset) { //Add block only when Setup has changed
        if (hasParameter("job-description") && setupNameVar != "") {  
          var comment = getParameter("job-description");
          if (comment) {
            writeBlock(setupNameVar + " = " + "\"" + comment + "\"" + "   ; Setup Name/Description");
          }   
        }
        if (hasParameter("job-notes") && setupNotesVar != "") {
          var comment = getParameter("job-notes");
          if (comment) {
            comment = comment.replace(/[\n\r]/g, ' ');
            writeBlock(setupNotesVar + " = " + "\"" + comment.slice(0,80) + "\"" + "   ; Setup Notes"); //Only the first 80 charcters of the Notes will be written
          }
        }
      }
      if (hasParameter("operation-comment") && toolPathNameVar != "") {
        var comment = getParameter("operation-comment");
        if (comment) {
          //writeComment(comment);
          writeBlock(toolPathNameVar + " = " + "\"" + comment + "\"" + "   ; Tool Path Name/Description");
        }
      }
      if (hasParameter("notes") && toolPathNotesVar != "") {
        var comment = getParameter("notes");
        if (comment) {
          comment = comment.replace(/[\n\r]/g, ' ');
          writeBlock(toolPathNotesVar + " = " + "\"" + comment.slice(0,80) + "\"" + "   ; Tool Path Notes");
        }
      }
    //}
  }

  //Begin - Write Tool, Feed and Speed Info CNC12 Variables -swissi 
  if (properties.writeCNC12Vars && writeToolLineVar != "") {
    var toolinfo = "T" + toolFormat.format(tool.number) + "  " +
      "D=" + xyzFormat.format(tool.diameter) + " " +
      localize("CR") + "=" + xyzFormat.format(tool.cornerRadius);
    if ((tool.taperAngle > 0) && (tool.taperAngle < Math.PI)) {
      toolinfo += " " + localize("TAPER") + "=" + taperFormat.format(tool.taperAngle) + localize("deg");
    }
    if (zRanges[tool.number]) {
      toolinfo += " - " + localize("ZMIN") + "=" + xyzFormat.format(zRanges[tool.number].getMinimum());
    }
    toolinfo += " - " + getToolTypeName(tool.type);
    if (tool.description) {
      toolinfo += " - " + (tool.description);
    }
    var comment = writeToolLineVar + " = \"" + toolinfo.slice(0,80) + "\"";
    writeBlock(comment);
    if (tool.comment && toolCommentVar != "" ) {
      var comment = toolCommentVar + " = \"" + tool.comment.slice(0,80) + "\"";
      writeBlock(comment);
    }
    if (hasParameter("operation:tool_type") && toolTypeVar != "" ) {
      var comment = getParameter("operation:tool_type");
      if (comment) {
        writeBlock(toolTypeVar + " = \"" + comment + "\"" + "   ; Tool Type");
      }   
    }
    if (hasParameter("operation:tool_unit") && toolUnitVar != "" ) {
      var comment = getParameter("operation:tool_unit");
      if (comment) {
        writeBlock(toolUnitVar + " = \"" + comment + "\"" + "   ; Tool Units");
      }   
    }
    if (hasParameter("operation:tool_diameter") && toolDiameterVar != "" ) {
      var comment = getParameter("operation:tool_diameter");
      if (comment) {
        writeBlock(toolDiameterVar + " = \"" + comment + "\"" + "   ; Tool Diameter");
      }   
    }
    if (hasParameter("operation:tool_numberOfFlutes") && toolNrOfFlutesVar != "" ) {
      var comment = getParameter("operation:tool_numberOfFlutes");
      if (comment) {
        writeBlock(toolNrOfFlutesVar + " = \"" + comment + "\"" + "   ; Tool Number of Flutes");
      }   
    }
    if (hasParameter("operation:tool_coolant") && toolCoolantVar != "" ) {
      var comment = getParameter("operation:tool_coolant");
      if (comment) {
        writeBlock(toolCoolantVar + " = \"" + comment + "\"" + "   ; Tool Coolant");
      }   
    }
    if (hasParameter("operation:tool_description") && toolDescrVar != "" ) {
      var comment = getParameter("operation:tool_description");
      if (comment) {
        writeBlock(toolDescrVar + " = \"" + comment.slice(0,80) + "\"" + "   ; Tool Description");
      }   
    }
    if (hasParameter("operation:tool_spindleSpeed") && spindleSpeedVar != "" ) {
      var comment = Math.round(getParameter("operation:tool_spindleSpeed"));
      if (comment) {
        writeBlock(spindleSpeedVar + " = \"" + comment + "\"" + "   ; Spindle Speed");
      }   
    }
    if (hasParameter("operation:tool_clockwise") && spindleDirVar != "" ) {
      if (getParameter("operation:tool_clockwise")) {
        var comment = "CW";
      } else {
        var comment = "CCW";
      }
      writeBlock(spindleDirVar + " = \"" + comment + "\"" + "   ; Spindle Direction");
    }   
    if (hasParameter("operation:optimalLoad") && optimalLoadVar != "" ) {
      var comment = getParameter("operation:optimalLoad");
      if (comment) {
        writeBlock(optimalLoadVar + " = \"" + comment + "\"" + "   ; Tool Optimal Load (WOC)");
      }   
    }
    if (hasParameter("operation:maximumStepdown") && maxStepdownVar != "" ) {
      var comment = getParameter("operation:maximumStepdown");
      if (comment) {
        writeBlock(maxStepdownVar + " = \"" + comment + "\"" + "   ; Max Stepdown (DOC)");
      }   
    }
    if (hasParameter("operation:tool_feedCutting") && feedCuttingVar != "" ) {
      var comment = getParameter("operation:tool_feedCutting");
      if (comment) {
        writeBlock(feedCuttingVar + " = \"" + comment + "\"" + "   ; Feed Rate");
      }   
    }
    if (hasParameter("operation:tool_feedPerTooth") && feedPerToothVar != "" ) {
      var comment = finefeedFormat.format(getParameter("operation:tool_feedPerTooth"));
      if (comment) {
        writeBlock(feedPerToothVar + " = \"" + comment + "\"" + "   ; Feed per Tooth");
      }   
    }
    if (hasParameter("operation:tool_feedRamp") && feedRampVar != "" ) {
      var comment = getParameter("operation:tool_feedRamp");
      if (comment) {
        writeBlock(feedRampVar + " = \"" + comment + "\"" + "   ; Ramp Feed Rate");
      }   
    }
    if (hasParameter("operation:tool_feedPlunge") && feedPlungeVar != "" ) {
      var comment = getParameter("operation:tool_feedPlunge");
      if (comment) {
        writeBlock(feedPlungeVar + " = \"" + comment + "\"" + "   ; Plunge Feed Rate");
      }   
    }
    if (hasParameter("operation:tool_feedPerRevolution") && feedPerRevVar != "" ) {
      var comment = finefeedFormat.format(getParameter("operation:tool_feedPerRevolution"));
      if (comment) {
        writeBlock(feedPerRevVar + " = \"" + comment + "\"" + "   ; Feed per Revolution");
      }   
    }
    if (setupOriginVar != "" ) {
      if (hasParameter("stock-lower-x")) {
        var lower_x = xyzFormat.format(getParameter("stock-lower-x"));
      } else {
        var lower_x = "NA";
      }
      if (hasParameter("stock-lower-y")) {
        var lower_y = xyzFormat.format(getParameter("stock-lower-y"));
      } else {
        var lower_y = "NA";
      }
      if (hasParameter("stock-lower-z")) {
        var lower_z = xyzFormat.format(getParameter("stock-lower-z"));
      } else {
        var lower_z = "NA";
      }
      if (hasParameter("stock-upper-x")) {
        var upper_x = xyzFormat.format(getParameter("stock-upper-x"));
      } else {
        var upper_x = "NA";
      }
      if (hasParameter("stock-upper-y")) {
        var upper_y = xyzFormat.format(getParameter("stock-upper-y"));
      } else {
        var upper_y = "NA";
      }
      if (hasParameter("stock-upper-z")) {
        var upper_z = xyzFormat.format(getParameter("stock-upper-z"));
      } else {
        var upper_z = "NA";
      }
      var comment = "Stock Coord = Dir+(X" + upper_x + " Y" + upper_y + " Z" + upper_z + ") Dir-(X" + lower_x + " Y" + lower_y + " Z" + lower_z + ")";
      writeBlock(setupOriginVar + " = \"" + comment + "\"" + "   ; Origin Position");
    }
    if (hasParameter("operation:clearanceHeight_value") && zClearanceVar != "" ) {
      var comment = getParameter("operation:clearanceHeight_value");
      if (comment) {
        writeBlock(zClearanceVar + " = \"" + comment + "\"" + "   ; Z Clearance Height");
      }   
    }
    if (currentWCSVar != "" ) {
      var workOffset = currentSection.workOffset;
      if (workOffset == 0) {
        workOffset = 1;
      }
      var comment = (gFormat.format(53 + workOffset));
      writeBlock(currentWCSVar + " = \"" + comment + "\"" + "   ; Current WCS");
    }
  }
  //End -  Write Tool, Feed and Speed Info CNC12 Variables


  //Add a user defined command to the start of the job file -swissi
  //If the command does not start with a gG or mM and the 2nd character is not a number, the command will be added as a comment
  if (isFirstSection() && properties.addCommandBegin != "") { 
    var addCom1 = properties.addCommandBegin.charAt(0);
    var addCom2 = properties.addCommandBegin.charAt(1);   
    if ((addCom1.toUpperCase() == "G" || addCom1.toUpperCase() == "M") && !isNaN(addCom2)) { 
      writeBlock(properties.addCommandBegin);
    } else {
      writeComment(properties.addCommandBegin);
    }    
  } 
  
  var forceToolAndRetract = optionalSection && !currentSection.isOptional(); //06/19/2020 -swissi
  optionalSection = currentSection.isOptional(); //06/19/2020 -swissi
  
  var insertToolCall = forceToolAndRetract || isFirstSection() ||
    currentSection.getForceToolChange && currentSection.getForceToolChange() ||
    (tool.number != getPreviousSection().getTool().number); //06/19/2020 -swissi
  
  retracted = false; // specifies that the tool has been retracted to the safe plane
  var newWorkOffset = isFirstSection() ||
    (getPreviousSection().workOffset != currentSection.workOffset); // work offset changes
  var newWorkPlane = isFirstSection() ||
    !isSameDirection(getPreviousSection().getGlobalFinalToolAxis(), currentSection.getGlobalInitialToolAxis()) ||
    (currentSection.isOptimizedForMachine() && getPreviousSection().isOptimizedForMachine() &&
      Vector.diff(getPreviousSection().getFinalToolAxisABC(), currentSection.getInitialToolAxisABC()).length > 1e-4) ||
    (!machineConfiguration.isMultiAxisConfiguration() && currentSection.isMultiAxis()) ||
    (!getPreviousSection().isMultiAxis() && currentSection.isMultiAxis() ||
      getPreviousSection().isMultiAxis() && !currentSection.isMultiAxis()); // force newWorkPlane between indexing and simultaneous operations
  if (insertToolCall || newWorkOffset || newWorkPlane) {
    
    // retract to safe plane
    writeRetract(Z); // retract
  }
  
  if (insertToolCall) {
    forceWorkPlane();
    
    retracted = true;
    onCommand(COMMAND_COOLANT_OFF);
  
    if (!isFirstSection() && properties.optionalStop) {
      onCommand(COMMAND_OPTIONAL_STOP);
    }

    if (tool.number > 99) {
      warning(localize("Tool number exceeds maximum value."));
    }

    writeBlock("T" + toolFormat.format(tool.number), mFormat.format(6));
    if (tool.comment) {
      writeComment(tool.comment);
    }
    var showToolZMin = false;
    if (showToolZMin) {
      if (is3D()) {
        var numberOfSections = getNumberOfSections();
        var zRange = currentSection.getGlobalZRange();
        var number = tool.number;
        for (var i = currentSection.getId() + 1; i < numberOfSections; ++i) {
          var section = getSection(i);
          if (section.getTool().number != number) {
            break;
          }
          zRange.expandToRange(section.getGlobalZRange());
        }
        writeComment(localize("ZMIN") + "=" + zRange.getMinimum());
      }
    }

    if (properties.preloadTool) {
      var nextTool = getNextTool(tool.number);
      if (nextTool) {
        writeBlock("T" + toolFormat.format(nextTool.number));
      } else {
        // preload first tool
        var section = getSection(0);
        var firstToolNumber = section.getTool().number;
        if (tool.number != firstToolNumber) {
          writeBlock("T" + toolFormat.format(firstToolNumber));
        }
      }
    }
    
  }
  
  if (!isProbeOperation() &&
      (insertToolCall ||
      forceSpindleSpeed ||
      isFirstSection() ||
      (rpmFormat.areDifferent(spindleSpeed, sOutput.getCurrent())) ||
      (tool.clockwise != getPreviousSection().getTool().clockwise))) {
    forceSpindleSpeed = false;

    if (spindleSpeed < 1) {
      error(localize("Spindle speed out of range."));
      return;
    }
    if (spindleSpeed > 99999) {
      warning(localize("Spindle speed exceeds maximum value."));
    }
    writeBlock(
      sOutput.format(spindleSpeed), mFormat.format(tool.clockwise ? 3 : 4)
    );
    
    //Adds a Dwell command after each Spindle Start if Property is selected -swissi
    if (properties.dwellFactor > 0) { 
        var dwellTime = tool.spindleRPM /1000 * (properties.dwellFactor / 100);  //dwell calculated based on spindle speed
          dwellTime = Math.round( dwellTime * 1e1 ) / 1e1; //rounds variable to 1 decimal
        onDwell(dwellTime); //Add dwell after spindle start
    }
  }

  // wcs
  if (insertToolCall) { // force work offset when changing tool
    currentWorkOffset = undefined;
  }
  var workOffset = currentSection.workOffset;

  if (workOffset == 0) {
    warningOnce(localize("Work offset has not been specified. Using G54 as WCS."), WARNING_WORK_OFFSET);
    workOffset = 1;
  }
  if (workOffset > 0) {
    if (workOffset > 6) {
      if (workOffset != currentWorkOffset) {
        writeBlock(eFormat.format(workOffset)); // E1->E18
        currentWorkOffset = workOffset;
      }
    } else {
      if (workOffset != currentWorkOffset) {
        writeBlock(gFormat.format(53 + workOffset)); // G54->G59
        currentWorkOffset = workOffset;
      }
    }
  }

  if (isProbeOperation) {
      workOffset = probeOutputWorkOffset  //-swissi set to WCS from Probing Setup
  }
 
  forceXYZ();

  var abc = defineWorkPlane(currentSection, true); //06/19/2020 -swissi

  // set coolant after we have positioned at Z
  setCoolant(tool.coolant);

  forceAny();

  var initialPosition = getFramePosition(currentSection.getInitialPosition());
  if (!retracted && !insertToolCall) {
    if (getCurrentPosition().z < initialPosition.z) {
      writeBlock(gMotionModal.format(0), zOutput.format(initialPosition.z));
    }
  }

  if (insertToolCall || retracted) {
    var lengthOffset = tool.lengthOffset;
    if (lengthOffset > 200) {
      error(localize("Length offset out of range."));
      return;
    }

    gMotionModal.reset();
    writeBlock(gPlaneModal.format(17));

    if (!machineConfiguration.isHeadConfiguration()) {
      writeBlock(
        gAbsIncModal.format(90),
        gMotionModal.format(0), xOutput.format(initialPosition.x), yOutput.format(initialPosition.y)
      );
      writeBlock(gMotionModal.format(0), gFormat.format(43), zOutput.format(initialPosition.z), hFormat.format(lengthOffset));
      //Add a M0 Command or M200 Message after each tool length offset so user can verify correct offset -swissi 
      switch (properties.checkToolOffset) {
        case "No":
          break;
        case "M0":  
          writeBlockSkip(mFormat.format(0));
          writeComment("CHECK TOOL-HEIGHT-OFFSET");
          gMotionModal.reset();
          break;
        case "M200":  
          if (hasParameter("operation:clearanceHeight_value")) {
            var comment = getParameter("operation:clearanceHeight_value");
            if (!comment) {
              comment = "unknown";
            }
          } 
          writeBlockSkip("M200 \"Check Tool-Height-Offset!\\n\\nZ-Distance between Tool and Z-Origin Point should be: " + comment + "\\n\\nPress Cycle Start to continue\\n\"");
          gMotionModal.reset();
          break;
		  }
    } else {
      writeBlock(
        gAbsIncModal.format(90),
        gMotionModal.format(0),
        gFormat.format(43), xOutput.format(initialPosition.x),
        yOutput.format(initialPosition.y),
        zOutput.format(initialPosition.z), hFormat.format(lengthOffset)
      );
    }
  } else {
    writeBlock(
      gAbsIncModal.format(90),
      gMotionModal.format(0),
      xOutput.format(initialPosition.x),
      yOutput.format(initialPosition.y)
    );
  }

  if (properties.smoothingProfile >= 0) {
  	if (properties.smoothingProfile > 99) {
		  error(localize("Smoothing Profile Number must be <= 99."));
		}
    writeBlock(gFormat.format(64), "ON P" + xyzFormat.format(properties.smoothingProfile));
  }

  //03/26/2020 -swissi
  if (isProbeOperation()) {
    if (g68RotationMode != 0) {
      error(localize("You cannot probe while G68 Rotation is in effect."));
      return;
    }
    angularProbingMode = getAngularProbingMode();
    //open probinf cycle file before the first probing move
    if (isFirstProbingMove) {
      isFirstProbingMove = false;
      writeBlock(gFormat.format(65), "\"" + probingCycleFile + "\"")
    }
    writeBlock(gFormat.format(65), "P" + 9832); // spin the probe on
  }
}

function onDwell(seconds) {
  if (seconds > 99999.999) {
    warning(localize("Dwelling time is out of range."));
  }
  seconds = clamp(0.001, seconds, 99999.999);
  writeBlock(gFormat.format(4), "P" + secFormat.format(seconds));
}

function onSpindleSpeed(spindleSpeed) {
  writeBlock(sOutput.format(spindleSpeed));
}

function onCycle() {
  writeBlock(gPlaneModal.format(17));
}

function getCommonCycle(x, y, z, r) {
  forceXYZ(); // force xyz on first drill hole of any cycle
  return [xOutput.format(x), yOutput.format(y),
    zOutput.format(z),
    "R" + xyzFormat.format(r)];
}

//Start 03/26/2020 -swissi
function setCyclePosition(_position) {
    switch (gPlaneModal.getCurrent()) {
    case 17: // XY
      zOutput.format(_position);
      break;
    case 18: // ZX
      yOutput.format(_position);
      break;
    case 19: // YZ
      xOutput.format(_position);
      break;
    }
}
  
/** Convert approach to sign. */
function approach(value) {
    validate((value == "positive") || (value == "negative"), "Invalid approach.");
    return (value == "positive") ? 1 : -1;
}
  
/**
  Determine if angular probing is supported
*/
function getAngularProbingMode() {
    if (machineConfiguration.isMultiAxisConfiguration()) {
      if (machineConfiguration.isMachineCoordinate(2)) {
        return ANGLE_PROBE_USE_CAXIS;
      } else {
        return ANGLE_PROBE_NOT_SUPPORTED;
      }
    } else {
      return ANGLE_PROBE_USE_ROTATION;
    }
}
  
/**
  Output rotation offset based on angular probing cycle.
*/
function setProbingAngle() {
    if ((g68RotationMode == 1) || (g68RotationMode == 2)) { // Rotate coordinate system for Angle Probing
      if (!properties.useG54x4) {
        gRotationModal.reset();
        gAbsIncModal.reset();
        writeBlock(
          gRotationModal.format(68), gAbsIncModal.format(90),
          (g68RotationMode == 1) ? "X0" : "X[#135]",
          (g68RotationMode == 1) ? "Y0" : "Y[#136]",
          "Z0", "I0.0", "J0.0", "K1.0", "R[#139]"
        );
        g68RotationMode = 3;
      } else if (angularProbingMode != ANGLE_PROBE_NOT_SUPPORTED) {
        writeBlock("#26010=#135");
        writeBlock("#26011=#136");
        writeBlock("#26012=#137");
        writeBlock("#26015=#139");
        writeBlock(gFormat.format(54.4), "P1");
        g68RotationMode = 0;
      } else {
        error(localize("Angular probing is not supported for this machine configuration."));
        return;
      }
    }
}
//End 03/26/2020 -swissi

function onCyclePoint(x, y, z) {
  if (!isSameDirection(getRotation().forward, new Vector(0, 0, 1))) {
    expandCyclePoint(x, y, z);
    return;
  }
  // Start 03/26/2020 - swissi
  var probeWorkOffsetCode;
  if (isProbeOperation()) {
    if (!useMultiAxisFeatures && !isSameDirection(currentSection.workPlane.forward, new Vector(0, 0, 1)) && (!cycle.probeMode || (cycle.probeMode == 0))) {
      error(localize("Updating WCS / work offset using probing is only supported by the CNC in the WCS frame."));
      return;
    }

    var workOffset = probeOutputWorkOffset ? probeOutputWorkOffset : currentWorkOffset;
    if (workOffset > 18) {
      error(localize("Work offset is out of range."));
      return;
    } else if (workOffset > 6) {
      probeWorkOffsetCode = probe100Format.format(workOffset - 6 + 100);
    } else {
      probeWorkOffsetCode = workOffset + "."; // G54->G59
    }
  }
  // End 03/26/2020 -swissi

  if (isFirstCyclePoint()) {
    repositionToCycleClearance(cycle, x, y, z);
    
    // return to initial Z which is clearance plane and set absolute mode

    var F = cycle.feedrate;
    var P = !cycle.dwell ? 0 : clamp(0.001, cycle.dwell, 99999.999); // in seconds

    switch (cycleType) {
    case "drilling":
      writeBlock(
        gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format(81),
        getCommonCycle(x, y, z, cycle.retract),
        feedOutput.format(F)
      );
      break;
    case "counter-boring":
      if (P > 0) {
        writeBlock(
          gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format(82),
          getCommonCycle(x, y, z, cycle.retract),
          "P" + secFormat.format(P), // not optional
          feedOutput.format(F)
        );
      } else {
        writeBlock(
          gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format(81),
          getCommonCycle(x, y, z, cycle.retract),
          feedOutput.format(F)
        );
      }
      break;
    case "chip-breaking":
      if (cycle.accumulatedDepth < cycle.depth) {
        expandCyclePoint(x, y, z);
      } else {
        writeBlock(
          gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format(73),
          getCommonCycle(x, y, z, cycle.retract),
          "Q" + xyzFormat.format(cycle.incrementalDepth),
          conditional(P > 0, "P" + secFormat.format(P)), // optional
          feedOutput.format(F)
        );
      }
      break;
    case "deep-drilling":
      writeBlock(
        gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format(83),
        getCommonCycle(x, y, z, cycle.retract),
        "Q" + xyzFormat.format(cycle.incrementalDepth),
        "P" + secFormat.format(P), // not optional - TAG: optional
        feedOutput.format(F)
      );
      break;
    case "tapping":
      if (!F) {
        F = tool.getTappingFeedrate();
      }
      writeBlock(
        gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format((tool.type == TOOL_TAP_LEFT_HAND) ? 74 : 84),
        getCommonCycle(x, y, z, cycle.retract),
        feedOutput.format(F)
      );
      break;
    case "left-tapping":
      if (!F) {
        F = tool.getTappingFeedrate();
      }
      writeBlock(
        gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format(74),
        getCommonCycle(x, y, z, cycle.retract),
        feedOutput.format(F)
      );
      break;
    case "right-tapping":
      if (!F) {
        F = tool.getTappingFeedrate();
      }
      writeBlock(
        gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format(84),
        getCommonCycle(x, y, z, cycle.retract),
        feedOutput.format(F)
      );
      break;
    case "reaming":
      writeBlock(
        gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format(85),
        getCommonCycle(x, y, z, cycle.retract),
        feedOutput.format(F)
      );
      break;
    case "boring":
      writeBlock(
        gRetractModal.format(98), gAbsIncModal.format(90), gCycleModal.format(89),
        getCommonCycle(x, y, z, cycle.retract),
        "P" + secFormat.format(P), // not optional
        feedOutput.format(F)
      );
      break;
  
    //Start Probing Cycles 03/26/2020 - swissi

    case "probing-x":
      forceXYZ();
      // move slowly always from clearance not retract
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9811 + " A1",
        "X" + xyzFormat.format(x + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter/2)),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-y":
      forceXYZ();
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9811 + " A2",
        "Y" + xyzFormat.format(y + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter/2)),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-z":
      forceXYZ();
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(Math.min(z - cycle.depth + cycle.probeClearance, cycle.retract)), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9811 + " A3",
        "Z" + xyzFormat.format(z - cycle.depth),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-x-wall":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9812 + " A1",
        "X" + xyzFormat.format(cycle.width1),
        zOutput.format(z - cycle.depth),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        "R" + xyzFormat.format(cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-y-wall":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9812 + " A2",
        "Y" + xyzFormat.format(cycle.width1),
        zOutput.format(z - cycle.depth),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        "R" + xyzFormat.format(cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-x-channel":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9813 + " A1",
        "X" + xyzFormat.format(cycle.width1),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        // not required "R" + xyzFormat.format(cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-x-channel-with-island":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9813 + " A1",
        "X" + xyzFormat.format(cycle.width1),
        zOutput.format(z - cycle.depth),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        "R" + xyzFormat.format(-cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-y-channel":
      yOutput.reset();
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9813 + " A2",
        "Y" + xyzFormat.format(cycle.width1),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        // not required "R" + xyzFormat.format(cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-y-channel-with-island":
      yOutput.reset();
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9813 + " A2",
        "Y" + xyzFormat.format(cycle.width1),
        zOutput.format(z - cycle.depth),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        "R" + xyzFormat.format(-cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-xy-circular-boss":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9814,
        "D" + xyzFormat.format(cycle.width1),
        "Z" + xyzFormat.format(z - cycle.depth),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        "R" + xyzFormat.format(cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-xy-circular-hole":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9817,
        "D" + xyzFormat.format(cycle.width1),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        // not required "R" + xyzFormat.format(cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-xy-circular-hole-with-island":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9817,
        "Z" + xyzFormat.format(z - cycle.depth),
        "D" + xyzFormat.format(cycle.width1),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        "R" + xyzFormat.format(-cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-xy-rectangular-hole":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9813 + " A1 C1",
        "X" + xyzFormat.format(cycle.width1),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        // not required "R" + xyzFormat.format(-cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      writeBlock(
        gFormat.format(65), "P" + 9813 + " A2 C1",
        "Y" + xyzFormat.format(cycle.width2),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        // not required "R" + xyzFormat.format(-cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-xy-rectangular-boss":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9812 + " A1 C1",
        "Z" + xyzFormat.format(z - cycle.depth),
        "X" + xyzFormat.format(cycle.width1),
        "R" + xyzFormat.format(cycle.probeClearance),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      writeBlock(
        gFormat.format(65), "P" + 9812 + " A2 C1",
        "Z" + xyzFormat.format(z - cycle.depth),
        "Y" + xyzFormat.format(cycle.width2),
        "R" + xyzFormat.format(cycle.probeClearance),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-xy-rectangular-hole-with-island":
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9813 + " A1 C1",
        "Z" + xyzFormat.format(z - cycle.depth),
        "X" + xyzFormat.format(cycle.width1),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        "R" + xyzFormat.format(-cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      writeBlock(
        gFormat.format(65), "P" + 9813 + " A2 C1",
        "Z" + xyzFormat.format(z - cycle.depth),
        "Y" + xyzFormat.format(cycle.width2),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        "R" + xyzFormat.format(-cycle.probeClearance),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      break;
    case "probing-xy-inner-corner":
      var cornerX = x + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter/2);
      var cornerY = y + approach(cycle.approach2) * (cycle.probeClearance + tool.diameter/2);
      var cornerI = 0;
      var cornerJ = 0;
      if (cycle.probeSpacing !== undefined) {
        cornerI = cycle.probeSpacing;
        cornerJ = cycle.probeSpacing;
      }
      if ((cornerI != 0) && (cornerJ != 0)) {
        g68RotationMode = 2;
      }
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9815, xOutput.format(cornerX), yOutput.format(cornerY),
        conditional(cornerI != 0, "I" + xyzFormat.format(cornerI)),
        conditional(cornerJ != 0, "J" + xyzFormat.format(cornerJ)),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        conditional((g68RotationMode == 0) || (angularProbingMode == ANGLE_PROBE_USE_CAXIS), getProbingArguments(cycle, probeWorkOffsetCode))
      );
      break;
    case "probing-xy-outer-corner":
      var cornerX = x + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter/2);
      var cornerY = y + approach(cycle.approach2) * (cycle.probeClearance + tool.diameter/2);
      var cornerI = 0;
      var cornerJ = 0;
      if (cycle.probeSpacing !== undefined) {
        cornerI = cycle.probeSpacing;
        cornerJ = cycle.probeSpacing;
      }
      if ((cornerI != 0) && (cornerJ != 0)) {
        g68RotationMode = 2;
      }
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9816, xOutput.format(cornerX), yOutput.format(cornerY),
        conditional(cornerI != 0, "I" + xyzFormat.format(cornerI)),
        conditional(cornerJ != 0, "J" + xyzFormat.format(cornerJ)),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        conditional((g68RotationMode == 0) || (angularProbingMode == ANGLE_PROBE_USE_CAXIS), getProbingArguments(cycle, probeWorkOffsetCode))
      );
      break;
    case "probing-x-plane-angle":
      forceXYZ();
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9843 + " A1",
        "X" + xyzFormat.format(x + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter/2)),
        "D" + xyzFormat.format(cycle.probeSpacing),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      //g68RotationMode = 1;
      break;
    case "probing-y-plane-angle":
      forceXYZ();
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(z - cycle.depth), feedOutput.format(F)); // protected positioning move
      writeBlock(
        gFormat.format(65), "P" + 9843 + " A2",
        "Y" + xyzFormat.format(y + approach(cycle.approach1) * (cycle.probeClearance + tool.diameter/2)),
        "D" + xyzFormat.format(cycle.probeSpacing),
        "Q" + xyzFormat.format(cycle.probeOvertravel),
        getProbingArguments(cycle, probeWorkOffsetCode)
      );
      //g68RotationMode = 1;
      break;
    //End Probing Cycles 03/26/2020 - swissi  
    default:
      expandCyclePoint(x, y, z);
    }

// 2nd through nth cycle point
} else {
    if (isProbeOperation()) {
      // do nothing
    } else if (cycleExpanded) {
      expandCyclePoint(x, y, z);
    } else {
      if (!xyzFormat.areDifferent(x, xOutput.getCurrent()) &&
          !xyzFormat.areDifferent(y, yOutput.getCurrent()) &&
          !xyzFormat.areDifferent(z, zOutput.getCurrent())) {
        switch (gPlaneModal.getCurrent()) {
        case 17: // XY
          xOutput.reset(); // at least one axis is required
          break;
        case 18: // ZX
          zOutput.reset(); // at least one axis is required
          break;
        case 19: // YZ
          yOutput.reset(); // at least one axis is required
          break;
        }
      }
      if (incrementalMode) { // set current position to retract height
        setCyclePosition(cycle.retract);
      }
      writeBlock(xOutput.format(x), yOutput.format(y));
      if (incrementalMode) { // set current position to clearance height
        setCyclePosition(cycle.clearance);
      }
    }
  }
}

// Start 03/26/2020 -swissi
function getProbingArguments(cycle, probeWorkOffsetCode) {
    var probeWCS = hasParameter("operation-strategy") && (getParameter("operation-strategy") == "probe");
    return [
      (cycle.angleAskewAction == "stop-message" ? "B" + xyzFormat.format(cycle.toleranceAngle ? cycle.toleranceAngle : 0) : undefined),
      ((cycle.updateToolWear && cycle.toolWearErrorCorrection <= 100) ? "F" + xyzFormat.format(cycle.toolWearErrorCorrection ? cycle.toolWearErrorCorrection / 100 : 0) : undefined),
      (cycle.wrongSizeAction == "stop-message" ? "H" + xyzFormat.format(cycle.toleranceSize ? cycle.toleranceSize : 0) : undefined),
      (cycle.outOfPositionAction == "stop-message" ? "M" + xyzFormat.format(cycle.tolerancePosition ? cycle.tolerancePosition : 0) : undefined),
      ((cycle.updateToolWear && cycleType == "probing-z") ? "T" + xyzFormat.format(cycle.toolLengthOffset) : undefined),
      ((cycle.updateToolWear && cycleType !== "probing-z") ? "T" + xyzFormat.format(cycle.toolDiameterOffset) : undefined),
      (cycle.updateToolWear ? "V" + xyzFormat.format(cycle.toolWearUpdateThreshold ? cycle.toolWearUpdateThreshold : 0) : undefined),
      (cycle.printResults ? "W" + xyzFormat.format(1 + cycle.incrementComponent) : undefined), // 1 for advance feature, 2 for reset feature count and advance component number. first reported result in a program should use W2.
      conditional(probeWorkOffsetCode && probeWCS, "S" + overridingProbeWorkOffset)
    ];
  }

function onCycleEnd() {
    if (isProbeOperation()) {
      writeBlock(gFormat.format(65), "P" + 9810 + " C3", zOutput.format(cycle.clearance)); // protected retract move
      writeBlock(gFormat.format(65), "P" + 9833); // spin the probe off
      setProbingAngle(); // define rotation of part
      // we can move in rapid from retract optionally
    
    } else {
      if (cycleSubprogramIsActive) {
        subprogramEnd();
        cycleSubprogramIsActive = false;
      }
      if (!cycleExpanded) {
        writeBlock(gCycleModal.format(80));
        zOutput.reset();
      }
    }
  }
// End 03/26/2020 -swissi 

var pendingRadiusCompensation = -1;

function onRadiusCompensation() {
  pendingRadiusCompensation = radiusCompensation;
}

function onRapid(_x, _y, _z) {
  var x = xOutput.format(_x);
  var y = yOutput.format(_y);
  var z = zOutput.format(_z);
  if (x || y || z) {
    if (pendingRadiusCompensation >= 0) {
      error(localize("Radius compensation mode cannot be changed at rapid traversal."));
    }
    writeBlock(gMotionModal.format(0), x, y, z);
    feedOutput.reset();
  }
}

function onLinear(_x, _y, _z, feed) {
  if (pendingRadiusCompensation >= 0) {
    // ensure that we end at desired position when compensation is turned off
    xOutput.reset();
    yOutput.reset();
  }
  var x = xOutput.format(_x);
  var y = yOutput.format(_y);
  var z = zOutput.format(_z);
  var f = feedOutput.format(feed);
  if (x || y || z) {
    if (pendingRadiusCompensation >= 0) {
      pendingRadiusCompensation = -1;
      var d = tool.diameterOffset;
      if (d > 200) {
        warning(localize("The diameter offset exceeds the maximum value."));
      }
      writeBlock(gPlaneModal.format(17));
      switch (radiusCompensation) {
      case RADIUS_COMPENSATION_LEFT:
        dOutput.reset();
        writeBlock(gMotionModal.format(1), gFormat.format(41), x, y, z, dOutput.format(d), f);
        break;
      case RADIUS_COMPENSATION_RIGHT:
        dOutput.reset();
        writeBlock(gMotionModal.format(1), gFormat.format(42), x, y, z, dOutput.format(d), f);
        break;
      default:
        writeBlock(gMotionModal.format(1), gFormat.format(40), x, y, z, f);
      }
    } else {
      writeBlock(gMotionModal.format(1), x, y, z, f);
    }
  } else if (f) {
    if (getNextRecord().isMotion()) { // try not to output feed without motion
      feedOutput.reset(); // force feed on next line
    } else {
      writeBlock(gMotionModal.format(1), f);
    }
  }
}

function onRapid5D(_x, _y, _z, _a, _b, _c) {
  if (!currentSection.isOptimizedForMachine()) {
    error(localize("This post configuration has not been customized for 5-axis simultaneous toolpath."));
    return;
  }
  if (pendingRadiusCompensation >= 0) {
    error(localize("Radius compensation mode cannot be changed at rapid traversal."));
    return;
  }
  var x = xOutput.format(_x);
  var y = yOutput.format(_y);
  var z = zOutput.format(_z);
  var a = aOutput.format(_a);
  var b = bOutput.format(_b);
  var c = cOutput.format(_c);
  writeBlock(gMotionModal.format(0), x, y, z, a, b, c);
  feedOutput.reset();
}

function onLinear5D(_x, _y, _z, _a, _b, _c, feed) {
    if (!currentSection.isOptimizedForMachine()) {
      error(localize("This post configuration has not been customized for 5-axis simultaneous toolpath."));
      return;
    }
    if (pendingRadiusCompensation >= 0) {
      error(localize("Radius compensation cannot be activated/deactivated for 5-axis move."));
      return;
    }
    var x = xOutput.format(_x);
    var y = yOutput.format(_y);
    var z = zOutput.format(_z);
    var a = aOutput.format(_a);
    var b = bOutput.format(_b);
    var c = cOutput.format(_c);
  
    // get feedrate number
    var f = {frn:0, fmode:0};
    if (a || b || c) {
      f = getMultiaxisFeed(_x, _y, _z, _a, _b, _c, feed);
      if (useInverseTimeFeed) {
        f.frn = inverseTimeOutput.format(f.frn);
      } else {
        f.frn = feedOutput.format(f.frn);
      }
    } else {
      f.frn = feedOutput.format(feed);
      f.fmode = 94;
    }
  
    if (x || y || z || a || b || c) {
      writeBlock(gFeedModeModal.format(f.fmode), gMotionModal.format(1), x, y, z, a, b, c, f.frn);
    } else if (f.frn) {
      if (getNextRecord().isMotion()) { // try not to output feed without motion
        feedOutput.reset(); // force feed on next line
      } else {
        writeBlock(gFeedModeModal.format(f.fmode), gMotionModal.format(1), f.frn);
      }
    }
  }
  
  // Start of multi-axis feedrate logic
  /***** Be sure to add 'useInverseTime' to post properties if necessary. *****/
  /***** 'inverseTimeOutput' must be defined. *****/
  /***** 'headOffset' should be defined when a head rotary axis is defined. *****/
  /***** The feedrate mode must be included in motion block output (linear, circular, etc. *****/
  var dpmBPW = 0.1; // ratio of rotary accuracy to linear accuracy for DPM calculations
  var inverseTimeUnits = 1.0; // 1.0 = minutes, 60.0 = seconds
  var maxInverseTime = 99999; // maximum value to output for Inverse Time feeds
      
  // Start of multi-axis feedrate logic
  /***** You can add 'properties.useInverseTime' if desired. *****/
  /***** 'previousABC' can be added throughout to maintain previous rotary positions. Required for Mill/Turn machines. *****/
  /***** 'headOffset' should be defined when a head rotary axis is defined. *****/
  /***** The feedrate mode must be included in motion block output (linear, circular, etc.) for Inverse Time feedrate support. *****/
  var dpmBPW = 0.1; // ratio of rotary accuracy to linear accuracy for DPM calculations
  var inverseTimeUnits = 1.0; // 1.0 = minutes, 60.0 = seconds
  var maxInverseTime = 9999; // maximum value to output for Inverse Time feeds
  var maxDPM = 9999.99; // maximum value to output for DPM feeds
  var useInverseTimeFeed = true; // use 1/T feeds
  var inverseTimeFormat = createFormat({decimals:(unit == MM ? 1 : 2), forceDecimal:true});
  var inverseTimeOutput = createVariable({prefix:"F", force:true}, inverseTimeFormat);
  var previousDPMFeed = 0; // previously output DPM feed
  var dpmFeedToler = 0.5; // tolerance to determine when the DPM feed has changed
  // var previousABC = new Vector(0, 0, 0); // previous ABC position if maintained in post, don't define if not used
  var forceOptimized = undefined; // used to override optimized-for-angles points (XZC-mode)
  
  /** Calculate the multi-axis feedrate number. */
  function getMultiaxisFeed(_x, _y, _z, _a, _b, _c, feed) {
      var f = {frn:0, fmode:0};
      if (feed <= 0) {
        error(localize("Feedrate is less than or equal to 0."));
        return f;
      }
      
      var length = getMoveLength(_x, _y, _z, _a, _b, _c);
      
      if (useInverseTimeFeed) { // inverse time
        f.frn = getInverseTime(length.tool, feed);
        f.fmode = 93;
        feedOutput.reset();
      } else { // degrees per minute
        f.frn = getFeedDPM(length, feed);
        f.fmode = 94;
      }
      return f;
  }
  
  /** Returns point optimization mode. */
  function getOptimizedMode() {
      if (forceOptimized != undefined) {
        return forceOptimized;
      }
      // return (currentSection.getOptimizedTCPMode() != 0); // TAG:doesn't return correct value
      return true; // always return false for non-TCP based heads
  }
      
  /** Calculate the DPM feedrate number. */
  function getFeedDPM(_moveLength, _feed) {
      if ((_feed == 0) || (_moveLength.tool < 0.0001) || (toDeg(_moveLength.abcLength) < 0.0005)) {
        previousDPMFeed = 0;
        return _feed;
      }
      var moveTime = _moveLength.tool / _feed;
      if (moveTime == 0) {
        previousDPMFeed = 0;
        return _feed;
      }
    
      var dpmFeed;
      var tcp = false; // !getOptimizedMode() && (forceOptimized == undefined);   // set to false for rotary heads
      if (tcp) { // TCP mode is supported, output feed as FPM
        dpmFeed = _feed;
      } else if (false) { // standard DPM
        dpmFeed = Math.min(toDeg(_moveLength.abcLength) / moveTime, maxDPM);
        if (Math.abs(dpmFeed - previousDPMFeed) < dpmFeedToler) {
          dpmFeed = previousDPMFeed;
        }
      } else if (true) { // combination FPM/DPM
        var length = Math.sqrt(Math.pow(_moveLength.xyzLength, 2.0) + Math.pow((toDeg(_moveLength.abcLength) * dpmBPW), 2.0));
        dpmFeed = Math.min((length / moveTime), maxDPM);
        if (Math.abs(dpmFeed - previousDPMFeed) < dpmFeedToler) {
          dpmFeed = previousDPMFeed;
        }
      } else { // machine specific calculation
        dpmFeed = _feed;
      }
      previousDPMFeed = dpmFeed;
      return dpmFeed;
  }
    
  /** Calculate the Inverse time feedrate number. */
  function getInverseTime(_length, _feed) {
      var inverseTime;
      if (_length < 1.e-6) { // tool doesn't move
        if (typeof maxInverseTime === "number") {
          inverseTime = maxInverseTime;
        } else {
          inverseTime = 999999;
        }
      } else {
        inverseTime = _feed / _length / inverseTimeUnits;
        if (typeof maxInverseTime === "number") {
          if (inverseTime > maxInverseTime) {
            inverseTime = maxInverseTime;
          }
        }
      }
      return inverseTime;
  }
    
  /** Calculate radius for each rotary axis. */
  function getRotaryRadii(startTool, endTool, startABC, endABC) {
      var radii = new Vector(0, 0, 0);
      var startRadius;
      var endRadius;
      var axis = new Array(machineConfiguration.getAxisU(), machineConfiguration.getAxisV(), machineConfiguration.getAxisW());
      for (var i = 0; i < 3; ++i) {
        if (axis[i].isEnabled()) {
          var startRadius = getRotaryRadius(axis[i], startTool, startABC);
          var endRadius = getRotaryRadius(axis[i], endTool, endABC);
          radii.setCoordinate(axis[i].getCoordinate(), Math.max(startRadius, endRadius));
        }
      }
      return radii;
  }
    
  /** Calculate the distance of the tool position to the center of a rotary axis. */
  function getRotaryRadius(axis, toolPosition, abc) {
      if (!axis.isEnabled()) {
        return 0;
      }
    
      var direction = axis.getEffectiveAxis();
      var normal = direction.getNormalized();
      // calculate the rotary center based on head/table
      var center;
      var radius;
      if (axis.isHead()) {
        var pivot;
        if (typeof headOffset === "number") {
          pivot = headOffset;
        } else {
          pivot = tool.getBodyLength();
        }
        if (axis.getCoordinate() == machineConfiguration.getAxisU().getCoordinate()) { // rider
          center = Vector.sum(toolPosition, Vector.product(machineConfiguration.getDirection(abc), pivot));
          center = Vector.sum(center, axis.getOffset());
          radius = Vector.diff(toolPosition, center).length;
        } else { // carrier
          var angle = abc.getCoordinate(machineConfiguration.getAxisU().getCoordinate());
          radius = Math.abs(pivot * Math.sin(angle));
          radius += axis.getOffset().length;
        }
      } else {
        center = axis.getOffset();
        var d1 = toolPosition.x - center.x;
        var d2 = toolPosition.y - center.y;
        var d3 = toolPosition.z - center.z;
        var radius = Math.sqrt(
          Math.pow((d1 * normal.y) - (d2 * normal.x), 2.0) +
          Math.pow((d2 * normal.z) - (d3 * normal.y), 2.0) +
          Math.pow((d3 * normal.x) - (d1 * normal.z), 2.0)
        );
      }
      return radius;
  }
      
  /** Calculate the linear distance based on the rotation of a rotary axis. */
  function getRadialDistance(radius, startABC, endABC) {
      // calculate length of radial move
      var delta = Math.abs(endABC - startABC);
      if (delta > Math.PI) {
        delta = 2 * Math.PI - delta;
      }
      var radialLength = (2 * Math.PI * radius) * (delta / (2 * Math.PI));
      return radialLength;
  }
      
  /** Calculate tooltip, XYZ, and rotary move lengths. */
  function getMoveLength(_x, _y, _z, _a, _b, _c) {
      // get starting and ending positions
      var moveLength = {};
      var startTool;
      var endTool;
      var startXYZ;
      var endXYZ;
      var startABC;
      if (typeof previousABC !== "undefined") {
        startABC = new Vector(previousABC.x, previousABC.y, previousABC.z);
      } else {
        startABC = getCurrentDirection();
      }
      var endABC = new Vector(_a, _b, _c);
        
      if (!getOptimizedMode()) { // calculate XYZ from tool tip
        startTool = getCurrentPosition();
        endTool = new Vector(_x, _y, _z);
        startXYZ = startTool;
        endXYZ = endTool;
    
        // adjust points for tables
        if (!machineConfiguration.getTableABC(startABC).isZero() || !machineConfiguration.getTableABC(endABC).isZero()) {
          startXYZ = machineConfiguration.getOrientation(machineConfiguration.getTableABC(startABC)).getTransposed().multiply(startXYZ);
          endXYZ = machineConfiguration.getOrientation(machineConfiguration.getTableABC(endABC)).getTransposed().multiply(endXYZ);
        }
    
        // adjust points for heads
        if (machineConfiguration.getAxisU().isEnabled() && machineConfiguration.getAxisU().isHead()) {
          if (typeof getOptimizedHeads === "function") { // use post processor function to adjust heads
            startXYZ = getOptimizedHeads(startXYZ.x, startXYZ.y, startXYZ.z, startABC.x, startABC.y, startABC.z);
            endXYZ = getOptimizedHeads(endXYZ.x, endXYZ.y, endXYZ.z, endABC.x, endABC.y, endABC.z);
          } else { // guess at head adjustments
            var startDisplacement = machineConfiguration.getDirection(startABC);
            startDisplacement.multiply(headOffset);
            var endDisplacement = machineConfiguration.getDirection(endABC);
            endDisplacement.multiply(headOffset);
            startXYZ = Vector.sum(startTool, startDisplacement);
            endXYZ = Vector.sum(endTool, endDisplacement);
          }
        }
      } else { // calculate tool tip from XYZ, heads are always programmed in TCP mode, so not handled here
        startXYZ = getCurrentPosition();
        endXYZ = new Vector(_x, _y, _z);
        startTool = machineConfiguration.getOrientation(machineConfiguration.getTableABC(startABC)).multiply(startXYZ);
        endTool = machineConfiguration.getOrientation(machineConfiguration.getTableABC(endABC)).multiply(endXYZ);
      }
    
      // calculate axes movements
      moveLength.xyz = Vector.diff(endXYZ, startXYZ).abs;
      moveLength.xyzLength = moveLength.xyz.length;
      moveLength.abc = Vector.diff(endABC, startABC).abs;
      for (var i = 0; i < 3; ++i) {
        if (moveLength.abc.getCoordinate(i) > Math.PI) {
          moveLength.abc.setCoordinate(i, 2 * Math.PI - moveLength.abc.getCoordinate(i));
        }
      }
      moveLength.abcLength = moveLength.abc.length;
    
      // calculate radii
      moveLength.radius = getRotaryRadii(startTool, endTool, startABC, endABC);
      
      // calculate the radial portion of the tool tip movement
      var radialLength = Math.sqrt(
        Math.pow(getRadialDistance(moveLength.radius.x, startABC.x, endABC.x), 2.0) +
        Math.pow(getRadialDistance(moveLength.radius.y, startABC.y, endABC.y), 2.0) +
        Math.pow(getRadialDistance(moveLength.radius.z, startABC.z, endABC.z), 2.0)
      );
      
      // calculate the tool tip move length
      // tool tip distance is the move distance based on a combination of linear and rotary axes movement
      moveLength.tool = moveLength.xyzLength + radialLength;
    
      // debug
      if (false) {
        writeComment("DEBUG - tool   = " + moveLength.tool);
        writeComment("DEBUG - xyz    = " + moveLength.xyz);
        var temp = Vector.product(moveLength.abc, 180/Math.PI);
        writeComment("DEBUG - abc    = " + temp);
        writeComment("DEBUG - radius = " + moveLength.radius);
      }
      return moveLength;
  }
  // End of multi-axis feedrate logic
  

function onCircular(clockwise, cx, cy, cz, x, y, z, feed) {
  if (pendingRadiusCompensation >= 0) {
    error(localize("Radius compensation cannot be activated/deactivated for a circular move."));
    return;
  }

  var start = getCurrentPosition();

  if (isFullCircle()) {
    if (properties.useRadius || isHelical()) { // radius mode does not support full arcs
      linearize(tolerance);
      return;
    }
    switch (getCircularPlane()) {
    case PLANE_XY:
      writeBlock(gPlaneModal.format(17), gMotionModal.format(clockwise ? 2 : 3), iOutput.format(cx - start.x, 0), jOutput.format(cy - start.y, 0), feedOutput.format(feed));
      break;
    case PLANE_ZX:
      writeBlock(gPlaneModal.format(18), gMotionModal.format(clockwise ? 2 : 3), iOutput.format(cx - start.x, 0), kOutput.format(cz - start.z, 0), feedOutput.format(feed));
      break;
    case PLANE_YZ:
      writeBlock(gPlaneModal.format(19), gMotionModal.format(clockwise ? 2 : 3), jOutput.format(cy - start.y, 0), kOutput.format(cz - start.z, 0), feedOutput.format(feed));
      break;
    default:
      linearize(tolerance);
    }
  } else if (!properties.useRadius) {
    switch (getCircularPlane()) {
    case PLANE_XY:
      writeBlock(gPlaneModal.format(17), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), iOutput.format(cx - start.x, 0), jOutput.format(cy - start.y, 0), feedOutput.format(feed));
      break;
    case PLANE_ZX:
      writeBlock(gPlaneModal.format(18), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), iOutput.format(cx - start.x, 0), kOutput.format(cz - start.z, 0), feedOutput.format(feed));
      break;
    case PLANE_YZ:
      writeBlock(gPlaneModal.format(19), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), jOutput.format(cy - start.y, 0), kOutput.format(cz - start.z, 0), feedOutput.format(feed));
      break;
    default:
      linearize(tolerance);
    }
  } else { // use radius mode
    var r = getCircularRadius();
    if (toDeg(getCircularSweep()) > (180 + 1e-9)) {
      r = -r; // allow up to <360 deg arcs
    }
    switch (getCircularPlane()) {
    case PLANE_XY:
      writeBlock(gPlaneModal.format(17), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), "R" + rFormat.format(r), feedOutput.format(feed));
      break;
    case PLANE_ZX:
      writeBlock(gPlaneModal.format(18), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), "R" + rFormat.format(r), feedOutput.format(feed));
      break;
    case PLANE_YZ:
      writeBlock(gPlaneModal.format(19), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), "R" + rFormat.format(r), feedOutput.format(feed));
      break;
    default:
      linearize(tolerance);
    }
  }
}

var currentCoolantMode = COOLANT_OFF;

function setCoolant(coolant) {
  if (coolant == currentCoolantMode) {
    return; // coolant is already active
  }

  if (coolant == COOLANT_OFF) {
    if (currentCoolantMode == COOLANT_THROUGH_TOOL) {
      m = 89;
    } else if (currentCoolantMode == COOLANT_AIR) {
      m = 84;
    } else {
      m = 9;
    }
    writeBlock(mFormat.format(m));
    currentCoolantMode = COOLANT_OFF;
    return;
  }

  if (currentCoolantMode != COOLANT_OFF) {
    setCoolant(COOLANT_OFF);
  }

  var m = undefined;
  switch (coolant) {
  //case COOLANT_OFF:
  case COOLANT_FLOOD:
    m = 8;
    break;
  case COOLANT_MIST:
    m = 7;
    break;
  default:
    warning(localize("Coolant not supported."));
    if (currentCoolantMode == COOLANT_OFF) {
      return;
    }
    coolant = COOLANT_OFF;
    m = 9;
  }

  writeBlock(mFormat.format(m));
  currentCoolantMode = coolant;
}

var mapCommand = {
  COMMAND_STOP:0,
  COMMAND_OPTIONAL_STOP:1,
  COMMAND_END:2,
  COMMAND_SPINDLE_CLOCKWISE:3,
  COMMAND_SPINDLE_COUNTERCLOCKWISE:4,
  COMMAND_STOP_SPINDLE:5,
  COMMAND_ORIENTATE_SPINDLE:19,
  COMMAND_LOAD_TOOL:6
};

function onCommand(command) {
  switch (command) {
  case COMMAND_STOP:
    writeBlock(mFormat.format(0));
    forceSpindleSpeed = true;
    return;
  case COMMAND_COOLANT_ON:
    setCoolant(COOLANT_FLOOD);
    return;
  case COMMAND_COOLANT_OFF:
    setCoolant(COOLANT_OFF);
    return;
  case COMMAND_START_SPINDLE:
    onCommand(tool.clockwise ? COMMAND_SPINDLE_CLOCKWISE : COMMAND_SPINDLE_COUNTERCLOCKWISE);
    return;
  case COMMAND_LOCK_MULTI_AXIS:
    writeBlock(mFormat.format(10));
    return;
  case COMMAND_UNLOCK_MULTI_AXIS:
    writeBlock(mFormat.format(11));
    return;
  case COMMAND_BREAK_CONTROL:
    return;
  case COMMAND_TOOL_MEASURE:
    return;
  }
  
  var stringId = getCommandStringId(command);
  var mcode = mapCommand[stringId];
  if (mcode != undefined) {
    writeBlock(mFormat.format(mcode));
  } else {
    onUnsupportedCommand(command);
  }
}

function onSectionEnd() {
  writeBlock(gPlaneModal.format(17));
  forceAny();
}

function writeRetract() {
  var words = []; // store all retracted axes in an array
  var _xyzMoved = new Array(false, false, false);
  //var _useG28 = false;
 
  if (properties.safeRetract == "clearanceHeight") {
    if (!is3D()) {
      error(localize("Retract option 'Clearance Height' is not supported for multi-axis machining."));
    }
    return; // G28 and G53 output is not desired
  }

  if (arguments.length == 0) {
    error(localize("No axis specified for writeRetract()."));
    return;
  }

  for (i in arguments) {
    _xyzMoved[arguments[i]] = true;
  }
  if ((_xyzMoved[0] || _xyzMoved[1]) && !retracted) { // retract Z first before moving to X/Y home
    error(localize("Move in X/Y Axis is not possible without retracting Z"));
    return;
  }

  // special conditions
    /*if (_xyzMoved[2]) { // Z doesn't use G53
  //  _useG28 = true;
  }*/

  // define home positions
  var _xHome;
  var _yHome;
  var _zHome;
  if (properties.safeRetract == "G28" || properties.safeRetract == "G30" || properties.safeRetract == "G30P3" || properties.safeRetract == "G30P4") {
    _xHome = toPreciseUnit(0, MM);
    _yHome = toPreciseUnit(0, MM);
    _zHome = toPreciseUnit(0, MM);
  } else {
    _xHome = machineConfiguration.hasHomePositionX() ? machineConfiguration.getHomePositionX() : toPreciseUnit(0, MM);
    _yHome = machineConfiguration.hasHomePositionY() ? machineConfiguration.getHomePositionY() : toPreciseUnit(0, MM);
    _zHome = machineConfiguration.getRetractPlane() != 0 ? machineConfiguration.getRetractPlane() : toPreciseUnit(0, MM);
  }
  for (var i = 0; i < arguments.length; ++i) {
    switch (arguments[i]) {
    case X:
      words.push("X" + xyzFormat.format(_xHome));
      xOutput.reset();
      break;
    case Y:
      words.push("Y" + xyzFormat.format(_yHome));
      yOutput.reset();
      break;
    case Z:
      words.push("Z" + xyzFormat.format(_zHome));
      zOutput.reset();
      retracted = true;
      break;
    default:
      error(localize("Bad axis specified for writeRetract()."));
      return;
    }
  }
  if (words.length > 0) {
    switch (properties.safeRetract) {
        case "G28":
            gAbsIncModal.reset();
            writeBlock(gFormat.format(28), gAbsIncModal.format(91), words);
            writeBlock(gAbsIncModal.format(90));
            break;
        case "G30":
            gAbsIncModal.reset();
            writeBlock(gFormat.format(30), gAbsIncModal.format(91), words);
            writeBlock(gAbsIncModal.format(90));
            break;    
        case "G30P3":
            gAbsIncModal.reset();
            writeBlock(gFormat.format(30), "P3 " + gAbsIncModal.format(91), words);
            writeBlock(gAbsIncModal.format(90));
            break;  
        case "G30P4":
            gAbsIncModal.reset();
            writeBlock(gFormat.format(30), "P4 " + gAbsIncModal.format(91), words);
            writeBlock(gAbsIncModal.format(90));
            break;     
        default:
            gAbsIncModal.reset();
            writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), words);
            break;    
    }  
    /*if (_useG28) {
      gAbsIncModal.reset();
      writeBlock(gFormat.format(28), gAbsIncModal.format(91), words);
      writeBlock(gAbsIncModal.format(90));
    } else {
      gAbsIncModal.reset();
      writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), words);
    }*/
  }
}

function onClose() {
  onCommand(COMMAND_COOLANT_OFF);
  optionalSection = false;
 
  //Added selectable Properties to position the Z-Axis at the end of the Job -swissi
  switch (properties.homeZatEnd) {
    case "G28":
      writeBlock(gFormat.format(28), gAbsIncModal.format(91), "Z" + xyzFormat.format(0)); // retract
      zOutput.reset();
      break;
    case "G30":
      writeBlock(gFormat.format(30), gAbsIncModal.format(91), "Z" + xyzFormat.format(0)); // retract
      zOutput.reset();
      break;
    case "G30P3":
      writeBlock(gFormat.format(30), "P3 " + gAbsIncModal.format(91), "Z" + xyzFormat.format(0)); // retract
      zOutput.reset();
      break;	
    case "G30P4":
      writeBlock(gFormat.format(30), "P4 " + gAbsIncModal.format(91), "Z" + xyzFormat.format(0)); // retract
      zOutput.reset();
      break;	
    case "none":
      zOutput.reset();
      break;	
    default:  // Just for safety. Should not be triggered under normal circumstances 
      writeBlock(gFormat.format(28), gAbsIncModal.format(91), "Z" + xyzFormat.format(0)); // retract
      zOutput.reset();
      break;		
    }
    //Added selectable Properties to position the X & Y-Axis at the end of the Job -swissi
    switch (properties.homeXYatEnd) {
        case "G28":
          if (!machineConfiguration.hasHomePositionX() && !machineConfiguration.hasHomePositionY()) {
            writeBlock(gFormat.format(28), gAbsIncModal.format(91), "X" + xyzFormat.format(0), "Y" + xyzFormat.format(0)); // return to home
          } else {
            var homeX;
            if (machineConfiguration.hasHomePositionX()) {
              homeX = "X" + xyzFormat.format(machineConfiguration.getHomePositionX());
            }
            var homeY;
            if (machineConfiguration.hasHomePositionY()) {
              homeY = "Y" + xyzFormat.format(machineConfiguration.getHomePositionY());
            }
            writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), homeX, homeY);
          }; 
          break;
        case "G30":
          if (!machineConfiguration.hasHomePositionX() && !machineConfiguration.hasHomePositionY()) {
            writeBlock(gFormat.format(30), gAbsIncModal.format(91), "X" + xyzFormat.format(0), "Y" + xyzFormat.format(0)); // return to home
          } else {
            var homeX;
            if (machineConfiguration.hasHomePositionX()) {
              homeX = "X" + xyzFormat.format(machineConfiguration.getHomePositionX());
            }
            var homeY;
            if (machineConfiguration.hasHomePositionY()) {
              homeY = "Y" + xyzFormat.format(machineConfiguration.getHomePositionY());
            }
            writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), homeX, homeY);
          }; 
          break;
        case "G30P3":
          if (!machineConfiguration.hasHomePositionX() && !machineConfiguration.hasHomePositionY()) {
            writeBlock(gFormat.format(30), "P3 " + gAbsIncModal.format(91), "X" + xyzFormat.format(0), "Y" + xyzFormat.format(0)); // return to home
          } else {
            var homeX;
            if (machineConfiguration.hasHomePositionX()) {
              homeX = "X" + xyzFormat.format(machineConfiguration.getHomePositionX());
            }
            var homeY;
            if (machineConfiguration.hasHomePositionY()) {
              homeY = "Y" + xyzFormat.format(machineConfiguration.getHomePositionY());
            }
            writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), homeX, homeY);
          }; 
          break;	
        case "G30P4":
          if (!machineConfiguration.hasHomePositionX() && !machineConfiguration.hasHomePositionY()) {
            writeBlock(gFormat.format(30), "P4 " + gAbsIncModal.format(91), "X" + xyzFormat.format(0), "Y" + xyzFormat.format(0)); // return to home
          } else {
            var homeX;
            if (machineConfiguration.hasHomePositionX()) {
              homeX = "X" + xyzFormat.format(machineConfiguration.getHomePositionX());
            }
            var homeY;
            if (machineConfiguration.hasHomePositionY()) {
              homeY = "Y" + xyzFormat.format(machineConfiguration.getHomePositionY());
            }
            writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), homeX, homeY);
          }; 
          break;		
          case "G53":
            if (!machineConfiguration.hasHomePositionX() && !machineConfiguration.hasHomePositionY()) {
              writeBlock(gFormat.format(53), "X" + xyzFormat.format(0), "Y" + xyzFormat.format(0)); // return to home
            } else {
              var homeX;
              if (machineConfiguration.hasHomePositionX()) {
                homeX = "X" + xyzFormat.format(machineConfiguration.getHomePositionX());
              }
              var homeY;
              if (machineConfiguration.hasHomePositionY()) {
                homeY = "Y" + xyzFormat.format(machineConfiguration.getHomePositionY());
              }
              writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), homeX, homeY);
            }; 
            break;		

            case "none": 
            break;			
    }
  //06/19/2020 -swissi
  if (properties.resetRotary) {
    if (machineConfiguration.isMachineCoordinate(0)) {
      writeBlock(mFormat.format(26) + "/A");
      writeBlock(gFormat.format(92) + " A0");
    }
    if (machineConfiguration.isMachineCoordinate(1)) {
      writeBlock(mFormat.format(26) + "/B");
      writeBlock(gFormat.format(92) + " B0");
    }
    if (machineConfiguration.isMachineCoordinate(2)) {
      writeBlock(mFormat.format(26) + "/C");
      writeBlock(gFormat.format(92) + " C0");
    }
  }  else {
    setWorkPlane(new Vector(0, 0, 0)); // reset working plane
  }  
  onImpliedCommand(COMMAND_END);
  onImpliedCommand(COMMAND_STOP_SPINDLE);
  writeBlock(mFormat.format(30)); // stop program, spindle stop, coolant off

  //Add a user defined command to the end of the job file -swissi
  //If the command does not start with a gG or mM and the 2nd character is not a number, the command will be added as a comment
  if (properties.addCommandEnd != "") { 
    var addCom1 = properties.addCommandEnd.charAt(0);
    var addCom2 = properties.addCommandEnd.charAt(1);   
    if ((addCom1.toUpperCase() == "G" || addCom1.toUpperCase() == "M") && !isNaN(addCom2)) { 
      if (properties.showSequenceNumbers) {
        writeWords2("N" + sequenceNumber, properties.addCommandEnd);
        sequenceNumber += properties.sequenceNumberIncrement;
      } else {
        writeln(properties.addCommandEnd);
      }  
    } else {
      writeComment(properties.addCommandEnd);
    }    
  } 

  // Clear all CNC12 User-String-Variables when used -swissi
  if (properties.writeCNC12Vars) {

    writeComment("Resetting all used CNC12 User-String-Variables");
    //*writeComment("disabled until CNC12 allows to reset User-String-Variables");
    
    if (writeToolLineVar != "") {
      writeBlock(writeToolLineVar + " = \"\"");
    }
    if (designNameVar != "") {
      writeBlock(designNameVar + " = \"\"");
    }
    if (programNameVar != "") {
      writeBlock(programNameVar + " = \"\"");
    }
    if (programCommentVar != "") {
      writeBlock(programCommentVar + " = \"\"");
    }
    if (setupNameVar != "") {
      writeBlock(setupNameVar + " = \"\"");
    }
    if (setupNotesVar != "") {
      writeBlock(setupNotesVar + " = \"\"");
    }
    if (toolPathNameVar != "") {
      writeBlock(toolPathNameVar + " = \"\"");
    }
    if (toolPathNotesVar != "") {
      writeBlock(toolPathNotesVar + " = \"\"");
    }
    if (toolTypeVar != "") {
      writeBlock(toolTypeVar + " = \"\"");
    }
    if (toolUnitVar != "") {
      writeBlock(toolUnitVar + " = \"\"");
    }
    if (toolDiameterVar != "") {
      writeBlock(toolDiameterVar + " = \"\"");
    }
    if (toolNrOfFlutesVar != "") {
      writeBlock(toolNrOfFlutesVar + " = \"\"");
    }
    if (toolCoolantVar != "") {
      writeBlock(toolCoolantVar + " = \"\"");
    }
    if (toolDescrVar != "") {
      writeBlock(toolDescrVar + " = \"\"");
    }
    if (toolCommentVar != "") {
      writeBlock(toolCommentVar + " = \"\"");
    }
    if (spindleSpeedVar != "") {
      writeBlock(spindleSpeedVar + " = \"\"");
    }
    if (spindleDirVar != "") {
      writeBlock(spindleDirVar + " = \"\"");
    }
    if (optimalLoadVar != "") {
      writeBlock(optimalLoadVar + " = \"\"");
    }
    if (maxStepdownVar != "") {
      writeBlock(maxStepdownVar + " = \"\"");
    }
    if (feedCuttingVar != "") {
      writeBlock(feedCuttingVar + " = \"\"");
    }
    if (feedPerToothVar != "") {
      writeBlock(feedPerToothVar + " = \"\"");
    }
    if (feedRampVar != "") {
      writeBlock(feedRampVar + " = \"\"");
    }
    if (feedPlungeVar != "") {
      writeBlock(feedPlungeVar + " = \"\"");
    }
    if (feedPerRevVar != "") {
      writeBlock(feedPerRevVar + " = \"\"");
    }
    if (setupOriginVar != "") {
      writeBlock(setupOriginVar + " = \"\"");
    }
    if (zClearanceVar != "") {
      writeBlock(zClearanceVar + " = \"\"");
    }
    if (currentWCSVar != "") {
      writeBlock(currentWCSVar + " = \"\"");
    }
    //*/
   } 

  writeln("%");
}