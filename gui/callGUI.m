function gui = callGUI()
    % CALLGUI creates and returns an instance of the BinaryFlagsGUI class.

    % Define the names of the flag groups
    namesOfGroups = { ...
                    'Pointing [Robot workspace]', ...
                    'Position of objects [Robot workspace]', ...
            	    'Hand approaching', ...
                    'Pointing [Shared workspace]', ...
                    'Position of objects [Shared workspace]', ...
                    'Hand reaching out', ...
                    'Pointing [Human workspace]', ...
                    'Position of objects [Human workspace]', ...
                    'Grip type', ...
                    'Stage of construction' ...
                    };

    % Define the number of flag groups
    numGroups = numel(namesOfGroups);

    % Define the names of flags per group
    namesOfFlagsPerGroup = { ...
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', 'Other', ... % Pointing [Robot workspace] 5
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', ... % Position of objects [Robot workspace] 4
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', 'Other', ... % Hand approaching 5
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', 'Other', ... % Pointing [Shared workspace] 5
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', ... % Position of objects [Shared workspace] 4
                            'Toggle', ... % Hand reaching out 1
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', 'Other', ... % Pointing [Human workspace] 5
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', ... % Position of objects [Human workspace] 4
                            'A', 'B', 'C', ... % Grip type 3
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2' ... % Stage of construction 4
                            }; 

    % Define the number of flags per group
    flagsPerGroup = [5 4 5 5 4 1 5 4 3 4];

    % Define the font sizes
    titleFontSize = 14;
    labelFontSize = 10;

    % Define group colors
    lightBlue = [135, 206, 250] / 255;
    lightRed = [1, 0.5, 0.5];
    white = [1, 1, 1];
    groupColors = [ ...
                   lightBlue; ...
                   lightRed; ...
                   white; ...
                   lightBlue; ...
                   lightRed; ...
                   white; ...
                   lightBlue; ...
                   lightRed; ...
                   white; ...
                   white; ...
                   ]; % Group colors (RGB values)

    % Create an instance of the BinaryFlagsGUI class
    gui = BinaryFlagsGUI(numGroups, flagsPerGroup, namesOfGroups, namesOfFlagsPerGroup, titleFontSize, labelFontSize, groupColors);
end

% 
% This code is a function that creates a graphical user interface (GUI) 
% using the BinaryFlagsGUI class. 
% The GUI consists of flag groups, each with a set of flags that can be 
% toggled on or off. 
% The flag groups and their corresponding flags are defined by the 
% namesOfGroups and namesOfFlagsPerGroup variables, respectively. 
% The number of flags per group is specified by the flagsPerGroup variable.
% 
% The function initializes an instance of the BinaryFlagsGUI class with the 
% provided parameters and returns it as the output. 
% The created GUI can be interacted with by the user to toggle flags within 
% each group.
% 
% Please note that the BinaryFlagsGUI class should be defined separately and 
% available in the MATLAB path for this code to work correctly.
% 
% This function serves as an entry point to create and access the GUI, 
% providing a convenient way to generate an instance of the BinaryFlagsGUI 
% class with the predefined flag groups and flags.
