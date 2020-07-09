# Fusion 360 Probing Cycle: Probe Start

## Description
The Probe Start Command has no parameters. This command is being called before each probing cycle to make sure the probe and necessary parameters are initialized.
What this command does is calling the command file probe_initialize.cnc from the c:\cncm\probing folder.


## Probe Start Command

```javascript
G65 P9832
```

See [Probing Customization](ProbeCustomization.md) for all the details about the configuration parameters in probe_initialize.cnc.



[*Use Browser Back Button to Return*]