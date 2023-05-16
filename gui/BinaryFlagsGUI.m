classdef BinaryFlagsGUI < handle
    properties (Access = private)
        numGroups
        flagsPerGroup
        flags
        fig
        semaphoreAxes
        namesOfGroups
        namesOfFlagsPerGroup
    end
    
    methods
        % Constructor
        function obj = BinaryFlagsGUI(numGroups, flagsPerGroup, namesOfGroups, namesOfFlagsPerGroup)
            % Constructor initializes the properties of the class
            obj.numGroups = numGroups;
            obj.flagsPerGroup = flagsPerGroup;
            obj.namesOfGroups = namesOfGroups;
            obj.namesOfFlagsPerGroup = namesOfFlagsPerGroup;
            obj.flags = cell(1, numGroups);
            for i = 1:numGroups
                obj.flags{i} = false(1, flagsPerGroup(i));
            end
            obj.createGUI();
        end

        % Method to create the GUI
        function createGUI(obj)
            % Create a figure window
            sizeX = 1000;
            sizeY = 500;
            obj.fig = figure('Name', 'Binary Flags GUI', 'NumberTitle', 'off', 'Position', [100, 100, sizeX, sizeY]);

            % Calculate the number of rows and columns in the grid
            numRows = ceil(sqrt(obj.numGroups));
            numCols = ceil(obj.numGroups / numRows);

            % Calculate the panel width and height based on the grid layout
            panelWidth = floor(sizeX / numCols);
            panelHeight = floor(sizeY / numRows);

            % Create panels for each flag group
            groupCounter = 1;
            for row = 1:numRows
                for col = 1:numCols
                    if groupCounter > obj.numGroups
                        break;
                    end
                    panelX = (col - 1) * panelWidth;
                    panelY = sizeY - (row * panelHeight);
                    panel = uipanel('Parent', obj.fig, 'Title', obj.namesOfGroups{groupCounter}, 'Units', 'pixels', 'Position', [panelX, panelY, panelWidth, panelHeight]);

                    % Create semaphore axes for each flag in the group
                    semWidth = 30;
                    semHeight = 30;
                    semSpacing = (panelWidth - (obj.flagsPerGroup(groupCounter) * semWidth)) / (obj.flagsPerGroup(groupCounter) + 1);  % Adjust the spacing between semaphores
                    semStartX = semSpacing;
                    semStartY = (panelHeight - semHeight) / 2;  % Adjust the starting Y position for semaphores
                    for flag = 1:obj.flagsPerGroup(groupCounter)
                        semX = semStartX + (semWidth + semSpacing) * (flag - 1);
                        semY = semStartY;  % Update the Y position for each semaphore
                        obj.semaphoreAxes{groupCounter, flag} = axes('Parent', panel, 'Units', 'pixels', 'Position', [semX, semY, semWidth, semHeight], 'Visible', 'off');
                        obj.drawSemaphore(groupCounter, flag);
                    end

                    % Create toggle buttons for each flag in the group
                    btnWidth = 50;
                    btnHeight = 30;
                    btnSpacing = 10;
                    btnStartX = (panelWidth - (btnWidth * obj.flagsPerGroup(groupCounter) + btnSpacing * (obj.flagsPerGroup(groupCounter) - 1))) / 2;
                    btnStartY = 0;  % Adjust the starting Y position for buttons
                    for flag = 1:obj.flagsPerGroup(groupCounter)
                        btnX = btnStartX + (btnWidth + btnSpacing) * (flag - 1);
                        btnY = btnStartY;  % Update the Y position for each button
                        btnLabel = obj.namesOfFlagsPerGroup{sum(obj.flagsPerGroup(1:groupCounter-1)) + flag};
                        uicontrol('Parent', panel, 'Style', 'togglebutton', 'String', btnLabel, 'Position', [btnX, btnY, btnWidth, btnHeight], 'Callback', {@obj.toggleFlag, groupCounter, flag});
                    end

                    groupCounter = groupCounter + 1;
                end
            end
        end
        
        % Callback function for flag toggling
        function toggleFlag(obj, ~, ~, group, flag)
            obj.flags{group}(flag) = ~obj.flags{group}(flag);
            obj.drawSemaphore(group, flag);
        end

        % Method to draw the semaphore based on flag value
        function drawSemaphore(obj, group, flag)
            flagValue = obj.flags{group}(flag);
            ax = obj.semaphoreAxes{group, flag};
            if flagValue
                rectangle(ax, 'Position', [0, 0, 30, 30], 'Curvature', [1, 1], 'FaceColor', 'green');
            else
                rectangle(ax, 'Position', [0, 0, 30, 30], 'Curvature', [1, 1], 'FaceColor', 'red');
            end
        end

        % Getter method to access the flags cell array
        function flagValues = getFlags(obj)
            flagValues = obj.flags;
        end
        
        % Get the flags associated with a specific group
        function groupFlags = getFlagsPerGroup(obj, groupName)
            groupIndex = find(strcmp(obj.namesOfGroups, groupName));
            if isempty(groupIndex)
                error('Invalid group name');
            end
            groupFlags = obj.flags{groupIndex};
        end
    
        % Check if the GUI window is closed
        function isClosed = isGUIWindowClosed(obj)
            isClosed = ~isvalid(obj.fig) || ~ishandle(obj.fig);
        end

        % Get the number of flag groups
        function numOfGroups = getNumGroups(obj)
            numOfGroups = obj.numGroups;
        end

        % Get the name of a group by its index
        function groupName = getGroupName(obj, index)
            groupName = obj.namesOfGroups{index};
        end
    end
end


% This code defines a class `BinaryFlagsGUI` which represents a graphical 
% user interface (GUI) for managing binary flags organized into groups. 
% Here's an overview of the key components and functionalities of the class:
% 
% - Properties:
%   - `numGroups`: Number of flag groups.
%   - `flagsPerGroup`: Number of flags in each group.
%   - `flags`: Cell array containing the flag values for each group.
%   - `fig`: Handle to the figure window.
%   - `semaphoreAxes`: Cell array containing handles to axes objects for 
% displaying the flag status.
%   - `namesOfGroups`: Names of the flag groups.
%   - `namesOfFlagsPerGroup`: Names of the flags within each group.
% 
% - Constructor:
%   - Initializes the properties of the class.
%   - Creates the GUI by calling the `createGUI` method.
% 
% - `createGUI` method:
%   - Creates a figure window.
%   - Calculates the layout of the flag groups in a grid.
%   - Creates panels for each flag group.
%   - Creates semaphore axes and toggle buttons for each flag within each 
% group.
%   - Sets up the GUI elements and their callbacks.
% 
% - toggleFlag method:
%   - Callback function triggered when a toggle button is pressed.
%   - Toggles the corresponding flag value.
%   - Updates the semaphore display by calling the drawSemaphore method.
% 
% - drawSemaphore method:
%   - Updates the semaphore display based on the flag value.
%   - Uses rectangle function to draw a colored rectangle.

% - Additional methods:
%   - getFlags: Returns the current flag values for all groups.
%   - getFlagsPerGroup: Returns the flag values for a specific group.
%   - isGUIWindowClosed: Checks if the GUI window is closed.
%   - getNumGroups: Returns the number of flag groups.
%   - getGroupName: Returns the name of a group based on its index.

% Overall, the BinaryFlagsGUI class provides a convenient way to create a 
% GUI for managing binary flags organized into groups, with interactive 
% toggle buttons and visual semaphore displays.
% 
