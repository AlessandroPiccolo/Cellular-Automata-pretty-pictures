%{
Cellular automata model N by N grid
with "maxState+1" different states and periodic
boundary conditions. The surrounding is a Moore neighbourhood.

1)
Spiral
Rule, goes to next state if one of the surrounding elements is in the next 
state. For maxState elements the next element is equal to zero.
Goes from maxState to zero if there is an element with state 1.

2)
Same as 1) but goes from maxState to state 0 if there exists an elements
with state higer than zero. 

3)
"Turbulent" has a range of 2 and goes to next step if there are atleast
five other elements with one higer state.

Different fun colormaps
http://se.mathworks.com/help/matlab/ref/colormap.html#inputarg_map

By Alessandro Piccolo
%}
clear all; close all;

spiral = input('Enter 1 or 2 for sprial shape and 3 for turbulent: ');
while spiral ~= 1 && spiral ~= 3 && spiral ~= 2
    disp('Error, input should be 1, 2 or 3');
    spiral = input('Re-enter your choice: ');
end

% Change parameters here    
T = 1000;           % Number of time steps, standard 1000
if (spiral == 1 || spiral == 2) % Spirals
    maxState = 15;  % Max state value, there will be maxState + 1 states
    N = 100;        % Grid size, standard 40
    range = 1;
    colormap jet;
else % Turbulent
    maxState = 7;
    N = 150;
    range = 2;
    colormap parula;
end

% Randomize initial grid
grid_new = zeros(N+4,N+4); tic;
for i = 3:N+2
    for j = 3:N+2
        grid_new(i,j) = round(rand()*maxState);
    end
end

% Stepping through time
for k = 1:T
    grid_new = updateBoundary2(grid_new);
    grid_old = grid_new;
    % All the grid points are updated "simultaneously"
    for i = 3:N+2
        for j = 3:N+2
            % Different rules for creating cyclic shapes
            if (spiral == 1 || spiral == 2)
            ishiger = ...
                    cyclicHigherCheck(grid_old,i,j,maxState,range,spiral);
            else
                ishiger = ...
                    turbulentHigherCheck(grid_old,i,j,maxState,range);
            end
            % Go to next value if ishiger is true
            if (ishiger)
                % Return to zero when we have reached maxState
                if (grid_new(i,j) == maxState)
                    grid_new(i,j) = 0;
                else
                    grid_new(i,j) = grid_new(i,j) + 1;
                end
            end
        end % end column for
    end % end row for
    
    % Draw figure
    imagesc(grid_new(3:N+2, 3:N+2));
    set(gca,'FontSize',10, 'FontWeight', 'bold');
    sN = num2str(N); sk = num2str(k);
    title(['Cellular automata, size = ' sN ' with time step ' sk]);
    colorbar;
    drawnow;
    %if (k == 10 || k == 20); pause; end;
end % end time step
toc
