% Get the full path to the gui folder relative to the current script
guiFolderPath = fullfile(fileparts(mfilename('fullpath')), 'gui');

% Add the gui folder to the MATLAB path
addpath(guiFolderPath);

% Create the GUI and assign it to the variable 'gui'
gui = callGUI();

% Enter a while loop until the GUI window is closed
while ~gui.isGUIWindowClosed()
    % Get the flag values from the GUI
    flags = gui.getFlags();

    % Iterate through all the groups and print the flag values
    for groupIndex = 1:gui.getNumGroups()
        % Get the name of the current group
        groupName = gui.getGroupName(groupIndex);
        
        % Get the flag values for the current group
        flagValues = gui.getFlagsPerGroup(groupName);
        
        % Display the flag values for the current group
        disp(['Flags for group ' groupName ':']);
        disp(flagValues);
    end
    
    % Pause for a short duration to prevent excessive looping
    pause(0.1);
end

% The provided code interacts with the GUI created using the BinaryFlagsGUI
% class. It continuously runs in a while loop until the GUI window is 
% closed.
% 
% The main functionality of the code is as follows:
% 
% 1. Create the GUI: The callGUI() function is called to create an instance 
% of the BinaryFlagsGUI class, and the GUI object is assigned to the 
% variable gui.
% 
% 2. Loop until GUI window is closed: The code enters a while loop that 
% continues until the GUI window is closed. This allows the code to 
% continuously interact with the GUI and retrieve the flag values.
% 
% 3. Retrieve and display flag values: Within the loop, the code retrieves 
% the flag values for each flag group by calling gui.getFlags(). It then 
% iterates through all the groups using a for loop.
% 
% 4. Print flag values: For each group, the code retrieves the group's name 
% using gui.getGroupName(groupIndex) and the flag values for that group 
% using gui.getFlagsPerGroup(groupName). It then displays the group name 
% and flag values using the disp function.
% 
% 5. Pause for a short duration: To prevent excessive looping, the code 
% pauses for a short duration using pause(0.1). This allows time for the 
% GUI to update and respond to user interactions.
% 
% The code provides a basic example of how to use the BinaryFlagsGUI class 
% and interact with the GUI to retrieve and display flag values dynamically.
