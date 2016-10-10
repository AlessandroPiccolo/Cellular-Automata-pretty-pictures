% Update boundary, used to solve periodicity boundary condition of range 2
% Actual grid is N by N dim
function grid = updateBoundary2(grid)
N = size(grid,1)-2;

% Sides
for j = 3:N+2
    grid(1,j) = grid(N+1,j); % Top 2
    grid(2,j) = grid(N+2,j); % Top 1
    
    grid(N+3,j) = grid(3,j); % Bottom 1
    grid(N+4,j) = grid(4,j); % Bottom 2
    
    grid(j,1) = grid(j,N+1); % Left 2
    grid(j,2) = grid(j,N+2); % Left 1
    
    grid(j,N+3) = grid(j,3); % Right 1
    grid(j,N+4) = grid(j,4); % Right 2
end
% Corners

% Top left
grid(1,1) = grid(N+2,N+2);
grid(2,2) = grid(N+1,N+1);
grid(1,2) = grid(N+1,N+2);
grid(2,1) = grid(N+2,N+1);

% Top right
grid(1,N+4) = grid(N+1,4);
grid(2,N+3) = grid(N+2,3);
grid(1,N+3) = grid(N+1,3);
grid(2,N+4) = grid(N+2,4);

% Bot left
grid(N+3,2) = grid(3,N+2);
grid(N+4,1) = grid(4,N+1);
grid(N+3,1) = grid(3,N+1);
grid(N+4,2) = grid(4,N+2);

% Bot right
grid(N+3,N+3) = grid(3,3);
grid(N+4,N+4) = grid(4,4);
grid(N+3,N+4) = grid(3,4);
grid(N+4,N+3) = grid(4,3);

end
