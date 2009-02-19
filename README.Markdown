# ChoosyFluid

Automatically generates Choosy behaviour rules for Fluid instances.

* Detects all Fluid instances in your user, system and network level applications directories
* Filters out Fluid instances that are already the target of a Choosy rule
* Gives you the option of which Fluid instances to create Choosy rules for
* Creates the rules and restarts the Choosy helper application to make sure they are loaded

**Note:** While this application will correctly create the relevant Choosy behaviours, using them to launch Fluid instances currently results in the Fluid instance crashing shortly after it has been launched.
