# icater-vision-mock

A GUI (in MATLAB) to mock the inputs given by the vision system, for the I-CATER project.

![The GUI](https://imgur.com/a/d0NuOUU.png)


## File overview
```
├── main.m
├── gui/
│   ├── BinaryFlagsGUI.m
│   └── callGUI.m
└── README.md
```

- `BinaryFlagsGUI.m`: This file contains the definition of the `BinaryFlagsGUI` class. It creates a graphical user interface (GUI) with multiple flag groups and allows users to toggle the flags within each group.
- `callGUI.m`: This file is a function that creates an instance of the `BinaryFlagsGUI` class and returns it. It sets up the necessary parameters, such as the number of flag groups, names of groups, and names of flags per group. This function is responsible for initializing and configuring the GUI.
- `main.m`: this file contains the main script that utilizes the `BinaryFlagsGUI` class. It creates an instance of the GUI by calling `callGUI()` and enters a while loop that continues until the GUI window is closed. Within the loop, it retrieves the flag values from the GUI and prints them for each flag group. **This script demonstrates how to interact with the GUI and retrieve the flag values dynamically.**

![Output of the main.m script](https://imgur.com/a/FeqnhM4.png)

---

# BinaryFlagsGUI

The `BinaryFlagsGUI` class is a MATLAB class that provides a graphical user interface (GUI) for managing binary flags organized into groups. It allows toggling the state of each flag and provides visual feedback using colored semaphores.

## Class Structure

The `BinaryFlagsGUI` class has the following properties:

- `numGroups`: The number of flag groups.
- `flagsPerGroup`: An array specifying the number of flags in each group.
- `flags`: A cell array that stores the state of each flag.
- `fig`: The handle to the figure window of the GUI.
- `semaphoreAxes`: A cell array that stores the handles to the semaphore axes.
- `namesOfGroups`: A cell array containing the names of the flag groups.
- `namesOfFlagsPerGroup`: A cell array containing the names of the flags within each group.

## Constructor

The `BinaryFlagsGUI` class is instantiated using the following constructor:

```matlab
gui = BinaryFlagsGUI(numGroups, flagsPerGroup, namesOfGroups, namesOfFlagsPerGroup)
```

- `numGroups`: The number of flag groups.
- `flagsPerGroup`: An array specifying the number of flags in each group.
namesOfGroups: A cell array containing the names of the flag groups.
- `namesOfFlagsPerGroup`: A cell array containing the names of the flags within each group.

## GUI creation

The `createGUI` method creates the GUI window, flag panels, semaphore axes, and toggle buttons for each flag group.

### Flag toggling

The state of each flag can be toggled by clicking the corresponding toggle button in the GUI. The `toggleFlag` method handles the flag toggling logic and updates the flag state accordingly.

### Semaphore visualization

Each flag is represented by a semaphore, which visually indicates its state using colors. Green indicates an active (true) flag, while red indicates an inactive (false) flag. The `drawSemaphore` method updates the color of the semaphore based on the flag state.

## Getting flag values

The `getFlags` method returns the current state of all flags as a cell array.

```matlab
flags = gui.getFlags();
```

The `getFlagsPerGroup` method allows retrieving the flags associated with a specific group by providing the group name as an input.

```matlab
groupFlags = gui.getFlagsPerGroup(groupName);
```

## Checking GUI window status

The `isGUIWindowClosed` method checks if the GUI window is closed.

```matlab
isClosed = gui.isGUIWindowClosed();
```

## Getting group and flag information

The `getNumGroups` method returns the total number of flag groups.

```matlab
numOfGroups = gui.getNumGroups();
```

The `getGroupName` method returns the name of a flag group based on its index.

```matlab
groupName = gui.getGroupName(groupIndex);
```

## Example usage

Here's an example that demonstrates how to use the `BinaryFlagsGUI` class:

```matlab
numGroups = 2;
flagsPerGroup = [3, 2];
namesOfGroups = {'Group 1', 'Group 2'};
namesOfFlagsPerGroup = {'Flag A', 'Flag B', 'Flag C', 'Flag D', 'Flag E'};
gui = BinaryFlagsGUI(numGroups, flagsPerGroup, namesOfGroups, namesOfFlagsPerGroup);

while ~gui.isGUIWindowClosed()
    flags = gui.getFlags();
    disp(flags);
    pause(0.1);
}
```

This example creates a GUI with two flag groups (`Group 1` and `Group 2`) containing three and two flags, respectively. It continuously retrieves and displays the state of all flags until the GUI window is closed.

Feel free to modify and adapt the code according to your specific needs!