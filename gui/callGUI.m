function gui = callGUI()
    % CALLGUI creates and returns an instance of the BinaryFlagsGUI class.

    % Define the names of the flag groups
    namesOfGroups = {'Hand approaching', ...
                    'Hand reaching out', ...
                    'Grip type', ...
                    'Pointing [Robot workspace]', ...
                    'Pointing [Shared workspace]', ...
                    'Pointing [Human workspace]', ...
                    'Position of objects [Robot workspace]', ...
                    'Position of objects [Shared workspace]', ...
                    'Position of objects [Human workspace]', ...
                    'Stage of construction' ...
                    };

    % Define the number of flag groups
    numGroups = numel(namesOfGroups);

    % Define the names of flags per group
    namesOfFlagsPerGroup = {'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', 'Other', ... % Hand approaching
                            'Toggle', ... % Hand reaching out
                            'A', 'B', 'C', ... % Grip type
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', 'Other', ... % Pointing [Robot workspace]
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', 'Other', ... % Pointing [Shared workspace]
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', 'Other', ... % Pointing [Human workspace]
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', ... % Position of objects [Robot workspace]
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', ... % Position of objects [Shared workspace]
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2', ... % Position of objects [Human workspace]
                            'Part 1', 'Part 2', 'Bracket 1', 'Bracket 2' ... % Stage of construction
                            }; 

    % Define the number of flags per group
    flagsPerGroup = [5 1 3 5 5 5 4 4 4 4];

    % Create an instance of the BinaryFlagsGUI class
    gui = BinaryFlagsGUI(numGroups, flagsPerGroup, namesOfGroups, namesOfFlagsPerGroup);
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
