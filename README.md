# ES Minilab 2 - Simulink - 2022
## Maps annotations
* **[0]** unknown
* **[1]** discovered
* **[2]** to be discovered
* **[3]** dicovered, a drone is in location
* **[99]** statically blocked
* **[-1]** free, can be discovered 
## Usage
Load the workspace
```matlab
load('workspace.mat')
```
Define the desired map
```matlab
map = realWorldMapA
% map = realWorldMapB
% map = realWorldMapC
```
Define working drones count, max 10
```matlab
droneCount = 3
```
Run the simulation
```matlab
sim('model.slx')
```
## Output
See ```output``` for scenarios outputs.<br>
* **scenario_1_3_drones:** success
* **scenario_1_5_drones:** success
* **scenario_1_10_drones:** success
<br><br>
* **scenario_2_3_drones:** battery dies on the way back to start location
* **scenario_2_5_drones:** success
* **scenario_2_10_drones:** success
<br><br>
* **scenario_3_3_drones:** battery dies
* **scenario_3_5_drones:** battery dies
* **scenario_3_10_drones:** battery dies
