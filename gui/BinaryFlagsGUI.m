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
        function obj = BinaryFlagsGUI(numGroups, flagsPerGroup, namesOfGroups, namesOfFlagsPerGroup)
            % Constructor
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

        function toggleFlag(obj, ~, ~, group, flag)
            obj.flags{group}(flag) = ~obj.flags{group}(flag);
            obj.drawSemaphore(group, flag);
        end

        function drawSemaphore(obj, group, flag)
            flagValue = obj.flags{group}(flag);
            ax = obj.semaphoreAxes{group, flag};
            if flagValue
                rectangle(ax, 'Position', [0, 0, 30, 30], 'Curvature', [1, 1], 'FaceColor', 'green');
            else
                rectangle(ax, 'Position', [0, 0, 30, 30], 'Curvature', [1, 1], 'FaceColor', 'red');
            end
        end
    
        function flagValues = getFlags(obj)
            % Getter method to access the flags cell array
            flagValues = obj.flags;
        end

        function groupFlags = getFlagsPerGroup(obj, groupName)
            % Get the flags associated with a specific group
            groupIndex = find(strcmp(obj.namesOfGroups, groupName));
            if isempty(groupIndex)
                error('Invalid group name');
            end
            groupFlags = obj.flags{groupIndex};
        end

        function isClosed = isGUIWindowClosed(obj)
            % Check if the GUI window is closed
            isClosed = ~isvalid(obj.fig) || ~ishandle(obj.fig);
        end

        function numOfGroups = getNumGroups(obj)
            numOfGroups = obj.numGroups;
        end

        function groupName = getGroupName(obj, index)
            groupName = obj.namesOfGroups{index};
        end
    end
end

