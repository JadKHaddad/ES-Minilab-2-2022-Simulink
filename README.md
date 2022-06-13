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
sim('model')
```