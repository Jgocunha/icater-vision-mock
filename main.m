gui = callGUI();

% Enter a while loop until the GUI window is closed
while ~gui.isGUIWindowClosed()
    % Get the flag values
    flags = gui.getFlags();

    % Access the flag values for a specific group and flag
    groupIndex = 2;
    flagIndex = 1;
    flagValue = flags{groupIndex}(flagIndex);

    % Do something with the flag value
    disp(['Flag value: ' num2str(flagValue)]);
    
    % Pause for a short duration
    pause(0.1);
end