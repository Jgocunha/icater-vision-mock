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
